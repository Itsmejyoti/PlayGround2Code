@isTest
public class LeadProcessorTest 
{
 @isTest public static void unitTest()
 {List<lead> lstLeadtoinsert = new List<Lead>();
     Lead l; 
     for(integer i=0;i<200;i++)
     {
     lstLeadtoinsert.add(new Lead(
        LastName='Test'+i,
         Company='Test'+i,
         Status='Open-Not Contacted',
         LeadSource='Dreamforce'));
     }
  insert lstLeadtoinsert;
  system.debug('lstLeadtoinsert:'+lstLeadtoinsert.size());
  Test.startTest();
  LeadProcessor leadBatch= new LeadProcessor();
  Database.executeBatch(leadBatch);
  Test.stopTest();
 }
    
}