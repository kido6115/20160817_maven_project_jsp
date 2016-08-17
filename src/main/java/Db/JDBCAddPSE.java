package Db;







import Bean.Holiday;

import Bean.SearchHour_m;



import com.oracle.*;





import java.sql.*;

import java.util.*;

//下面是excel要用的

import org.apache.poi.hssf.usermodel.HSSFCell;

import org.apache.poi.hssf.usermodel.HSSFRow;

import org.apache.poi.hssf.usermodel.HSSFSheet;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import org.apache.poi.poifs.filesystem.POIFSFileSystem;

import java.io.File;

import java.io.FileInputStream;

//



public class JDBCAddPSE extends JDBCCore {



	public int nPSE(String Eid, String ad) {

		

		int Pid=1;

		try {



			

			Connection conn;

			conn = makeConnection();

			PreparedStatement st = conn

					.prepareStatement("SELECT MAX(Pid) FROM PSE_MAIN");

			

			

			ResultSet rs = st.executeQuery();

			while (rs.next()) {

				Pid=rs.getInt("MAX(Pid)");

						

			}

			

			

			Pid=Pid+1;

			st.close();

			

			PreparedStatement st2 = conn

					.prepareStatement("insert into PSE.PSE_MAIN values(?,?,3,to_date(?,'YYYY/MM/DD HH24/MI'),null)");

			st2.setInt(1, Pid);

			st2.setString(2, Eid);

			st2.setString(3, ad);

			st2.executeUpdate();



			st2.close();

			

			conn.close();



		} catch (Exception e) {

		Pid=0;

		}

		return Pid;

	}

	

	public int nSubPSE(int Pid,int Pcid, String pk,String ds, String de,

			String ts, String te, String total, String ps) {

		int r = 0;

		

		try {



			

			Connection conn;

			conn = makeConnection();

			PreparedStatement st = conn

					.prepareStatement("insert into PSE.PSE_SUB values(?,?,to_date(?,'YYYY-MM-DDHH24:MI'),to_date(?,'YYYY-MM-DDHH24:MI'),?,?,?)");

			//pid/pcid/st/et/pctotal/kid/ps

			st.setInt(1, Pid);

			st.setInt(2, Pcid);

			

			st.setString(3, ds+ts);

			

			st.setString(4, de+te);

			

			st.setDouble(5, Double.parseDouble(total));

			st.setInt(6, Integer.parseInt(pk));

			st.setString(7, ps);

			

			st.executeUpdate();



			st.close();

			

			//rs.close();

			st.close();

			conn.close();



		} catch (Exception e) {

		r=5;

		}

		return r;

	}

	

	

public List<Holiday> getHolidays(){

		

		ArrayList<Holiday> holiday = new ArrayList<Holiday>();

		try {



			Connection conn;

			conn = makeConnection();

			PreparedStatement pstmt = conn

					.prepareStatement("select to_char(H_Date,'yyyy-mm-dd'),H_NAME from holiday ");

			

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {

				int i = 0;

				String H_date = rs.getString(1);

				String H_name = rs.getString(2);

				



				Holiday dl = new Holiday(H_date, H_name);

				holiday.add(i, dl);

				i++;

			}

			rs.close();

			pstmt.close();

			conn.close();



		} catch (Exception e) {

		}

		return holiday;

	}



public int checkpse(int j, String sdate, String stime, String edate,String etime) {

	int count = 0;

	try {

		Connection conn;

		conn = makeConnection();

		PreparedStatement pstmt = conn

				.prepareStatement("select count(A.PID) from pse_sub a,pse_main b where a.pid=b.pid and b.status=? and( a.startdatetime between to_date(?,'yyyy-mm-dd hh24:mi') and to_date(?,'yyyy-mm-dd hh24:mi') or a.enddatetime between  to_date(?,'yyyy-mm-dd hh24:mi') and to_date(?,'yyyy-mm-ddhh24:mi'))");

		pstmt.setInt(1, j);

		pstmt.setString(2, sdate + " " +stime);

		pstmt.setString(3, edate + " "+ etime);

		pstmt.setString(4, sdate + " "+ stime);

		pstmt.setString(5, edate + " "+ etime);

		ResultSet rs = pstmt.executeQuery();



		if (rs.next()) {

			count=rs.getInt(1);

			

		} else {

			count = 99999;

		}

		pstmt.close();

		conn.close();



	} catch (Exception e) {

		count = 5; // 發生錯誤

		return count;



	}



	return count;

}

		

//解析上傳的excel	

public int  readExcel(int pid)  { 
int status=0;
    FileInputStream fis ; 

    POIFSFileSystem fs ; 

    HSSFWorkbook wb ; 

String filePath = "c://workspace//DemoIO V40//WebContent//WEB-INF//temp.xls" ;//讀取檔案路徑







    try 

    { 

    	



      

      fis = new FileInputStream(filePath); 

        fs = new POIFSFileSystem( fis );

        

        wb = new HSSFWorkbook(fs);

      HSSFSheet sheet = wb.getSheetAt(0);  

//取得Excel第一個sheet(從0開始) 

      HSSFCell cell; 

    

      //getPhysicalNumberOfRows這個比較好        

      for (int i = 1; i < sheet.getPhysicalNumberOfRows() ; i++) {  

    	  String[] sub = {"","","","","",""," "};

//由於第 0 Row 為 title, 故 i 從 1 開始 

          HSSFRow row = sheet.getRow(i); // 取得第 i Row 

          if(row!=null){ 

            int j = 0; 

          for (; j < 7; j++){  //看資料需要的欄數 

              if(row.getCell(j)!=null){

              cell = row.getCell(j); 

              sub[j]=cell.toString();

              //取出i列j行的值

              }else{

            	  continue;

              }

             

          } 

          if(sub[5].equals("事假")){sub[5]="1";}

          if(sub[5].equals("病假")){sub[5]="2";}

          if(sub[5].equals("喪假")){sub[5]="3";}

          if(sub[5].equals("產假")){sub[5]="4";}

          if(sub[5].equals("特休")){sub[5]="5";}

          nSubPSE(pid, i, sub[5], sub[0], sub[2],sub[1],  sub[3], sub[4],sub[6]);//pid,pcid,startdate,enddate,starttime,endtime,pctotal,ps

          

          } 

         

      } 



         fis.close();

    }catch(Exception e) 

    { 

      e.printStackTrace(); 
status=99;
    } 

return status;

}

//匯入後刪除

public void delete(){

	try{

		File file = new File("c://workspace//DemoIO V40//WebContent//WEB-INF//temp.xls");

		file.delete();

		}catch(Exception e){



		e.printStackTrace();



		}

}



}

