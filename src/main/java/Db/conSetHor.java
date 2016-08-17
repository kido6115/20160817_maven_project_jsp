package Db;

import com.oracle.*;
import java.sql.*;
import java.util.*;

public class conSetHor extends JDBCCore {

	public String compute(String eid, String kid) {
		String left = "";

		try {
			Connection conn;
			conn = makeConnection();
			PreparedStatement pstmt = conn
					.prepareStatement("SELECT SUM(B.PCTOTAL) FROM PSE_MAIN A,PSE_SUB B WHERE A.PID=B.PID  AND STATUS='1' AND EID='E101' AND KID='1'");

			ResultSet rs = pstmt.executeQuery();
			if(rs.next())
			{
				left = rs.getString(1);

			}

		} catch (Exception e) {

		}
		return left;

	}

	public String getName(String Account) {
		String eName = "";
		try {
			Connection conn;
			conn = makeConnection();
			PreparedStatement st = conn
					.prepareStatement("Select Name from EMPLOYEE where EID='"
							+ Account + "'");
			// st.setString(1, Account);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				eName = rs.getString("Name");
			}

		} catch (Exception e) {
			eName = "???"; // 發生錯誤
		}

		return eName;
	}

}
