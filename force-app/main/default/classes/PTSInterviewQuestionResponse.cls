public class PTSInterviewQuestionResponse {

    public String quizName;
    public String Description;    
   
    public static PTSInterviewQuestionResponse parse(String json) {
	return (PTSInterviewQuestionResponse) System.JSON.deserialize(json, PTSInterviewQuestionResponse.class);	
    }    
  
}