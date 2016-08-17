package Db;

import java.sql.*;

public class JDBCCore implements JDBCConstants
{
	//繼承連線資料做連線
public Connection makeConnection() throws Exception{
	
	Connection conn;
	
	try{
		
		Class.forName(Driver);
		conn=DriverManager.getConnection(URI,USERNAME,PASSWORD);
		return conn;
	}
	catch(Exception e){
		throw e;
	}
	
	
}
	
}
