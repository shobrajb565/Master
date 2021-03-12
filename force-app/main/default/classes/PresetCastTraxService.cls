/**
* Requirement: Sending the request from cashtrax to salesforce
* @param
* @author
* @return type
* @created date
* @modification
**/
public class PresetCastTraxService {

 public enum STATUS {
    OK,
    ERROR
 }
 
 public static Map<STATUS, String> statusMessaages = new Map<STATUS, String> {
  STATUS.OK => '200',
  STATUS.ERROR => '400'
 };


/**
 * This method is fetching notes.
 * @param String jsonRequest
 * @return String .
 * @exception Exception On input error.
 * @see 
*/
public String fetchNotes(String jsonRequest) {
       System.debug('REQUEST PAYLOAD Firm ===== ' + jsonRequest);
        NoteResponse response = new NoteResponse();
        CashtraxEntities.ActivityRequest request ;
    try {
         request = (CashtraxEntities.ActivityRequest) JSON.deserialize(jsonRequest, CashtraxEntities.ActivityRequest.class);
       
         response = selectNotes(request);
        return JSON.serialize(response);
    } catch (Exception e) {
      response = new NoteResponse();
      response.statusCode = statusMessaages.get(STATUS.ERROR);
      response.status = STATUS.ERROR.name();
      response.message = 'Line Number ' + e.getLineNumber() + ' Message ' + e.getMessage() + e.getStackTraceString() + e.getTypeName() + ' Firm Name '  ;
      return JSON.serialize(response);
    }
 }



/**
  * This method is fetching activities.
  * @param String jsonRequest
  * @return String.
  * @exception Exception On input error.
  *
**/ 
public String fetchActivities(String jsonRequest) {
       System.debug('REQUEST PAYLOAD Firm ===== ' + jsonRequest);
        CTXActivityResponse response = new CTXActivityResponse();
        CashtraxEntities.ActivityRequest request ;
    try {
         request = (CashtraxEntities.ActivityRequest) JSON.deserialize(jsonRequest, CashtraxEntities.ActivityRequest.class);
       
         response = selectActivities(request);
        return JSON.serialize(response);
    } catch (Exception e) {
      response = new CTXActivityResponse();
      response.statusCode = statusMessaages.get(STATUS.ERROR);
      response.status = STATUS.ERROR.name();
      response.message = 'Line Number ' + e.getLineNumber() + ' Message ' + e.getMessage() + e.getStackTraceString() + e.getTypeName() + ' Firm Name '  ;
      return JSON.serialize(response);
    }
 }

/**
  * This method is fetching events.
  * @param String jsonRequest
  * @return String.
  * @exception Exception On input error.
  *
**/ 
public String fetchEvents(String jsonRequest) {
       System.debug('REQUEST PAYLOAD Firm ===== ' + jsonRequest);
        CTXEventResponse response = new CTXEventResponse();
        CashtraxEntities.ActivityRequest request ;
    try {
         request = (CashtraxEntities.ActivityRequest) JSON.deserialize(jsonRequest, CashtraxEntities.ActivityRequest.class);
       
         response = selectEvents(request);
        return JSON.serialize(response);
    } catch (Exception e) {
      response = new CTXEventResponse();
      response.statusCode = statusMessaages.get(STATUS.ERROR);
      response.status = STATUS.ERROR.name();
      response.message = 'Line Number ' + e.getLineNumber() + ' Message ' + e.getMessage() + e.getStackTraceString() + e.getTypeName() + ' Firm Name '  ;
      return JSON.serialize(response);
    }
 }


/**
 * This method is fetching activities record.
 * @param String jsonRequest
 * @return String.
 * @exception Exception On input error.
 *
*/ 
public String caseFunded(String jsonRequest) {
       System.debug('REQUEST PAYLOAD ===== ' + jsonRequest);
       
       
        CTXResponse response ;//= new CTXResponse();
        
        //CashtraxEntities.FundedCase request ;
    try {
         
         FundedCaseParser parser = FundedCaseParser.parse(jsonRequest);
    
         response = createFundedCase(parser.Cases);
         return JSON.serialize(response);
    } catch (Exception e) {
    
    
      response = new CTXResponse();
      response.statusCode = statusMessaages.get(STATUS.ERROR);
      response.status = STATUS.ERROR.name();
      response.message = 'Some issue creating case: ' + e.getMessage();
      return JSON.serialize(response);
    }
 }


/**
  * This method is creating attorneynote record.
  * @param String jsonRequest
  * @return String.
  * @exception Exception On input error.
  * @see 
 */
public String createAttorneyNote(String jsonRequest) {
       System.debug('REQUEST PAYLOAD ===== ' + jsonRequest);
       
       
        CTXNoteResponse response ;
        
        CashtraxEntities.Firm request ;
    try {
    
    
         JSON2Apex r = JSON2Apex.parse(jsonRequest);
     
         if(r!=null){
             response = createAttorneyNotes(r.Notes);
         }
        return JSON.serialize(response);
    } catch (Exception e) {
    
    
      response = new CTXNoteResponse();
      response.statusCode = statusMessaages.get(STATUS.OK);
      response.status = STATUS.OK.name();
      response.message = 'You Reached correctly. This  part is in development' ; //'Line Number ' + e.getLineNumber() + ' Message ' + e.getMessage() + e.getStackTraceString() + e.getTypeName() + ' Firm Name '  ;
      return JSON.serialize(response);
    }
 }





/**
  * This method is creatingCTXFirm record.
  * @param String jsonRequest
  * @return String.
  * @exception Exception On input error.
  * @see 
 */
public String createCTXFirm(String jsonRequest) {
       System.debug('REQUEST PAYLOAD Firm ===== ' + jsonRequest);
        CTXResponse response = new CTXResponse();
        CashtraxEntities.Firm request ;
    try {
         request = (CashtraxEntities.Firm) JSON.deserialize(jsonRequest, CashtraxEntities.Firm.class);
         System.debug('REQUEST PAYLOAD Firm2 ===== ' + request);
         response = createFirm(request);
        return JSON.serialize(response);
    } catch (Exception e) {
      response = new CTXResponse();
      response.statusCode = statusMessaages.get(STATUS.ERROR);
      response.status = STATUS.ERROR.name();
      response.message = 'Line Number ' + e.getLineNumber() + ' Message ' + e.getMessage() + e.getStackTraceString() + e.getTypeName() + ' Firm Name '  ;
      return JSON.serialize(response);
    }
 }
 
/**
  * This method is Update CTXFirm record.
  * @param String jsonRequest
  * @return String.
  * @exception Exception On input error.
  * @see 
 */
public String updateCTXFirm(String jsonRequest) {
       System.debug('REQUEST PAYLOAD 1111===== ' + jsonRequest);
        CTXResponse response = new CTXResponse();
        CashtraxEntities.Firm request;
    try {
         request = (CashtraxEntities.Firm) JSON.deserialize(jsonRequest, CashtraxEntities.Firm.class);
         System.debug('REQUEST PAYLOAD ===== ' + request);
         response = updateFirm(request);
        return JSON.serialize(response);
    } catch (Exception e) {
      response = new CTXResponse();
      response.statusCode = statusMessaages.get(STATUS.ERROR);
      response.status = STATUS.ERROR.name();
      response.message = 'Line Number ' + e.getLineNumber() + ' Message ' + e.getMessage() + e.getStackTraceString() + e.getTypeName() + ' Firm Name '  ;
      return JSON.serialize(response);
    }
 }

/**
  * This method is creating CTXFirmLocation record.
  * @param 
  * @return .
  * @exception Exception On input error.
  * @see 
 */
public String createCTXFirmLocation(String jsonRequest) {
       System.debug('REQUEST PAYLOAD FirmLcation ===== ' + jsonRequest);
        CTXResponse response = new CTXResponse();
        CashtraxEntities.FirmLocation request ;
    try {
         request = (CashtraxEntities.FirmLocation) JSON.deserialize(jsonRequest, CashtraxEntities.FirmLocation.class);
         System.debug('REQUEST PAYLOAD Firm Location2===== ' + request);
         response = createFirmLocation(request);
        return JSON.serialize(response);
    } catch (Exception e) {
      response = new CTXResponse();
      response.statusCode = statusMessaages.get(STATUS.ERROR);
      response.status = STATUS.ERROR.name();
      response.message = 'Line Number ' + e.getLineNumber() + ' Message ' + e.getMessage() + e.getStackTraceString() + e.getTypeName() + ' Firm Name '  ;
      return JSON.serialize(response);
    }
 }

/**
  * This method is updating the CTX Firm location records.
  * @param String jsonRequest
  * @return String.
  * @exception Exception On input error.
  * @see 
 */
public String updateCTXFirmLocation(String jsonRequest) {
       System.debug('REQUEST PAYLOAD 1111===== ' + jsonRequest);
        CTXResponse response = new CTXResponse();
        CashtraxEntities.FirmLocation request;
    try {
         request = (CashtraxEntities.FirmLocation) JSON.deserialize(jsonRequest, CashtraxEntities.FirmLocation.class);
         System.debug('REQUEST PAYLOAD ===== ' + request);
         response = updateFirmLocation(request);
        return JSON.serialize(response);
    } catch (Exception e) {
      response = new CTXResponse();
      response.statusCode = statusMessaages.get(STATUS.ERROR);
      response.status = STATUS.ERROR.name();
      response.message = 'Line Number ' + e.getLineNumber() + ' Message ' + e.getMessage() + e.getStackTraceString() + e.getTypeName() + ' Firm Name '  ;
      return JSON.serialize(response);
    }
 }

/**
  * This method is creating CTX Attorney records.
  * @param String jsonRequest
  * @return String.
  * @exception Exception On input error.
  * @see 
 */
public String createCTXAttorney(String jsonRequest) {
       System.debug('REQUEST PAYLOAD 1111===== ' + jsonRequest);
        CTXResponse response = new CTXResponse();
        CashtraxEntities.Attorney request ;
    try {
         request = (CashtraxEntities.Attorney) JSON.deserialize(jsonRequest, CashtraxEntities.Attorney.class);
         System.debug('REQUEST PAYLOAD ===== ' + request);
         response = createAttorney(request);
        return JSON.serialize(response);
    } catch (Exception e) {
      response = new CTXResponse();
      response.statusCode = statusMessaages.get(STATUS.ERROR);
      response.status = STATUS.ERROR.name();
      response.message = 'Line Number ' + e.getLineNumber() + ' Message ' + e.getMessage() + e.getStackTraceString() + e.getTypeName() + ' Firm Name '  ;
      return JSON.serialize(response);
    }
 }
 
