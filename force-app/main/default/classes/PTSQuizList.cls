public class PTSQuizList {
    public static void getCourses(){
      
        Http http = new Http();
        HttpRequest request= new HttpRequest();
        request.setEndPoint('https://data.pathtosalesforce.com/quizzes.php?token=3c6530e31352476faafb05968d32afde');
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        system.debug(response.getBody());     //json formatında geldı
        
        PTSQuizListResponse res = PTSQuizListResponse.parse(response.getBody()); //JSON ları sısteme APEX modunda  koyduk
        system.debug(res);
        
        
        List<Course__c> existingCources = [SELECT Id,Name,Number_of_Quizzes__c FROM Course__c]; //Course name lerı cagrdık
        
     /*List<String> courseNames = new List<String>(); // course un name lerını querryden  alıp for eachle bu lısteye ekledım
        
        for(Course__c cName: existingCources){
            courseNames.add(cName.Name);      
      } */
        
        
      //coursename ve numberofQuızlerı KEY-VALUE seklınde olustrmam lazım MAP ıle
        Map<String,Integer> myMap = new Map<String,Integer>();
        
        myMap.put('Administrator',Integer.valueof(res.Administrator));
        myMap.put('Formulas',Integer.valueof(res.Formulas));
        myMap.put('FlowBuilder',Integer.valueof(res.FlowBuilder));
        myMap.put('VehicleManager',Integer.valueof(res.VehicleManager)); 
        myMap.put('ApexBeginner',Integer.valueof(res.ApexBeginner));
        myMap.put('ApexIntermediate',Integer.valueof(res.ApexIntermediate));
        myMap.put('Integration',Integer.valueof(res.IQ));
        myMap.put('HTML',Integer.valueof(res.HTML));
        myMap.put('JS',Integer.valueof(res.JS));
        myMap.put('LWC',Integer.valueof(res.LWC));
        myMap.put('ApexAdvance',Integer.valueof(res.ApexAdvance));
        myMap.put('ApexCodesCheatSheet',Integer.valueof(res.ApexCodesCheatSheet));
        myMap.put('IQ',Integer.valueof(res.IQ));
        myMap.put('VisualForce',Integer.valueof(res.VisualForce));
        myMap.put('BuildApexCodingSkills',Integer.valueof(res.BuildApexCodingSkills));
        
        
      //EKLEMEK ISTEDGIM COURSE LARI BU SEKILDD EKLIYORUM SISTEME
        List<Course__c> courseList = new List<Course__c>();      
          
        for(Course__c course : existingCources){   //(var olan course ları UPDATE et) 
            course.New_Quiz_Added_Today__c= false; //reset yap false ıle (quiz sayısı degısmediyse-aynı ıse kutu(newQuızaddded) tıklanmasın)
          if(course.Number_of_Quizzes__c != myMap.get(course.Name)){   //quız sayısı  degstyse (arttr) update yapınca
             course.New_Quiz_Added_Today__c= true;  //degerler aynı degılse tıklesın(newQuızaddded) kutu
            }                         
            course.Number_of_Quizzes__c = myMap.get(course.Name);  //(course un name ını verınce degerını alıyorsun=n.ofQuız)
            courseList.add(course);
        }
          update courseList;
        
     //yenı course name ve numberofquızlerı INsert  ıcın kulandık bu code u
       /* for(String course : myMap.keySet()) {
            Course__c course = new Course__c();
            course.Name = course;
            course.Number_of_Quizzes__c =myMap.get(course);
            
            courseList.add(course);           
        }    
        insert courseList;
      */
        
        
    }
}