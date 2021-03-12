@isTest
private class PresetCastTraxServiceTest {

  @isTest
  private static void testCreateAttorneyAssistant(){
   String request = '{"CRM_FirmID" : 343,"CRM_AttorneyID":"1234","AttorneyAssistantID":123,"AttorneyAssistantType":"Assistant","FirstName":"FirstName","LastName":"LastName","email":"test346@gmail.com","PhoneNumber":"1234567890","Fax"  : "3323232"}';
   new PresetCastTraxService().createAttorneyAssistant(request);
 
  }
  
  @isTest
  private static void testCreateAttorneyAssistantException(){
   String request = null;
   new PresetCastTraxService().createAttorneyAssistant(request);
 
  }
  
  @isTest
  private static void testUpdateAttorneyAssistant(){
   String request = '{"CRM_FirmID" : 343,"CRM_AttorneyID":"0034B00000XbgA8QAJ","AttorneyAssistantID":123,"AttorneyAssistantType":"Assistant","FirstName":"FirstName","LastName":"LastName","email":"test346@gmail.com","PhoneNumber":"1234567890","Fax"  : "3323232"}';
   new PresetCastTraxService().updatedAttorneyAssistant(request);
  }
  
  @isTest
  private static void testUpdateAttorneyAssistantException(){
   String request = null;
   new PresetCastTraxService().updatedAttorneyAssistant(request);
  }
  
  @isTest
  private static void testCreateCTXAttorney(){
   String request = '{"CRM_FirmID" : "0014B00000eRRbv","FirmName": "Prashant","FirstName": "Kumar Last","CTX_FirmID": 1234567,"LastName": "Test Last Name","MiddleName":"","Address1":"","Address2":"","City":"","State":"","Zip":"","DayPhone":"","Fax":"","Email":"","AttorneyID":123567,"Type":"Payer"}';
   new PresetCastTraxService().CreateCTXAttorney(request);
  }
  
  @isTest
  private static void testCreateCTXAttorneyException(){
   String request = null;
   new PresetCastTraxService().CreateCTXAttorney(request);
  }
  
  @isTest
  private static void testupdateCTXAttorney(){
   String request = '{"CRM_FirmID" : "0014B00000eRRbv","FirmName": "Prashant","FirstName": "Kumar Last","CTX_FirmID": 1234567,"LastName": "Test Last Name","MiddleName":"","Address1":"","Address2":"","City":"","State":"","Zip":"","DayPhone":"","Fax":"","Email":"","AttorneyID":123567,"Type":"Payer"}';
   new PresetCastTraxService().updateCTXAttorney(request);
  
  }
  
  @isTest
  private static void testupdateCTXAttorneyException(){
   String request = null;
   new PresetCastTraxService().updateCTXAttorney(request);
  
  }
  
  @isTest
  private static void testcreateCTXFirm(){
   String request = '{"CRM_FirmID" : "0014B00000eRRbv","FirmName": "Prashant","FirstName": "Kumar Last","CTX_FirmID": 1234567,"LastName": "Test Last Name","MiddleName":"","Address1":"","Address2":"","City":"","State":"","Zip":"","DayPhone":"","Fax":"","Email":"","AttorneyID":123567,"Type":"Payer"}';
   new PresetCastTraxService().createCTXFirm(request);
  }
  
  @isTest
  private static void testcreateCTXFirmException(){
   String request = null;
   new PresetCastTraxService().createCTXFirm(request);
  }
  
  @isTest
  private static void testupdateCTXFirm(){
   String request = '{"CRM_FirmID" : "0014B00000eRRbv","FirmName": "Prashant","FirstName": "Kumar Last","CTX_FirmID": 1234567,"LastName": "Test Last Name","MiddleName":"","Address1":"","Address2":"","City":"","State":"","Zip":"","DayPhone":"","Fax":"","Email":"","AttorneyID":123567,"Type":"Payer"}';
   new PresetCastTraxService().updateCTXFirm(request);
  }
  
  @isTest
  private static void testupdateCTXFirmException(){
   String request = null;
   new PresetCastTraxService().updateCTXFirm(request);
  }
  