 /**
  * This method is updating CTX Attorney.
  * @param String jsonRequest
  * @return String.
  * @exception Exception On input error.
  * @see 
 */
 public String updateCTXAttorney(String jsonRequest) {
   
   System.debug('REQUEST PAYLOAD 1111===== ' + jsonRequest);
        CTXResponse   response = new CTXResponse();
        CashtraxEntities.Attorney request ;
    try {
         request = (CashtraxEntities.Attorney) JSON.deserialize(jsonRequest, CashtraxEntities.Attorney.class);
         System.debug('REQUEST PAYLOAD ===== ' + request);
         response = updateAttorney(request);
        return JSON.serialize(response);
    } catch (Exception e) {
        system.debug('EXCeption === '+ e.getMessage());
      response.status = STATUS.ERROR.name();
      response.message = e.getMessage();
      return JSON.serialize(response);
    }
 }
 
 /**
  * This method is createing attorney assitant records.
  * @param String jsonRequest
  * @return String.
  * @exception Exception On input error.
  * @see 
 */
 public String createAttorneyAssistant(String jsonRequest) {
    System.debug('PRINT THE NON ATTORNEY ASSITANT REQUEST PAYLOAD ' + jsonRequest);
    CTXResponse   response = new CTXResponse();
    CashtraxEntities.AttorneyAssistant request ;
    
    try {
         request = (CashtraxEntities.AttorneyAssistant) JSON.deserialize(jsonRequest, CashtraxEntities.AttorneyAssistant.class);
         response = createAttorneyAssistant(request);
         return JSON.serialize(response);
    }catch(Exception e) {
         response.status = STATUS.ERROR.name();
         response.message = e.getMessage();
         return JSON.serialize(response);
    }
 }
 
 /**
  * This method is updating the attorney assitant records.
  * @param String jsonRequest
  * @return String.
  * @exception Exception On input error.
  * @see 
 */
 public String updatedAttorneyAssistant(String jsonRequest) {
    System.debug('PRINT THE NON ATTORNEY ASSITANT REQUEST PAYLOAD ' + jsonRequest);
    CTXResponse   response = new CTXResponse();
    CashtraxEntities.AttorneyAssistant request ;
    
    try {
         request = (CashtraxEntities.AttorneyAssistant) JSON.deserialize(jsonRequest, CashtraxEntities.AttorneyAssistant.class);
         response = updateAttorneyAssistant(request);
         return JSON.serialize(response);
    }catch(Exception e) {
         response.status = STATUS.ERROR.name();
         response.message = e.getMessage();
         return JSON.serialize(response);
    }
 }
 
 
 /**
  * This method is sending a response back once will create the attorney notes.
  * @param List<JSON2Apex.Notes> notes
  * @return CTXNoteResponse .
  * @exception Exception On input error.
  * @see 
 */
 @testvisible private CTXNoteResponse createAttorneyNotes(List<JSON2Apex.Notes> notes)
 {
 
     Note n=null;
     List<Note> notesToBeInserted = new List<Note>();
     List<Id> idList = new List<Id>();
     for(JSON2Apex.Notes jnote: notes)
     {
         /*
         n = new Note();
         n.ParentId = jnote.CRM_AttorneyID;
         n.Title = jnote.NoteID +':'+jnote.Name;
         n.Body = jnote.NoteText;
         */
         
         ContentNote cn = new ContentNote();
            cn.Title = jnote.NoteID +':'+jnote.Name;
            String body =  jnote.NoteText;
            cn.Content = Blob.valueOf(body.escapeHTML4());
            insert cn;
            idList.add(cn.Id); 
             
             ContentDocumentLink newCD = new ContentDocumentLink();
            newCD.ContentDocumentId = cn.id;
            newCD.LinkedEntityId = jnote.CRM_AttorneyID;
            newCD.ShareType = 'V';
            newCD.Visibility = 'AllUsers';
            insert newCD;
     
     }
     
    /* 
     if(notesToBeInserted.size()>0)
     {
         Database.SaveResult[] srList = Database.insert(notesToBeInserted);

        for (Database.SaveResult sr : srList)
        {
            if(sr.isSuccess()){
                idList.add(sr.getId());
            }else {
            
               idList.add('NULL');

            }
        }
         
     }*/
     
     
     List<CRMNote> respList = new List<CRMNote>();
     integer k=0;
     CRMNote cnote = null;
     for(JSON2Apex.Notes jnote: notes)
     {
        cnote = new CRMNote();
        cnote.NoteID = String.valueOf(jnote.NoteID);
        cnote.CRMNoteID = String.valueOf(idList.get(k));
        respList.add(cnote);      
        k++;   
     }
     
         CTXNoteResponse response = new CTXNoteResponse(); 
         response.statusCode = statusMessaages.get(STATUS.OK);
         response.status = STATUS.OK.name();
         response.message = 'NOTES CREATED' ;
         response.Notes = respList;
         return response;
     
 }
 
 
 
 /**
  * This method is selecting the activities as req by CTX
  * @param CashtraxEntities.ActivityRequest request
  * @return CTXActivityResponse .
  * @exception Exception On input error.
  * @see 
 */
 
