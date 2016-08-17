package Db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Bean.RemainHour;
import Bean.SearchHour;

public class JDBCIndex2 extends JDBCCore {

	public List<RemainHour> remainHour(String eid) {

		ArrayList<RemainHour> sh = new ArrayList<RemainHour>();
		try {

			Connection conn;
			conn = makeConnection();

			PreparedStatement pstmt = conn
					.prepareStatement("select b.credit-sum(a.pctotal),e.kname,e.kid from PSE_SUB a, Hours b ,PSE_main c,employee d,PSE_Kind e where b.eid=? and a.Kid=b.Kid and b.year=to_char(sysdate, 'yyyy')  and c.pid=a.pid and c.eid=b.eid and d.eid=b.eid and e.kid=a.kid and a.kid!=1 group by b.credit , d.name,e.kname,e.kid order by e.kid desc");
			pstmt.setString(1, eid);

			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				int i = 0;
				float remain = rs.getFloat(1);
				String kname = rs.getString(2);

				RemainHour dl = new RemainHour(remain, kname);
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

	public Float[] takeoff(String eid) {

		Float[] takeoff = new Float[5];
		try {
			

			
			for (int i = 0; i < 5; i++) {
				Connection conn;
				conn = makeConnection();
				PreparedStatement pstmt = conn
						.prepareStatement("select sum(c.pctotal) from PSE_main a,employee b, PSE_sub c where  a.pid=c.pid and b.eid=a.eid  and b.eid=? and c.kid=? and a.status!=2 and a.status!=4");

				pstmt.setString(1, eid);
				pstmt.setInt(2, (i + 1));
				ResultSet rs = pstmt.executeQuery();
				if (rs.next()) {
					takeoff[i] = rs.getFloat(1);
				}

				rs.close();
				pstmt.close();
				conn.close();
			}

		} catch (Exception e) {
		}
		return takeoff;
	}

	public Float[] pending(String eid) {

		Float[] pending = new Float[5];
		try {
			

			
			for (int i = 0; i < 5; i++) {
				Connection conn;
				conn = makeConnection();
				PreparedStatement pstmt = conn
						.prepareStatement("select sum(c.pctotal) from PSE_main a,employee b, PSE_sub c where  a.pid=c.pid and b.eid=a.eid  and b.eid=? and c.kid=? and a.status=3");

				pstmt.setString(1, eid);
				pstmt.setInt(2, (i + 1));
				ResultSet rs = pstmt.executeQuery();
				if (rs.next()) {
					pending[i] = rs.getFloat(1);
				}

				rs.close();
				pstmt.close();
				conn.close();
			}

		} catch (Exception e) {
		}
		return pending;
	}
	
	
	
	public List<RemainHour> getcredit(String eid) {

		ArrayList<RemainHour> sh = new ArrayList<RemainHour>();
		try {

			Connection conn;
			conn = makeConnection();
			PreparedStatement pstmt = conn
					.prepareStatement("select a.CREDIT,b.kname from Hours a,PSE_KIND b where a.Eid=? and a.kid=b.kid  and a.year=to_char(sysdate, 'YYYY') order by a.kid asc");
			pstmt.setString(1, eid);

			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				int i = 0;
				float remain = rs.getFloat(1);
				String kname = rs.getString(2);

				RemainHour dl = new RemainHour(remain, kname);
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