  @isTest
  private static void testcreateCTXFirmLocation(){
   String request = '{"CRM_FirmID" : "0014B00000eRRbv","FirmName": "Prashant","FirstName": "Kumar Last","CTX_FirmID": 1234567,"LastName": "Test Last Name","MiddleName":"","Address1":"","Address2":"","City":"","State":"","Zip":"","DayPhone":"","Fax":"","Email":"","AttorneyID":123567,"Type":"Payer"}';
   new PresetCastTraxService().createCTXFirmLocation(request);
  }
  
  @isTest
  private static void testcreateCTXFirmLocationException(){
   String request = null;
   new PresetCastTraxService().createCTXFirmLocation(request);
  }
  
  @isTest
  private static void testupdateCTXFirmLocation(){
   String request = '{"CRM_FirmID" : "0014B00000eRRbv","FirmName": "Prashant","FirstName": "Kumar Last","CTX_FirmID": 1234567,"LastName": "Test Last Name","MiddleName":"","Address1":"","Address2":"","City":"","State":"","Zip":"","DayPhone":"","Fax":"","Email":"","AttorneyID":123567,"Type":"Payer"}';
   new PresetCastTraxService().updateCTXFirmLocation(request);
  }
  
  @isTest
  private static void testupdateCTXFirmLocationException(){
   String request = null;
   new PresetCastTraxService().updateCTXFirmLocation(request);
  }
  
   
  @isTest
  private static void testcreateActivities(){
   String request = '{"CRMNoteID" : "Test","Attorney" : "Test" ,"Title" : "Test","NoteText" : "Law Firm" ,"OwnerName" : "Test","CreatedBy" : "Prashant","CreatedDate" : "2014-01-01T23:28:56.782Z"}';
   new PresetCastTraxService().fetchActivities(request);
  }
  
  @isTest
  private static void testcreateActivitiesException(){
   String request = null;
   new PresetCastTraxService().fetchActivities(request);
  }
  
  @isTest
  private static void testcaseFunded(){
   String request = '{"plaintiffName" : "Test","caseNumber" : 10123 ,"amount" : 10.0,"CRM_FirmID" : "Test","CRM_FirmLocationID" : "Test","CRM_AttorneyID" : "Test"}';
   new PresetCastTraxService().caseFunded(request);
  }
  
  @isTest
  private static void testcaseFundedException(){
   String request = null;
   new PresetCastTraxService().caseFunded(request);
  }
  
  @isTest
  private static void testcreateAttorneyNote(){
   String request = '{"FirmID" : "1234fghj","FirmName" : "Test" ,"HeadQuarter" : true,"PhoneNumber" : "+19089787867" ,"Website" : "Hello.com","Fax" : "19089787867" }';
   new PresetCastTraxService().createAttorneyNote(request);
  }
  
  @isTest
  private static void testcreateAttorneyNoteException(){
   String request = null;
   new PresetCastTraxService().createAttorneyNote(request);
  }
  
  /*@isTest
  private static void testfetchNotes(){
   String request = '{"CRM_FirmLocationID" : "Test","CRM_AttorneyID" : "Test" ,"count" : 1}';
   new PresetCastTraxService().fetchNotes(request);
  }*/
  
  @isTest
  private static void testfetchNotesException(){
   String request = null;
   new PresetCastTraxService().fetchNotes(request);
  }
  
  @isTest
  private static void testcreateCache(){
   String action = '/services/apexrest/createAttorneyNot';
   String payload = '{"FirmID" : "1234fghj","FirmName" : "Test" ,"HeadQuarter" : true,"PhoneNumber" : "+19089787867" ,"Website" : "Hello.com","Fax" : "19089787867" }';
   String objectId = '1234';
   PresetCastTraxService.createCache(action, payload, objectId);
  }
  
  testMethod static void testCTXUpdateResponse(){
   PresetCastTraxService.CTXUpdateResponse rep = new PresetCastTraxService.CTXUpdateResponse();
   rep.status = '1234ert';
   rep.message = 'ssss';
   
   
   System.assertNotEquals(null, rep.status );
   System.assertNotEquals(null, rep.message);
   
 
 }
 
