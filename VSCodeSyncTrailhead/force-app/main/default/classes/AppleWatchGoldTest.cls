@isTest
public class AppleWatchGoldTest {
    
    @isTest static void createOpportunity(){
        Opportunity opp = new Opportunity();
        opp.Name      = 'Taylor Swift';
        opp.StageName = 'Prospecting';
        opp.CloseDate = Date.today();
        opp.Amount    = 55000;
        insert opp;
    	/*SeeAllData = true 
    	never bother to create records from scratch 
    	this will take original data from org and change it permanently.
		*/
    }    
}