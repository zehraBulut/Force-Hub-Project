public class PTSUtility {
       public static String getToken(){       
           
        //PTSTokenConfig meta data olstrdm ve liste yapıp(null exceptıona takılmamak ıcın) olstrdgm 2 custom fıeldı kulanmak ıstyrm
        
        List<PTSTokenConfig__mdt> tokens = [SELECT Id,Token__c,Active__c FROM PTSTokenConfig__mdt WHERE Label= 'PTSToken' AND Active__c =True];
           
        String PTSToken ='';
        if(tokens.size()>0){
         PTSToken = tokens[0].Token__c;             
        }    
           system.debug(PTSToken);
          return PTSToken ;
    }

}