public class RandomContactFactory 
{
public static List<Contact> generateRandomContacts(integer ind , string name)
{
  List<Contact> lstContact = new List<Contact>();
    for(integer i=1;i<=ind;i++)
    {
        Contact con = new Contact();
        con.FirstName=name+''+i;
        lstContact.add(con);
    }
    return lstContact;
}
}