public  with sharing  class   bestWeek {

    @AuraEnabled(cacheable=true)
    public static Integer  theBestContact(){ 

        Contact Con = [SELECT Id, Name ,This_Week__c FROM Contact   ORDER BY  This_Week__c DESC LIMIT 1];
      
        
        Integer Score = Integer.ValueOf(Con.This_Week__c);
         system.debug(Score);
        return Score;

    }
}