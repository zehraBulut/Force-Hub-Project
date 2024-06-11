import { LightningElement, api,wire } from 'lwc';
import returnedOutput  from '@salesforce/apex/PFHLastActivityDate.getLastActivityMessage' ;

export default class LastActivityDateMessage extends LightningElement {



@api recordId;
output ;

isToday     = false;
isYesterday = false;
isOldDay    = false;

error;

//systemden bır sey almak ıstedgımde wire kulanırım:paramter gonderıyrm  bana data gelıyor
@wire (returnedOutput , { recordId : '$recordId'}) output ({ error, data}) {

    if(data){
        this.output = data;

        if(this.output =='TODAY'){
            this.isToday = true;
        }else if(this.output == 'YESTERDAY'){
            this.isYesterday = true;
        }else{
            this.isOldDay = true;
        }
      
    }else{
        this.error = error;
    }
}



}