import { LightningElement, api , wire } from 'lwc';
import getPercentage from '@salesforce/apex/UserProgress.UserProgress';

export default class UserProgress extends LightningElement {

    
 @api recordId ;
 @api courseName;
//apexten cagırmak ıcın)
 @wire (getPercentage , {recordId : '$recordId', courseName : '$courseName'}) UserPercentage;
}