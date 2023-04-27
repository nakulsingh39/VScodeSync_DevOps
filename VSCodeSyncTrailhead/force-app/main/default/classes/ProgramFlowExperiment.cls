//Send an email every time an contact's owner is changed
//A lousy way to programming which will fail if there is a bulk update. Moreover, it'll also fail when some contact update 
//first and few others after some time from different workflow or apex code. 
//
public class ProgramFlowExperiment {
    
    public static Integer emailcounter = 0;
    private void SendEmail(){
        emailcounter++;
        system.debug('Queueing email to send');
    }
    
    private void SendQueuedEmails(){
        system.debug('Sending Email queue');
    }
    
    //if this class fires again because of field update workflow, it will send out double emails. 
    //To control that we use static boolean variable.
    private static Boolean weveBeenHereBefore = false;
    
    //
    private static Set<Id> alreadyprocessedList = null;
    
    public void HandlerContactUpdateTrigger(List<Contact> newList, Map<Id, Contact> oldMap){
        //Check if this is already fired then return
        if(weveBeenHereBefore){
            return;
        }
        //Otherwise make it true and run execute the logic of sending out an email.
        weveBeenHereBefore = true;
        
        if(alreadyprocessedList == null){
            alreadyprocessedList = new Set<Id>();
        }
        
        for(Contact ct: newList){
            if(alreadyprocessedList.contains(ct.id)){
                continue;
            }
            if(ct.ownerID != oldMap.get(ct.ID).ownerID){
                alreadyprocessedList.add(ct.id);
                sendEmail();
            }
        }
        sendQueuedEmails();
    }
}