public class FetchCampingItem 
{
  @AuraEnabled
    public static Camping_Item__c getCampingItem() 
    {
     List<Camping_Item__c> ciList = new List<Camping_Item__c>([SELECT Name,Packed__c,Price__c,Quantity__c 
                                                               FROM  Camping_Item__c
                                                               LIMIT 1
                                                              ]);
        
        Camping_Item__c campListItem =[SELECT Name,Packed__c,Price__c,Quantity__c FROM  Camping_Item__c];
                    return campListItem;
    }

}