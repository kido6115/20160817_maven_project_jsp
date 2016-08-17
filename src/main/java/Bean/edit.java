package Bean;

public class edit {
	private String Pid;
	private String Time;
	private String Reply;
	

	public edit(String Pid, String Time, String Reply) {
		this.Pid = Pid;
		this.Time = Time;
		this.Reply = Reply;
		

	}

	public String getPid() {
		return Pid;

	}

	public String getTime() {
		return Time;

	}

	public String getReply() {
		return Reply;

	}

	

	public void setPid(String Pid) {
		this.Pid = Pid;

	}

	public void setTime(String Time) {
		this.Time = Time;

	}

	public void setReply(String Reply) {
		this.Reply = Reply;

	}

	
}
