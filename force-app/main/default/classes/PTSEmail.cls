public class PTSEmail {
    @future(Callout=true)
    public static void sendEmail(String emailSubject, String emailBody, List<String>emailList){
         
     PTSEmailRequest newEmail = new PTSEmailRequest();  //alttakı degıskenler PTSEmailRequestten gelıyor
     
     newEmail.emailSubject=emailSubject;
     newEmail.emailBody= emailBody;
     newEmail.emailAddresses= emailList; //map yaptım
                
    /* bunu kulanmak yerıne artık yukardakı  parameteri kulanıp dsarıdan anonymoustan olstrablrm yolamak ıstedklermı(subject,body,emaıladres..)
     newEmail.emailSubject='hatunundan emaiL :)) ';
     newEmail.emailBody='e hani bana pisküvviittt ,nassiinnn koçişimm';        
     List<String> emailList = new List<String>{'ozgurdestina@gmail.com','gkhnblt1304@gmail.com'};  */
        
        
    Http http = new Http();
    HttpRequest request =new HttpRequest();
    request.setEndpoint('https://data.pathtosalesforce.com/sendEmailTest.php?token=5b64d39b421fa865286fbc9e2136adec0504eafb5fddd0032919431e82392e01');
    request.setBody(JSON.serialize(newEmail));  //gonderırken apex ı json a cevır serialize et
    request.setHeader('Content-Type', 'application/json;charset=UTF-8');
    request.setMethod('POST'); 
        
   HttpResponse response=  Http.send(request);
        
     if(response.getStatusCode() >=200 && response.getStatusCode()<300){
       APILogUtility.SuccessAPILog('PTSEmail','PTSEmail','PTSEmail  API Call was  successfully','Success at PTSEmail');
         
     } else{
       APILogUtility.ErrorAPILog('PTSEmail','PTSEmail','PTSEmail  API Call was not successfully' ,'Error at PTSEmail');  
     }       
  }    
}