package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class BaseDao {
	private	 String dburl = "jdbc:mysql://localhost:3306/graduation_294_xiaomi?useUnicode=true&characterEncoding=utf8" ;
	private   String dbuser = "root" ;   
	private   String dbpass = "123456" ; 	
	private Connection conn=null;
	 private ResultSet rs=null;
	 private Statement stat =null;
	 private PreparedStatement pstat=null;
	 
	 
	public  BaseDao(){
		  try {
			Class.forName("com.mysql.jdbc.Driver");
			conn=this.getConn();
			
			stat=this.createstat();
			stat.execute("SET names 'utf8'");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			
	  }
     public void setAuto(){
    	 try {
			conn.setAutoCommit(false);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
     }
     public void commit(){
    	 try {
			conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
     }
     public void rollback(){
    	 try {
			conn.rollback();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
     }
	 public Connection getConn(){
		  try {
			conn=DriverManager.getConnection(dburl, dbuser, dbpass);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	  }
	 public Statement createstat(){
		 try {
			stat=conn.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return stat;
	 }
	 public PreparedStatement createPst(String sql){
		 try {
			 pstat=conn.prepareStatement(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pstat;
	 }
	 public ResultSet executQuery(){
		 try {
			rs=pstat.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	 }
	 public ResultSet executQuery(String sql){
		 try {
			rs=stat.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	 }
	 public int executeUpdate(String sql){
		 int iMark=0; 
	try {
		iMark=stat.executeUpdate(sql);
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return iMark;
	 }
	 public int executeUpdate(){
		 int iMark=0; 
	try {
		iMark=pstat.executeUpdate();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return iMark;
	 }
	 
	 public void close(){

		  if(rs!= null){ 
		        try{   
		            rs.close() ;   
		        }catch(SQLException e){   
		            e.printStackTrace() ;   
		        }   
		          }   
		          if(stat != null){   
		        try{   
		            stat.close() ;   
		        }catch(SQLException e){   
		            e.printStackTrace() ;   
		        }   
		          }   
		          if(conn != null){  
		         try{   
		            conn.close() ;   
		         }catch(SQLException e){   
		            e.printStackTrace() ;   
		         }   
		          } 
			
	 }
	 
	 
}
