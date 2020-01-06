trigger BatchApexErrorTrigger on BatchApexErrorEvent (after insert) 
{
  List<BatchLeadConvertErrors__c> lstBatchLeadError = new List<BatchLeadConvertErrors__c >();
    for(BatchApexErrorEvent err : trigger.New)
    {
      BatchLeadConvertErrors__c batchErrobj = new BatchLeadConvertErrors__c();
        batchErrobj.AsyncApexJobId__c=err.AsyncApexJobId ;
        batchErrobj.Records__c=err.JobScope;
            batchErrobj.StackTrace__c=err.StackTrace;
        lstBatchLeadError.add(batchErrobj);
    }
    if(!lstBatchLeadError.isEmpty())
    {
        insert lstBatchLeadError;
        
    }
      
}