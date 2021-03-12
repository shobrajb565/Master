@isTest
public class ContactTriggerUtilityHandlerTest {
  testmethod static void testContactData(){
      
      Account acc = UtiityHelperClass.createAccount();
      acc.HeadQuarter__c = false;
      insert acc;
      
      Contact con = UtiityHelperClass.createContact(acc.Id);
      //con.MailingCity = 'city';
      insert con;
      
      con.firstname = 'fconName';
      //con.MailingCity = 'City1';
      update con;
  }
}