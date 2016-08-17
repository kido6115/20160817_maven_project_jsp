package Bean;

public class Employee {

	private String Eid;
	private String Name;
	private String Id;
	private String Email;
	private String Pwd;
	private int Identity;

	public Employee(String Eid, String Name, String Id, String Email,
			String Pwd, int Identity) {
		this.Eid = Eid;
		this.Name = Name;
		this.Id = Id;
		this.Email = Email;
		this.Pwd = Pwd;
		this.Identity = Identity;

	}

	public String getEid() {
		return Eid;

	}

	public String getName() {
		return Name;

	}

	public String getId() {
		return Id;

	}

	public String getEmail() {
		return Email;

	}

	public String getPwd() {
		return Pwd;

	}

	public int getIdentity() {
		return Identity;

	}

	public void setEid(String Eid) {
		this.Eid = Eid;

	}

	public void setName(String Name) {
		this.Name = Name;

	}

	public void setId(String Id) {
		this.Id = Id;

	}

	public void setEmail(String Email) {
		this.Email = Email;

	}

	public void setPwd(String Pwd) {
		this.Pwd = Pwd;

	}

	public void setIdentity(int Identity) {
		this.Identity = Identity;

	}

}
