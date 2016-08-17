package Db;

import com.oracle.*;
import java.sql.*;
import java.sql.Date;
import java.util.*;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import oracle.sql.ANYDATA;



import Bean.CheckPSE;
import Bean.CkeckSub;

public class JDBCCheckPSE extends JDBCCore {

	public List<CheckPSE> ListUnchecked(String dep) {
   int dd=Integer.parseInt(dep);
		ArrayList<CheckPSE> sh = new ArrayList<CheckPSE>();
		try {

			Connection conn;
			conn = makeConnection();
			PreparedStatement pstmt = conn
					.prepareStatement("select b.pid,a.eid,a.name,b.applytime,c.sname from employee a,pse_main b,pse_status c where a.eid=b.eid and b.status=c.status and b.status=3 and a.dep_id=? order by b.pid desc");
			pstmt.setInt(1, dd);

			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				int i = 0;
				int pid = rs.getInt(1);
				String eid = rs.getString(2);
				String name = rs.getString(3);
				Date applytime = rs.getDate(4);
				String status = rs.getString(5);

				CheckPSE dl = new CheckPSE(pid, eid, name, applytime,status);
				sh.add(i, dl);
				i++;
			}
			rs.close();
			pstmt.close();
			conn.close();

		} catch (Exception e) {
		}
		return sh;
		
	}
	
	
	public List<CkeckSub> ListPSE(int pid) {

		ArrayList<CkeckSub> sh = new ArrayList<CkeckSub>();
		try {

			Connection conn;
			conn = makeConnection();
			PreparedStatement pstmt = conn
					.prepareStatement("select b.pcid,c.kname,b.pctotal,to_char(b.startdatetime,'yyyy-mm-dd'),to_char(b.startdatetime,'HH24:mi'),to_char(b.enddatetime,'yyyy-mm-dd'),to_char(b.enddatetime,'HH24:mi'),b.ps from pse_main a,pse_sub b ,pse_kind c where a.pid=b.pid and b.kid=c.kid and a.pid=?");
			pstmt.setInt(1, pid);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				
				int i = 0;
				int pcid = rs.getInt(1);
				String kname = rs.getString(2);
				int pctotal = rs.getInt(3);
				
				String startdate = rs.getString(4);
				String starttime = rs.getString(5);

				String enddate = rs.getString(6);
				String endtime = rs.getString(7);

				String ps = rs.getString(8);

				CkeckSub dl = new CkeckSub(pcid, kname, pctotal, startdate,starttime,enddate,endtime,ps);
				sh.add(i, dl);
				i++;
			}
			rs.close();
			pstmt.close();
			conn.close();

		} catch (Exception e) {
		}
		return sh;
		
	}
	
	public int check(int pid,String comment,int status){
		
		int ss=0;
		try {

			Connection conn;
			conn = makeConnection();
        
		
			PreparedStatement st = conn
					.prepareStatement("Update PSE_MAIN set STATUS=?,REPLY=? where PID=?");
			st.setInt(1, status);
			st.setString(2, comment);
			st.setInt(3, pid);

			ss=1;

			st.executeUpdate();

			ss = 2;// 成功修改

			st.close();
			conn.close();
		}

		catch (Exception e) {
			ss = 3;// 發生錯誤
		}

		return ss;

	}
	
	
	
	public int sendMail(String name, String Email, String Eid) {
		int status = 0;

		String host = "smtp.gmail.com";
		int port = 587;
		final String username = "littletree04240@gmail.com";
		final String password = "tree0329";

		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.port", port);

		Session session = Session.getInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});
		StringBuffer newPwd = new StringBuffer();

		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("littletree04240@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(Email));
			message.setSubject("IISI-員工忘記密碼");

			int[] pwd = new int[8];
			int mod;
			for (int i = 0; i < 8; i++) {
				mod = (int) ((Math.random() * 7) % 3);

				if (mod == 1) {
					pwd[i] = (int) ((Math.random() * 10) + 48);
				} else if (mod == 2) {
					pwd[i] = (char) ((Math.random() * 26) + 65);

				} else {
					pwd[i] = (char) ((Math.random() * 26) + 97);

				}
			}
			for (int j = 0; j < 8; j++) {
				newPwd.append((char) pwd[j]);
			}

			message.setText("親愛的 " + name + "您好,\n\n 您的新密碼為:" + newPwd
					+ "\n\n請重新登入並修改密碼");

			Transport transport = session.getTransport("smtp");
			transport.connect(host, port, username, password);

			transport.sendMessage(message, message.getAllRecipients());
			String npwd = newPwd.toString();

			System.out.println("Done");
			status = 1;
		} catch (MessagingException e) {
			status = 2;
			throw new RuntimeException(e);
		}

		try {

			Connection conn;
			conn = makeConnection();

			String npwd = newPwd.toString();

			PreparedStatement st = conn
					.prepareStatement("Update Employee set PWD=? where Eid=?");
			st.setString(1, npwd);
			st.setString(2, Eid);

			st.executeUpdate();

			status = 4;// 成功修改

			st.close();
			conn.close();
		}

		catch (Exception e) {
			status = 5;// 發生錯誤
		}

		return status;

	}
	
	public String getEid(int pid){
		String Eid="";
		try{
			Connection conn;
			conn = makeConnection();
			PreparedStatement pstmt = conn
					.prepareStatement("Select EID from PSE_MAIN where PID=?");
			pstmt.setInt(1, pid);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
			
				 Eid = rs.getString(1);

			}
			pstmt.close();
			conn.close();
		}
		catch(Exception e){
			
			
		}
		return Eid;
	}
 
	
	
	public int sendMail2(String name, String Email, String Eid,String mes ,int pid) {
		int status = 0;

		String host = "smtp.gmail.com";
		int port = 587;
		final String username = "littletree04240@gmail.com";
		final String password = "tree0329";

		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.port", port);

		Session session = Session.getInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});
		StringBuffer newPwd = new StringBuffer();

		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("littletree04240@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(Email));
			message.setSubject("IISI-假單審核結果");

		

			message.setText("親愛的 " + name + "您好,\n\n 您的假單編號:" + pid
					+ "\n\n審核結果為:"+mes);

			Transport transport = session.getTransport("smtp");
			transport.connect(host, port, username, password);

			transport.sendMessage(message, message.getAllRecipients());
			String npwd = newPwd.toString();

			System.out.println("Done");
			status = 1;
		} catch (MessagingException e) {
			status = 2;
			throw new RuntimeException(e);
		}

		try {

			Connection conn;
			conn = makeConnection();

			String npwd = newPwd.toString();

			PreparedStatement st = conn
					.prepareStatement("Update Employee set PWD=? where Eid=?");
			st.setString(1, npwd);
			st.setString(2, Eid);

			st.executeUpdate();

			status = 4;// 成功修改

			st.close();
			conn.close();
		}

		catch (Exception e) {
			status = 5;// 發生錯誤
		}

		return status;

	}
	
	
	
	
	
	
	
}
