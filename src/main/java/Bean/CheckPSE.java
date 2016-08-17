package Bean;

import java.sql.Date;

public class CheckPSE {

	private int pid;
	private String eid;
	private String name;
	private Date applytime;
	private String status;
	
	

	public CheckPSE(int pid, String eid, String name, Date applytime,
			String status) {
		// TODO Auto-generated constructor stub

		this.pid = pid;
		this.eid = eid;
		this.name = name;
		this.applytime = applytime;
		this.status = status;

	}
	
	
	

	public int getpid() {
		return pid;

	}

	public String geteid() {
		return eid;

	}

	public String getname() {
		return name;

	}

	public Date getapplytime() {
		return applytime;

	}

	public String getstatus() {
		return status;

	}

	public void setpid(int pid) {
		this.pid = pid;

	}

	public void seteid(String eid) {
		this.eid = eid;

	}

	public void setname(String name) {
		this.name = name;

	}

	public void setapplytime(Date applytime) {
		this.applytime = applytime;

	}

	public void setstatus(String status) {
		this.status = status;

	}

}
