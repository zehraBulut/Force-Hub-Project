import { LightningElement , api} from 'lwc';

export default class PFCPanel extends LightningElement {

    @api panelType;
    @api panelBody;
    @api panelTitle;
}