 @testvisible private CTXActivityResponse selectActivities(CashtraxEntities.ActivityRequest request) {
      CTXActivityResponse   response = new CTXActivityResponse();

      try{
        
        if(String.IsNotBlank(request.CRM_AttorneyID))// && String.IsNotBlank(request.CRM_FirmLocationID))
        {
        
             List<Task> taskList = [SELECT type,AccountId,Account.Name,ActivityDate,CreatedBy.Name,CreatedDate,Description,Id,Owner.Name,Status,Subject,What.Name,Who.name FROM Task  
                                       WHERE IsDeleted=false and whoId = :request.CRM_AttorneyID order by createdDate desc Limit :request.count ALL ROWS]; 
          
           
             system.debug('----------TASK LIST SIZE ----------'+taskList.size());
          
              CashtraxEntities.Activity activity=null;
              List<CashtraxEntities.Activity> activityList = new List<CashtraxEntities.Activity>();
              for(Task t: taskList)
              {
              
                 activity = new CashtraxEntities.Activity();
                 
                 activity.FirmName = t.What.Name;
                 activity.Attorney = t.Who.Name;
                 activity.Subject = t.Subject;
                 activity.Type = t.Type; 
                 activity.Comments = t.Description; 
                 activity.AssignedTo = t.Owner.Name; 
                 activity.DueDate = t.ActivityDate;
                 activity.CreatedBy = t.CreatedBy.Name;
                 activity.CreatedDate = (t.CreatedDate);
                 activityList.add(activity);
                }
           
                 response.statusCode = statusMessaages.get(STATUS.OK);
                 response.status = STATUS.OK.name();
                 response.message = 'FETCH SUCCESSFUL' ;
                 response.activities = activityList; 
                 return response;
           
        }
          else
        {
        
         response.statusCode = statusMessaages.get(STATUS.ERROR);
         response.status = STATUS.ERROR.name();
         response.message = 'CRM_AttorneyID or CRM_FirmLocationID MISSING IN REQUEST' ;
         return response;
           
        } 
         
         
      }
      catch(Exception e)
      {
        
        
         response.statusCode = statusMessaages.get(STATUS.ERROR);
         response.status = STATUS.ERROR.name();
         response.message = e.getMessage(); 
         return response;
      }    

}



 /**
  * This method is selecting the events as req by CTX
  * @param CashtraxEntities.ActivityRequest request
  * @return CTXEventResponse .
  * @exception Exception On input error.
  * @see 
 */
 
 @testvisible private CTXEventResponse selectEvents(CashtraxEntities.ActivityRequest request) {
      CTXEventResponse   response = new CTXEventResponse();

      try{
        
        if(String.IsNotBlank(request.CRM_AttorneyID)  && String.IsNotBlank(request.CRM_FirmLocationID))
        {
        
             List<Event> eventList = [SELECT AccountId,ActivityDate,BackendSystem_OwnerName__c,CreatedDate,Cross_Sell__c,Description,Type, EventSubtype,Id,
                                         Oasis_Event_Purpose__c,Oasis_Event_Result__c,Subject,WhatId,WhoId, who.name, What.Name, DurationInMinutes, 
                                         EndDateTime, StartDateTime, GroupEventType, Location, owner.name, whocount, whatcount
                                         FROM Event where IsPrivate = false and IsDeleted=false and whoId = :request.CRM_AttorneyID 
                                         order by createdDate desc Limit :request.count ALL ROWS]; 
          
           
             system.debug('----------TASK LIST SIZE ----------'+eventList.size());
          
          
              //get presetID of attorney
                   //Check for Attorney 
             List<Account_Relation__c> accRelationList = [select Id, PresetID__c,Contact__c, Account__c,Account__r.Name, Role__c  
                                                          from Account_Relation__c 
                                                          where Account__c = :request.CRM_FirmLocationID and Contact__c = :request.CRM_AttorneyID 
                                                          and Role__c='Attorney' and PresetID__c != null];
             String presetId='0';   
             String accName ='';
             if(accRelationList!=null && accRelationList.size()>0)
             {
                presetId = accRelationList[0].PresetID__c;    
                accName = accRelationList[0].Account__r.Name;
             }    
          
          
              CashtraxEntities.Event activity=null;
              List<CashtraxEntities.Event> activityList = new List<CashtraxEntities.Event>();
              for(Event t: eventList)
              {
              
                 activity = new CashtraxEntities.Event();
                 
                 activity.FirmName = (t.What.Name); //!=null) ? t.What.Name : accName; 
                 activity.CRM_FirmID =t.whatId; //request.CRM_FirmLocationID;
                 
                 activity.Attorney = t.Who.Name;
                 activity.AttorneyId = presetId;
                 activity.Subject = t.Subject;
                 activity.EventType = t.Oasis_Event_Purpose__c; 
                 activity.ResultOfEvent = t.Oasis_Event_Result__c; 
                 activity.StartDateTime = (t.StartDateTime);
                 
                 
                 activity.Description= t.Description; 
                 activity.OwnerName= t.Owner.Name; 
                 activity.DueDate = t.ActivityDate;
                 activity.Location= t.Location;
                 activity.CreatedDate = (t.CreatedDate);
                 activityList.add(activity);
                }
           
                 response.statusCode = statusMessaages.get(STATUS.OK);
                 response.status = STATUS.OK.name();
                 response.message = 'FETCH SUCCESSFUL' ;
                 response.activities = activityList; 
                 return response;
           
        }
          else
        {
        
         response.statusCode = statusMessaages.get(STATUS.ERROR);
         response.status = STATUS.ERROR.name();
         response.message = 'CRM_FirmAttorneyID or CRM_FirmLocationID MISSING IN REQUEST' ;
         return response;
           
        } 
         
         
      }
      catch(Exception e)
      {
        
        
         response.statusCode = statusMessaages.get(STATUS.ERROR);
         response.status = STATUS.ERROR.name();
         response.message = e.getMessage(); 
         return response;
      }    

}


 /**
  * This method is send response back once select notes.
  * @param CashtraxEntities.ActivityRequest request
  * @return NoteResponse .
  * @exception Exception On input error.
  * @see 
 */
 @testvisible private NoteResponse selectNotes(CashtraxEntities.ActivityRequest request) {
      NoteResponse   response = new NoteResponse();

      try{
     
              CashtraxEntities.SFNote note=null;
              List<CashtraxEntities.SFNote> nList = new List<CashtraxEntities.SFNote>();
     
        
        if(String.IsNotBlank(request.CRM_AttorneyID))
        {
        
          /*   List<Note> noteList = [SELECT Id, Body,CreatedBy.Name,CreatedDate,Owner.Name,ParentId, Parent.Name,Title 
                                    FROM Note 
                                    WHERE ParentId = :request.CRM_AttorneyID order by createdDate desc Limit :request.count ]; 
          
           
             system.debug('----------NOTE LIST SIZE ----------'+noteList.size());
          
              for(Note t: noteList)
              {
              
                 note = new CashtraxEntities.SFNote();
                 
                 note.CRMNoteID = t.Id; 
                 note.Attorney = t.Parent.Name;
                 note.Title = t.Title;
                 note.NoteText = t.Body; 
                 note.OwnerName = t.Owner.Name; 
                 
                 note.CreatedBy = t.CreatedBy.Name;
                 note.CreatedDate = t.CreatedDate;
                 nList.add(note);
                }
           */
           
           
           
    List<ContentDocumentLink> docLinkList = [SELECT ContentDocumentId,Id,LinkedEntityId,ShareType,SystemModstamp,Visibility,LinkedEntity.Name 
                                            FROM ContentDocumentLink where LinkedEntityId = :request.CRM_AttorneyID 
                                            order by SystemModstamp desc Limit :request.count ];
                                            
    Set<Id> docIdSet = new Set<Id>();
    String attorneyName ='';
   
    if(docLinkList !=null && docLinkList.size()>0){
        for(ContentDocumentLink link : docLinkList)
        {
           docIdSet.add(link.ContentDocumentId);
           attorneyName = link.LinkedEntity.Name;
        }
    


    List<ContentVersion> noteList = [SELECT ContentBodyId,ContentDocumentId,Description,FileType,Id,IsLatest,
                                 OwnerId,TextPreview,Title,VersionData,VersionNumber,CreatedById,CreatedBy.Name,CreatedDate,Owner.Name
                                 FROM ContentVersion where FileType='SNOTE' and IsLatest=true and ContentDocumentId IN :docIdSet];
    
    if(noteList!=null && noteList.size()>0)
    {
                
    
              
              for(ContentVersion t: noteList)
              {  
            
                
                Blob  payloadBlob = t.VersionData;
                String payload = payloadBlob.toString();

            
                 note = new CashtraxEntities.SFNote();
                 
                 note.CRMNoteID = t.ContentDocumentId; 
                 note.Attorney = attorneyName;
                 note.Title = t.Title;
                 note.NoteText = payload; 
                 note.OwnerName = t.Owner.Name; 
                 
                 note.CreatedBy = t.CreatedBy.Name;
                 note.CreatedDate = (t.CreatedDate);
                 nList.add(note);
                }
    
        }
    }

           
           
           
           
           
                 response.statusCode = statusMessaages.get(STATUS.OK);
                 response.status = STATUS.OK.name();
                 response.message = 'FETCH SUCCESSFUL' ;
                 response.notes= nList; 
                 return response;
           
        }
          else
        {
        
         response.statusCode = statusMessaages.get(STATUS.ERROR);
         response.status = STATUS.ERROR.name();
         response.message = 'CRM_FirmAttorneyID or CRM_FirmLocationID MISSING IN REQUEST' ;
         return response;
           
        } 
         
         
      }
      catch(Exception e)
      {
        
        
         response.statusCode = statusMessaages.get(STATUS.ERROR);
         response.status = STATUS.ERROR.name();
         response.message = e.getMessage(); 
         return response;
      }    

}


