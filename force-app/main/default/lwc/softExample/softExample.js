import { LightningElement } from 'lwc';

export default class SoftExample extends LightningElement {


fullName = 'destina';

course =  'developer';

changeHandler (event){


    this.course= event.target.value;

}




}