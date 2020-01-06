public class ShowContactController 
{
  @AuraEnabled
    public static List<contact> getContacts()
  {
     List<Contact> lstContact = new List<contact>([SELECT Id,Name FROM Contact]);
      return lstContact;
  }
    
     @Auraenabled
    public static List<Contact> delteContactById(String conId)
    {
        System.debug('In controller delteContactById method..');
        Contact delContact=[Select Id from Contact where id=:conId];
        delete delContact;
        return [Select ID,Name,Phone from Contact];
    }
}