public with sharing class WarehouseCalloutService {

    private static final String WAREHOUSE_URL = 'https://th-superbadge-apex.herokuapp.com/equipment';
    
  // complete this method to make the callout (using @future) to the
    // REST endpoint and update equipment on hand.
    @future(callOut=true)
    public static void runWarehouseEquipmentSync()
    {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(WAREHOUSE_URL);
        request.setMethod('GET');
        
        HttpResponse response= http.send(request);
        List<Product2> products = new List<Product2>();
        if(response.getStatusCode()==200)
        {
            List<Object> lstEquipment = (List<Object>) JSON.deserializeUntyped(response.getBody());
            system.debug('lstEquipment:'+lstEquipment);
            
            
            
            for(Object o :  lstEquipment){
                
                Map<String, Object> mapProduct = (Map<String, Object>)o;
                
                Product2 product = new Product2();
                
                product.Name = (String)mapProduct.get('name');
                
                string cost = (String) mapProduct.get('cost');
                   product.Cost__c = Decimal.valueOf(cost);
                  // product.Cost__c =(Decimal) mapProduct.get('cost');
                
                product.Current_Inventory__c = Integer.valueOf(mapProduct.get('quantity'));
                
                product.Maintenance_Cycle__c = Integer.valueOf(mapProduct.get('maintenanceperiod'));
                
                product.Replacement_Part__c = Boolean.valueOf(mapProduct.get('replacement'));
                
                product.Lifespan_Months__c = Integer.valueOf(mapProduct.get('lifespan'));
                
                product.Warehouse_SKU__c = (String)mapProduct.get('sku');
                
                product.ProductCode = (String)mapProduct.get('_id');
                 products.add(product);

                
            }
        }
        if(products.size() > 0)
        {

                System.debug(products);

                upsert products;

            }

            
        }
}