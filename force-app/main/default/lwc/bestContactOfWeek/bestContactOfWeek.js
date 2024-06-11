import { LightningElement , wire, track} from 'lwc';

import theBestContact from '@salesforce/apex/bestWeek.theBestContact';



export default class SoftExample extends LightningElement {

@track cont; 


@wire(theBestContact) theBestContact({error,data}){

    
    if(data) {

    this.cont = data; 

    } else if(error) {

     this.cont = undefined; 
}
 }


}