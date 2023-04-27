@isTest //annotation - writing test class
public class HelloWorldTest {
    //3 million apex character limit total
    @isTest static void updateLeadTestMethod(){
        Lead mylead = new Lead();
        mylead.FirstName = 'abc';
        mylead.LastName = 'xyz';
        mylead.Company = 'Salesforce';
        insert mylead;
        
        mylead.Company = 'Google';
        update mylead;
    }
}