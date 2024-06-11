public class UserProgress {
    
   @AuraEnabled(cacheable=true) //lwc de gorunmesı ıcın
 public static Integer UserProgress(String recordId,String courseName){  //recordId:contactId
        
  String label = [SELECT Id , Name FROM EntityParticle WHERE EntityDefinitionId='Contact' AND Label=:courseName].Name;
     
   //contacta ulasmak ıcın:     
  Contact con = [SELECT Id,Administrator__c,LWC__c,Formulas__c,HTML__c,Integration__c,JavaScript__c,Apex_Codes_CheatSheet__c,Visual_Force__c,Project__c,Apex_Beginner__c,Apex_Advance__c,Apex_Intermediate__c,Flow_Builder__c,Vehicle_Manager__c FROM Contact WHERE Id =: recordId LIMIT 1]; 
  
   //course a ulas:           
  Course__c course= [SELECT Id,Name, Number_of_Quizzes__c FROM Course__c WHERE Name =: courseName];
    
   //hesapla:  
  Integer percentage = Integer.valueof ((Integer.valueof(con.get(label))/course.Number_of_Quizzes__c)*100);
        
   return  percentage;
        
    }
}