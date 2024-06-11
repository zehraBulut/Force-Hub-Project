public class PFHLastActivityDate {

    @AuraEnabled(cacheable=true)
    public static String getLastActivityMessage(String recordId){   //hangı contact Id yazarsam o cont.la ılglı bılgı verıcek bana
       
        Contact selectedContact = [select Id,LastVisitDate__c FROM Contact WHERE Id =: recordId];
      
        Date LastVisitDate = Date.valueof(selectedContact.LastVisitDate__c);       
         string output ='';
         Integer numberofDays = LastVisitDate.daysBetween(Date.today());
        
        if(LastVisitDate == Date.today()){
            output = 'TODAY';
           
        }else if(LastVisitDate == Date.today().addDays(-1)){
            output = 'YESTERDAY';
             
            
        }   else{
           output = numberofDays + ' Days ago.';
            
            
        }  
        //system.debug(output);   //TODAY or yesterday
        return output;   

}
}