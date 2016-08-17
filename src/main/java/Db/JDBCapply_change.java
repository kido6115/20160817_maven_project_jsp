package Db;

import java.io.FileWriter;
import java.io.IOException;
import java.sql.*;
import java.util.*;

import javax.servlet.http.HttpSession;

import Bean.SearchHour_e;
import Bean.SearchHour_m;
import Bean.SearchPSE;
import Db.JDBCPSEsearch.FileStatus;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import au.com.bytecode.opencsv.CSVWriter;

public class JDBCapply_change extends JDBCCore {

	public List<SearchHour_m> SearchHour_m(String year, String eid, String name){
		
		ArrayList<SearchHour_m> sh = new ArrayList<SearchHour_m>();
		try {

			Connection conn;
			conn = makeConnection();
			PreparedStatement pstmt = conn
					.prepareStatement("SELECT A.EID,  C.NAME,  A.YEAR,  B.KNAME,  A.CREDIT FROM HOURS A,  PSE_KIND B,  EMPLOYEE C WHERE A.EID  = C.EID AND B.KID  = A.KID AND (A.YEAR = ? OR ? IS NULL) AND (A.EID  = ? OR ? IS NULL) AND (C.NAME like ?  OR ? IS NULL) order by A.EID desc");
			pstmt.setString(1, year);
			pstmt.setString(2, year);
			pstmt.setString(3, eid);
			pstmt.setString(4, eid);
			pstmt.setString(5, "%"+name+"%");
			pstmt.setString(6, name);
			
			/*pstmt.setString(1, year);
			pstmt.setString(2, year);
			pstmt.setString(3, eid);
			pstmt.setString(4, eid);
			pstmt.setString(5, name);*/
			
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				int i = 0;
				String seid = rs.getString(1);
				String sname = rs.getString(2);
				String syear = rs.getString(3);
				String skname = rs.getString(4);
				String scredit = rs.getString(5);

				SearchHour_m dl = new SearchHour_m(seid, sname, syear, skname,
						scredit);
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

public List<SearchHour_e> SearchHour_e(String Year, String eid){
		
		ArrayList<SearchHour_e> sh = new ArrayList<SearchHour_e>();
		try {

			Connection conn;
			conn = makeConnection();
			PreparedStatement pstmt = conn
					.prepareStatement("SELECT A.EID,  C.NAME,  A.YEAR,  B.KNAME,  A.CREDIT FROM HOURS A,  PSE_KIND B,  EMPLOYEE C WHERE A.EID  = C.EID AND B.KID  = A.KID AND (A.YEAR = ? OR ? IS NULL) AND (A.EID  = ?) order by A.EID desc");
			pstmt.setString(1, Year);
			pstmt.setString(2, Year);
			pstmt.setString(3, eid);
			
			
			
			/*pstmt.setString(1, year);
			pstmt.setString(2, year);
			pstmt.setString(3, eid);
			pstmt.setString(4, eid);
			pstmt.setString(5, name);*/
			
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				int i = 0;
				String seid = rs.getString(1);
				String sname = rs.getString(2);
				String syear = rs.getString(3);
				String skname = rs.getString(4);
				String scredit = rs.getString(5);

				SearchHour_e dl = new SearchHour_e(seid, sname, syear, skname,
						scredit);
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

public String Array2Csv(List<SearchHour_m> list) {

	// 01.檔案名稱
//	final String disk = "C:\\workspace\\DemoIO-0527 V9.0\\WebContent\\WEB-INF\\export\\";
	final String disk = "C:\\";
	final String fileName = "PSE";

	// 02.資料來源
	final List<String[]> source = new ArrayList<String[]>();

	for (int i = 0; i < list.size(); i++) {

		source.add(new String[] { list.get(i).getYear(),list.get(i).getName(),
				list.get(i).getEid(), list.get(i).getKname(),
				list.get(i).getCredit()});

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

public String ArrayCsv(List<SearchHour_e> list) {

	// 01.檔案名稱
//	final String disk = "C:\\workspace\\DemoIO-0527 V9.0\\WebContent\\WEB-INF\\export\\";
	final String disk = "C:\\";
	final String fileName = "PSE";

	// 02.資料來源
	final List<String[]> source = new ArrayList<String[]>();

	for (int i = 0; i < list.size(); i++) {

		source.add(new String[] { list.get(i).getYear(),list.get(i).getName(),
				list.get(i).getEid(), list.get(i).getKname(),
				list.get(i).getCredit()});

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
