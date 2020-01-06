global class DailyLeadProcessor implements Schedulable
{
  global void execute(SchedulableContext sc)
  {
      List<Lead> lstLead = new List<Lead>([SELECT Id,Name FROM Lead WHERE LeadSource='' OR LeadSource=null LIMIT 200]);
       
      for(Lead l : lstLead)
      {
         l.LeadSource='Dreamforce'; 
      }
      update lstLead;
  }
}