 /**
  * This method is creating firm record.
  * @param CashtraxEntities.Firm request
  * @return CTXResponse.
  * @exception Exception On input error.
  * @see 
 */
 @testvisible private CTXResponse createFirm(CashtraxEntities.Firm request) {
      CTXResponse   response = new CTXResponse();

      try{
        
      //  Id dupId = checkDuplicateAccount(request,true);
       
       // if(dupId ==null)
        {
         Account acct = new Account();

         acct.Name = request.FirmName;
         acct.HeadQuarter__c = true; //request.HeadQuarter;
         acct.CTXFirmId__c= request.FirmID;
         
         acct.Type = 'LawFirm'; //(String.isBlank(request.Type)) ? 'LawFirm' : request.Type;
      /*   acct.BillingStreet = request.Address1;
         acct.Street2__c = request.Address2;
         acct.BillingPostalCode = request.ZipCode;
         acct.BillingCity = request.city;
         acct.BillingState = request.state;
         
         acct.Phone = request.PhoneNumber;
         acct.Fax = request.fax;
        */
         acct.Website = request.Website;
         acct.PreSet__c = true;
         acct.RecordTypeId = Utility.getAccountRecTypeId(Constant.RC_ATTORENY_ACCOUNT);
         insert acct; 
 
         createCache('CreateFirm',JSON.serialize(request),acct.Id);
             
          //Send Response 
         response.CRM_ID = acct.Id;
         //response.CTX_FirmID = Integer.valueOf(request.FirmID);
         response.statusCode = statusMessaages.get(STATUS.OK);
         response.status = STATUS.OK.name();
         response.message = 'ACCOUNT CREATED' ;
         return response;
         
        }
      /*  else
        {
        
         response.CRM_FirmID = dupId;
         response.CTX_FirmID = Integer.valueOf(request.FirmID);
         response.statusCode = statusMessaages.get(STATUS.ERROR);
         response.status = STATUS.ERROR.name();
         response.message = 'ACCOUNT ALREADY EXISTS' ;
         return response;
           
        } 
        */ 
         
      }
      catch(Exception e)
      {
        
         response.CRM_ID = null; 
         //response.CTX_FirmID = Integer.valueOf(request.FirmID);
        
         response.statusCode = statusMessaages.get(STATUS.ERROR);
         response.status = STATUS.ERROR.name();
         response.message = e.getMessage(); 
         return response;
      }    

}

 /**
  * This method is creating firm location records.
  * @param CashtraxEntities.FirmLocation request
  * @return CTXResponse.
  * @exception Exception On input error.
  * @see 
 */
 @testvisible private CTXResponse createFirmLocation(CashtraxEntities.FirmLocation request) {
      CTXResponse   response = new CTXResponse();

      try{
      
      
            if(String.IsNotBlank(request.CRM_FirmID))
            {
      
                Id dupId = checkDuplicateAccount(request,false);
               
               if(dupId ==null)
               { 
              
                 Account acct = new Account();
        
                 acct.Name = request.FirmLocationName;
                 acct.HeadQuarter__c = false; //request.HeadQuarter;
                 acct.Type = 'LawFirm'; //(String.isBlank(request.Type)) ? 'LawFirm' : request.Type;
                 
                 // 9/25/2019 - changed from FirmId to FirmLocationId  dw
                 acct.CTXFirmId__c= request.FirmLocationID;
                 acct.ParentId = request.CRM_FirmID;
                 
                 acct.BillingStreet = request.Address1;
                 acct.Street2__c = request.Address2;
                 acct.BillingPostalCode = request.ZipCode;
                 acct.BillingCity = request.city;
                 acct.BillingState = request.state;
                 
   //              acct.Phone = request.PhoneNumber;
     //            acct.Fax = request.fax;
                
                // acct.Website = request.Website;
                 acct.RecordTypeId = Utility.getAccountRecTypeId(Constant.RC_ATTORENY_ACCOUNT);
                 acct.Created_from_backend__c = true;
                 acct.PreSet__c = true;
                 insert acct; 
         
                 createCache('CreateFirmLocation',JSON.serialize(request),acct.Id);
         
                  //Send Response 
                 response.CRM_ID = acct.Id;
                 //response.CTX_FirmID = Integer.valueOf(request.FirmID);
                 response.statusCode = statusMessaages.get(STATUS.OK);
                 response.status = STATUS.OK.name();
                 response.message = 'ACCOUNT LOCATION CREATED' ;
                 return response;
                } 
                 else
                {
                
                 response.CRM_ID = dupId;
                 //response.CTX_FirmID = Integer.valueOf(request.FirmID);
                 response.statusCode = statusMessaages.get(STATUS.OK);
                 response.status = STATUS.OK.name();
                 response.message = 'ACCOUNT LOCATION ALREADY EXISTS' ;
                 return response;
                   
                } 
                
             }   
             else  //blank crmid  
             {
                 response.CRM_ID = null; 
                 response.statusCode = statusMessaages.get(STATUS.ERROR);
                 response.status = STATUS.ERROR.name();
                 response.message = 'CRM Firm ID Missing'; 
                 return response;    
                        
             }    
              }
              catch(Exception e)
              {
                
                 response.CRM_ID = null; 
                // response.CTX_FirmID = Integer.valueOf(request.FirmID);
                
                 response.statusCode = statusMessaages.get(STATUS.ERROR);
                 response.status = STATUS.ERROR.name();
                 response.message = e.getMessage(); 
                 return response;
              }    
        
  }


 /**
  * This method is updating the firm records.
  * @param CashtraxEntities.Firm request
  * @return CTXResponse.
  * @exception Exception On input error.
  * @see 
 */ 
 @testvisible private CTXResponse updateFirm(CashtraxEntities.Firm request) {
      CTXResponse   response = new CTXResponse();

      try{
      
        if(String.IsNotBlank(request.CRM_FirmId))
        {
       
            
          CashtraxEntities.UpdatedByCashtrax = true;  
          
         Account acct = new Account(id=request.CRM_FirmId);

         acct.Name = request.FirmName;
         acct.HeadQuarter__c = true; //request.HeadQuarter;
         //acct.CTXFirmId__c= request.FirmID;
     /*   
         acct.BillingStreet = request.Address1;
         acct.Street2__c = request.Address2;
         acct.BillingPostalCode = request.ZipCode;
         acct.BillingCity = request.city;
         acct.BillingState = request.state;
       */  
      //   acct.Phone = request.PhoneNumber;
      //   acct.Fax = request.fax;
        
         acct.Website = request.Website;
         //acct.UpdatedByPS__c = true;
         update acct; 
         
         createCache('UpdateFirm',JSON.serialize(request),acct.Id);
         
        
            
          //Send Response 
         //response.CRM_FirmID = acct.Id;
         //response.CTX_FirmID = Integer.valueOf(request.FirmID);
         response.statusCode = statusMessaages.get(STATUS.OK);
         response.status = STATUS.OK.name();
         response.message = 'ACCOUNT UPDATED' ;
         return response;
         
        }else
        {
         response.statusCode = statusMessaages.get(STATUS.ERROR);
         response.status = STATUS.ERROR.name();
         response.message = 'CRM Firm ID Missing'; 
         return response;
        }
         
         
      }
      catch(Exception e)
      {
        
         //response.CRM_FirmID = null; 
         //response.CTX_FirmID = Integer.valueOf(request.FirmID);
        
         response.statusCode = statusMessaages.get(STATUS.ERROR);
         response.status = STATUS.ERROR.name();
         response.message = e.getMessage(); 
         return response;
      }    

}
 
