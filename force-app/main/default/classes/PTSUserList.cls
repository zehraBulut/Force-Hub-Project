public class PTSUserList {
        
   // @future(callout=true)     //sıstem hazır olunca calısır
    public static void getUserList(){
        
        Http http = new Http();//new object 
        
        HttpRequest request = new HttpRequest();         
        request.setEndpoint('https://data.pathtosalesforce.com/userListProject.php?token=5b64d39b421fa865286fbc9e2136adec0504eafb5fddd0032919431e82392e01');//dsardakı datanın adresi
        request.setMethod('GET');       
        HttpResponse response = Http.send(request);        
        
        system.debug(response.getBody());    //datanın ıcını gosterır       
        system.debug(response.getStatus());
        system.debug(response.getStatusCode());         
                
        if(response.getStatusCode()>=200 && response.getStatusCode()<300){
            
        APILogUtility.SuccessAPILog('PTSUserList', 'PTSUserList','API Call invoked successfully','Success at PTSUserList');
            
        List<PTSUserListResponse> userList = PTSUserListResponse.parse(response.getBody());//apexte cevrdm..cagır response    classtakılerı
         system.debug(userList);
     
                      
            List<Contact> existingContacts =[SELECT Id, FirstName, LastName, Name, Phone, Email, LastActivityDate, BuildApexCodingSkillsCertification__c, Active__c,
                                             Administrator__c, Apex_Advance__c, Apex_Beginner__c, Apex_Intermediate__c, Certificates__c, Apex_Codes_CheatSheet__c,
                                             Inactivity_Process__c, Exercises__c, Formulas__c, Flow_Builder__c, Group__c, HTML__c, Integration__c, LWC__c, 
                                             JavaScript__c, Language__c, LastVisitDate__c, Order_ID__c, UserId__c, Vehicle_Manager__c, Days_of_Inactivity__c,
                                             Weekly_Studied_Days__c, TotalPassedQuizzesFriday__c, This_Week__c, Last_Activity_Date__c, All_times__c, This_Month__c,
                                             Total_Passed_Quizzes_Monday__c, Administrator_Certification__c, Total_Passed_Quizzes_Today__c, Total_Passed_Quizzes__c,
                                             Formulas_Certification__c, Flow_Builder_Certification__c, Vehicle_Manager_Certification__c, 
                                             Apex_Beginner_Certification__c, Apex_Intermediate_Certification__c, Integration_Certification__c, HTML_Certification__c,
                                             JS_Certification__c, LWC_Certification__c, Apex_Advance_Certification__c, Apex_Codes_Cheat_Sheet_Certification__c, 
                                             Visual_Force__c, Visual_Force_Certification__c, Total_Passed_Quizzes_Saturday__c, Total_Passed_Quizzes_Sunday__c,
                                             Total_Passed_Quizzes_Thursday__c, TotalPassedQuizzesWednesday__c, TotalPassedQuizzesTuesday__c FROM Contact]; 
             
        Set<String> conIds = new Set<String>();        
        for (Contact con : existingContacts){
         conIds.add(con.UserId__c);   //gormek ıstersen anonymoustan s.debug yap          
        }        
    
        List<Contact> conList = new  List<Contact>();
        for(PTSUserListResponse ptsUser : userList ){
           
            if(!conIds.contains(ptsUser.Id)){
                
              //INSERT CODE HERE !!!
                
            Contact con = new Contact();
            
            String[] nameParts = ptsUser.Name.split(' ');
            
       //map yapılıyor( dsardan strıng)json) olrk gelen contact recordlarn bılgısını data typle larına gore cevırıyoruz apexe)       

                    //con.LastName=ptsUser.Name;
                    con.firstName=nameParts[0];
                    con.LastName=nameParts[1]; 
                    con.UserId__c=ptsUser.Id;
                    con.Email=ptsUser.Email;
                    con.LastVisitDate__c=Datetime.valueOf(ptsUser.LastVisitDate);
                    con.Registration_Date__c= Date.valueOf(ptsUser.registerDate);
                    con.Active__c='Yes';
                     
                    //con.Data_Update_Date__c = System.now();
                    con.Total_Passed_Quizzes__c=Integer.valueOf(ptsUser.TotalPassedQuizzes);
                    con.Certificates__c= Integer.valueOf(ptsUser.TotalCertificates);
                    
                    con.Administrator__c= Integer.valueOf(ptsUser.Administrator);
                    con.Formulas__c=Integer.valueOf(ptsUser.Formulas);
                    con.Flow_Builder__c= Integer.valueOf(ptsUser.FlowBuilder);
                    con.Vehicle_Manager__c= Integer.valueOf(ptsUser.VehicleManager);
                    con.Apex_Beginner__c= Integer.valueOf(ptsUser.ApexBeginner);
                    con.Apex_Intermediate__c= Integer.valueOf(ptsUser.ApexIntermediate);
                    con.Integration__c= Integer.valueOf(ptsUser.Integration);
                    con.HTML__c= Integer.valueOf(ptsUser.HTML);
                    con.JavaScript__c= Integer.valueOf(ptsUser.JS);
                    con.LWC__c= Integer.valueOf(ptsUser.LWC);
                    con.Apex_Advance__c= Integer.valueOf(ptsUser.ApexAdvance);
                    con.Apex_Codes_CheatSheet__c= Integer.valueOf(ptsUser.ApexCodesCheatSheet);
                    con.IQ__c= Integer.valueOf(ptsUser.IQ);
                    con.Visual_Force__c= Integer.valueOf(ptsUser.VisualForce);
                    con.BuildApexCodingSkills__c= Integer.valueOf(ptsUser.BuildApexCodingSkills);
                    
                    con.Administrator_Certification__c=Integer.valueOf(ptsUser.AdministratorCertification)  != 0 ? true : false ;
                    con.Formulas_Certification__c=Integer.valueOf(ptsUser.FormulasCertification) != 0 ? true : false ;
                    con.Flow_Builder_Certification__c=Integer.valueOf(ptsUser.FlowBuilderCertification) != 0 ? true : false ;
                    con.Vehicle_Manager_Certification__c =Integer.valueOf(ptsUser.VehicleManagerCertification) != 0 ? True : False;
                    con.Apex_Beginner_Certification__c =Integer.valueOf(ptsUser.ApexBeginnerCertification) != 0 ? True : False;
                    con.Apex_Intermediate_Certification__c =Integer.valueOf(ptsUser.ApexIntermediateCertification) != 0 ? True : False;
                    con.Integration_Certification__c =Integer.valueOf(ptsUser.IntegrationCertification) != 0 ? True : False;
                    con.HTML_Certification__c =Integer.valueOf(ptsUser.HTMLCertification) != 0 ? True : False;
                    con.JS_Certification__c =Integer.valueOf(ptsUser.JSCertification) != 0 ? True : False;
                    con.LWC_Certification__c =Integer.valueOf(ptsUser.LWCCertification) != 0 ? True : False;
                    con.Apex_Advance_Certification__c =Integer.valueOf(ptsUser.ApexAdvanceCertification) != 0 ? True : False;
                    con.Apex_Codes_Cheat_Sheet_Certification__c =Integer.valueOf(ptsUser.ApexCodesCheatSheetCertification) != 0 ? True : False;
                    con.IQ_Certification__c =Integer.valueOf(ptsUser.IQCertification) != 0 ? True : False;
                    con.Visual_Force_Certification__c =Integer.valueOf(ptsUser.VisualForceCertification) != 0 ? True : False;
                    con.BuildApexCodingSkillsCertification__c =Integer.valueOf(ptsUser.BuildApexCodingSkillsCertification) != 0 ? True : False;
                    
                    con.Total_Passed_Quizzes_Today__c= Integer.valueOf(ptsUser.TotalPassedQuizzesToday);
                    
                    con.Mon__c =Integer.valueOf(ptsUser.TotalPassedQuizzesMonday) != 0 ? True : False;
                    con.Tue__c =Integer.valueOf(ptsUser.TotalPassedQuizzesTuesday) != 0 ? True : False;
                    con.Wed__c =Integer.valueOf(ptsUser.TotalPassedQuizzesWednesday) != 0 ? True : False;
                    con.Thu__c =Integer.valueOf(ptsUser.TotalPassedQuizzesThursday) != 0 ? True : False;
                    con.Fri__c =Integer.valueOf(ptsUser.TotalPassedQuizzesFriday) != 0 ? True : False;
                    con.Sat__c =Integer.valueOf(ptsUser.TotalPassedQuizzesSaturday) != 0 ? True : False;
                    con.Sun__c =Integer.valueOf(ptsUser.TotalPassedQuizzesSunday) != 0 ? True : False;
                
                   con.This_Week__c=String.isnotBlank(ptsUser.UserScoreLast7Days) ? Decimal.valueof(ptsUser.UserScoreLast7Days) : 0;
                   con.This_Month__c=String.isnotBlank(ptsUser.UserScoreLast30Days) ? Decimal.valueof(ptsUser.UserScoreLast30Days) : 0;
                   con.All_Times__c =String.isnotBlank(ptsUser.UserScoreAllTimes) ? Decimal.valueof(ptsUser.UserScoreAllTimes) : 0;

                    conList.add(con);
                
         } else if (conIds.contains(ptsUser.Id)){
                    
                    for(Contact con : existingContacts){
                        if(ptsUser.Id == con.UserId__c){
                            String[] nameParts = ptsUser.Name.split(' ');
                            
                   con.FirstName = nameParts[0];
                   con.LastName  = nameParts[1] ; 
                   con.Email= ptsUser.email;
                            
                   //con.Data_Update_Date__c = System.now();         
                   con.LastVisitDate__c= Datetime.valueOf(ptsuser.LastVisitDate);
                   con.Total_Certificates__c= Integer.valueOf(ptsuser.TotalCertificates);       
                   con.Total_Passed_Quizzes__c= Integer.valueOf(ptsuser.TotalPassedQuizzes);
             
                  //fields are mapped:data typeları checkbox ama strıng geldgı ıcın cevırıyrz JSON to APEX ;                              
                    con.Mon__c =Integer.valueOf(ptsUser.TotalPassedQuizzesMonday) != 0 ? True : False;
                    con.Tue__c =Integer.valueOf(ptsUser.TotalPassedQuizzesTuesday) != 0 ? True : False;
                    con.Wed__c =Integer.valueOf(ptsUser.TotalPassedQuizzesWednesday) != 0 ? True : False;
                    con.Thu__c =Integer.valueOf(ptsUser.TotalPassedQuizzesThursday) != 0 ? True : False;
                    con.Fri__c =Integer.valueOf(ptsUser.TotalPassedQuizzesFriday) != 0 ? True : False;
                    con.Sat__c =Integer.valueOf(ptsUser.TotalPassedQuizzesSaturday) != 0 ? True : False;
                    con.Sun__c =Integer.valueOf(ptsUser.TotalPassedQuizzesSunday) != 0 ? True : False;
             
                            con.Administrator__c= Integer.valueOf(ptsuser.Administrator);
                            con.Formulas__c= Integer.valueOf(ptsuser.Formulas);
                            con.Flow_Builder__c= Integer.valueOf(ptsuser.FlowBuilder);
                            con.Vehicle_Manager__c= Integer.valueOf(ptsuser.VehicleManager);
                            con.Apex_Beginner__c= Integer.valueOf(ptsuser.ApexBeginner);
                            con.Apex_Intermediate__c= Integer.valueOf(ptsuser.ApexIntermediate);
                            con.Integration__c= Integer.valueOf(ptsuser.Integration);  
                            con.HTML__c= Integer.valueOf(ptsuser.HTML);
                            con.JavaScript__c = Integer.valueOf(ptsuser.JS);
                            con.LWC__c = Integer.valueOf(ptsuser.LWC);
                            con.Apex_Advance__c = Integer.valueOf(ptsuser.ApexAdvance);
                            con.Apex_Codes_CheatSheet__c = Integer.valueOf(ptsuser.ApexCodesCheatSheet);
                            con.IQ__c = Integer.valueOf(ptsuser.IQ);  
                            con.Visual_Force__c = Integer.valueOf(ptsuser.VisualForce);
                            con.BuildApexCodingSkills__c = Integer.valueOf(ptsuser.BuildApexCodingSkills);            
                            
                         //more fields will be map:(fıeld data type:Integer ama string JSON geldgı ıcın cevr ,certıfıkası varsa 0 dısında gelıcek sonuc)
                            con.Administrator_Certification__c = Integer.valueOf(ptsuser.AdministratorCertification)!=0?true:false;
                            con.Formulas_Certification__c= Integer.valueOf(ptsuser.FormulasCertification)!=0?true:false;
                            con.Flow_Builder_Certification__c = Integer.valueOf(ptsuser.FlowBuilderCertification)!=0?true:false;
                            con.Vehicle_Manager_Certification__c = Integer.valueOf(ptsuser.VehicleManagerCertification)!=0?true:false;
                            con.Apex_Beginner_Certification__c = Integer.valueOf(ptsuser.ApexBeginnerCertification)!=0?true:false;
                            con.Apex_Intermediate_Certification__c =Integer.valueOf(ptsuser.ApexIntermediateCertification)!=1?true:false;
                            con.Integration_Certification__c = Integer.valueOf(ptsuser.IntegrationCertification)!=0?true:false;
                            con.HTML_Certification__c = Integer.valueOf(ptsuser.HTMLCertification)!=0?true:false;
                            con.JS_Certification__c = Integer.valueOf(ptsuser.JSCertification)!=0?true:false;
                            con.LWC_Certification__c = Integer.valueOf(ptsuser.LWCCertification)!=0?true:false;
                            con.Apex_Advance_Certification__c = Integer.valueOf(ptsuser.ApexAdvanceCertification)!=0?true:false;
                            con.Apex_Codes_Cheat_Sheet_Certification__c = Integer.valueOf(ptsuser.ApexCodesCheatSheetCertification)!=0?true:false;
                            con.IQ_Certification__c = Integer.valueOf(ptsuser.IQCertification)!=0?true:false;
                            con.Visual_Force_Certification__c = Integer.valueOf(ptsuser.VisualForceCertification)!=0?true:false; 
                            con.BuildApexCodingSkillsCertification__c = Integer.valueOf(ptsuser.BuildApexCodingSkillsCertification)!=0?true:false;                    
                                  
                        con.Administrator_Status__c = Integer.valueOf(ptsuser.AdministratorStatus)!=0?true:false;
                        con.Formulas_Status__c=Integer.valueOf(ptsuser.FormulasStatus)!=0?true:false;
                        con.Flow_Builder_Status__c= Integer.valueOf(ptsuser.FlowBuilderStatus)!=0?true:false;
                        con.Vehicle_Manager_Status__c=Integer.valueOf(ptsuser.VehicleManagerStatus)!=0?true:false;
                        con.Apex_Beginner_Status__c = Integer.valueOf(ptsuser.ApexBeginnerStatus)!=0?true:false;
                        con.Apex_Intermediate_Status__c=Integer.valueOf(ptsuser.ApexIntermediateStatus)!=0?true:false;
                        con.Integration_Status__c = Integer.valueOf(ptsuser.IntegrationStatus)!=0?true:false;
                        con.HTML_Status__c=Integer.valueOf(ptsuser.HTMLStatus)!=0?true:false;
                        con.JavaScript_Status__c=Integer.valueOf(ptsuser.JSStatus)!=0?true:false;
                        con.LWC_Status__c = Integer.valueOf(ptsuser.LWCStatus)!=0?true:false;
                        con.IQ_Status__c=Integer.valueOf(ptsuser.IQStatus)!=0?true:false;
                        con.Apex_Codes_CheatSheet_Status__c=Integer.valueOf(ptsuser.ApexCodesCheatSheetStatus)!=0?true:false;
                        con.Visual_Force_Status__c = Integer.valueOf(ptsuser.VisualForceStatus)!=0?true:false;
                        con.Build_Apex_Coding_Skills_Status_c__c=Integer.valueOf(ptsuser.BuildApexCodingSkillsStatus)!=0?true:false;
                        
             con.This_Week__c=String.isnotBlank(ptsUser.UserScoreLast7Days) ? Decimal.valueof(ptsUser.UserScoreLast7Days) : 0;
             con.This_Month__c=String.isnotBlank(ptsUser.UserScoreLast30Days) ? Decimal.valueof(ptsUser.UserScoreLast30Days) : 0;
             con.All_Times__c =String.isnotBlank(ptsUser.UserScoreAllTimes) ? Decimal.valueof(ptsUser.UserScoreAllTimes) : 0;
       
                      }
                   }  
                 }                 
              }
             conList.addAll(existingContacts);
            
            try{
                upsert conList; 
   /*     
API_Log__c APILog = new API_Log__c();
APILog.APIKey__c = APIKey;   //'PTSUserList'
APILog.APIName__c = APIName; //'PTSUserList'
APILog.Is_Error__c = false;
APILog.MessageBody__c = messageBody; //'All contact has been upserted successfuly'
APILog.Log_Title__c = logTitle; //'sucess at PTSUserList'
insert APILog; */ 
                
   APILogUtility.SuccessAPILog('PTSUserList','PTSUserList', existingContacts.size()+' contacts updated succesfully'+conList.size()+'we have total contacts','Success at PTSUserList');         
           
            }  catch (Exception e){  
                
/*API_Log__c APILog = new API_Log__c();
APILog.APIKey__c = APIKey;   //'PTSUserList'
APILog.APIName__c = APIName; //'PTSUserList'
APILog.Is_Error__c = true;
APILog.MessageBody__c = messageBody; //'All contact has NOT been upserted successfuly'
APILog.Log_Title__c = logTitle; //'Error at PTSUserList'
insert APILog; */    
  APILogUtility.ErrorAPILog('PTSUserList','PTSUserList', e.getCause()+ e.getMessage() +e.getLineNumber(),'Error at PTSUserList');      
          }         
        } else{   //contact almazsa  burası calısmalı           
            
 APILogUtility.ErrorAPILog('PTSUserList','PTSUserList',String.valueOf(response.getStatusCode()),'Error at API call');                   
       }
      }
     }