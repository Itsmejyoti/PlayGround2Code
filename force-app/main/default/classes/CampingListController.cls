public class CampingListController {

    @AuraEnabled
    public static list<Camping_Item__c> getItems()
    {
        	return [SELECT id,Name FROM Camping_Item__c];
    }
    
    @AuraEnabled
    public static Camping_Item__c saveItem(Camping_Item__c item)
    {
        insert item;
        return item;
    }   
        
    
}