 /**
  * This method is updating the firm location records.
  * @param CashtraxEntities.FirmLocation request
  * @return CTXResponse.
  * @exception Exception On input error.
  * @see 
 */
 @testvisible private CTXResponse updateFirmLocation(CashtraxEntities.FirmLocation request) {
      CTXResponse   response = new CTXResponse();

      try{
      
           Id dupId = checkDuplicateAccount(request,false);
        //   if(dupId ==null)
           { 
      
                if(String.IsNotBlank(request.CRM_FirmLocationId))
                {
        
                 CashtraxEntities.UpdatedByCashtrax = true; 
         
        
                 Account acct = new Account(id=request.CRM_FirmLocationId);
        
                 acct.Name = request.FirmLocationName;
                 acct.HeadQuarter__c = false; //request.HeadQuarter;
                 // 9/25/2019 DW the CTXID is the FirmLocationId for a firm location
                 acct.CTXFirmId__c = request.FirmLocationID;
                 acct.Type = 'LawFirm'; // (String.isBlank(request.Type)) ? 'LawFirm Location' : request.Type;
                 acct.BillingStreet = request.Address1;
                 acct.Street2__c = request.Address2;
                 acct.BillingPostalCode = request.ZipCode;
                 acct.BillingCity = request.city;
                 acct.BillingState = request.state;
                 
    //             acct.Phone = request.PhoneNumber;
      //           acct.Fax = request.fax;
                
               //  acct.Website = request.Website;
                // acct.UpdatedByPS__c = true;
                 update acct; 
                 
                 createCache('UpdateFirmLocation',JSON.serialize(request),acct.Id);
                 
                
                  //Send Response 
                 //response.CRM_FirmID = acct.Id;
                 //response.CTX_FirmID = Integer.valueOf(request.FirmID);
                 response.statusCode = statusMessaages.get(STATUS.OK);
                 response.status = STATUS.OK.name();
                 response.message = 'ACCOUNT LOCATION UPDATED' ;
                 return response;
                 
            }else
            {
             response.statusCode = statusMessaages.get(STATUS.ERROR);
             response.status = STATUS.ERROR.name();
             response.message = 'CRM Firm Location ID Missing'; 
             return response;
            }
          }//dup
       /*  else
         {
           
           //Don't allow them to update
           
             response.CRM_ID = dupId;
             //response.CTX_FirmID = Integer.valueOf(request.FirmLocationID);
             response.statusCode = statusMessaages.get(STATUS.OK);
             response.status = STATUS.OK.name();
             response.message = 'ACCOUNT LOCATION ALREADY EXISTS' ;
             return response;
         }    
         */
      }
      catch(Exception e)
      {
        
         //response.CRM_FirmID = null; 
         //response.CTX_FirmID = Integer.valueOf(request.FirmLocationID);
        
         response.statusCode = statusMessaages.get(STATUS.ERROR);
         response.status = STATUS.ERROR.name();
         response.message = e.getMessage(); 
         return response;
      }    

}
 
 
 /**
  * This method is creating the attorney records.
  * @param CashtraxEntities.Attorney request
  * @return CTXResponse.
  * @exception Exception On input error.
  * @see 
 */
 @testvisible private CTXResponse createAttorney(CashtraxEntities.Attorney request) {
      CTXResponse   response = new CTXResponse();
      //List<Account> lstAccount = new List<Account>();
      //List<Contact> lstContact = new List<Contact>();
      Contact cnt=null;
      boolean insertFlag = false;
   
   try{
   
      Id duplicateId  = checkDuplicateContact(request);
      if(String.isNotBlank(String.valueOf(request.CRM_FirmLocationID)))
      {
      
        if(duplicateId ==null ) 
        {
         
             cnt = new Contact();
             cnt.AccountId = request.CRM_FirmLocationID;
             cnt.FirstName = request.FirstName; 
             cnt.LastName = request.LastName;
          //   cnt.MiddleName__c = request.MiddleName;
         /*    cnt.MailingStreet = request.Address1;
             cnt.MailingStreet2__c = request.Address2;
             cnt.MailingPostalCode = request.ZipCode;
             cnt.MailingCity = request.city;
             cnt.MailingState = request.state;
         */
             //cnt.PresetID__c= String.valueOf(request.AttorneyID);
           
             cnt.Phone = request.PhoneNumber;
             cnt.Fax = request.fax;
             cnt.Email = request.Email;
            // cnt.Type__c = request.Type;
             cnt.BarVerificationDate__c = (request.BarVerificationDate)!=null? (request.BarVerificationDate).date(): null;
             cnt.BarVerificationExpirationDate__c= (request.BarVerificationExpirationDate)!=null? (request.BarVerificationExpirationDate).date(): null;
            
             cnt.PSPortal__c= request.Portal;
             cnt.RecordTypeId = Utility.getContactRecTypeId(Constant.RC_ATTORENY_CONTACT);
             cnt.PreSet__c = true;
            
            // Modified 7/27/2020 DW to pull owner Email
             if(String.isNotBlank(String.valueOf(request.OwnerEmail)))
             {	User Usr = new User();
             	Usr =[SELECT Id, Name, Email FROM User where Email=:request.OwnerEmail ];
			 	cnt.OwnerId = Usr.Id;   // UserId
             }
            
             insert cnt;
             
         
            Account_Relation__c relation = new Account_Relation__c();
            relation.Role__c = 'Attorney';//request.Type;
            relation.Contact__c = cnt.Id;
            relation.Account__c = request.CRM_FirmLocationID;
            relation.PresetID__c = String.valueOf(request.AttorneyID);
             relation.Created_from_backend__c=true;
            insert relation;
         
            
             createCache('CreateAttorney',JSON.serialize(request),relation.Id);
         
         
          //Send Response 
         //response.CTX_AttorneyID = Integer.valueOf(request.AttorneyID);
         response.CRM_ID = cnt.Id;
        // response.CTX_FirmID = Integer.valueOf(request.CTX_FirmID);
         response.statusCode = statusMessaages.get(STATUS.OK);
         response.status = STATUS.OK.name();
         response.message = 'ATTORNEY CONTACT CREATED' ;
         return response;
         
      } else {
        
                
                List<Account_Relation__c> accRelList = [select Id from Account_Relation__c where Contact__c= : duplicateId and Account__c= :request.CRM_FirmLocationID];
                if(!(accRelList!=null && accRelList.size()>0))
                {
                //Insert dup into relation object
                 Account_Relation__c relation = new Account_Relation__c();
                  relation.Role__c = 'Attorney';//request.Type;
                  relation.Contact__c = duplicateId;
                  relation.Account__c = request.CRM_FirmLocationID;
                  relation.PresetID__c = String.valueOf(request.AttorneyID);
                  insert relation;
                }
                
                    
                 //response.CTX_AttorneyID = Integer.valueOf(request.AttorneyID);
                 response.CRM_ID = duplicateId;
                // response.CTX_FirmID = Integer.valueOf(request.CTX_FirmID);
                
                 response.statusCode = statusMessaages.get(STATUS.OK);
                 response.status = STATUS.OK.name();
                 response.message = 'ATTORNEY CONTACT ALREADY EXISTS' ;
                 return response;
      }
      
      
      }//blank crm
      else
      {
          response.CRM_ID = null;
          response.status = STATUS.ERROR.name();
          response.message = 'MISSING CRM FIRMLocation_ID in request.';
          return response;
    
      }
      
      }
      catch(Exception e)
      {
         //response.CTX_AttorneyID = Integer.valueOf(request.AttorneyID);
         //response.CRM_AttorneyID = duplicateId;
       //  response.CTX_FirmID = Integer.valueOf(request.CTX_FirmID);
        response.CRM_ID = null;
         response.statusCode = statusMessaages.get(STATUS.ERROR);
         response.status = STATUS.ERROR.name();
         response.message = e.getMessage(); 
         return response;
      
      
      }
 }
 
