package Bean;

import java.sql.Date;

public class Apply {



	private int aPID;
	private String eid;
	private String name;
	private int dep_id ;
	private String dep_name;
	private int job_id ;
	private String job_name;
	private int ap_dep_id ;
	private String ap_dep_name;
	private int ap_job_id ;
	private String ap_job_name;
	private String reason;
	private String ap_date;
	
	

	
	
	public Apply(int aPID, String eid, String name, int dep_id,
			String dep_name, int job_id, String job_name, int ap_dep_id,
			String ap_dep_name, int ap_job_id, String ap_job_name,
			String reason, String ap_date) {
		this.aPID = aPID;
		this.eid = eid;
		this.name = name;
		this.dep_id = dep_id;
		this.dep_name = dep_name;
		this.job_id = job_id;
		this.job_name = job_name;
		this.ap_dep_id = ap_dep_id;
		this.ap_dep_name = ap_dep_name;
		this.ap_job_id = ap_job_id;
		this.ap_job_name = ap_job_name;
		this.reason = reason;
		this.ap_date = ap_date;
	}



	public int getaPID() {
		return aPID;
	}



	public void setaPID(int aPID) {
		this.aPID = aPID;
	}



	public String getEid() {
		return eid;
	}



	public void setEid(String eid) {
		this.eid = eid;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public int getDep_id() {
		return dep_id;
	}



	public void setDep_id(int dep_id) {
		this.dep_id = dep_id;
	}



	public String getDep_name() {
		return dep_name;
	}



	public void setDep_name(String dep_name) {
		this.dep_name = dep_name;
	}



	public int getJob_id() {
		return job_id;
	}



	public void setJob_id(int job_id) {
		this.job_id = job_id;
	}



	public String getJob_name() {
		return job_name;
	}



	public void setJob_name(String job_name) {
		this.job_name = job_name;
	}



	public int getAp_dep_id() {
		return ap_dep_id;
	}



	public void setAp_dep_id(int ap_dep_id) {
		this.ap_dep_id = ap_dep_id;
	}



	public String getAp_dep_name() {
		return ap_dep_name;
	}



	public void setAp_dep_name(String ap_dep_name) {
		this.ap_dep_name = ap_dep_name;
	}



	public int getAp_job_id() {
		return ap_job_id;
	}



	public void setAp_job_id(int ap_job_id) {
		this.ap_job_id = ap_job_id;
	}



	public String getAp_job_name() {
		return ap_job_name;
	}



	public void setAp_job_name(String ap_job_name) {
		this.ap_job_name = ap_job_name;
	}



	public String getReason() {
		return reason;
	}



	public void setReason(String reason) {
		this.reason = reason;
	}



	public String getAp_date() {
		return ap_date;
	}



	public void setAp_date(String ap_date) {
		this.ap_date = ap_date;
	}



}
