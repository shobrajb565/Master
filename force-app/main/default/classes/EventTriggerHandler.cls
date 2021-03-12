public class EventTriggerHandler {

    public static void beforeinsert(list<event> lstEvent){
    
        set<string> huntIds = new set<string>();
    
        for(event evt : lstEvent){
        if(evt.WhatId !=Null){
            if(evt.WhatId.getSObjectType().getDescribe().getName()=='Hunt_List__c')
            {
            
                huntIds.add(evt.whatId);        
            }}
        }
        
        if(huntIds.size() > 0){
                
            map<string,Hunt_List__c> mapHunt = new map<string,Hunt_List__c>();
        
            for(Hunt_List__c objHunt : [SELECT id,Attorney_1__c,Attorney_Firm_1__c,Attorney_Firm_1__r.Description,
                                        Attorney_Firm_1__r.billingStreet,Attorney_Firm_1__r.Street2__c,Attorney_Firm_1__r.billingCity,Attorney_Firm_1__r.billingstate,
                                        Attorney_Firm_1__r.billingCountry,Attorney_Firm_1__r.billingPostalCode FROM Hunt_List__c 
                                        WHERE id =: huntIds]){
                mapHunt.put(objHunt.id,objHunt);                            
            }
        
            for(event evt : lstEvent){
            if(evt.WhatId !=Null){
                if(evt.WhatId.getSObjectType().getDescribe().getName()=='Hunt_List__c' && mapHunt.containsKey(evt.whatId))
                {                                        
                   // evt.whoId = mapHunt.get(evt.whatId).Attorney_1__c;
                  //  evt.Description = mapHunt.get(evt.whatId).Attorney_Firm_1__r.Description;
                    evt.Location = mapHunt.get(evt.whatId).Attorney_Firm_1__r.billingStreet +','+
                                   mapHunt.get(evt.whatId).Attorney_Firm_1__r.Street2__c +','+
                                   mapHunt.get(evt.whatId).Attorney_Firm_1__r.billingCity +','+
                                   mapHunt.get(evt.whatId).Attorney_Firm_1__r.billingState +','+
                                   mapHunt.get(evt.whatId).Attorney_Firm_1__r.billingPostalCode +','+
                                   mapHunt.get(evt.whatId).Attorney_Firm_1__r.billingCountry;
                     evt.Description = evt.Description  + 'Link to Salesforce - https://oasiscrm.lightning.force.com/lightning/r/Contact/' +mapHunt.get(evt.whatId).Attorney_1__c+'/view';              
                }
            }}
        }
    }
    
  
    
    @future
    public static void linkContactFutureMethod(set<string> evtIds,set<string> huntIds)
    {   
    
        if(huntIds.size() > 0){
        
            map<string,Hunt_List__c> mapHunt = new map<string,Hunt_List__c>();
            list<event> allEvt = new list<event>();
        
            for(Hunt_List__c objHunt : [SELECT id,Attorney_1__c FROM Hunt_List__c WHERE id =: huntIds]){
                mapHunt.put(objHunt.id,objHunt);                            
            }
            
            for(event evt : [SELECT id,WhatId FROM event WHERE id =: evtIds]){
                if(evt.WhatId !=Null){
                    if(mapHunt.containsKey(evt.whatId))
                    {                      
                        event objEvt = new event();  
                        objEvt.id = evt.id;   
                        objEvt.whoId = mapHunt.get(evt.whatId).Attorney_1__c;
                        allEvt.add(ObjEvt);
                    }
                }
            }

            if(allEvt.size() > 0){
                update allEvt;
                
            }
        }
    }
    
    public static void crmActivitysPreset(Map<id,Event> newMapRecords){
        Set<id> setOfActivityIds=new Set<id>();
        //check Account and contact task Records
        for(id ids:newMapRecords.keyset()){
            if((newMapRecords.get(ids).Whatid!=null && (newMapRecords.get(ids).Whatid).getSObjectType()+''=='Account')||
              (newMapRecords.get(ids).WhoID!=null && (newMapRecords.get(ids).WhoID).getSObjectType()+''=='Contact')){
                  setOfActivityIds.add(ids);
             }
         }
         if(!test.isrunningtest()){
             System.enqueueJob(new PresetCRMActivityQueuebleJob (setOfActivityIds));
         }
    }      

}