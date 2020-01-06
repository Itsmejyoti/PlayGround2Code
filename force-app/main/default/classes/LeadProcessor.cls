global class LeadProcessor implements Database.Batchable<SObject>
{
    global Database.QueryLocator start(Database.BatchableContext bc)
    {
        return Database.getQueryLocator('SELECT Id,Name,LeadSource FROM Lead');
        
    }
    global void execute(Database.BatchableContext bc, List<Lead> Scope)
    {
        List<Lead> lstLeadtoUpdate = new List<Lead>();
        for(Lead l : scope)
        {
            if(l.LeadSource == 'Dreamforce')
            {
                lstLeadtoUpdate.add(l);  
            }
            
        }
        update lstLeadtoUpdate;
    }
    global void finish(Database.BatchableContext bc)
    {
        
    }
}