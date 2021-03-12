@isTest
public class AccountTriggerUtilityHandlerTest {
  testmethod static void testUpdateRegion(){
    
     Region_Territory__c regionT = UtiityHelperClass.createRegionTerritory();
     insert regionT;
     
     Account acc = UtiityHelperClass.createAccount();
     acc.HeadQuarter__c = false;
     insert acc;
     
     regionT.State__c = 'AL';
     regionT.Zip_Code__c = '23456';
     update regionT;
     
     acc.Region__c = 'Region';
     acc.Territory__c = 'Territory';
     acc.GMSA__c = 'GMSA_Name';
     acc.billingstate = 'AL';
     acc.billingPostalCode = '23456';
     update acc;
     
     
      Account acc1 = UtiityHelperClass.createAccount();
     acc1.HeadQuarter__c = false;
     insert acc1;
     
     
     merge  acc acc1;
     
  }
  
  
  
  

}