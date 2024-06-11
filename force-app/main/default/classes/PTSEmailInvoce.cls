public class PTSEmailInvoce {
 
    //ıstedgım kdr varıable olustrablrm bu ınner classta -->flowda actıon emaılde goruncek(emaılsubj...ler)
    public class request{
        
     @invocableVariable(Label='Email Subject')   
      public string emailSubject;
     @invocableVariable(Label='emailBody')     
      public string emailBody;
     @invocableVariable(Label='Email List')    
      public List<string> emailList;               
    }
    
   //Invocable methodun ıcınde cagırcaz yukardakılerı
    @invocablemethod(Label='PTS Send Email Integration')
    public static void SendEmail(List<request> params){   //ınvocable methodlarn parameter olrk lısteyı kabul etgı ıcın,flowdakı ınvocable methodların LİSTE kabul etmesınden dolayı  lıst olustryrm
      
     /*email clastan al: 
    PTSEmail.sendEmail('october 5','deneme yapıyore2', new List<String>{'zhrblt83@gmail.com'}); bunun yerıne alttaknı kulanıcaz */
        
        //basarılı ıse emaıl gonderme sucesslog calıscak degılse erorlog..              
         
  try{ 
    PTSEmail.sendEmail(params[0].emailSubject,params[0].emailBody, params[0].emailList); 
    APILogUtility.SuccessAPILog('PTSEmailInvoce','PTSEmailInvoce','PTSEmail invocablemethod  was called successfully','Success at PTSEmailInvoce');    
         
     }        
  catch(Exception e){
      APILogUtility.ErrorAPILog('PTSEmailInvoce','PTSEmailInvoce',e.getMessage(),'Error at PTSEmailInvoce');    
            
            }
        }           
       }