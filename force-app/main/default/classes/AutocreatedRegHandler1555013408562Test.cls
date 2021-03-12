@isTest
private class AutocreatedRegHandler1555013408562Test {
    static testMethod void testCreateAndUpdateUser() {
        
        Profile pf= [Select Id from profile where Name='Standard User']; 
        User uu=new User(firstname = 'testFirst', 
                         lastName = 'testLast', 
                         email = 'testuse8888r@example.org', 
                         Username = 'testuse8888r@example.org', 
                        
                         EmailEncodingKey = 'ISO-8859-1', 
                         Alias = 'teste8r', 
                         TimeZoneSidKey = 'America/Los_Angeles', 
                         LocaleSidKey = 'en_US', 
                         LanguageLocaleKey = 'en_US', 
                         ProfileId = pf.Id
                        ); 
        
        // create user
        insert uu;
        
        
        AutocreatedRegHandler1555013408562 handler = new AutocreatedRegHandler1555013408562();
        Auth.UserData sampleData = new Auth.UserData('testId', 'testFirst', 'testLast',
                                                     'testFirst testLast', 'testuse8888r@example.org', null, 'testuse8888r@example.org', 'en_US', 'facebook',
                                                     null, new Map<String, String>{'language' => 'en_US'});
        
        try{
            User u = handler.createUser(null, sampleData);
            
            sampleData = new Auth.UserData('testNewId', 'testNewFirst', 'testNewLast',
                                           'testNewFirst testNewLast', 'testnewuser@example.org', null, 'testnewuserlong', 'en_US', 'facebook',
                                           null, new Map<String, String>{});
            handler.updateUser(null, null, sampleData);
        }
        
        catch(Exception e){
            
        }      
    }
}