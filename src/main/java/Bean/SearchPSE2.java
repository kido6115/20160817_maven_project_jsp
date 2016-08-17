package Bean;

public class SearchPSE2 {

	private String applytime;
	private String eid;
	private String name;
	private int pid;
	private String kname;
	private String starttime;
	private String endtime;
	private String sname;

	public SearchPSE2(String applytime, String eid, String name, int pid,
			String kname, String starttime, String endtime, String sname) {
		// TODO Auto-generated constructor stub
		this.applytime = applytime;
		this.eid = eid;
		this.name = name;
		this.pid = pid;
		this.kname = kname;
		this.starttime = starttime;
		this.endtime = endtime;
		this.sname = sname;

	}

	public String getapplytime() {
		return applytime;

	}

	public String geteid() {
		return eid;

	}

	public String getname() {
		return name;

	}

	public int getpid() {
		return pid;

	}

	public String getkname() {
		return kname;

	}

	public String getstarttime() {
		return starttime;

	}

	public String getendtime() {
		return endtime;

	}

	public String getsname() {
		return sname;

	}

	public void setapplytime(String applytime) {
		this.applytime = applytime;

	}

	public void seteid(String eid) {
		this.eid = eid;

	}

	public void setpid(int pid) {
		this.pid = pid;

	}

	public void setstarttime(String starttime) {
		this.kname = starttime;

	}

	public void setendtime(String endtime) {
		this.kname = endtime;

	}

	public void setsname(String sname) {
		this.sname = sname;

	}

}
