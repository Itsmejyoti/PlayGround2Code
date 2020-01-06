// This class can be safely deleted from your org. 
// It was only used to ensure 100% test coverage 
// for the managed package installation 

@IsTest
public class InstallationTests {
    @IsTest
    public static void testMaintenanceRequest(){
        Case cs = new Case(Status='New',Priority='Medium',Origin='Web');
        List<Case> lstCase = new List<Case>();
        lstCase.add(cs);
        MaintenanceRequestHelper.updateWorkOrders(lstCase);
    }
    
    @IsTest
    public static void testWarehouseSync(){
        WarehouseCalloutService.runWarehouseEquipmentSync();
    }
}