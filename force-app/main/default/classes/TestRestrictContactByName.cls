@isTest
public class TestRestrictContactByName 
{
 public testMethod static void unitTest()
 {
     Contact con =new Contact();
     con.LastName='INVALIDNAME';
     insert con;
 }
}