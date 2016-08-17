/*package Db;

import Bean.Hours;
import Bean.SearchPSE;
import Bean.SearchPSE2;

import com.oracle.*;
import java.sql.*;
import java.util.*;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import au.com.bytecode.opencsv.CSVWriter;

public class JDBCPSEsearch extends JDBCCore {

	public List<Hours> getYear() {

		ArrayList<Hours> dy = new ArrayList<Hours>();
		int i = 0;
		String sYear = null;

		try {
			Connection conn;
			conn = makeConnection();
			PreparedStatement pstmt = conn
					.prepareStatement("select Year from Hours group by year order by Year desc");

			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {

				sYear = rs.getString(1);

				Hours dl = new Hours(sYear);
				dy.add(i, dl);
				i++;
			}
			rs.close();
			pstmt.close();
			conn.close();

		} catch (Exception e) {
		}
		return dy;
	}

	// 主管查詢
	public List<SearchPSE> SearchPSE(String emp, String ename, String sdate,
			String edate, String[] Kind, String[] Status,String dep) throws Exception {
int dd=Integer.parseInt(dep);
		ArrayList<SearchPSE> sh = new ArrayList<SearchPSE>();
		int i = 0;
		String applytime = null;
		String eid = null;
		String name = null;
		int pid = 0;
		String kname = null;
		String starttime = null;
		String endtime = null;
		String sname = null;
		String type = "";
		String stat = " ";

		if (Kind != null) {
			for (int j = 1; j < Kind.length; j++) {
				if (Kind.length < 1) {
					type = "sub.kid=" + Kind[0];

				} else {
					type = type + " or sub.kid=" + Kind[j];

				}
			}
			type = "and (sub.kid=" + Kind[0] + "" + type + ")";
		} else {
			type = "";
		}

		if (Status != null) {
			for (int j = 1; j < Status.length; j++) {
				if (Status.length < 1) {
					stat = "main.status=" + Status[0];

				} else {
					stat = stat + " or main.status=" + Status[j];

				}
			}
			stat = "and ( main.status=" + Status[0] + "" + stat + ")";
		} else {
			stat = "";
		}

		try {

			Connection conn;
			conn = makeConnection();
			PreparedStatement pstmt;
			if (emp == null && ename == null && sdate == null && edate == null
					&& Kind == null && Status == null) {
				pstmt = conn
						.prepareStatement("select to_char(main.applytime, 'yyyy-mm-dd'),main.eid,emp.name,main.pid,kind.kname,to_char(sub.startdatetime, 'yyyy-mm-dd HH:mm'),to_char(sub.enddatetime, 'yyyy-mm-dd HH:mm'),status.sname from employee emp,pse_main main , pse_sub sub, pse_kind kind,pse_status status where emp.eid=main.eid and main.pid=sub.pid and sub.kid=kind.kid and main.status=status.status and emp.dep_id=? order by main.applytime desc");
				pstmt.setInt(1, dd);

			} else {
				pstmt = conn
						.prepareStatement("select to_char(main.applytime, 'yyyy-mm-dd'),main.eid,emp.name,main.pid,kind.kname,to_char(sub.startdatetime, 'yyyy-mm-dd HH:mm'),to_char(sub.enddatetime, 'yyyy-mm-dd HH:mm'),status.sname from employee emp,pse_main main , pse_sub sub, pse_kind kind,pse_status status where emp.eid=main.eid and main.pid=sub.pid and sub.kid=kind.kid and main.status=status.status and (main.eid = ? or ? is null) and (emp.name like ? or ? is null) and (sub.startdatetime  BETWEEN  to_date(?,'yyyy-mm-dd') and to_date(?,'yyyy-mm-dd')) "
								+ type
								+ " "
								+ stat
								+ " and emp.dep_id=? order by main.applytime desc");

				pstmt.setString(1, emp);
				pstmt.setString(2, emp);

				pstmt.setString(3, "%" + ename + "%");
				pstmt.setString(4, ename);

				pstmt.setString(5, sdate);
				pstmt.setString(6, edate);
				pstmt.setInt(7, dd);


			}
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {

				applytime = rs.getString(1);
				eid = rs.getString(2);
				name = rs.getString(3);
				pid = rs.getInt(4);
				kname = rs.getString(5);
				starttime = rs.getString(6);
				endtime = rs.getString(7);
				sname = rs.getString(8);

				SearchPSE dl = new SearchPSE(applytime, eid, name, pid, kname,
						starttime, endtime, sname);
				sh.add(i, dl);
				i++;
			}
			rs.close();
			pstmt.close();
			conn.close();

		} catch (Exception e) {
			throw e;
		}
		return sh;
	}

	
	public List<SearchPSE> SearchPSE2(String emp, String ename,String[] Kind, String[] Status,String dep) throws Exception {

		ArrayList<SearchPSE> sh = new ArrayList<SearchPSE>();
		int i = 0;
		String applytime = null;
		String eid = null;
		String name = null;
		int pid = 0;
		String kname = null;
		String starttime = null;
		String endtime = null;
		String sname = null;
		String type = "";
		String stat = " ";

		if (Kind != null) {
			for (int j = 1; j < Kind.length; j++) {
				if (Kind.length < 1) {
					type = "sub.kid=" + Kind[0];

				} else {
					type = type + " or sub.kid=" + Kind[j];

				}
			}
			type = "and (sub.kid=" + Kind[0] + "" + type + ")";
		} else {
			type = "";
		}

		if (Status != null) {
			for (int j = 1; j < Status.length; j++) {
				if (Status.length < 1) {
					stat = "main.status=" + Status[0];

				} else {
					stat = stat + " or main.status=" + Status[j];

				}
			}
			stat = "and ( main.status=" + Status[0] + "" + stat + ")";
		} else {
			stat = "";
		}

		try {

			Connection conn;
			conn = makeConnection();
			PreparedStatement pstmt;
			if (emp == null && ename == null && Kind == null && Status == null) {
				pstmt = conn
						.prepareStatement("select to_char(main.applytime, 'yyyy-mm-dd'),main.eid,emp.name,main.pid,kind.kname,to_char(sub.startdatetime, 'yyyy-mm-dd HH:mm'),to_char(sub.enddatetime, 'yyyy-mm-dd HH:mm'),status.sname from employee emp,pse_main main , pse_sub sub, pse_kind kind,pse_status status where emp.eid=main.eid and main.pid=sub.pid and sub.kid=kind.kid and main.status=status.status  order by main.applytime desc");

			} else {
				pstmt = conn
						.prepareStatement("select to_char(main.applytime, 'yyyy-mm-dd'),main.eid,emp.name,main.pid,kind.kname,to_char(sub.startdatetime, 'yyyy-mm-dd HH:mm'),to_char(sub.enddatetime, 'yyyy-mm-dd HH:mm'),status.sname from employee emp,pse_main main , pse_sub sub, pse_kind kind,pse_status status where emp.eid=main.eid and main.pid=sub.pid and sub.kid=kind.kid and main.status=status.status and (main.eid = ? or ? is null) and (emp.name like ? or ? is null)"
								+ type
								+ " "
								+ stat
								+ "  order by main.applytime desc");

				pstmt.setString(1, emp);
				pstmt.setString(2, emp);

				pstmt.setString(3, "%" + ename + "%");
				pstmt.setString(4, ename);


			}
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {

				applytime = rs.getString(1);
				eid = rs.getString(2);
				name = rs.getString(3);
				pid = rs.getInt(4);
				kname = rs.getString(5);
				starttime = rs.getString(6);
				endtime = rs.getString(7);
				sname = rs.getString(8);

				SearchPSE dl = new SearchPSE(applytime, eid, name, pid, kname,
						starttime, endtime, sname);
				sh.add(i, dl);
				i++;
			}
			rs.close();
			pstmt.close();
			conn.close();

		} catch (Exception e) {
			throw e;
		}
		return sh;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 員工查詢
	public List<SearchPSE> SearchPSE_E(String emp, String sdate, String edate,String[] Kind, String[] Status,String dep) throws Exception {

		ArrayList<SearchPSE> sh = new ArrayList<SearchPSE>();
		int i = 0;
		String applytime = null;
		String eid = null;
		String name = null;
		int pid = 0;
		String kname = null;
		String starttime = null;
		String endtime = null;
		String sname = null;
		String type = "";
		String stat = " ";

		if (Kind != null) {
			for (int j = 1; j < Kind.length; j++) {
				if (Kind.length < 1) {
					type = "sub.kid=" + Kind[0];

				} else {
					type = type + " or sub.kid=" + Kind[j];

				}
			}
			type = "and (sub.kid=" + Kind[0] + "" + type + ")";
		} else {
			type = "";
		}

		if (Status != null) {
			for (int j = 1; j < Status.length; j++) {
				if (Status.length < 1) {
					stat = "main.status=" + Status[0];

				} else {
					stat = stat + " or main.status=" + Status[j];

				}
			}
			stat = "and ( main.status=" + Status[0] + "" + stat + ")";
		} else {
			stat = "";
		}

		try {

			Connection conn;
			conn = makeConnection();
			PreparedStatement pstmt;
			if (sdate == null && edate == null && Kind == null
					&& Status == null) {
				pstmt = conn
						.prepareStatement("select to_char(main.applytime, 'yyyy-mm-dd'),main.eid,emp.name,main.pid,kind.kname,to_char(sub.startdatetime, 'yyyy-mm-dd HH:mm'),to_char(sub.enddatetime, 'yyyy-mm-dd HH:mm'),status.sname from employee emp,pse_main main , pse_sub sub, pse_kind kind,pse_status status where emp.eid=main.eid and main.pid=sub.pid and sub.kid=kind.kid and main.status=status.status  and main.eid=?   order by main.applytime desc");
				pstmt.setString(1, emp);


			} else {
				pstmt = conn
						.prepareStatement("select to_char(main.applytime, 'yyyy-mm-dd'),main.eid,emp.name,main.pid,kind.kname,to_char(sub.startdatetime, 'yyyy-mm-dd HH:mm'),to_char(sub.enddatetime, 'yyyy-mm-dd HH:mm'),status.sname from employee emp,pse_main main , pse_sub sub, pse_kind kind,pse_status status where emp.eid=main.eid and main.pid=sub.pid and sub.kid=kind.kid and main.status=status.status and main.eid = ? and (sub.startdatetime  BETWEEN  to_date(?,'yyyy-mm-dd') and to_date(?,'yyyy-mm-dd')) "
								+ type
								+ " "
								+ stat
								+ " order by main.applytime desc");

				pstmt.setString(1, emp);
				pstmt.setString(2, sdate);
				pstmt.setString(3, edate);

			}

			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {

				applytime = rs.getString(1);
				eid = rs.getString(2);
				name = rs.getString(3);
				pid = rs.getInt(4);
				kname = rs.getString(5);
				starttime = rs.getString(6);
				endtime = rs.getString(7);
				sname = rs.getString(8);

				SearchPSE dl = new SearchPSE(applytime, eid, name, pid, kname,
						starttime, endtime, sname);
				sh.add(i, dl);
				i++;
			}
			rs.close();
			pstmt.close();
			conn.close();

		} catch (Exception e) {
			throw e;
		}
		return sh;
	}

	// Excel
	public enum FileStatus {
		Success("檔案寫入成功!"), //
		Fail("檔案寫入失敗!");

		final String msg;

		String filePath = "";

		private FileStatus(final String msg) {
			this.msg = msg;
		}

		public String getMsg() {
			return msg;
		}

		public FileStatus path(final String filePath) {
			this.filePath = filePath;
			return this;
		}

		public String getFilePath() {
			return filePath;
		}
	}

	public String Array2Csv(List<SearchPSE> list) {

		// 01.檔案名稱
	//	final String disk = "C:\\workspace\\DemoIO-0527 V9.0\\WebContent\\WEB-INF\\export\\";
		final String disk = "C:\\";
		final String fileName = "PSE";

		// 02.資料來源
		final List<String[]> source = new ArrayList<String[]>();

		for (int i = 0; i < list.size(); i++) {

			source.add(new String[] { list.get(i).getapplytime(),
					list.get(i).geteid(), list.get(i).getname(),
					String.valueOf(list.get(i).getpid()),
					list.get(i).getkname(), list.get(i).getstarttime(),
					list.get(i).getendtime(), list.get(i).getsname() });

		}

		// 02.a 檔案名稱(加上隨機ID結尾以避免檔案重複)
		String file = fileName + ".csv";
		//String file = fileName + UUID.randomUUID() + ".csv";

		final String filePath = disk + file;

		// 03.輸出CSV檔案
		final FileStatus status = this.outputCsv(source, filePath);
		System.out.println(status.getMsg());
		System.out.println(status.getFilePath());
		// 04.執行結果 及 檔案位置
		return file;
	}

	public String ArrayCsv(List<SearchPSE> list) {

		// 01.檔案名稱
	//	final String disk = "C:\\workspace\\DemoIO-0527 V9.0\\WebContent\\WEB-INF\\export\\";
		final String disk = "C:\\";
		final String fileName = "PSE";

		// 02.資料來源
		final List<String[]> source = new ArrayList<String[]>();

		for (int i = 0; i < list.size(); i++) {

			source.add(new String[] { list.get(i).getapplytime(),
					list.get(i).geteid(),String.valueOf(list.get(i).getpid()),
					list.get(i).getkname(), list.get(i).getstarttime(),
					list.get(i).getendtime(), list.get(i).getsname() });

		}

		// 02.a 檔案名稱(加上隨機ID結尾以避免檔案重複)
		String file = fileName + ".csv";
		//String file = fileName + UUID.randomUUID() + ".csv";

		final String filePath = disk + file;

		// 03.輸出CSV檔案
		final FileStatus status = this.outputCsv(source, filePath);
		System.out.println(status.getMsg());
		System.out.println(status.getFilePath());
		// 04.執行結果 及 檔案位置
		return file;
	}


	private FileStatus outputCsv(final List<String[]> source,
			final String filePath) {
		try {
			CSVWriter writer = new CSVWriter(new FileWriter(filePath));
			writer.writeAll(source);
			writer.close();
		} catch (IOException e) {
			System.out.println(e);
			return FileStatus.Fail.path(filePath);
		}
		return FileStatus.Success.path(filePath);
	}

}
*/