 /**
  * This method is updating the attorney records.
  * @param CashtraxEntities.Attorney request
  * @return CTXResponse.
  * @exception Exception On input error.
  * @see 
 */
 @testvisible private CTXResponse  updateAttorney(CashtraxEntities.Attorney request) {
      CTXResponse   response = new CTXResponse();
      
      List<Contact> cntLst = new List<Contact>();
      boolean updateFlag = false;
     
    try{ 
     
     
      if(String.isNotBlank(String.valueOf(request.CRM_FirmLocationID)) && String.isNotBlank(String.valueOf(request.CRM_AttorneyID)))
      {
     
             CashtraxEntities.UpdatedByCashtrax = true; 
             system.debug('-------------------------UpdatedByCashtrax------------'+CashtraxEntities.UpdatedByCashtrax);
     
         Id duplicateId  = checkDuplicateContact(request);
     //    if(duplicateId ==null)
         {
             ID cntID = String.ValueOf(request.CRM_AttorneyID);
             Contact cnt = new Contact(Id=cntId);
             cnt.accountId = request.CRM_FirmLocationID;
             cnt.FirstName = request.FirstName; 
             cnt.LastName = request.LastName;
          //   cnt.MiddleName__c = request.MiddleName;
         /*    cnt.MailingStreet = request.Address1;
             cnt.MailingStreet2__c = request.Address2;
             cnt.MailingPostalCode = request.ZipCode;
             cnt.MailingCity = request.city;
             cnt.MailingState = request.state;
           */
             cnt.Phone = request.PhoneNumber;
             cnt.Fax = request.fax;
             cnt.Email = request.Email;
             //cnt.Type__c = 'Attorney'; //request.Type;
             cnt.BarVerificationDate__c = (request.BarVerificationDate)!=null? (request.BarVerificationDate).date(): null;
             cnt.BarVerificationExpirationDate__c= (request.BarVerificationExpirationDate)!=null? (request.BarVerificationExpirationDate).date(): null;
             cnt.PSPortal__c= request.Portal;
             cnt.ContactInstructions__c = request.ContactInformation;
             // Modified 7/27/2020 DW to pull owner Email
             if(String.isNotBlank(String.valueOf(request.OwnerEmail)))
             {	User Usr = new User();
             	Usr =[SELECT Id, Name, Email FROM User where Email=:request.OwnerEmail ];
			 	cnt.OwnerId = Usr.Id;   // UserId
             }
             
             cntLst.add(cnt);
             //cnt.UpdatedByPS__c = true;
             update cntLst;
             
             createCache('UpdateAttorney',JSON.serialize(request),cnt.Id);
         
             
          
             response.statusCode = statusMessaages.get(STATUS.OK);
             response.status = STATUS.OK.name();
             response.message = 'ATTORNEY CONTACT UPDATED SUCCESSFULLY.';
             return response;
          }
      /*    else //dup
          {
          
             //response.CTX_AttorneyID = Integer.valueOf(request.AttorneyID);
           //  response.CRM_AttorneyID = duplicateId;
            // response.CTX_FirmID = Integer.valueOf(request.CTX_FirmID);
            
             response.statusCode = statusMessaages.get(STATUS.ERROR);
             response.status = STATUS.ERROR.name();
             response.message = 'ATTORNEY CONTACT ALREADY EXISTS' ;
             return response;
          }
             
        */ 
       }  else {
         response.statusCode = statusMessaages.get(STATUS.ERROR);
         response.status = STATUS.ERROR.name();
         response.message = 'MISSING CRM ATTORNEY ID OR FIRMLOCATION ID in request.';
         return response;
      }
      
   
  }
   catch(Exception e)
      {
         response.statusCode = statusMessaages.get(STATUS.ERROR);
         response.status = STATUS.ERROR.name();
         response.message = e.getMessage(); 
         return response;
      
      
      }    
      
      
 }
 
 /**
  * This method is creating the attorney assistant records.
  * @param CashtraxEntities.AttorneyAssistant request
  * @return CTXResponse.
  * @exception Exception On input error.
  * @see 
 */
 @testvisible private CTXResponse createAttorneyAssistant(CashtraxEntities.AttorneyAssistant request) {
      CTXResponse   response = new CTXResponse();
      String nonAttorneyId ;
      String nonAttorneyContactId;
     
    try{  
         if(String.IsNotBlank(request.CRM_AttorneyID)  && String.IsNotBlank(request.CRM_FirmLocationID)) {
         
                                 
                  String name = request.Name;
                  String[] namearr = name.split(' ');
                  String firstName='',lastName='';
                  if(namearr.size()>1)
                  {
                     firstName = namearr[0];
                     lastName= namearr[1];
                  }else if(namearr.size()>0)
                  {
                     firstName = name;
                     lastName= name;
                     
                 }
                  
                  Id dupId = checkDuplicateContact(request,firstName,lastName);

                  
                  if(dupId==null)            
                  {   
                 
                      Contact cnt = new Contact();
                      cnt.accountId = request.CRM_FirmLocationID;
                      cnt.FirstName = firstName;
                       cnt.LastName = lastName;
                      //cnt.PresetID__c = String.valueOf(request.AttorneyAssistantID);
                      cnt.Phone = request.PhoneNumber;
                     // cnt.Fax = request.fax;
                      cnt.Email = request.Email;
                      cnt.Role__c = request.AttorneyAssistantType;
                      cnt.RecordTypeId = Utility.getContactRecTypeId(Constant.RC_ATTORENY_CONTACT);
                      
                      cnt.PreSet__c = true;
                      insert cnt;
                     
                        Non_Attorney_Contact__c nonAttorney = new Non_Attorney_Contact__c ();
                        nonAttorney.Attorney__c = request.CRM_AttorneyID;
                        nonAttorney.Contact__c = cnt.Id;
                        nonAttorney.Firm_Name__c = request.CRM_FirmLocationID;
                        nonAttorney.PresetID__c =request.AttorneyAssistantID;
                        nonAttorney.Role__c = request.AttorneyAssistantType;
                        insert nonAttorney;
                        
                        createCache('CreateNonAttorney',JSON.serialize(request),nonAttorney.Id);
         
         
                        nonAttorneyId = nonAttorney.Id;
                        nonAttorneyContactId = cnt.Id;
                      
                         //response.nonAttorneyId = nonAttorneyId;
                         response.CRM_ID = nonAttorneyContactId;
                         response.statusCode = statusMessaages.get(STATUS.OK);
                         response.status = STATUS.OK.name();
                         response.message = 'SUPPORT CONTACT CREATED' ;
                         return response;
                  }
                  else //dup
                  {
                 
                            List<Non_Attorney_Contact__c> accRelList = [select Id from Non_Attorney_Contact__c where Contact__c= : dupId and Firm_Name__c= :request.CRM_FirmLocationID];
                            if(!(accRelList!=null && accRelList.size()>0))
                            {
                               //Insert dup into relation object
                               Non_Attorney_Contact__c nonAttorney = new Non_Attorney_Contact__c ();
                               nonAttorney.Attorney__c = request.CRM_AttorneyID;
                               nonAttorney.Contact__c = dupId;
                               nonAttorney.Firm_Name__c = request.CRM_FirmLocationID;
                               nonAttorney.PresetID__c =request.AttorneyAssistantID;
                               nonAttorney.Role__c = request.AttorneyAssistantType;
                               insert nonAttorney;
                               
                               createCache('CreateNonAttorney',JSON.serialize(request),nonAttorney.Id);
                                
                            }
                
                            
                             response.CRM_ID = dupId;
                             response.statusCode = statusMessaages.get(STATUS.OK);
                             response.status = STATUS.OK.name();
                             response.message = 'SUPPORT CONTACT ALREADY EXISTS' ;
                             return response;
                  }
                 
              } else //missing contact id
              {
                 response.CRM_ID = null;
                 response.statusCode = statusMessaages.get(STATUS.ERROR);
                 response.status = STATUS.ERROR.name();
                 response.message = 'CRM Attorney ID or FIRM LOCATIONID Missing in Request' ;
                 return response;
              }
              
      }catch(Exception e)
      {
         response.CRM_ID = null;
         response.status = STATUS.ERROR.name();
         response.message = e.getMessage(); 
         return response;
      
      
      }             
              
             // return response;
   }
 
