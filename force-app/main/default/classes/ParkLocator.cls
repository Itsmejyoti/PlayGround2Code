public class ParkLocator
{
  public static String [] country(string cntry)
  {
      ParkService.ParksImplPort  park = 
            new ParkService.ParksImplPort();
     return park.byCountry(cntry);
       // return calculator.doAdd(x,y);
  }
}