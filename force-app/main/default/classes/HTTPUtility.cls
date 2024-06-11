public class HTTPUtility {
    public static HttpResponse getMethod(String EndPoint){
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndPoint(EndPoint);
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        return response;   
                   
    }
}