 /**
  * This method is updating the attorney assistant records .
  * @param CashtraxEntities.AttorneyAssistant request
  * @return CTXResponse.
  * @exception Exception On input error.
  * @see 
 */
 @testvisible private CTXResponse updateAttorneyAssistant(CashtraxEntities.AttorneyAssistant request) {
      CTXResponse   response = new CTXResponse();
      String nonAttorneyId ;
      String nonAttorneyContactId;
      boolean updateFlag = false;
      
     try{ 
          if(String.IsNotBlank(request.CRM_AttorneyAssistantID)) 
           {
         
            
                     CashtraxEntities.UpdatedByCashtrax = true; 
            
            
                  String name = request.Name;
                  String[] namearr = name.split(' ');
                  String firstName='',lastName='';
                  if(namearr.size()>1)
                  {
                     firstName = namearr[0];
                     lastName= namearr[1];
                  }else if(namearr.size()>0)
                  {
                     firstName = name;
                     lastName= name;
                     
                 }
                  
                  Id dupId = checkDuplicateContact(request,firstName,lastName);

           //       if(dupId==null)            
                  {   
                      ID cntID = (ID)request.CRM_AttorneyAssistantID;
                      Contact cnt = new Contact(Id=cntID);
                     //cnt.AccountId = request.CRM_FirmID;
                      cnt.FirstName =firstName; 
                      cnt.LastName = lastName;
                      //cnt.Attorney_Contact_Id__c = String.valueOf(request.AttorneyAssistantID);
                      cnt.Phone = request.PhoneNumber;
                      cnt.Fax = request.fax;
                      cnt.Email = request.Email;
                    //  cnt.Type__c = request.AttorneyAssistantType;
                      //cnt.UpdatedByPS__c = true;
                      update cnt;
                      
                      createCache('UpdateNonAttorney',JSON.serialize(request),cnt.Id);
                      
                       response.CRM_ID = cnt.Id;
                       response.statusCode = statusMessaages.get(STATUS.OK);
                        response.status = STATUS.OK.name();
                        response.message = 'ATTORNEY ASSISTANT UPDATED' ;
                        return response;
                      
                    
                  }
             /*     else //dup
                  {
                        
                         response.CRM_ID = dupId;
                         response.statusCode = statusMessaages.get(STATUS.OK);
                         response.status = STATUS.OK.name();
                         response.message = 'NON-ATTORNEY ALREADY EXISTS' ;
                         return response;
                  }
               */ 
                
             } 
             else //missing contact id
             {
                  response.CRM_ID = null;
                 response.statusCode = statusMessaages.get(STATUS.ERROR);
                 response.status = STATUS.ERROR.name();
                 response.message = 'Missing CRM_AttorneyAssitantID in Request' ;
                 return response;
              }      
                  
            }
            catch(Exception e)
             {
                  response.CRM_ID = null;
                 response.status = STATUS.ERROR.name();
                  response.status = STATUS.ERROR.name();
                 response.message = e.getMessage(); 
                 return response;
          
              }              
                     
  }
  
  /**
  * This method is creating an Opportunity whenever a case is funded in CTX.
  * @param CashtraxEntities.FundedCase request
  * @return CTXResponse.
  * @exception Exception On input error.
  * @see 
  
 { 
 "plaintiffName" : "Amit shah",
 "caseNumber" : 3343,
 "amount" : 100.34,
 "CRM_FirmLocationID": "0014B00000eyL30",
 "CRM_AttorneyID" : "0034B00000XxhY8"
}
 */
 @testvisible private CTXResponse createFundedCase(List<FundedCaseParser.Cases> caseList) {
      CTXResponse   response = new CTXResponse();
 
 
     for(FundedCaseParser.Cases fcase: caseList)
     {
        createFundedCase(fcase);
     }
 
 
         response.statusCode = statusMessaages.get(STATUS.OK);
         response.status = STATUS.OK.name();
         response.message = 'RECD CASE DETAILS'; 
         
         return response;
 }
 

        @testvisible private boolean createFundedCase(FundedCaseParser.Cases fcase)
    {
    
       try{
            if(String.isNotBlank(fcase.CRM_FirmLocationID) && String.isNotBlank(fcase.CRM_AttorneyID))
            {   
                
                    String pfname = fcase.PlaintiffName;
                    String[] pnames = pfname.split(' ');
                    String fname='',lname='';
                    if(pnames.size()>1)
                    {
                        fname = pnames[0];
                        lname = pnames[1];
                    }
                    else
                    {
                        fname = ' ';
                        lname = pfname;
                    }
                    
                
                
                //Check if any QuickAdd opportunty exists with case number
                
                List<Opportunity> oppList = [Select Id,StageName from Opportunity where Case_Number__c = :Decimal.valueOf(fcase.CaseNumber)];
                if(oppList!=null && oppList.size()>0)
                {
                    Opportunity opp = oppList[0];
                    opp.StageName = 'Closed Won';
                    update opp;
                     createCache('CreateFundedCase1',JSON.serialize(fcase),opp.Id);
                }
                    
                else
                {
                        //Check for Wolf pack Opportunity
                        String firmLocationId = fcase.CRM_FirmLocationID;
                        String attorneyId = fcase.CRM_AttorneyID;
                        List<Opportunity> oppAttList = [Select Id,StageName from Opportunity where AccountId = :firmLocationId 
                                                         and Attorney__c = :attorneyId and StageName != 'Closed Won'];
                        if(oppAttList!=null && oppAttList.size()>0)
                        {
                            Opportunity opp = oppAttList[0];
                            opp.Amount = Decimal.valueOf(fcase.Amount);
                            opp.PlaintiffFirstName__c = fname;
                            opp.PlaintiffLastName__c = lname; 
                            opp.Case_Number__c = Integer.valueOf(fcase.CaseNumber);
                            opp.StageName = 'Closed Won';
                            opp.CloseDate = System.today();
                            opp.RecordTypeId = Utility.getOppRecTypeId('Standard');
                            update opp;
                              createCache('CreateFundedCase2',JSON.serialize(fcase),opp.Id);
                        }
                        else
                        { 
                            Opportunity opp = new Opportunity();
                            
                            opp.name = fcase.plaintiffName;
                            opp.Amount = Decimal.valueOf(fcase.Amount);
                            opp.PlaintiffFirstName__c = fname;
                            opp.PlaintiffLastName__c = lname; 
                            opp.Case_Number__c = Integer.valueOf(fcase.CaseNumber);
                            opp.StageName = 'Closed Won';
                            opp.AccountId = fcase.CRM_FirmLocationID;
                            opp.Attorney__c = fcase.CRM_AttorneyID; 
                            opp.CloseDate = System.today();
                            opp.RecordTypeId = Utility.getOppRecTypeId('Standard');
                        
                             opp.RecordTypeId = Utility.getOppRecTypeId('Standard');
                             insert opp; 
                             createCache('CreateFundedCase3',JSON.serialize(fcase),opp.Id);
                            
                        }
        
                }//else
                
              } //main if
        
         return true;
         
      }catch(Exception e)
      {
        system.debug('-----ERROR creating/updating opportunity--------'+e.getMessage()+' for case:'+fcase);
      }    
      
   return false;
}

  
  
 /**
  * This method is Delete the firm records.
  * @param String jsonRequest
  * @return String.
  * @exception Exception On input error.
  * @see 
 */
 public String deleteFirmInCRM(String jsonRequest) {
    System.debug('PRINT REQUEST PAYLOAD ' + jsonRequest);
    CTXResponse   response = new CTXResponse();
    CashtraxEntities.Firm request ;
    
    try {
         request = (CashtraxEntities.Firm ) JSON.deserialize(jsonRequest, CashtraxEntities.Firm.class);
         response = deleteFirm(request);
         return JSON.serialize(response);
    }catch(Exception e) {
         response.status = STATUS.ERROR.name();
         response.message = e.getMessage();
         return JSON.serialize(response);
    }
 }
 
 
 /**
  * This method is Delete the Firm Location records.
  * @param String jsonRequest
  * @return String.
  * @exception Exception On input error.
  * @see 
 */
 public String deleteFirmLocation(String jsonRequest) {
    System.debug('PRINT REQUEST PAYLOAD ' + jsonRequest);
    CTXResponse   response = new CTXResponse();
    CashtraxEntities.FirmLocation  request ;
    
    try {
         request = (CashtraxEntities.FirmLocation  ) JSON.deserialize(jsonRequest, CashtraxEntities.FirmLocation.class);
         response = deleteFirmLocation(request);
         return JSON.serialize(response);
    }catch(Exception e) {
         response.status = STATUS.ERROR.name();
         response.message = e.getMessage();
         return JSON.serialize(response);
    }
 }
 

