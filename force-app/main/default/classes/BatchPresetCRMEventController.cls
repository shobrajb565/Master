global class BatchPresetCRMEventController  implements Database.Batchable<sObject>,Database.Stateful,Database.AllowsCallouts {
    global Set<id> setOfActivityIds;
    global BatchPresetCRMEventController (Set<id> setOfActivityIds){
         this.setOfActivityIds=setOfActivityIds;
         
    }
   
    // Start Method
    global Database.QueryLocator start(Database.BatchableContext BC){
        system.debug('---Start Method');
        return Database.getQueryLocator('select id,Oasis_Type__c,Oasis_Event_Purpose__c,Oasis_Event_Result__c, Whatid,Subject,Whoid,ActivityDate from Event  where id in :setOfActivityIds');
    
    }
   
    // Execute Logic
    global void execute(Database.BatchableContext BC, List<sObject>scope){
        // Logic to be Executed batch wise    
         Preset_Medlien_Configuration__c  objReq =Preset_Medlien_Configuration__c.getAll().get('PresetaddCrmActivity');
       
        List<PSCommunicationCache__c> lstOfPscCommCaches=new List<PSCommunicationCache__c>(); 
        
        for(Event  evnt:(List<Event>)scope){
            ModelActivity md=new ModelActivity();
           // md.Type=evnt.Oasis_Type__c+'';
           md.Type='Event';
            //md.EventStatus='';
            md.Subject=evnt.Subject;
            md.CRM_ID=evnt.id+'';
            if(evnt.Whoid!=null){
                md.CRM_AttorneyID=evnt.Whoid+'';
            }else{
                md.CRM_AttorneyID=evnt.Whatid+'';
            }
            md.TypeOfEvent=evnt.Oasis_Event_Purpose__c+'';
           // md.CreatedBy=evnt.CreatedByid+'';
            md.ResultOfEvent=evnt.Oasis_Event_Result__c;
           // md.CreatedDate=evnt.CreatedDate+'';
            md.AssignedTo=UserInfo.getUserEmail()+'';
            md.ActivityDate=evnt.ActivityDate+'';

            String body=System.JSON.serialize(md);
            
            PSCommunicationCache__c objpsc=new PSCommunicationCache__c();
            objpsc.InputPayload__c=body;
            objpsc.Operation__c=objReq.End_Point__c;   
            objpsc.ObjectId__c=evnt.id;
            objpsc.GenericName__c='PresetaddCrmActivity';
            objpsc.IsError__c=true;

            HTTPResponse resfrmLoc =PresetMedlienHttpRequestController.request(body,'PresetaddCrmActivity','');

            objpsc.ResponsePayload__c=resfrmLoc.getBody();
            objpsc.ResponseStatus__c=resfrmLoc.getStatusCode()+'';
            
            System.debug('###@@'+resfrmLoc.getBody());
            
            if(resfrmLoc.getStatusCode()==200 && parse(resfrmLoc.getBody()).Status=='Success'){
                objpsc.IsError__c=false;
            }
            lstOfPscCommCaches.add(objpsc); 
        }     
            
        if(lstOfPscCommCaches.size()>0){
             insert lstOfPscCommCaches;
        }
    }
 
    global void finish(Database.BatchableContext BC){
        // Logic to be Executed at finish
    }
    public static ModelResponse parse(String json) {
        return (ModelResponse ) System.JSON.deserialize(json, ModelResponse.class);
    }
    public class ModelResponse {
        public string Status;
    }    
    public class ModelActivity{
        public String Type;
        //public String EventStatus;
        public String Subject;
        public String CRM_AttorneyID;
        public String ResultOfEvent;
        public String CRM_ID;
      //  public String CreatedDate;
       // public String CreatedBy;
        public String AssignedTo;
        public String ActivityDate;
        public String TypeOfEvent;
    }
  
}