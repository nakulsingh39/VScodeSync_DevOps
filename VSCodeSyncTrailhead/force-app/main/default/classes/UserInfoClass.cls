/*
STATIC variable use for caching data.
This class has 2 methods and 2 queries for retrieving the phone no. and mobile phone using 2 methods.
This code can be improved using static variable.
*/
public class UserInfoClass {
	/*BAD CODING
    public String getphone(){
        List<User> users = [Select Phone, Extension from User where ID = :UserInfo.getUserId()];
        User u = users[0];
        return u.Phone + ((u.Extension != null) ? 'x' + u.Extension : '' );
    }
    
    public String getMobilePhone(){
        List<User> users = [Select MobilePhone from User where ID = :UserInfo.getUserId()];
        return users[0].MobilePhone;
    }*/
    
    //GREAT CODING USING static VARIABLE
    private static User CachedUserInfo = null;
    //To query and optain data from user object and store it in static variable.
    private User GetUserInfo(){
        if(CachedUserInfo == null){
            List<User> users = [SELECT Phone, Extension, MobilePhone FROM User WHERE ID = :UserInfo.getUserId()];
            CachedUserInfo = users[0];
        }
        return CachedUserInfo;
    }
    //call the method to get Phone number.
    public String getphone(){
        User u = GetUserInfo();
        return u.Phone + ((u.Extension != null) ? 'x' + u.Extension : '' );
    }
    //call the method to get mobile number.
    public String getMobilePhone(){
        return GetUserInfo().MobilePhone;
    }
    /*Bulk object syntaxcan query multiple objects
     *List<User> users = [SELECT Phone, Extension, MobilePhone FROM User WHERE ID = :UserInfo.getUserId()];
	 *CachedUserInfo = users[0];
	 *Single onject syntax will return a single object
	 *User CachedUserInfo = [SELECT Phone, Extension, MobilePhone FROM User WHERE ID = :UserInfo.getUserId()];
	 */
}