 /**
  * This method is Delete the firm records.
  * @param CashtraxEntities.Firm request
  * @return CTXResponse.
  * @exception Exception On input error.
  * @see 
 */ 


@testvisible private CTXResponse deleteFirm  (CashtraxEntities.Firm request) {
      CTXResponse response = new CTXResponse();
      response.CRM_ID=request.CRM_FirmId;
      try{
        if(String.IsNotBlank(request.CRM_FirmId)){
            List<Account> lstofAcc=[select id,(select id from contacts) from account where id =:request.CRM_FirmId];
         
            if(lstofAcc.size()>0 && lstofAcc[0].contacts.size()>0){
                response.statusCode = statusMessaages.get(STATUS.ERROR);
                response.status = STATUS.ERROR.name();
                response.message = 'Related contacts found in CRM Firm Records'; 
                return response;
            }else if(lstofAcc.size()>0 && lstofAcc[0].contacts.size()==0){
            
                delete lstofAcc;
                response.statusCode = statusMessaages.get(STATUS.OK);
                response.status = STATUS.OK.name();
                response.message = 'Successfully Account Deleted' ;
                return response;
             
            }else{
                response.statusCode = statusMessaages.get(STATUS.ERROR);
                response.status = STATUS.ERROR.name();
                response.message = 'CRM Firm Record not Found'; 
                return response;
            }
        }else{
            response.statusCode = statusMessaages.get(STATUS.ERROR);
            response.status = STATUS.ERROR.name();
            response.message = 'CRM Firm ID Missing'; 
            return response;
        }
         
         
      }
      catch(Exception e){
         response.statusCode = statusMessaages.get(STATUS.ERROR);
         response.status = STATUS.ERROR.name();
         response.message = e.getMessage(); 
         return response;
      }    

}



 /**
  * This method is Delete the firm Location records.
  * @param CashtraxEntities.FirmLocation request
  * @return CTXResponse.
  * @exception Exception On input error.
  * @see 
 */ 
@testvisible private CTXResponse deleteFirmLocation(CashtraxEntities.FirmLocation  request) {
      CTXResponse response = new CTXResponse();
       response.CRM_ID=request.CRM_FirmLocationId;
      try{
        if(String.IsNotBlank(request.CRM_FirmLocationId)){
            List<Account> lstofAcc=[select id,(select id from contacts) from account where id =:request.CRM_FirmLocationId];
             
            if(lstofAcc.size()>0 && lstofAcc[0].contacts.size()>0){
                response.statusCode = statusMessaages.get(STATUS.ERROR);
                response.status = STATUS.ERROR.name();
                response.message = 'Related contacts found in  CRM Firm Location Records'; 
                return response;
            }else if(lstofAcc.size()>0 && lstofAcc[0].contacts.size()==0){
                delete lstofAcc;
                response.statusCode = statusMessaages.get(STATUS.OK);
                response.status = STATUS.OK.name();
                response.message = 'Successfully Account Deleted' ;
                return response;
             
            }else{
                response.statusCode = statusMessaages.get(STATUS.ERROR);
                response.status = STATUS.ERROR.name();
                response.message = 'CRM Firm Location Record not Found'; 
                return response;
            }
        }else{
            response.statusCode = statusMessaages.get(STATUS.ERROR);
            response.status = STATUS.ERROR.name();
            response.message = 'CRM Firm Location ID Missing'; 
            return response;
        }
         
         
      }
      catch(Exception e){
         response.statusCode = statusMessaages.get(STATUS.ERROR);
         response.status = STATUS.ERROR.name();
         response.message = e.getMessage(); 
         return response;
      }    

}
  
  
 
 /**
  * This method is check duplicate contact.
  * @param CashtraxEntities.Attorney request
  * @return Id.
  * @exception Exception On input error.
  * @see 
 */
 @testvisible private Id checkDuplicateContact(CashtraxEntities.Attorney request) {
 
     List<Contact> cntList = [Select Id from Contact where firstname =:request.FirstName  
                                 and lastname =:request.LastName and email=:request.Email];
     
     if(cntList!=null && cntList.size()>0)
     {
        return cntList[0].Id;
     }
     return null;
 }



 /**
  * Check for duplicate Account based on Name and Address Information
  * @param CashtraxEntities.FirmLocation request, Boolean isHeadQuarter
  * @return Id.
  * @exception Exception On input error.
  * @see 
 */
 @testvisible private Id checkDuplicateAccount(CashtraxEntities.FirmLocation request, Boolean isHeadQuarter) {
 
     List<Account> acctList =null;
    
  /* if(isHeadQuarter==true)
   {  
     acctList= [Select Id from Account where Name  =:request.FirmName and HeadQuarter__c = true];
   }
   else */
   
   {  //CTX does not have phone and fax at location level
     acctList= [Select Id from Account where Name  =:request.FirmLocationName and BillingStreet = :request.Address1 
                and BillingCity=:request.City and BillingState = :request.State and BillingPostalCode = :request.ZipCode
               ];
       
   }
    
     if(acctList!=null && acctList.size()>0)
     {
        return acctList[0].Id;
     }
    
     return null;
 }

 
 @testvisible private Id checkDuplicateContact(CashtraxEntities.AttorneyAssistant request,String firstName,String lastName) {
     Id dupId = null;
     List<Contact> cntList = [Select Id from Contact where firstname =:firstName  and lastname =:lastName and email=:request.Email];
     if(cntList!=null && cntList.size()>0) {
         dupId = cntList[0].Id;
     }
     return dupId;
 }
 
 /**
     * This method is build cache request.
     * @param String action, String payload,String objectId
     * @return PSCommunicationCache__c  
     * @exception Exception On input error.
     * @see 
    */
     @testvisible private static void  createCache(String action, String payload,String objectId)
     {
     
         PSCommunicationCache__c cache = new PSCommunicationCache__c();
         cache.GenericName__c = action;
         cache.Direction__c = 'Incoming';
         cache.Operation__c = action; //OperationMap.get(action);
         cache.InputPayload__c = payload;
         cache.LOB__c = 'PS';
         cache.ObjectId__c = objectId;
         insert cache;
         
     }
     
   private static Datetime convertGMTtoLocal(Datetime dt)
   {
        if(dt==null) return null;        
        String timeZone = UserInfo.getTimeZone().getID();
        Datetime dateGMT=dt;
        Datetime d1=Datetime.valueOf(dateGMT);
        string s1=d1.format();
        System.debug('@@@@@@@@@@@'+s1);
        return d1;
   }  
 
 public class CTXResponse {
    
   public String statusCode{set;get;}
   public String status{set;get;}
   public String message{set;get;}
  // public integer CTX_FirmID{set;get;}
   public String CRM_ID{set;get;}
  // public integer CTX_AttorneyID{set;get;}
  // public String CRM_AttorneyID{set;get;}
   
 }
 
 public class CTXUpdateResponse {
   
   public String status{set;get;}
   public String message{set;get;}
   
   
 }
 
 public class CTXNonAttorneyResponse {
    
   public String statusCode{set;get;}
   public String status{set;get;}
   public String message{set;get;}
   //public String CRM_NonAttorneyId{set;get;}
   public String CRM_ContactId{set;get;}
   
   
 }
 
 public class CTXNonAttorneyUpdatResponse {
    
   public String statusCode{set;get;}
   public String status{set;get;}
   public String message{set;get;}
    public String CRM_ContactId{set;get;}
   
   
   
 }
 
 public class CTXNoteResponse {
 
   public String statusCode{set;get;}
   public String status{set;get;}
   public String message{set;get;}
   public List<CRMNote> Notes {get;set;}
 
 }

public class NoteResponse {
 
   public String statusCode{set;get;}
   public String status{set;get;}
   public String message{set;get;}
   public List<CashtraxEntities.SFNote> notes {get;set;}
 
 }

 public class CTXActivityResponse  {
 
   public String statusCode{set;get;}
   public String status{set;get;}
   public String message{set;get;}
   public List<CashtraxEntities.Activity> activities {get;set;}
 
 }
  

 public class CTXEventResponse  {
 
   public String statusCode{set;get;}
   public String status{set;get;}
   public String message{set;get;}
   public List<CashtraxEntities.Event> activities {get;set;}
 
 }
  


public class CRMNote {

   public String NoteID{set;get;}
   public String CRMNoteID{set;get;}

}

}