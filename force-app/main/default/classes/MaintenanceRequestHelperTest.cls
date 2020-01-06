@isTest
public class MaintenanceRequestHelperTest
{
  @isTest public static void unitTest()
  {
    Product2 prod = new Product2();
     prod.Name='Test Prod'; 
      prod.Replacement_Part__c=True;
          prod.Maintenance_Cycle__c=10;
      insert prod;
      
      Case cs = new Case();
      cs.Type='Repair';
      //case.IsClosed=true;
      cs.Status='Closed';
      cs.Priority='Medium';
      cs.Origin='Phone';
      insert cs;
      
      Work_Part__c workPart = new Work_Part__c();
      workPart.Equipment__c=prod.Id;
      workPart.Maintenance_Request__c=cs.Id;
      insert workPart;
      
      
      update cs;
      
  }
}