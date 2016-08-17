package Bean;

public class Holiday {

	private String h_date;
	private String h_name;

	public Holiday(String h_date, String h_name) {
		// TODO Auto-generated constructor stub
		this.h_date = h_date;
		this.h_name = h_name;
	}

	public String geth_date() {
		return h_date;

	}

	public String geth_name() {
		return h_name;

	}

	public void seth_date(String h_date) {
		this.h_date = h_date;

	}

	public void seth_name(String h_name) {
		this.h_name = h_name;

	}
}
