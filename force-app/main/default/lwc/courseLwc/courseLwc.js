import { LightningElement, api,wire } from 'lwc';

import{ getRecord,getFieldValue} from 'lightning/uiRecordApi';

import NAME_FIELD from '@salesforce/schema/Course__c.Name';
import NUMBER_OF_QUIZZES_FIELD from '@salesforce/schema/Course__c.Number_of_Quizzes__c';
import CERTIFICATE_FIELD from '@salesforce/schema/Course__c.Certificate__c';


const FIELDS=[NAME_FIELD,NUMBER_OF_QUIZZES_FIELD,CERTIFICATE_FIELD];


export default class CourseLwc extends LightningElement {

@api recordId;

coursename;
numberOfQuizzes;
certificate;

error;

@wire (getRecord,{recordId:'$recordId',fields:FIELDS})
courseRecord ({error,data}){

if(data){

this.coursename = getFieldValue(data,NAME_FIELD);
this.numberOfQuizzes = getFieldValue(data,NUMBER_OF_QUIZZES_FIELD);
this.certificate = getFieldValue(data,CERTIFICATE_FIELD);

}else{
    this.error = error;
}
}
}