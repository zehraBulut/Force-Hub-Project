import {LightningElement, api, wire } from 'lwc';
import {getRecord, getFieldValue} from 'lightning/uiRecordApi';

//almak ıstedgn fıeldlerı yaz tektek
import FIRSTNAME_FIELD from '@salesforce/schema/Contact.FirstName' ;
import LASTNAME_FIELD  from '@salesforce/schema/Contact.LastName' ;
import EMAIL_FIELD  from '@salesforce/schema/Contact.Email' ;
import THIS_WEEK_FIELD  from '@salesforce/schema/Contact.This_Week__c' ;
import THIS_MONTH_FIELD  from '@salesforce/schema/Contact.This_Month__c' ;
import ALL_TIMES_FIELD  from '@salesforce/schema/Contact.All_times__c' ;
import TOTAL_CERTIFICATES_FIELD  from '@salesforce/schema/Contact.Total_Certificates__c' ;
import LASTVISIT_DATE_FIELD  from '@salesforce/schema/Contact.LastVisitDate__c' ;
import PHOTO_URL_FIELD  from '@salesforce/schema/Contact.Photo_URL__c' ;

import returnedOutput  from '@salesforce/apex/PFHLastActivityDate.getLastActivityMessage' ;

const FIELDS= [FIRSTNAME_FIELD,LASTNAME_FIELD,EMAIL_FIELD,THIS_WEEK_FIELD,THIS_MONTH_FIELD,ALL_TIMES_FIELD,TOTAL_CERTIFICATES_FIELD,PHOTO_URL_FIELD,LASTVISIT_DATE_FIELD];

export default class ContactCard extends LightningElement { //gorunmesnı ıstedklermızı exportun ıcınde yazarz

//sf dan almak ıcın kulan @api 
@api recordId;

firstName;
lastName;
email;
thisweek;
thismonth;
alltimes;
totalcertificates;
photoUrl;
lastVisitDate;

error;

//START HERE

//wire(anasayfadan almak ıcın)
@wire (getRecord, {recordId: '$recordId', fields:FIELDS}) contactRecord ({error,data}){
    
if(data){

this.firstName = getFieldValue(data,FIRSTNAME_FIELD);//istedgn fieldlerı cek
this.lastName = getFieldValue(data,LASTNAME_FIELD);
this.email = getFieldValue(data,EMAIL_FIELD);
this.thisweek = getFieldValue(data,THIS_WEEK_FIELD);
this.thismonth = getFieldValue(data,THIS_MONTH_FIELD);
this.alltimes = getFieldValue(data,ALL_TIMES_FIELD);
this.totalcertificates = getFieldValue(data,TOTAL_CERTIFICATES_FIELD);
this.photoUrl = getFieldValue(data,PHOTO_URL_FIELD);
this.lastVisitDate =  getFieldValue(data,LASTVISIT_DATE_FIELD);

}else{
   
    this.error = error;

}

//END HERE
}

@wire (returnedOutput , { recordId : '$recordId'}) output ({ error, data}) {
    if(data){
        this.output = data;
        this.lastVisitDate =  getFieldValue(data,LASTVISIT_DATE_FIELD);
    }else{
        this.error = error;
    }
}

}