public class PTSInterviewQuestion {
    
  public static HttpResponse getIQ(){       
       
      String myToken= PTSUtility.getToken();        
       
        Http http = new Http();
      
        HttpRequest request=new HttpRequest();
        request.setEndPoint('https://data.pathtosalesforce.com/iq.php?token='+ myToken); //heıckerların tokena ulasması ımkansz
        request.setMethod('GET');        
       
      HttpResponse response = http.send(request);   //response data type:httpResponse(object)
       
      system.debug(response.getBody());  
       
      return  response;
    }   

}