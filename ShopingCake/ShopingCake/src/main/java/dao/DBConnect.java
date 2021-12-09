package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * @author MyPC
 *
 */
public class DBConnect {
	  private static String DB_URL = "jdbc:mysql://localhost:3306/webhang";
	    private static String USER_NAME = "root";
	    private static String PASSWORD = "icandoit";
	public Connection cn;
	public void getConnection() throws Exception{
		cn=null;
		
		 try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            cn = DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);
	            System.out.println("connect successfully!");
	        } catch (Exception ex) {
	            System.out.println("connect failure!");
	            ex.printStackTrace();
	        }
	}
	public static void main(String[] args) throws Exception {
		DBConnect  c = new DBConnect();
		c.getConnection();
		System.out.println("ok");
	}

}
