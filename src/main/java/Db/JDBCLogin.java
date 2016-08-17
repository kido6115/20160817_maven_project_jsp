/*package Db;

import com.oracle.*;
import java.sql.*;
import java.util.*;

public class JDBCLogin extends JDBCCore {

	public int CheckEmployee(String Account, String Pwd) {
		int status = 0;
		try {
			Connection conn;
			conn = makeConnection();
			PreparedStatement st = conn
					.prepareStatement("Select PWD from EMPLOYEE where EID=?");
	st.setString(1, Account);
			ResultSet rs = st.executeQuery();
			if (rs.next()) {
				if (rs.getString("PWD").equals(Pwd)) {
					status = 1;// 帳號及密碼正確
				} else {
					status = 2;// 帳號或密碼錯誤
				}

			} else {
				status = 3; // 無此帳號
			}
			st.close();
			conn.close();

		} catch (Exception e) {
			status = 5;  //發生錯誤
		}

		return status;
	}
	
	
	
	public String getName(String Account) {
		String eName ="";
		try {
			Connection conn;
			conn = makeConnection();
			PreparedStatement st = conn
					.prepareStatement("Select Name from EMPLOYEE where EID='"+Account+"'");
//			st.setString(1, Account);
			ResultSet rs = st.executeQuery();
			while(rs.next())
			{
				eName=rs.getString("Name");
			}

		} catch (Exception e) {
			eName = "???";  //發生錯誤
		}

		return eName;
	}

	public int getStatus(String Account) {
		int status =0;
		try {
			Connection conn;
			conn = makeConnection();
			PreparedStatement st = conn
					.prepareStatement("Select JOB_ID from EMPLOYEE where EID='"+Account+"'");
//			st.setString(1, Account);
			ResultSet rs = st.executeQuery();
			while(rs.next())
			{
				status=rs.getInt("JOB_ID");
			}

		} catch (Exception e) {
			status = 0;  //發生錯誤
		}
		
		return status;
	}
	
	
}
*/



package Db;

import com.oracle.*;
import java.sql.*;
import java.util.*;

public class JDBCLogin extends JDBCCore {

	public int CheckEmployee(String Account, String Pwd) {
		int status = 0;
		try {
			Connection conn;
			conn = makeConnection();
			PreparedStatement st = conn
					.prepareStatement("Select PWD from EMPLOYEE where EID=?");
	st.setString(1, Account);
			ResultSet rs = st.executeQuery();
			if (rs.next()) {
				if (rs.getString("PWD").equals(Pwd)) {
					status = 1;// 帳號及密碼正確
				} else {
					status = 2;// 帳號或密碼錯誤
				}

			} else {
				status = 3; // 無此帳號
			}
			st.close();
			conn.close();

		} catch (Exception e) {
			status = 5;  //發生錯誤
		}

		return status;
	}
	
	public int getJobId(String Account) {
		int eName=0;
		try {
			Connection conn;
			conn = makeConnection();
			PreparedStatement st = conn
					.prepareStatement("Select JOB_ID from EMPLOYEE where EID='"+Account+"'");
//			st.setString(1, Account);
			ResultSet rs = st.executeQuery();
			while(rs.next())
			{
				eName=rs.getInt("JOB_ID");
			}

		} catch (Exception e) {
			
		}

		return eName;
	}
	
	public String getName(String Account) {
		String eName ="";
		try {
			Connection conn;
			conn = makeConnection();
			PreparedStatement st = conn
					.prepareStatement("Select Name from EMPLOYEE where EID='"+Account+"'");
//			st.setString(1, Account);
			ResultSet rs = st.executeQuery();
			while(rs.next())
			{
				eName=rs.getString("Name");
			}

		} catch (Exception e) {
			eName = "???";  //發生錯誤
		}

		return eName;
	}
	public String getMail(String Account) {
		String eMail ="";
		try {
			Connection conn;
			conn = makeConnection();
			PreparedStatement st = conn
					.prepareStatement("Select Email from EMPLOYEE where EID='"+Account+"'");
//			st.setString(1, Account);
			ResultSet rs = st.executeQuery();
			while(rs.next())
			{
				eMail=rs.getString("Email");
			}

		} catch (Exception e) {
			eMail = "???";  //發生錯誤
		}

		return eMail;
	}
	public int getStatus(String Account) {
		int status =0;
		try {
			Connection conn;
			conn = makeConnection();
			PreparedStatement st = conn
					.prepareStatement("Select DEP_ID from EMPLOYEE where EID='"+Account+"'");
//			st.setString(1, Account);
			ResultSet rs = st.executeQuery();
			while(rs.next())
			{
				status=rs.getInt("DEP_ID");
			}

		} catch (Exception e) {
			status = 0;  //發生錯誤
		}
		
		return status;
	}
	public String getJob(String Account) {
		String job = null;
		try {
			Connection conn;
			conn = makeConnection();
			PreparedStatement st = conn
					.prepareStatement("Select a.JOB_NAME from JOB a,employee b where b.EID='"+Account+"'and a.job_id=b.job_id ");
//			st.setString(1, Account);
			ResultSet rs = st.executeQuery();
			while(rs.next())
			{
				job=rs.getString("JOB_NAME");
			}

		} catch (Exception e) {
			job = "error";  //發生錯誤
		}
		
		return job;
	}
	public String getDep(String Account) {
		String dep = null;
		try {
			Connection conn;
			conn = makeConnection();
			PreparedStatement st = conn
					.prepareStatement("Select a.DEP_NAME from DEP a,employee b where b.EID='"+Account+"'and a.dep_id=b.dep_id ");
//			st.setString(1, Account);
			ResultSet rs = st.executeQuery();
			while(rs.next())
			{
				dep=rs.getString("DEP_NAME");
			}

		} catch (Exception e) {
			dep = "error";  //發生錯誤
		}
		
		return dep;
	}
	
}
