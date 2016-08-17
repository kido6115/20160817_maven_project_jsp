package Db;

import java.sql.*;
import java.util.*;

import javax.servlet.http.HttpSession;

import Bean.SearchHour_e;
import Bean.view_sub;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class JDBC_edit extends JDBCCore {

	public List<view_sub> view_sub(String Pid) {

		ArrayList<view_sub> sh = new ArrayList<view_sub>();
		try {

			Connection conn;
			conn = makeConnection();
			PreparedStatement pstmt = conn
					.prepareStatement("Select  PID,PCID,to_char(STARTDATETIME,'yyyy/mm/dd'),to_char(STARTDATETIME,'HH24:mi'),to_char(ENDDATETIME,'yyyy/mm/dd'),to_char(ENDDATETIME,'HH24:mi'),PCTOTAL , KID,PS from PSE_SUb where pid=? order by pcid DESC");

			pstmt.setString(1, Pid);

			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				int i = 0;
				String sPid = rs.getString(1);
				String sPcid = rs.getString(2);

				String sStarDate = rs.getString(3);
				String sStartTime = rs.getString(4);

				String sEndDate = rs.getString(5);
				String sEndTime = rs.getString(6);
				String sPctatol = rs.getString(7);
				String skid = rs.getString(8);
				String sPS = rs.getString(9);

				view_sub dl = new view_sub(sPid, sPcid, sStartTime, sStarDate,
						sEndTime, sEndDate, sPctatol, skid, sPS);// bean裡有,這裡就要有
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

}

/*
 * public String getName(String Name) { String eName =""; try { Connection conn;
 * conn = makeConnection(); PreparedStatement st = conn
 * .prepareStatement("Select Name from EMPLOYEE where Name ='"+Name+"'"); //
 * st.setString(1, Name); ResultSet rs = st.executeQuery(); while(rs.next()) {
 * eName=rs.getString("Name"); }
 * 
 * } catch (Exception e) { eName = "???"; //發生錯誤 }
 * 
 * return eName; }
 * 
 * 
 * }
 */
