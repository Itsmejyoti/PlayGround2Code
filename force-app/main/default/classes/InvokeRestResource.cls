public class InvokeRestResource 
{
    public class deserializeResponse
    {
        public String id;
        public String access_token;
    }
    
    public static string athentication()
    {
        System.debug(UserInfo.getOrganizationId().substring(0, 15) + 'test' +  UserInfo.getSessionId().substring(15));
        
        String consumerKey ='3MVG9ZL0ppGP5UrDc4977ZxW0gw.sw7kshoRyYNMDCWkm3qyqwac9geOkurSijxlOLayd1bpCdBdjIXXDbIQE';
        string consumerSecret='D7D0F9D4F823031622C6E25633BDF0C1B985F8A241F52279B52890CB4A6253BA';
        String username='waykar.jyoti@curious-goat-mhgmf8.com';
        String password='#Jyoti1234Rtl9J5ZL9C9NbgTClm9rNawjq';          
        
        
        String reqbody = 'grant_type=password&client_id='+consumerKey+'&client_secret='+consumerSecret+'&username='+username+'&password='+password;
        
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setBody(reqbody);
        req.setMethod('POST');
        req.setEndpoint('https://login.salesforce.com/services/oauth2/token');
        HttpResponse res = h.send(req);
        system.debug('Response:'+res);
        deserializeResponse response = (deserializeResponse)JSON.deserialize(res.getbody(),deserializeResponse.class);
        system.debug('@@@@access_token@@'+response );
        
        String response1=res.getbody();
        System.debug('****************res.getStatusCode();'+res.getStatusCode());
        System.debug('****************res.getbody();'+res.getBody());
        system.debug('response.access_token:'+response.access_token);
        
                return response.access_token ;
    }
    public static void getAccount()
    {
        InvokeRestResource ivokeOvj = new InvokeRestResource();
        
        String accessToken=athentication();
        string accessToken1 =accessToken.substring(15);
        system.debug('accessToken:'+accessToken);
        system.debug('accessToken1:'+accessToken1);
        
        // https://curious-goat-mhgmf8-dev-ed.my.salesforce.com
        
        String domainName='https://jyodevorg-dev-ed.my.salesforce.com/';
        if(accessToken!=null)
        {
            string endPoint=domainName+'services/apexrest/Accountv1/0010K00002CplAf';  
            Http h2 = new Http();
            HttpRequest req1 = new HttpRequest();
            req1.setHeader('Authorization','Bearer ' + accessToken);
            req1.setHeader('Content-Type','application/json');
            req1.setHeader('accept','application/json');
            req1.setMethod('GET');
            req1.setEndpoint(endPoint);
            HttpResponse res1 = h2.send(req1);
            system.debug('response:'+res1);
            system.debug('response body:'+res1.getBody());
        }
    }
}