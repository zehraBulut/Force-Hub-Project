public class PTS_TokensUtility {
 public static String getActiveTokenbyLabel(String label){
     
     PTSTokenConfig__mdt myToken =[SELECT Id, token__c , Active__c FROM PTSTokenConfig__mdt WHERE Active__c = True AND Label =:label LIMIT 1];
        return myToken.token__c;      
    }   
}