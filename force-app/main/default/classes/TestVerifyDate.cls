@isTest
public class TestVerifyDate 
{
 public testMethod static void unitTest()
 {
     Date date1=Date.today();
     Date date2 = Date.today().addDays(10);
     VerifyDate.CheckDates( date1,  date2);
     VerifyDate.DateWithin30Days( date1,  date2);
     VerifyDate.SetEndOfMonthDate( date1);
 }
    public testMethod static void unitTest1()
 {
     Date date1=Date.today();
     Date date2 = Date.today().addDays(40);
     VerifyDate.CheckDates( date1,  date2);
     
 }
}