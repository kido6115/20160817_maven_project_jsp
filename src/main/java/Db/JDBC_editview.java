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

public class JDBC_editview extends JDBCCore {

	public List<view_sub> view_sub(String pid){//(String pid)傳進來的東西
		
		ArrayList<view_sub> sh = new ArrayList<view_sub>();
		try {
		
			Connection conn;
			conn = makeConnection();
			PreparedStatement pstmt = conn
					.prepareStatement("Select a.PID,a.PCID,to_char(a.STARTDATETIME,'yyyy/mm/dd'),to_char(a.STARTDATETIME,'HH24:MI'),to_char(a.ENDDATETIME,'yyyy/mm/dd'),to_char(a.ENDDATETIME,'HH24:MI'),a.PCTOTAL , b.KNAME,a.PS from PSE_SUb a,PSE_KIND b where b.KID=a.KID and pid=? order by 2 desc");
			
			pstmt.setString(1, pid);
	
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				int i = 0;
				String sPid= rs.getString(1);
				String sPcid= rs.getString(2);
				
				String sStartDate=rs.getString(3);
				String sStartTime= rs.getString(4);
				
				String sEndDate=rs.getString(5);
				String sEndTime= rs.getString(6);
				String sPctatol= rs.getString(7);
				String skid= rs.getString(8);
				String sPS=rs.getString(9);
				

				view_sub dl = new view_sub(sPid, sPcid, sStartTime,sStartDate, sEndTime,sEndDate,sPctatol,skid,sPS);//bean裡有,這裡就要有
				sh.add(i, dl);
				i++;
			}
			rs.close();
			pstmt.close();
			conn.close();

		} catch (Exception e) {
	 int a=1;
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