package Db;

import Bean.Hours;
import Bean.SearchPSE;
import Bean.SearchPSE2;

import com.oracle.*;
import java.sql.*;
import java.util.*;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
//excel
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
//
import au.com.bytecode.opencsv.CSVWriter;

public class JDBCPSEsearch extends JDBCCore {

	public List<Hours> getYear() {

		ArrayList<Hours> dy = new ArrayList<Hours>();
		int i = 0;
		String sYear = null;

		try {
			Connection conn;
			conn = makeConnection();
			PreparedStatement pstmt = conn
					.prepareStatement("select Year from Hours group by year order by Year desc");

			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {

				sYear = rs.getString(1);

				Hours dl = new Hours(sYear);
				dy.add(i, dl);
				i++;
			}
			rs.close();
			pstmt.close();
			conn.close();

		} catch (Exception e) {
		}
		return dy;
	}

	// 主管查詢
	public List<SearchPSE> SearchPSE(String emp, String ename, String sdate,
			String edate, String[] Kind, String[] Status,String dep) throws Exception {
int dd=Integer.parseInt(dep);
		ArrayList<SearchPSE> sh = new ArrayList<SearchPSE>();
		int i = 0;
		String applytime = null;
		String eid = null;
		String name = null;
		int pid = 0;
		String kname = null;
		String starttime = null;
		String endtime = null;
		String sname = null;
		String type = "";
		String stat = " ";

		if (Kind != null) {
			for (int j = 1; j < Kind.length; j++) {
				if (Kind.length < 1) {
					type = "sub.kid=" + Kind[0];

				} else {
					type = type + " or sub.kid=" + Kind[j];

				}
			}
			type = "and (sub.kid=" + Kind[0] + "" + type + ")";
		} else {
			type = "";
		}

		if (Status != null) {
			for (int j = 1; j < Status.length; j++) {
				if (Status.length < 1) {
					stat = "main.status=" + Status[0];

				} else {
					stat = stat + " or main.status=" + Status[j];

				}
			}
			stat = "and ( main.status=" + Status[0] + "" + stat + ")";
		} else {
			stat = "";
		}

		try {

			Connection conn;
			conn = makeConnection();
			PreparedStatement pstmt;
			if (emp == null && ename == null && sdate == null && edate == null
					&& Kind == null && Status == null) {
				pstmt = conn
						.prepareStatement("select to_char(main.applytime, 'yyyy-mm-dd'),main.eid,emp.name,main.pid,kind.kname,to_char(sub.startdatetime, 'yyyy-mm-dd HH:mi'),to_char(sub.enddatetime, 'yyyy-mm-dd HH:mi'),status.sname from employee emp,pse_main main , pse_sub sub, pse_kind kind,pse_status status where emp.eid=main.eid and main.pid=sub.pid and sub.kid=kind.kid and main.status=status.status and (emp.dep_id=? or ? is NULL) and main.status!=4 order by main.applytime desc");
				pstmt.setInt(1, dd);
				pstmt.setInt(2, dd);


			} else {
				pstmt = conn
						.prepareStatement("select to_char(main.applytime, 'yyyy-mm-dd'),main.eid,emp.name,main.pid,kind.kname,to_char(sub.startdatetime, 'yyyy-mm-dd HH:mi'),to_char(sub.enddatetime, 'yyyy-mm-dd HH:mi'),status.sname from employee emp,pse_main main , pse_sub sub, pse_kind kind,pse_status status where emp.eid=main.eid and main.pid=sub.pid and sub.kid=kind.kid and main.status=status.status and (main.eid = ? or ? is null) and (emp.name like ? or ? is null) and (sub.startdatetime  BETWEEN  to_date(?,'yyyy-mm-dd') and to_date(?,'yyyy-mm-dd')) "
								+ type
								+ " "
								+ stat
								+ " and (emp.dep_id=? or ? is NULL) order by main.applytime desc");

				pstmt.setString(1, emp);
				pstmt.setString(2, emp);

				pstmt.setString(3, "%" + ename + "%");
				pstmt.setString(4, ename);

				pstmt.setString(5, sdate);
				pstmt.setString(6, edate);
				pstmt.setInt(7, dd);
				pstmt.setInt(8, dd);


			}
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {

				applytime = rs.getString(1);
				eid = rs.getString(2);
				name = rs.getString(3);
				pid = rs.getInt(4);
				kname = rs.getString(5);
				starttime = rs.getString(6);
				endtime = rs.getString(7);
				sname = rs.getString(8);

				SearchPSE dl = new SearchPSE(applytime, eid, name, pid, kname,
						starttime, endtime, sname);
				sh.add(i, dl);
				i++;
			}
			rs.close();
			pstmt.close();
			conn.close();

		} catch (Exception e) {
			throw e;
		}
		return sh;
	}

	
	public List<SearchPSE> SearchPSE2(String emp, String ename,String[] Kind, String[] Status,String dep) throws Exception {

		ArrayList<SearchPSE> sh = new ArrayList<SearchPSE>();
		int i = 0;
		String applytime = null;
		String eid = null;
		String name = null;
		int pid = 0;
		String kname = null;
		String starttime = null;
		String endtime = null;
		String sname = null;
		String type = "";
		String stat = " ";

		if (Kind != null) {
			for (int j = 1; j < Kind.length; j++) {
				if (Kind.length < 1) {
					type = "sub.kid=" + Kind[0];

				} else {
					type = type + " or sub.kid=" + Kind[j];

				}
			}
			type = "and (sub.kid=" + Kind[0] + "" + type + ")";
		} else {
			type = "";
		}

		if (Status != null) {
			for (int j = 1; j < Status.length; j++) {
				if (Status.length < 1) {
					stat = "main.status=" + Status[0];

				} else {
					stat = stat + " or main.status=" + Status[j];

				}
			}
			stat = "and ( main.status=" + Status[0] + "" + stat + ")";
		} else {
			stat = "";
		}

		try {

			Connection conn;
			conn = makeConnection();
			PreparedStatement pstmt;
			if (emp == null && ename == null && Kind == null && Status == null) {
				pstmt = conn
						.prepareStatement("select to_char(main.applytime, 'yyyy-mm-dd'),main.eid,emp.name,main.pid,kind.kname,to_char(sub.startdatetime, 'yyyy-mm-dd HH:mi'),to_char(sub.enddatetime, 'yyyy-mm-dd HH:mi'),status.sname from employee emp,pse_main main , pse_sub sub, pse_kind kind,pse_status status where emp.eid=main.eid and main.pid=sub.pid and sub.kid=kind.kid and main.status=status.status  order by main.applytime desc");

			} else {
				pstmt = conn
						.prepareStatement("select to_char(main.applytime, 'yyyy-mm-dd'),main.eid,emp.name,main.pid,kind.kname,to_char(sub.startdatetime, 'yyyy-mm-dd HH:mi'),to_char(sub.enddatetime, 'yyyy-mm-dd HH:mi'),status.sname from employee emp,pse_main main , pse_sub sub, pse_kind kind,pse_status status where emp.eid=main.eid and main.pid=sub.pid and sub.kid=kind.kid and main.status=status.status and (main.eid = ? or ? is null) and (emp.name like ? or ? is null)"
								+ type
								+ " "
								+ stat
								+ "  order by main.applytime desc");

				pstmt.setString(1, emp);
				pstmt.setString(2, emp);

				pstmt.setString(3, "%" + ename + "%");
				pstmt.setString(4, ename);


			}
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {

				applytime = rs.getString(1);
				eid = rs.getString(2);
				name = rs.getString(3);
				pid = rs.getInt(4);
				kname = rs.getString(5);
				starttime = rs.getString(6);
				endtime = rs.getString(7);
				sname = rs.getString(8);

				SearchPSE dl = new SearchPSE(applytime, eid, name, pid, kname,
						starttime, endtime, sname);
				sh.add(i, dl);
				i++;
			}
			rs.close();
			pstmt.close();
			conn.close();

		} catch (Exception e) {
			throw e;
		}
		return sh;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 員工查詢
	public List<SearchPSE> SearchPSE_E(String emp, String sdate, String edate,String[] Kind, String[] Status,String dep) throws Exception {

		ArrayList<SearchPSE> sh = new ArrayList<SearchPSE>();
		int i = 0;
		String applytime = null;
		String eid = null;
		String name = null;
		int pid = 0;
		String kname = null;
		String starttime = null;
		String endtime = null;
		String sname = null;
		String type = "";
		String stat = " ";

		if (Kind != null) {
			for (int j = 1; j < Kind.length; j++) {
				if (Kind.length < 1) {
					type = "sub.kid=" + Kind[0];

				} else {
					type = type + " or sub.kid=" + Kind[j];

				}
			}
			type = "and (sub.kid=" + Kind[0] + "" + type + ")";
		} else {
			type = "";
		}

		if (Status != null) {
			for (int j = 1; j < Status.length; j++) {
				if (Status.length < 1) {
					stat = "main.status=" + Status[0];

				} else {
					stat = stat + " or main.status=" + Status[j];

				}
			}
			stat = "and ( main.status=" + Status[0] + "" + stat + ")";
		} else {
			stat = "";
		}

		try {

			Connection conn;
			conn = makeConnection();
			PreparedStatement pstmt;
			if (sdate == null && edate == null && Kind == null
					&& Status == null) {
				pstmt = conn
						.prepareStatement("select to_char(main.applytime, 'yyyy-mm-dd'),main.eid,emp.name,main.pid,kind.kname,to_char(sub.startdatetime, 'yyyy-mm-dd HH:mi'),to_char(sub.enddatetime, 'yyyy-mm-dd HH:mi'),status.sname from employee emp,pse_main main , pse_sub sub, pse_kind kind,pse_status status where emp.eid=main.eid and main.pid=sub.pid and sub.kid=kind.kid and main.status=status.status  and main.eid=? and main.status!=4  order by main.applytime desc");
				pstmt.setString(1, emp);


			} else {
				pstmt = conn
						.prepareStatement("select to_char(main.applytime, 'yyyy-mm-dd'),main.eid,emp.name,main.pid,kind.kname,to_char(sub.startdatetime, 'yyyy-mm-dd HH:mi'),to_char(sub.enddatetime, 'yyyy-mm-dd HH:mi'),status.sname from employee emp,pse_main main , pse_sub sub, pse_kind kind,pse_status status where emp.eid=main.eid and main.pid=sub.pid and sub.kid=kind.kid and main.status=status.status and main.eid = ? and (sub.startdatetime  BETWEEN  to_date(?,'yyyy-mm-dd') and to_date(?,'yyyy-mm-dd')) "
								+ type
								+ " "
								+ stat
								+ " order by main.applytime desc");

				pstmt.setString(1, emp);
				pstmt.setString(2, sdate);
				pstmt.setString(3, edate);

			}

			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {

				applytime = rs.getString(1);
				eid = rs.getString(2);
				name = rs.getString(3);
				pid = rs.getInt(4);
				kname = rs.getString(5);
				starttime = rs.getString(6);
				endtime = rs.getString(7);
				sname = rs.getString(8);

				SearchPSE dl = new SearchPSE(applytime, eid, name, pid, kname,
						starttime, endtime, sname);
				sh.add(i, dl);
				i++;
			}
			rs.close();
			pstmt.close();
			conn.close();

		} catch (Exception e) {
			throw e;
		}
		return sh;
	}

	// Excel
	public enum FileStatus {
		Success("檔案寫入成功!"), //
		Fail("檔案寫入失敗!");

		final String msg;

		String filePath = "";

		private FileStatus(final String msg) {
			this.msg = msg;
		}

		public String getMsg() {
			return msg;
		}

		public FileStatus path(final String filePath) {
			this.filePath = filePath;
			return this;
		}

		public String getFilePath() {
			return filePath;
		}
	}

	public String Array2Csv(List<SearchPSE> list) {

		// 01.檔案名稱
	//	final String disk = "C:\\workspace\\DemoIO-0527 V9.0\\WebContent\\WEB-INF\\export\\";
		final String disk = "C:\\";
		final String fileName = "PSE";

		// 02.資料來源
		final List<String[]> source = new ArrayList<String[]>();

		for (int i = 0; i < list.size(); i++) {

			source.add(new String[] { list.get(i).getapplytime(),
					list.get(i).geteid(), list.get(i).getname(),
					String.valueOf(list.get(i).getpid()),
					list.get(i).getkname(), list.get(i).getstarttime(),
					list.get(i).getendtime(), list.get(i).getsname() });

		}

		// 02.a 檔案名稱(加上隨機ID結尾以避免檔案重複)
		String file = fileName + ".csv";
		//String file = fileName + UUID.randomUUID() + ".csv";

		final String filePath = disk + file;

		// 03.輸出CSV檔案
		final FileStatus status = this.outputCsv(source, filePath);
		System.out.println(status.getMsg());
		System.out.println(status.getFilePath());
		// 04.執行結果 及 檔案位置
		return file;
	}

	public String ArrayCsv(List<SearchPSE> list) {

		// 01.檔案名稱
	//	final String disk = "C:\\workspace\\DemoIO-0527 V9.0\\WebContent\\WEB-INF\\export\\";
		final String disk = "C:\\";
		final String fileName = "PSE";

		// 02.資料來源
		final List<String[]> source = new ArrayList<String[]>();

		for (int i = 0; i < list.size(); i++) {

			source.add(new String[] { list.get(i).getapplytime(),
					list.get(i).geteid(),String.valueOf(list.get(i).getpid()),
					list.get(i).getkname(), list.get(i).getstarttime(),
					list.get(i).getendtime(), list.get(i).getsname() });

		}

		// 02.a 檔案名稱(加上隨機ID結尾以避免檔案重複)
		String file = fileName + ".csv";
		//String file = fileName + UUID.randomUUID() + ".csv";

		final String filePath = disk + file;

		// 03.輸出CSV檔案
		final FileStatus status = this.outputCsv(source, filePath);
		System.out.println(status.getMsg());
		System.out.println(status.getFilePath());
		// 04.執行結果 及 檔案位置
		return file;
	}


	private FileStatus outputCsv(final List<String[]> source,
			final String filePath) {
		try {
			CSVWriter writer = new CSVWriter(new FileWriter(filePath));
			writer.writeAll(source);
			writer.close();
		} catch (IOException e) {
			System.out.println(e);
			return FileStatus.Fail.path(filePath);
		}
		return FileStatus.Success.path(filePath);
	}
	
	
	//匯出excel
	public String exportpse(List<SearchPSE> list){
		String file = "PSE.xls";//檔名
		 try{
		HSSFWorkbook workbook = new HSSFWorkbook();//建立一個Excel活頁簿
		HSSFSheet sheet = workbook.createSheet("TEST"); //在活頁簿中建立一個Sheet
		
		         
		
		//印出表頭
		 Row headRow = sheet.createRow(0);
         String[] head = { "申請日期", "員工編號", "員工姓名", "假單編號", "假單種類", "開始時間","結束時間","假單狀態"};
         for( int i = 0 ; i < head.length ; i++ ){
             Cell cell = headRow.createCell(i);
             cell.setCellValue(head[i]);

         }
         //印出資料
         int i=1;
         for(SearchPSE pse :list){
         Row dataRow = sheet.createRow(i);
         
        	 Cell cell0 = dataRow.createCell(0);
             cell0.setCellValue(pse.getapplytime());
             Cell cell1 = dataRow.createCell(1);
             cell1.setCellValue(pse.geteid());
             Cell cell2 = dataRow.createCell(2);
             cell2.setCellValue(pse.getname());
             Cell cell3 = dataRow.createCell(3);
             cell3.setCellValue(pse.getpid());
             Cell cell4 = dataRow.createCell(4);
             cell4.setCellValue(pse.getkname());
             Cell cell5 = dataRow.createCell(5);
             cell5.setCellValue(pse.getstarttime());
             Cell cell6 = dataRow.createCell(6);
             cell6.setCellValue(pse.getendtime());
             Cell cell7 = dataRow.createCell(7);
             cell7.setCellValue(pse.getsname());
            
         i++;
         }
         //排版
         sheet.autoSizeColumn((short)0);
         sheet.autoSizeColumn((short)1);
         sheet.autoSizeColumn((short)2);
         sheet.autoSizeColumn((short)3);
         sheet.autoSizeColumn((short)4);
         sheet.autoSizeColumn((short)5);
         sheet.autoSizeColumn((short)6);
         sheet.autoSizeColumn((short)7);
		//暫存位子
		FileOutputStream fOut = new FileOutputStream("c://PSE.xls");
		workbook.write(fOut);
		fOut.close();}catch(Exception e){}
		
		return file;
		
	}

}
