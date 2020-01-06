public class InsertContactController 
{
    @AuraEnabled
   public static Contact insertContact(Contact con)
   {
     
       insert con;
       return con;  
   }
}