/*
using STATIC variable to maintain STATE.
Use defentsive programming to anticipate future metadata changes
Adapt execution to the type of execution context

*/

public class futureExperiment {
	/*Future call limitation is 50.
	this tells the system that when you call this method dont execute it immediately
	instead execute it at some time in the future when system has a little bit of extra 
	time available
	
	current limitation you cannot call a future from another 
	future or batch execution context.

	ONE TO THE KEEP PURPOSE OF static -> is to maintain state as long as we're looking into
	future calls
	*/
    @future //asyncronous or future method have attreibute @future
    public static void test1(){
        system.debug('In future call');
    }
    //keep track of whether or not we made a future call.
    private static Boolean futureCalled = false;
	//a function to tell the system that we want to make a future call.
    public static void test2(){
        if(futureCalled){
            return;
        }
        /*Common technique is you detect whether you're in a futre or batch operation,
		if yes, go ahead and make a sync call.
		*/
        if(system.isFuture() || system.isFuture()){
            test2sync();
            return;
        }
        futureCalled = true;
        test2Future();
    }
    //now we create a future call.
    @future
    public static void test2Future(){
        //System.debug('In future call 2');
        test2sync();
    }
    
    /*It is good to have both sync and async entry point to execute the functionality
	Therefore, put your functionality in the mirror sync function rather than calling it
	from future method and call that sync fn. from future method.
	*/
    public static void test2sync(){
        System.debug('Performing operation sync or async');
    }
}