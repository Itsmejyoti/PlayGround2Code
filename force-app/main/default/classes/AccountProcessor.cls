public class AccountProcessor 
{
 @future
    public static void countContacts(List<Id> lstAccId)
  {
    List<Account> lstAccount= new List<Account>([SELECT Id,Name,(SELECT Id FROM Contacts) FROM Account]);
      for(Account acc :lstAccount)
      {
          
              acc.Number_of_Contacts__c=acc.Contacts.size();
          
      }
      update lstAccount;
  }
}