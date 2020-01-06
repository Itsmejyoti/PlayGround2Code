@isTest
public class AddPrimaryContactTest 
{
    
    @testSetup public static void Setup()
    {
        List<Account> lstNYAccounts = new List<Account>();
        List<Account> lstCAAccounts = new List<Account>();
        
        for(integer i=0;i<50;i++)
        {
            lstNYAccounts.add(new Account(Name='Test'+i,BillingState='NY'));  
        }
        for(integer i=0;i<50;i++)
        {
            lstCAAccounts.add(new Account(Name='Test'+i,BillingState='CA'));  
        }
        insert lstNYAccounts; 
        insert lstCAAccounts; 
        
        Contact con= new Contact(LastName='TestLast',FirstName='TestFirst');
        insert con;
    }
    @isTest public static void unitTest()
    {
        Contact con =[SELECT Id,Name FROM Contact LIMIT 1];
        AddPrimaryContact addPrimaryContactObj = new AddPrimaryContact(con,'NY');
        
        Test.startTest();
        system.enqueueJob(addPrimaryContactObj);
        Test.StopTest();
    }
}