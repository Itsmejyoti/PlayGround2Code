public class AnimalLocator
{
  public static string getAnimalNameById(integer idVar)
  {
     string name;
      Http http = new Http();
      HttpRequest request = new HttpRequest();
      request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+idVar);
      request.setMethod('GET');
      HttpResponse response = http.send(request);
      system.debug('response:'+response.getBody());
      if (response.getStatusCode() == 200) {
    // Deserialize the JSON string into collections of primitive data types.
    Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
          Map<String,object> obj =(Map<String,object>)results.get('animal');
    // Cast the values in the 'animals' key as a list
    system.debug('obj:'+obj);
          
  name =(string) obj.get('name');
          system.debug('obj:'+obj);
          
      }
      system.debug('name:'+name);
     return name; 
  }
}