package Db;

import com.oracle.*;
import java.sql.*;
import java.util.*;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class JDBCForgetPwd extends JDBCCore {

	public int ForgetPwd(String Eid, String Email) {
		int status = 0;

		try {

			Connection conn;
			conn = makeConnection();
			PreparedStatement st = conn
					.prepareStatement("Select Email from EMPLOYEE where EID=?");
			st.setString(1, Eid);
			ResultSet rs = st.executeQuery();

			if (rs.next()) {
				if (rs.getString("Email").equals(Email)) {
					status = 1; // 有比對到信箱
				} else {
					status = 2; // 信箱錯誤
				}

			} else {
				status = 3;// 查無會員編號
			}
			st.close();
			conn.close();
		} catch (Exception e) {
			status = 4;// 發生錯誤
		}

		return status;

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
}
