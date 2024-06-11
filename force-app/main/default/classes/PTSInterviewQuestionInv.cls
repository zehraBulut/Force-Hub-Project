public class PTSInterviewQuestionInv { //ınterviewQuest clasın ınvocable'ı 
    
    @InvocableMethod(Label='Get Interview Question')
    public static List<String> getIQ(){                
     
      HttpResponse response = PTSInterviewQuestion.getIQ();        
      PTSInterviewQuestionResponse result = PTSInterviewQuestionResponse.parse(response.getBody());  //response clastan cagırdım(quizName ve descrption ıcın)        
     
      List<String> IQDetails = new  List<String>();  //flowda kulanmak ıcın bu lısteyı yap       
        
     String emailBody = '<p style="color:purple"><b>'+result.QuizName+ '</b></p><p>'+result.Description+ '</p>';
        
            
         IQDetails.add(emailBody);
               return IQDetails;
    }
}