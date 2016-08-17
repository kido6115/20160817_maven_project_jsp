package Bean;

import java.sql.Date;

public class CkeckSub {
private int pcid;
private String kname;
private int pctotal;
private String startdate;
private String starttime;

private String enddate;
private String endtime;

private String ps;

	
	public CkeckSub(int pcid, String kname, int pctotal, String startdate,String starttime,
			String enddate,String endtime, String ps) {
		// TODO Auto-generated constructor stub
		
		this.pcid=pcid;
		this.kname=kname;
		this.pctotal=pctotal;
		this.startdate=startdate;
		this.starttime=starttime;
		this.enddate=enddate;
		this.endtime=endtime;
		
		this.ps=ps;
	}

	public int getpcid() {
		return pcid;

	}

	public String getkname() {
		return kname;

	}

	public int getpctotal() {
		return pctotal;

	}

	public String getstartdate() {
		return startdate;

	}
	public String getstarttime() {
		return starttime;

	}
	public String getenddate() {
		return enddate;

	}
	public String getendtime() {
		return endtime;

	}
	public String getps() {
		return ps;

	}

	public void setpcid(int pcid) {
		this.pcid = pcid;

	}

	public void setkname(String kname) {
		this.kname = kname;

	}

	public void setpctotal(int pctotal) {
		this.pctotal = pctotal;

	}

	public void setstartdate(String startdate) {
		this.startdate = startdate;

	}
	public void setstarttimee(String starttime) {
		this.starttime = starttime;

	}
	public void setenddate(String enddate) {
		this.enddate = enddate;

	}
	public void setendtime(String endtime) {
		this.endtime = endtime;

	}
	public void setps(String ps) {
		this.ps = ps;

	}
	
	
	
}
