public class ShowOppRelatedtoAccount 
{
  @AuraEnabled
    public static List<Opportunity> getOpportunities(Id accId)
    {
      List<Opportunity> lstopportunity = new List<Opportunity>([SELECT Id,Name From Opportunity WHERE AccountId=:accId]); 
        return lstopportunity;
    }
    @AuraEnabled
    public static List<Opportunity> getAllOpportunities(Id accId)
    {
      List<Opportunity> lstAllOpp= new List<Opportunity>([SELECT Id,Name,Account.Name FROM Opportunity WHERE AccountId !=:accId]); 
       return lstAllOpp;
    }
    @AuraEnabled
    public static List<Opportunity> updateOppAccount(Id accId,Id oppId)
    {
       system.debug('I in updateOppAccount');
        Opportunity opp =[SELECT Id,Name,AccountId FROM Opportunity WHERE Id =:oppId ] ;
        opp.AccountId=accId;
        update opp;
        List<Opportunity> lstAllOpp= new List<Opportunity>([SELECT Id,Name,Account.Name FROM Opportunity WHERE AccountId !=:accId]); 
       return lstAllOpp;
        
    }
}