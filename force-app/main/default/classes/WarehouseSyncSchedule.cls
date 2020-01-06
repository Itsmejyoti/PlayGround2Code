global class WarehouseSyncSchedule implements Schedulable
{
  // implement scheduled code here
  global static void execute(system.SchedulableContext sc)
  {
      
      WarehouseCalloutService.runWarehouseEquipmentSync();
  }
}