package Bean;

public class view_sub {

	private String Pid;
	private String Pcid;
	private String StartTime;
	private String StartDate;
	private String EndTime;
	private String EndDate;
	private String Pctatol;
	private String Kid;
	private String PS;
	

	public view_sub(String Pid, String Pcid, String StartTime,String StartDate, String EndTime,String EndDate,
			String Pctatol,String Kid,String PS) {
		this.Pid = Pid;
		this.Pcid = Pcid;
		this.StartTime = StartTime;
		this.StartDate = StartDate;
		this.EndDate = EndDate;
		this.EndTime=EndTime;
		this.Pctatol = Pctatol;
		this.Kid = Kid;
		this.PS=PS;

	}

	public String getPid() {
		return Pid;

	}

	public String getPcid() {
		return Pcid;

	}

	public String getStartTime() {
		return StartTime;

	}public String getStartDate() {
		return StartDate;

	}

	public String getEndTime() {
		return EndTime;

	}
	public String getEndDate() {
		return EndDate;

	}
	public String getPctatol() {
		return Pctatol;

	}
	public String getKid() {
		return Kid;

	}
	public String getPS() {
		return PS;
	}

	public void setPid(String Pid) {
		this.Pid = Pid;

	}

	public void setPcid(String Pcid) {
		this.Pcid = Pcid;

	}

	public void setStartTime(String StartTime) {
		this.StartTime = StartTime;

	}
	public void setStartDate(String StartDate) {
		this.StartDate = StartDate;

	}

	public void setEndTime(String EndTime) {
		this.EndTime = EndTime;

	}
	public void setEndDate(String EndDate) {
		this.EndDate = EndDate;

	}

	public void setPctatol(String Pctatol) {
		this.Pctatol = Pctatol;

	}
	public void setKid(String Kid) {
		this.Kid = Kid;

	}
	public void setPS(String PS) {
		this.PS = PS;

	}

}
