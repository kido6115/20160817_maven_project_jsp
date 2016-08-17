package Db;

import Bean.SearchHour_m;

import com.oracle.*;
import java.sql.*;
import java.util.*;

public class JDBCApplyChange extends JDBCCore {

	public int applyjob(String Eid, String ad, int dep_old, int job_old,
			int dep_new, int job_new, String ps) {
		
	
        
		int ss = 0;
		int status = 0;
		int APID = 1;
		try {

			Connection conn;
			conn = makeConnection();
			PreparedStatement st = conn
					.prepareStatement("SELECT MAX(APID) FROM APPLY_CHANGE");

			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				APID = rs.getInt("MAX(APID)");

			}

			APID = APID + 1;
			st.close();

			status = 1;

			PreparedStatement st2 = conn
					.prepareStatement("insert into apply_change values(?,?,?,?,?,?,?,3,SYSDATE)");

			st2.setLong(1, APID);
			st2.setString(2, Eid);
			st2.setInt(3, dep_old);
			st2.setInt(4, dep_new);

			st2.setInt(5, job_old);
			st2.setInt(6, job_new);
			st2.setString(7, ps);
			status = 2;
			st2.executeUpdate();
			status = 3;

			st2.close();

			conn.close();

status=4;
		} catch (Exception e) {
		
		}
		return status;
	}

}

