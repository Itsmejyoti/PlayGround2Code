@RestResource(urlMapping='/Account/*')
global with sharing class AccountManager {
    @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        //String accId='0012v00002LUcsM';
        
        // grab the Account from the end of the URL
        String accId = request.requestURI.substringBetween('Accounts/','/contacts');
        Account result =  [SELECT Id,Name,(SELECT Id,Name FROM Contacts)
                           FROM Account
                           WHERE Id = :accId LIMIT 1];
        return result;
    }
}