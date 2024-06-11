public class APILogUtility {
    
   //ptsuserlistten aldık susscess ve error bolumunu-parameterları olustrp,degerlerı kendımız verıcez
   
    public static void SuccessAPILog (String APIKey,String APIName,String messageBody,String logTitle){  //isError'a gerek yok  
    
            API_Log__c APILog = new API_Log__c();
                       
            APILog.APIKey__c = APIKey;
            APILog.APIName__c = APIName;
            APILog.Is_Error__c = false;
            APILog.MessageBody__c = messageBody;
            APILog.Log_Title__c = logTitle; 
            
            insert APILog;        
    }
     public static void ErrorAPILog (String APIKey,String APIName,String messageBody,String logTitle){    
          
         API_Log__c APILog = new API_Log__c();
                       
            APILog.APIKey__c = APIKey;
            APILog.APIName__c = APIName;
            APILog.Is_Error__c = true;
            APILog.MessageBody__c = messageBody;
            APILog.Log_Title__c = logTitle; 
            
            insert APILog;
        
    }
}