package Bean;

public class hr {
	private String eid;
	private String name;

	private String depID;
	private String  depName;

	private String jobID;
	private String jobName;

	public hr(String eid, String name, String depID, String depName,
			String jobID, String jobName) {

		this.eid = eid;
		this.name = name;
		this.depID = depID;
		this.depName = depName;

		this.jobID = jobID;
		this.jobName = jobName;

	}

	public String geteid() {
		return eid;

	}

	public String getname() {
		return name;

	}

	public String getdepID() {
		return depID;

	}

	public String getdepName() {
		return depName;

	}

	public String getjobID() {
		return jobID;

	}

	public String getjobName() {
		return jobName;

	}

	public void seteid(String eid) {
		this.eid = eid;

	}

	public void setname(String name) {
		this.name = name;

	}

	public void setjobID(String jobID) {
		this.jobID = jobID;

	}

	public void setjobName(String jobName) {
		this.jobName =jobName;

	}

	public void setdepID(String depID) {
		this.depID = depID;

	}

	public void setdepName(String depName) {
		this.depName = depName;

	}

}
