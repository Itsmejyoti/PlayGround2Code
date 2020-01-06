trigger MaintenanceRequest on Case (after update) {
    // call MaintenanceRequestHelper.updateWorkOrders 
    List<Case> lstCase = new List<Case>();
    for(Case c : Trigger.New)
    {
      if(c.IsClosed== true && (c.Type=='Repair' || c.Type=='Routine Maintenance'))
      {
        lstCase.add(c);
      }
    }
    MaintenanceRequestHelper.updateWorkOrders(lstCase);
 system.debug('lstCase:'+lstCase);   
}