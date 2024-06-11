public class PFHuserCurrentMonthDatesResponse {
	public String UserId;
	public String Days;

	public static List<PFHuserCurrentMonthDatesResponse> parse(String json) {
		return (List<PFHuserCurrentMonthDatesResponse>) System.JSON.deserialize(json, List<PFHuserCurrentMonthDatesResponse>.class);
	}
}