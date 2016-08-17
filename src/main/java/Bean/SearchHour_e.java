package Bean;

public class SearchHour_e {

	private String Eid;
	private String Name;
	private String Year;
	private String Kname;
	private String Credit;

	public SearchHour_e(String Eid, String Name, String Year, String Kname,
			String Credit) {
		this.Eid = Eid;
		this.Name = Name;
		this.Year = Year;
		this.Kname = Kname;
		this.Credit = Credit;

	}

	public String getEid() {
		return Eid;

	}

	public String getName() {
		return Name;

	}

	public String getYear() {
		return Year;

	}

	public String getKname() {
		return Kname;

	}

	public String getCredit() {
		return Credit;

	}

	public void setEid(String Eid) {
		this.Eid = Eid;

	}

	public void setName(String Name) {
		this.Name = Name;

	}

	public void setYear(String Year) {
		this.Year = Year;

	}

	public void setKname(String Kname) {
		this.Kname = Kname;

	}

	public void setCredit(String Credit) {
		this.Credit = Credit;

	}

}
