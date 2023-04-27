@isTest
public class DeduperAccountTest {
	@isTest
    static void createAccount(){
        Account acc = new Account();
        acc.Name = 'Duplicate Account';
        insert acc;
    }
}