public class MaintenanceRequestHelper {
    
    public static void updateWorkOrders(List<Case> CaseList)
    {
        system.debug('I m in handlers method');
        List<Case> lstCaseToCreate = new List<Case>();
        if(CaseList!=null && CaseList.size() >0)
        {
            for(Case c: CaseList)
            {
                case csNew=new case();
                csNew.status='New';
                csNew.Origin=c.origin;
                csNew.Vehicle__c=c.Vehicle__c;
                csNew.Equipment__c=c.Equipment__c;
                csNew.Type='Routine Maintenance';
                csNew.Date_Reported__c=system.today();
                csNew.Subject='For Future Routine Checkup';
                lstCaseToCreate.add(csNew); 
            }
            
            integer i=0;
            for(Aggregateresult r:[SELECT MIN(equipment__r.Maintenance_Cycle__c)MinimumValue FROM Work_Part__c where Maintenance_Request__c=:CaseList]){
                system.debug('Aggregateresult result: '+r);
                
                if(r.get('MinimumValue')!=NULL)
                    lstCaseToCreate[i].Date_Due__c=system.today()+integer.valueof(r.get('MinimumValue'));
                
                i++;
            }
           
            system.debug('lstCaseToCreate:'+lstCaseToCreate);
           if(lstCaseToCreate != null && lstCaseToCreate.size()>0)
           {
            insert lstCaseToCreate;   
           }
            
            
        }
        // update workorders
    }        
    
}