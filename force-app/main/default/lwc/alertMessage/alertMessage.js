import { LightningElement,api } from 'lwc';
export default class AlertMessage extends LightningElement {

    
//Metadan al ısımlerı yaz buraya(SF  dan cekıyoruz)
@api messageHead;
@api messageBody;
@api alertType;

}