 testMethod static void testCTXNonAttorneyResponse(){
   PresetCastTraxService.CTXNonAttorneyResponse rep = new PresetCastTraxService.CTXNonAttorneyResponse();
   rep.status = '1234ert';
   rep.message = 'ssss';
   rep.statusCode = '1234';
   rep.CRM_ContactId='ddd';
   
   
   
   System.assertNotEquals(null, rep.status );
   System.assertNotEquals(null, rep.message);
   System.assertNotEquals(null, rep.statusCode );
   System.assertNotEquals(null, rep.CRM_ContactId);
   
 
 }
 
 testMethod static void testCTXNonAttorneyUpdatResponse(){
   PresetCastTraxService.CTXNonAttorneyUpdatResponse rep = new PresetCastTraxService.CTXNonAttorneyUpdatResponse();
   rep.status = '1234ert';
   rep.message = 'ssss';
   rep.statusCode = '1234';
   rep.CRM_ContactId='ddd';
   
   
   
   System.assertNotEquals(null, rep.status );
   System.assertNotEquals(null, rep.message);
   System.assertNotEquals(null, rep.statusCode );
   System.assertNotEquals(null, rep.CRM_ContactId);
   
 
 }
 
 testMethod static void testCTXNoteResponseN(){
   PresetCastTraxService.CTXNoteResponse rep = new PresetCastTraxService.CTXNoteResponse();
   rep.status = '1234ert';
   rep.message = 'ssss';
   rep.statusCode = '1234';
   rep.Notes = new List<PresetCastTraxService.CRMNote>();
   
   
   
   System.assertNotEquals(null, rep.status );
   System.assertNotEquals(null, rep.message);
   System.assertNotEquals(null, rep.statusCode );
   System.assertEquals(new List<PresetCastTraxService.CRMNote>(), rep.Notes);
   
 
 }
  
  testMethod static void testCRMNoteF(){
   PresetCastTraxService.CRMNote rep = new PresetCastTraxService.CRMNote();
   rep.NoteID = '1234ert';
   rep.CRMNoteID = 'ssss';
   
   System.assertNotEquals(null, rep.NoteID );
   System.assertNotEquals(null, rep.CRMNoteID );
   
 
 }
 
   testMethod static void testNoteResponseF(){
   PresetCastTraxService.NoteResponse rep = new PresetCastTraxService.NoteResponse();
   rep.notes = new List<CashtraxEntities.SFNote>();
   
   System.assertEquals(new List<CashtraxEntities.SFNote>(), rep.notes );

   
 
 } 
 
 testMethod static void testCTXActivityResponseF(){
   PresetCastTraxService.CTXActivityResponse rep = new PresetCastTraxService.CTXActivityResponse();
   rep.activities = new List<CashtraxEntities.Activity>();
   
   System.assertEquals(new List<CashtraxEntities.Activity>(), rep.activities );

   
 
 } 
 
 testmethod static void testcheckDuplicateContactO() {
   CashtraxEntities.AttorneyAssistant cashtrxEnt = new CashtraxEntities.AttorneyAssistant();
   cashtrxEnt.CRM_FirmID = '123ertt';
   cashtrxEnt.CRM_FirmLocationID = '1234ert';
   cashtrxEnt.CRM_AttorneyID = '1234ert';
   cashtrxEnt.CRM_AttorneyAssistantID = '1234ert';
   cashtrxEnt.AttorneyAssistantID = 1234;
   cashtrxEnt.AttorneyAssistantType = 'test';
   cashtrxEnt.Name = 'test 1';
   cashtrxEnt.FirstName = 'test';
   cashtrxEnt.LastName = 'test';
   cashtrxEnt.Email = 'hitmprashant@gmail.com';
   cashtrxEnt.PhoneNumber = '9560682173';
   cashtrxEnt.Fax = '9560682173';
   new PresetCastTraxService().checkDuplicateContact(cashtrxEnt, 'test', 'test' );
 }
 
