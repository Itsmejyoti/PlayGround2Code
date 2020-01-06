/**
 * Test for default MyDataLoaderLeadExportCondition provided by Salesforce
 * 
*/
@isTest
public class MyDataLoaderLeadExportConditionTest {
    /*
     * Test to check if policy gets triggered when user exports 750 Leads
    */
  public static testMethod void testLeadExportTriggered() {
    Map<String, String> eventMap = getEventMap(String.valueOf(750));
    Organization org = getOrganization();
    User user = createUser();
      
    TxnSecurity.Event e = createTransactionSecurityEvent(org, user, eventMap) ;
    /* We are unit testing a PolicyCondition that triggers
       when an event is generated due to high NumberOfRecords */
    MyDataLoaderLeadExportCondition dataLoaderLeadExportCondition = new MyDataLoaderLeadExportCondition();
    /* Assert that the condition is triggered */
    System.assertEquals(true, dataLoaderLeadExportCondition.evaluate(e));
   }
    /*
     * Test to check if policy doesn't get triggered when user exports 200 Leads
    */
  public static testMethod void testLeadExportNotTriggered() {
    Map<String, String> eventMap = getEventMap(String.valueOf(200));
    Organization org = getOrganization();
    User user = createUser();
       
    TxnSecurity.Event e = createTransactionSecurityEvent(org, user, eventMap) ;
    /* We are unit testing a PolicyCondition that does not trigger
       an event due to low NumberOfRecords  */
    MyDataLoaderLeadExportCondition dataLoaderLeadExportCondition = new MyDataLoaderLeadExportCondition();
      
    /* Assert that the condition is NOT triggered */
    System.assertEquals(false, dataLoaderLeadExportCondition.evaluate(e));
  }
    /*
     * Create an example user
     */
    private static User createUser(){
        Profile p = [select id from profile where name='System Administrator'];
        String ourSysAdminString = p.Id; 
        
        User u = new User(alias = 'test', email='user@salesforce.com',
            emailencodingkey='UTF-8', lastname='TestLastname', languagelocalekey='en_US',
            localesidkey='en_US', profileid = p.Id, country='United States',
            timezonesidkey='America/Los_Angeles', username=generateRandomUsername(7));
        insert u;
        return u;
    }
    /**
     * Generates a random username of the form “[random]@[random].com”, where the 
     * length of the random string is the given Integer argument. For example, with 
     * an argument of 3, the following random username may be produced: 
     * “ajZ@ajZ.com”.
     */ 
    private static String generateRandomUsername(Integer len) {
        final String chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
        String randStr = '';
        while (randStr.length() < len) {
           Integer idx = Math.mod(Math.abs(Crypto.getRandomInteger()), chars.length());
           randStr += chars.substring(idx, idx+1);
        }
        return randStr + '@' + randStr + '.com'; 
    }

    /*
     * Returns current organization
     */
    private static Organization getOrganization(){
        return [SELECT id, Name FROM Organization];
    }
      
    /*
     * Adds NumberOfRecords and example ExecutionTime
     */ 
    private static Map<String, String> getEventMap(String numberOfRecords){
        Map<String, String> eventMap = new Map<String, String>();
        eventMap.put('NumberOfRecords', numberOfRecords);
        eventMap.put('ExecutionTime', '30');
        eventMap.put('EntityName', 'Lead');
        return eventMap;
    }
    
    /*
     * Create a TxnSecurity.Event instance
     */ 
    private static TxnSecurity.Event createTransactionSecurityEvent(Organization org, User user, Map<String, String> eventMap){
        TxnSecurity.Event e = new TxnSecurity.Event(
             org.Id /* organizationId */,
             user.Id /* userId */,
             'Lead' /* entityName */ ,
             'DataExport' /* action */,
             'Lead' /* resourceType */,
             '000000000000000' /* entityId */,
              Datetime.newInstance(2016, 9, 22) /* timeStamp */,
              eventMap /* data - Map containing information about the event */ );
        return e;
    }
}