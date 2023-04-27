@isTest
public class OwnerChangeTest {
	
    @isTest
    public static void testOwnerChange(){
        //createsome test contacts
        List<Contact> newContacts = intiTestContacts('c' , 5);
        User u = initTestUser('myname', 'myname');
        
        system.runAs(u){
            //These contacts will be created with a fake user as owner
            insert newContacts;
        }
        
        Test.startTest();
        
        for(Contact ct : newContacts){
            ct.OwnerId = UserInfo.getUserId();
            ct.Email = 'someone@somewhere.com';
        }
        update newContacts;
        
        Test.stopTest();
        
        system.assertEquals(newContacts.size(), ProgramFlowExperiment.emailCounter);
    }
    
    public static List<Contact> intiTestContacts(String prefix, Integer count){
        List<Contact> results = new List<Contact>();
        for(Integer x=0; x<count; x++){
            results.add(new Contact(LastName = prefix + '_' + string.valueOf(x), email = prefix + '_' + '@test.com'));
        }
        return(results);
    }
    
    public static User initTestUser(String username, String thealias){
        User u = new User();
        u.Alias 					   = thealias;
        u.Email 					   = username + '@test.com';
        u.FirstName  				   = 'Joe';
        u.LastName 					   = username;
        u.TimeZoneSidKey 			   = 'America/Los_Angeles';
        u.UserName 					   = username + '@apexfordevstests.com';
        u.UserPermissionsMarketingUser = true;
        u.LocaleSidKey 				   = 'en_US';
        u.EmailEncodingKey    		   = 'UTF-8';
        u.LanguageLocaleKey 		   = 'en_US';
        u.ProfileId 				   = userInfo.getProfileId();
        return u;
    }
}