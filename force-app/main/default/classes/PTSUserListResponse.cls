public class PTSUserListResponse {
    
    public PTSUserListResponse(){
        
        Id='';
        Name='';
        email='';
        LastVisitDate='';
        registerDate=''; 
        FormattedLastVisitDate='';
        
        TotalPassedQuizzes='0';
        TotalCertificates='0';
        TotalPassedQuizzesToday='0';
        TotalPassedQuizzesMonday='0';
        TotalPassedQuizzesTuesday='0';
        TotalPassedQuizzesWednesday='0';
        TotalPassedQuizzesThursday='0';
        TotalPassedQuizzesFriday='0';
        TotalPassedQuizzesSaturday='0';
        TotalPassedQuizzesSunday='0';
        
        Administrator='0';
        Formulas='0';
        FlowBuilder='0';
        VehicleManager='0';
        ApexBeginner='0';
        ApexIntermediate='0';
        Integration='0';
        HTML='0';
        JS='0';
        LWC='0';
        ApexAdvance='0';
        ApexCodesCheatSheet='0';
        IQ='0';
        VisualForce='0';
        
        AdministratorCertification='0';
        FormulasCertification='0';
        FlowBuilderCertification='0';
        VehicleManagerCertification='0';
        ApexBeginnerCertification='0';
        ApexIntermediateCertification='0';
        IntegrationCertification='0';
        HTMLCertification='0';
        JSCertification='0';
        LWCCertification='0';
        ApexAdvanceCertification='0';
        ApexCodesCheatSheetCertification='0';
        IQCertification='0';
        VisualForceCertification='0';
        TotalCertificates='0';
        BuildApexCodingSkillsCertification='0';

       
        AdministratorStatus='';
        FormulasStatus='';
        FlowBuilderStatus='';
        VehicleManagerStatus='';
        ApexBeginnerStatus='';
        ApexIntermediateStatus='';
        IntegrationStatus='';
        HTMLStatus='';
        JSStatus='';
        LWCStatus='';
        IQStatus='';
        ApexCodesCheatSheetStatus='';
        VisualForceStatus='';
        BuildApexCodingSkillsStatus='';     
        
        //Burası yenı eklendı
        UserScoreAllTimes='0';
		UserScoreLast30Days='0';
		UserScoreLast7Days='0';
		ProjectCompleted='0';
        ThisWeek='';
        ThisMonth='';
        
  }
    public String Id;
    public String Name;
    public String email;
    public String LastVisitDate;
    public String registerDate;
    public String FormattedLastVisitDate;
    public String TotalPassedQuizzes;
    public String TotalCertificates;
    
    public String TotalPassedQuizzesToday;
    public String TotalPassedQuizzesMonday;
    public String TotalPassedQuizzesTuesday;
    public String TotalPassedQuizzesWednesday;
    public String TotalPassedQuizzesThursday;
    public String TotalPassedQuizzesFriday;
    public String TotalPassedQuizzesSaturday;
    public String TotalPassedQuizzesSunday;
    
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
    
    public String AdministratorCertification;
    public String FormulasCertification;
    public String FlowBuilderCertification;
    public String VehicleManagerCertification;
    public String ApexBeginnerCertification;
    public String ApexIntermediateCertification;
    public String IntegrationCertification;
    public String HTMLCertification;
    public String JSCertification;
    public String LWCCertification;
    public String ApexAdvanceCertification;
    public String ApexCodesCheatSheetCertification;
    public String IQCertification;
    public String VisualForceCertification;
    public String BuildApexCodingSkillsCertification;
    
    public String AdministratorStatus;
    public String FormulasStatus;
    public String FlowBuilderStatus;
    public String VehicleManagerStatus;
    public String ApexBeginnerStatus;
    public String ApexIntermediateStatus;
    public String IntegrationStatus;
    public String HTMLStatus;
    public String JSStatus;
    public String LWCStatus;
    public String IQStatus;
    public String ApexCodesCheatSheetStatus;
    public String VisualForceStatus;
    public String BuildApexCodingSkillsStatus;
    public String BuildApexCodingSkills;
    
    public String UserScoreAllTimes;
	public String UserScoreLast30Days;
	public String UserScoreLast7Days;
	public String ProjectCompleted;
    public String ThisWeek;
    public String ThisMonth;
        
	
	public static List<PTSUserListResponse> parse(String json) {
	return (List<PTSUserListResponse>) System.JSON.deserialize(json, List<PTSUserListResponse>.class);	
    }
  }