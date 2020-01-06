@isTest
public class AccountManagerTest 
{
    @isTest static void testGetAccountById() {
        
        Account acc= new Account();
        acc.name='Test';
        insert acc;
        
        Contact con = new Contact();
        con.LastName='test last';
        con.AccountId=acc.Id;
        insert con;
        
        Id recordId = acc.Id;

        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://curious-wolf-5he70p-dev-ed.my.salesforce.com/services/apexrest/Accounts/'
            + recordId+'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        
        Account thisAcc =AccountManager.getAccount();
        
    }
}