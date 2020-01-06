@isTest
public class WarehouseSyncScheduleTest
{
    @isTest public static void unitTest()
    {
       Test.startTest();
        Test.setMock(HttpCalloutMock.class, new WarehouseCalloutServiceMock()); 
        WarehouseSyncSchedule sh1 = new WarehouseSyncSchedule();
        
        String sch = '0 0 23 * * ?'; 
        system.schedule('Test Territory Check', sch, sh1);
        Test.stopTest(); 
    }
    
}