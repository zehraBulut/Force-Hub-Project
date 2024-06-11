import { LightningElement, api,wire } from 'lwc';
import getuserMP from '@salesforce/apex/PFHuserMonthProgress.GetMonthlyProgress';



export default class UserMonthlyProgress extends LightningElement {

@api recordId;
MPList;
Days=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31];




@wire (getuserMP , { conId : '$recordId'}) output ({ error, data}) {
    if(data){
        this.MPList = data;
      
    }else{
        this.MPList = data;
    }
}


}