//STORY 32 path proje:I want the following integration (API Call)torun and update the field with the API name Studied_Days_of_Current_Month__c
public class PFHuserCurrentMonthDates {
  public static String mytoken =  PTS_TokensUtility.getActiveTokenbyLabel('PFHuserCurrentMonthDates');//custom metadata da token gırdık
  
   @future(callout=true)
    public static void getData(){
      /*  Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndPoint('https://data.pathtosalesforce.com/userCurrentMonthDatesFREE.php?token='+ mytoken); //remote setıngte tanımlı oldg ıcın.drek yazıyrm token . cunku token metadatada
        request.setMethod('GET');      
        HttpResponse response = http.send(request);
        system.debug(response.getBody());  
   artık bu kod yerıne utility classtaki method cagırarak kullanıcaz http ..yı */
  HttpResponse response = HTTPUtility.getMethod('https://data.pathtosalesforce.com/userCurrentMonthDatesFREE.php?token='+ mytoken);//utilityden cagrdk
          
       
 //not:deserialize nasıl yplr:RESPONSE classtakı DATA TYPE'ı al.ısım ver =hereokudan gelen json CLASS Name'i al.PARSE  ıle cevır deserıalizeye ve ıcıne getBody() koy
       
   if(response.getStatusCode()>=200 && response.getStatusCode()<300){
      List<PFHuserCurrentMonthDatesResponse> result = PFHuserCurrentMonthDatesResponse.parse(response.getBody());   //deserialize yaptım
      
       //contactları update et
      List<Contact> conList = new List<Contact>();    
       for(PFHuserCurrentMonthDatesResponse  res : result){
         List<Contact> con = [SELECT Id, UserId__c, Studied_Days_of_Current_Month__c FROM Contact WHERE UserId__c =: res.UserId];
          
           if(con.size()>0){  //nullcheck yaptk :lıstede yapılması daha uygun              
           con[0].Studied_Days_of_Current_Month__c = res.Days;
           conList.add(con[0]);
               
           }
         } 
       try{
            update conList;
       }catch (Exception e){
          APILogUtility.ErrorAPILog('PFHuserCurrentMonthDates','PFHuserCurrentMonthDates',e.getCause()+ e.getMessage() +e.getLineNumber(),'Error at PFHuserCurrentMonthDates');    
       }
             
   } else{
     APILogUtility.ErrorAPILog('PFHuserCurrentMonthDates','PFHuserCurrentMonthDates', string.valueOf(response.getStatusCode()),'Error at PFHuserCurrentMonthDates');  
   } 
    }
}
//ınvocable class olustur