 testmethod static void testcreateFundedCase() {
   String json = '{\"Cases\":[{\"CRM_FirmLocationID\":\"0014B00000eQx5rQAC\",\"CRM_AttorneyID\":\"0034B00000XOOgSQAX\",\"CaseNumber\":\"1090356\",\"PlaintiffName\":\"Test Test Test\",\"Amount\":\"2000.0000\"},{\"CRM_FirmLocationID\":\"0014B00000eQx5rQAC\",\"CRM_AttorneyID\":\"0034B00000XOOgxQAH\",\"CaseNumber\":\"1121238\",\"PlaintiffName\":\"1121238\",\"Amount\":\"2350.0000\"},{\"CRM_FirmLocationID\":\"0014B00000eQx5rQAC\",\"CRM_AttorneyID\":\"0034B00000XOOgSQAX\",\"CaseNumber\":\"1116190\",\"PlaintiffName\":\"1116190\",\"Amount\":\"5000.0000\"}],\"Count\":3}';
   FundedCaseParser.Cases fCase = new FundedCaseParser.Cases(System.JSON.createParser(json));     
   new PresetCastTraxService().createFundedCase(fCase);
 }
  
  testmethod static void testupdateAttorneyAssistantO() {
   CashtraxEntities.AttorneyAssistant cashtrxEnt = new CashtraxEntities.AttorneyAssistant();
   cashtrxEnt.CRM_FirmID = '123ertt';
   cashtrxEnt.CRM_FirmLocationID = '1234ert';
   cashtrxEnt.CRM_AttorneyID = '1234ert';
   cashtrxEnt.CRM_AttorneyAssistantID = '1234ert';
   cashtrxEnt.AttorneyAssistantID = 1234;
   cashtrxEnt.AttorneyAssistantType = 'test';
   cashtrxEnt.Name = 'test 1';
   cashtrxEnt.FirstName = 'test';
   cashtrxEnt.LastName = 'test';
   cashtrxEnt.Email = 'hitmprashant@gmail.com';
   cashtrxEnt.PhoneNumber = '9560682173';
   cashtrxEnt.Fax = '9560682173';  
   new PresetCastTraxService().updateAttorneyAssistant(cashtrxEnt);
 }
 
 testmethod static void testcreateAttorneyAssistantO() {
   CashtraxEntities.AttorneyAssistant cashtrxEnt = new CashtraxEntities.AttorneyAssistant();
   cashtrxEnt.CRM_FirmID = '123ertt';
   cashtrxEnt.CRM_FirmLocationID = '1234ert';
   cashtrxEnt.CRM_AttorneyID = '1234ert';
   cashtrxEnt.CRM_AttorneyAssistantID = '1234ert';
   cashtrxEnt.AttorneyAssistantID = 1234;
   cashtrxEnt.AttorneyAssistantType = 'test';
   cashtrxEnt.Name = 'test 1 rt';
   cashtrxEnt.FirstName = 'test';
   cashtrxEnt.LastName = 'test';
   cashtrxEnt.Email = 'hitmprashant@gmail.com';
   cashtrxEnt.PhoneNumber = '9560682173';
   cashtrxEnt.Fax = '9560682173';  
   new PresetCastTraxService().createAttorneyAssistant(cashtrxEnt);
 }
 
 testmethod static void testupdateAttorneyO() {
   CashtraxEntities.Attorney cashtrxEnt = new CashtraxEntities.Attorney();
   cashtrxEnt.CRM_FirmLocationID = '123ertt';
   cashtrxEnt.CRM_AttorneyID = '1234ert';
   cashtrxEnt.AttorneyID = 1234;
   cashtrxEnt.FirstName = 'test 1';
   cashtrxEnt.LastName = 'test';
   cashtrxEnt.Email = 'hitmprashant@gmail.com';
   cashtrxEnt.Portal = true;
   cashtrxEnt.PhoneNumber = '9560682173';
   cashtrxEnt.Fax = '9560682173';
   cashtrxEnt.Birthday = datetime.newInstance(2014, 9, 15, 12, 30, 0);
   cashtrxEnt.ContactInformation = 'Colorado';
   cashtrxEnt.BarVerificationDate = datetime.newInstance(2014, 9, 15, 12, 30, 0);
   cashtrxEnt.BarVerificationExpirationDate = datetime.newInstance(2014, 9, 15, 12, 30, 0);  
   new PresetCastTraxService().updateAttorney(cashtrxEnt);
 }
 
