public class PFHuserMonthProgress {

    @Auraenabled(cacheable=true)
    public static List<Boolean> GetMonthlyProgress(String conId){
        
        Contact con =[SELECT Id,Name,Studied_Days_of_Current_Month__c FROM Contact WHERE Id=:conId];
        
        List<Boolean> MPList = new  List<Boolean>(); //ıcı bos doldurcam
        
        // Integer numberofDays = Date.daysInMonth(2023,11);   //hangı ayın  kac gun oldgnu gosterıcek daysInMonth        
       Integer numberofDays = Date.daysInMonth(Date.today().year() , Date.today().month() );  //dynamıc oldu:hard codıng yapmamıs olduk sabıtdegl
        
        String[] StudiedDays = con.Studied_Days_of_Current_Month__c.split(','); //gunlerın arasına , koyulcak:1,2,5..
        
        for(Integer i=1;  i<=numberofDays; i++){
            
            if(StudiedDays.contains(String.valueof(i))){
               MPList.add(true); 
            }else{
                MPList.add(false);
            }            
        }               
        
        system.debug(MPList);

        return MPList ;
        
    }
}