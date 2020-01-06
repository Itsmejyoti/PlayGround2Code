@isTest
public class DailyLeadProcessorTest 
{
  public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    @TestSetup
    public static void setup()
    {
       List<Lead> lstLeadtoInsert = new List<Lead>();
        for(integer i=0;i<200;i++)
        {
           lstLeadtoInsert.add(new Lead(LastName='Test'+i,Status='Open-Not Contacted',Company='Test Cmp')); 
        }
        insert lstLeadtoInsert;
    }
    
    @isTest public static void UnitTest()
    {
        Test.startTest();
       DailyLeadProcessor leadProcessor = new DailyLeadProcessor();
        system.schedule('Test Job', CRON_EXP, leadProcessor);
        Test.stopTest();
    }
}