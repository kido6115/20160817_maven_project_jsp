package Db;

import java.awt.Checkbox;
import java.sql.*;
import java.util.*;

import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

import Servlet.deleteServlet;
import Bean.edit;

public class deleteJDBC extends JDBCCore {
	public int checkbox(String[] checkbox) throws Exception{
			int status=0;
		try {
			for (int i = 0;i<checkbox.length;i++){
			Connection conn;
			
			Connection conn1;
			conn1 = makeConnection();
			PreparedStatement pstmt = conn1
					.prepareStatement("update pse_main set status='4' where pid=?");
//			st.setString(1, Account);
			
			pstmt.setInt(1, Integer.parseInt(checkbox[i]));
			ResultSet rs = pstmt.executeQuery();
			status=1;

			rs.close();
			pstmt.close();
			conn1.close();
			status=2;
			}
		} catch (Exception e) {
			status=3;

			throw e;
		
		}
		//回傳sditServlet1
		return status  ;
	
		}
}
/*
 * ArrayList<Checkbox> show = new ArrayList<Checkbox>(); int i = 0;
 * 
 * int pid = 0; String ckeck = null;
 * 
 * String type = ""; String stat = " ";
 * 
 * if (check != null) { for (int j = 1; j < check.length; j++) { if
 * (check.length < 1) { type = "main.pid=" + check[0];
 * 
 * } else { type = type + " or main.pid=" + check[j];
 * 
 * } } type = "and (main.pid=" + (check[0] + "" + type + ")"); } else { type =
 * ""; } } try { Connection conn; conn = makeConnection(); PreparedStatement st
 * = conn .prepareStatement("update pse_main set status='4'where pid=?;"); //
 * st.setString(1, Account); pstmt.setString(1, pid); ResultSet rs =
 * st.executeQuery(); } rs.close(); pstmt.close(); conn.close();
 * 
 * } catch (Exception e) { throw e; }return show;
 */

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