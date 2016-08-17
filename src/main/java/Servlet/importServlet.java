package Servlet;

import java.io.File;  
import java.io.IOException;  
import java.util.Iterator;  
import java.util.List;  
 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import javax.servlet.http.HttpSession;
 
import org.apache.commons.fileupload.FileItem;  
import org.apache.commons.fileupload.disk.DiskFileItemFactory;  
import org.apache.commons.fileupload.servlet.ServletFileUpload;  

import org.apache.poi.hssf.usermodel.HSSFCell; 
import org.apache.poi.hssf.usermodel.HSSFRow; 
import org.apache.poi.hssf.usermodel.HSSFSheet; 
import org.apache.poi.hssf.usermodel.HSSFWorkbook; 
import org.apache.poi.poifs.filesystem.POIFSFileSystem;

import Db.JDBCAddPSE;

import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class importServlet
 */
public class importServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String uploadPath = "c://workspace//DemoIO V40//WebContent//WEB-INF//temp.xls";//上傳到指定位置並命名
    /**
     * @see HttpServlet#HttpServlet()
     */
    public importServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		 try { 
			 
			    
				
				
	            // Create a factory for disk-based file items  
	            DiskFileItemFactory factory = new DiskFileItemFactory();  
	 
	 
	            // Create a new file upload handler  
	            ServletFileUpload upload = new ServletFileUpload(factory);  
	 
	 
	            List<FileItem> items = upload.parseRequest(request);// 
	            Iterator<FileItem> i = items.iterator();  
	            
	            while (i.hasNext()) {  
	                FileItem fi = (FileItem) i.next();  
	                String fileName = fi.getName();  
	                if (fileName != null) {  
	                    
	                    File savedFile = new File(uploadPath);  
	                    fi.write(savedFile);  
	                }  
	            }  
	              
	            
	            
	            response.setContentType("text/html;charset=UTF-8");    
	            
	            HttpSession session = request.getSession();
		        String Eid=(String) session.getAttribute("Employee");
			    java.text.SimpleDateFormat Formatr = new java.text.SimpleDateFormat("yyyy/MM/dd HH/mm");
				java.util.Date currentime= new java.util.Date();
				String ad=Formatr.format(currentime);
				JDBCAddPSE db = new JDBCAddPSE();	
				int Pid = db.nPSE(Eid,ad);
	    		int status=db.readExcel(Pid);

	    		db.delete();
	    		
	    		if(status==99) {
		    		request.setAttribute("Status", "99");

	    		}else {
		    		request.setAttribute("Status", "1");

	    		}

	    		RequestDispatcher dispatcher=request.getRequestDispatcher("addPSE.jsp");
				dispatcher.forward(request, response);  
	            
	        } catch (Exception e) {  
	            
	            e.printStackTrace();  
	        }  
		
		
	}
}