 testmethod static void testcreateAttorneyO() {
   CashtraxEntities.Attorney cashtrxEnt = new CashtraxEntities.Attorney();
   cashtrxEnt.CRM_FirmLocationID = '123ertt';
   cashtrxEnt.CRM_AttorneyID = '1234ert';
   cashtrxEnt.AttorneyID = 1234;
   cashtrxEnt.FirstName = 'test 1';
   cashtrxEnt.LastName = 'test';
   cashtrxEnt.Email = 'hitmprashant@gmail.com';
   cashtrxEnt.Portal = true;
   cashtrxEnt.PhoneNumber = '9560682173';
   cashtrxEnt.Fax = '9560682173';
   cashtrxEnt.Birthday = datetime.newInstance(2014, 9, 15, 12, 30, 0);
   cashtrxEnt.ContactInformation = 'Colorado';
   cashtrxEnt.BarVerificationDate = datetime.newInstance(2014, 9, 15, 12, 30, 0);
   cashtrxEnt.BarVerificationExpirationDate = datetime.newInstance(2014, 9, 15, 12, 30, 0);  
   new PresetCastTraxService().createAttorney(cashtrxEnt);
 }
 
 testmethod static void testupdateFirmLocationO() {
   CashtraxEntities.FirmLocation cashtrxEnt = new CashtraxEntities.FirmLocation();
   cashtrxEnt.CRM_FirmID = '123ertt';
   cashtrxEnt.CRM_FirmLocationID = '1234ert';
   cashtrxEnt.FirmLocationID = '1234ert';
   cashtrxEnt.FirmID = '1234ert';
   cashtrxEnt.FirmLocationName = 'test';
   cashtrxEnt.HeadQuarter = true;
   cashtrxEnt.Address1 = 'adr 1';
   cashtrxEnt.Address2 = 'adr 2';
   cashtrxEnt.City = 'Connecticut';
   cashtrxEnt.State = 'Colorado';
   cashtrxEnt.ZipCode = '1234ER';
   cashtrxEnt.type = 'new'; 
   new PresetCastTraxService().updateFirmLocation(cashtrxEnt);
 }
 
 testmethod static void testcreateFirmO() {
   CashtraxEntities.Firm cashtrxEnt = new CashtraxEntities.Firm();
   cashtrxEnt.CRM_FirmID = '123ertt';
   cashtrxEnt.FirmID = '1234ert';
   cashtrxEnt.HeadQuarter = true;
   cashtrxEnt.Website = 'https://www.google.com';
   cashtrxEnt.fax = '9560682173';
   cashtrxEnt.type = 'new';
   cashtrxEnt.PhoneNumber = '9560682173';
   new PresetCastTraxService().createFirm(cashtrxEnt);
 }
 @isTest
 private static void testselectNotesO() {
   CashtraxEntities.ActivityRequest[] cashtrxEnt = new CashtraxEntities.ActivityRequest[]{};
   
   if(cashtrxEnt!=null &&  cashtrxEnt.size()>0){
       cashtrxEnt[0].CRM_FirmLocationID = '123ertt';
       cashtrxEnt[0].CRM_AttorneyID = '1234ert';
       cashtrxEnt[0].count = 1;
       new PresetCastTraxService().selectNotes(cashtrxEnt[0]);
   }
 }
 
  @isTest
  private static void testupdateFirmLocationException(){
   CashtraxEntities.FirmLocation request = null;
   new PresetCastTraxService().updateFirmLocation(request);
  }
  
  @isTest
  private static void testcreateFirmException(){
   CashtraxEntities.Firm request = null;
   new PresetCastTraxService().createFirm(request);
  }
  
  @isTest
  private static void testcreateFirmLocationException(){
   CashtraxEntities.FirmLocation request = null;
   new PresetCastTraxService().createFirmLocation(request);
  }
  
  @isTest
  private static void testupdateFirmException(){
   CashtraxEntities.Firm request = null;
   new PresetCastTraxService().updateFirm(request);
  }
  
  
  
 
 

}