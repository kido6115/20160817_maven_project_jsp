package Db;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import Bean.Apply;
import Bean.CheckPSE;

public class JDBCCheckApply extends JDBCCore {

	public List<Apply> ListUncheckApply(int aID) {

		ArrayList<Apply> sh = new ArrayList<Apply>();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try {

			Connection conn;
			conn = makeConnection();
			if (aID == 0) {
				pstmt = conn
							.prepareStatement("select a.apid,a.eid,b.name,b.dep_id,c.dep_name,b.job_id,e.job_name,a.ap_dep_id,d.dep_name,a.ap_job_id,f.job_name,a.why,to_char(a.apply_date,'yyyy-mm-dd') from apply_change a,employee b, dep c,job e,dep d, job f where a.eid=b.eid and b.dep_id=c.dep_id and b.job_id=e.job_id and a.ap_dep_id=d.dep_id and a.ap_job_id=f.job_id and a.status=3 ");
	
				//	.prepareStatement("select a.apid,a.eid,b.name,a.dep_id,c.dep_name,a.job_id,e.job_name,a.ap_dep_id,d.dep_name,a.ap_job_id,f.job_name,a.why,to_char(a.apply_date,'yyyy-mm-dd') from apply_change a,employee b, dep c,job e,dep d, job f where a.eid=b.eid and a.dep_id=c.dep_id and a.job_id=e.job_id and a.ap_dep_id=d.dep_id and a.ap_job_id=f.job_id and a.status=3 ");
				rs = pstmt.executeQuery();

			} else {
				pstmt = conn
						.prepareStatement("select a.apid,a.eid,b.name,b.dep_id,c.dep_name,b.job_id,e.job_name,a.ap_dep_id,d.dep_name,a.ap_job_id,f.job_name,a.why,to_char(a.apply_date,'yyyy-mm-dd') from apply_change a,employee b, dep c,job e,dep d, job f where a.eid=b.eid and b.dep_id=c.dep_id and b.job_id=e.job_id and a.ap_dep_id=d.dep_id and a.ap_job_id=f.job_id and a.apid=?");
				pstmt.setInt(1, aID);
				rs = pstmt.executeQuery();

			}

			while (rs.next()) {
				int i = 0;
				int aPID = rs.getInt(1);
				String eid = rs.getString(2);
				String name = rs.getString(3);
				int dep_id = rs.getInt(4);
				String dep_name = rs.getString(5);
				int job_id = rs.getInt(6);
				String job_name = rs.getString(7);
				int ap_dep_id = rs.getInt(8);
				String ap_dep_name = rs.getString(9);
				int ap_job_id = rs.getInt(10);
				String ap_job_name = rs.getString(11);
				String reason = rs.getString(12);
				String ap_date = rs.getString(13);

				Apply dl = new Apply(aPID, eid, name, dep_id, dep_name, job_id,
						job_name, ap_dep_id, ap_dep_name, ap_job_id,
						ap_job_name, reason, ap_date);
				sh.add(i, dl);
				i++;
			}
			rs.close();
			pstmt.close();
			conn.close();

		} catch (Exception e) {
			int a = 1;

		}
		return sh;

	}

	public int PassApply(int aPID, String Eid, int dep, int job, int ap_dep,
			int ap_job) {
		int status = 0;
		try {

			Connection conn;
			conn = makeConnection();
			PreparedStatement pstmt = null;
			PreparedStatement pstmt2 = null;
			PreparedStatement pstmt3 = null;

			ResultSet rs = null;
			int count = 0;
			if (job == 2) {
				pstmt = conn
						.prepareStatement("select count(job_id) from employee where dep_id=? and job_id=2");
				pstmt.setInt(1, dep);
				rs = pstmt.executeQuery();
				status = 1;
				if (rs.next()) {
					count = rs.getInt(1);
				}
				if (count < 2) {
					status = 2; // 主管只有一人 不可調動
					return status;
				}else {
					pstmt2 = conn
							.prepareStatement("Update Employee set Dep_id=? ,job_id=? where EID=?");
					pstmt3 = conn
							.prepareStatement("Update Apply_Change set Status='1' where APID=?");
					pstmt2.setInt(1, ap_dep);
					pstmt2.setInt(2, ap_job);
					pstmt2.setString(3, Eid);
					status = 3;
					pstmt2.executeUpdate();
					pstmt3.setInt(1, aPID);
					pstmt3.executeUpdate();

					status = 4;
					pstmt2.close();
					status = 5;// 成功修改
				}
				pstmt.close();

			} else {

				pstmt2 = conn
						.prepareStatement("Update Employee set Dep_id=? ,job_id=? where EID=?");
				pstmt3 = conn
						.prepareStatement("Update Apply_Change set Status='1' where APID=?");
				pstmt2.setInt(1, ap_dep);
				pstmt2.setInt(2, ap_job);
				pstmt2.setString(3, Eid);
				status = 3;
				pstmt2.executeUpdate();
				pstmt3.setInt(1, aPID);
				pstmt3.executeUpdate();

				status = 4;
				pstmt2.close();
				status = 5;// 成功修改

			}


			conn.close();

		} catch (Exception e) {
			return status;

		}
		return status;

	}

	public int notPassApply(int aPID) {
		int status = 0;

		try {

			Connection conn;
			conn = makeConnection();

			PreparedStatement st = conn
					.prepareStatement("Update Apply_Change set Status='2' where APID=?");
			st.setInt(1, aPID);
			status = 1;
			st.executeUpdate();
			status = 2;
			st.close();

			st.close();
			conn.close();
			status = 3;// 成功修改

		} catch (Exception e) {
			return status;

		}
		return status;

	}

	public int sendMail(String Email, String Eid, List<Apply> list) {
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

		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("littletree04240@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(Email));
			message.setSubject("IISI-申請調職結果----不通過");

			for (Apply apply : list) {

				message.setText("親愛的 " + apply.getName() + "您好,\n\n" + " 您於:"
						+ apply.getAp_date() + "申請的調職為     "
						+ apply.getDep_name() + "部" + apply.getJob_name()
						+ "\n\n經由詳細審查後不予通過,請再接再厲 \n\n\n 祝  平安,順心  \n\n人資部關心您");
			}

			Transport transport = session.getTransport("smtp");
			transport.connect(host, port, username, password);

			transport.sendMessage(message, message.getAllRecipients());

			System.out.println("Done");
			status = 1;
		} catch (MessagingException e) {
			status = 2;
			throw new RuntimeException(e);
		}

		return status;

	}

	
	
	
	
	public int sendMail_Pass(String Email, String Eid, List<Apply> list) {
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

		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("littletree04240@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(Email));
			message.setSubject("IISI-申請調職結果----通過");

			for (Apply apply : list) {

				message.setText("親愛的 " + apply.getName() + "您好,\n\n" + " 您於:"
						+ apply.getAp_date() + "申請的調職為     "
						+ apply.getDep_name() + "部" + apply.getJob_name()
						+ "\n\n經由詳細審查予以通過!! \n\n\n 祝  平安,順心  \n\n人資部關心您");
			}

			Transport transport = session.getTransport("smtp");
			transport.connect(host, port, username, password);

			transport.sendMessage(message, message.getAllRecipients());

			System.out.println("Done");
			status = 1;
		} catch (MessagingException e) {
			status = 2;
			throw new RuntimeException(e);
		}

		return status;

	}
	
	
	
	
	
}
