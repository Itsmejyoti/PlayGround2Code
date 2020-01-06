@isTest
public class AnimalLocatorTest 
{
 @isTest public static void unitTest()
 {
    Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
     string response = AnimalLocator.getAnimalNameById(1);
 }
}