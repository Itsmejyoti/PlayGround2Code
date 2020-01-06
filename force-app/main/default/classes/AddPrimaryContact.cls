public class AddPrimaryContact implements Queueable
{
    public Contact contact;
    public string stateAbb;
    public AddPrimaryContact(Contact con, string sabb)
    {
        this.contact =con;
        this.stateAbb = sabb;
    }
    public void execute(QueueableContext qc)
    {
        List<Contact> lstContacttoInsert= new List<Contact>();
        List<Account> lstAccounts = new List<Account>([SELECT Id,Name,BillingState FROM Account WHERE BillingState =:stateAbb LIMIT 200]);
        for(Account acc : lstAccounts)
        {
            contact.AccountId=acc.Id;
            Contact cloneCon =contact.clone(false, false, false, false);
            lstContacttoInsert.add(cloneCon);
            
            
        }
        insert lstContacttoInsert;
    }
}