public class PTSQuizListResponse {
    
     public PTSQuizListResponse(){
        
         Administrator = '0';
         Formulas = '0';
         FlowBuilder = '0';
         VehicleManager = '0';
         ApexBeginner = '0';
         ApexIntermediate = '0';
         Integration = '0';
         HTML = '0';
         JS = '0';
         LWC = '0';
         ApexAdvance = '0';
         ApexCodesCheatSheet = '0';
         IQ = '0';
         VisualForce = '0';
         BuildApexCodingSkills = '0';  
    }
    

    public String Administrator;
	public String Formulas;
	public String FlowBuilder;
	public String VehicleManager;
	public String ApexBeginner;
	public String ApexIntermediate;
	public String Integration;
	public String HTML;
	public String JS;
	public String LWC;
	public String ApexAdvance;
	public String ApexCodesCheatSheet;
	public String IQ;
	public String VisualForce;
	public String BuildApexCodingSkills;
	
	
	public static PTSQuizListResponse parse(String json) {
		return (PTSQuizListResponse) System.JSON.deserialize(json, PTSQuizListResponse.class);
	}
   }