@isTest
public class AccountProcessorTest 
{
@isTest public static void unitTest()
{
    Account acc= new Account(Name='Test Acc');
    insert acc;
    
    Contact con= new Contact(LastName='LastName',AccountId=acc.Id);
    insert con;
    List<Id> lstId= new List<Id>();
    lstId.add(acc.Id);
    Test.startTest();
    AccountProcessor.countContacts(lstId);
    Test.stopTest();
}
}