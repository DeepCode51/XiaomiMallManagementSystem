package beans;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class UserDao {
//判断账号是否存在
	public boolean checkUid(String uid){
		BaseDao dao=new BaseDao();
    	ResultSet rs=null;
       String sql="select uid from user where uid='"+uid+"'";
      rs=dao.executQuery(sql);
      boolean check=false;
    try {
		if(rs.next()){
			check=false;
		}else{
			check=true;
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	dao.close();
	return check;
	}
	//注册
	public boolean regist(String uid,String upass,String uphone){
		     BaseDao dao=new BaseDao();
			PreparedStatement pstat=null;
			String sql="insert into user(uid,upass,uphone) values(?,?,?)";
			pstat=dao.createPst(sql);
			try {
				pstat.setString(1,uid);
				pstat.setString(2,upass);
				pstat.setString(3,uphone);
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			if(dao.executeUpdate()>0){
				return true;
			}else{
				return false;
			}
	}
	//登录
	public boolean login(String uid,String upass,String table){
		BaseDao dao=new BaseDao();
		ResultSet rs=null;
		boolean mark=false;
       String sql="select uid from "+table+" where uid='"+uid+"'and upass='"+upass+"'";
       rs=dao.executQuery(sql);
      try {
		if(rs.next()){
			mark=true;  
		  }else{
			  mark=false;
		  }
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
      return mark; 
		
	}
	//查询管理员姓名
	public String searchadminname(String uid){
		BaseDao dao=new BaseDao();
		String uname="";
		ResultSet rs=null;
		boolean mark=false;
       String sql="select uname from admin where uid='"+uid+"'";
       rs=dao.executQuery(sql);
       try {
		if(rs.next()){
			   uname=rs.getString(1);
		   }
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return uname;
	}
	//管理员信息
	public UserBean findAdmininfo(String uid){
		ResultSet rs=null;
		BaseDao dao=new BaseDao();
		UserBean user=new UserBean();
		String sql="select uid,uname,uphone from admin where uid='"+uid+"'";
		
		
		try {
			rs=dao.executQuery(sql);
			if(rs.next()){	
				user.setUid(rs.getString("uid"));
				user.setUname(rs.getString("uname"));
				user.setUphone(rs.getString("uphone"));
			}else{	
		        
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
  
	}

	//用户信息
	public UserBean findUserInfo(String uid){
		ResultSet rs=null;
		BaseDao dao=new BaseDao();
		UserBean user=new UserBean();
		String sql="select uid,uname,uphone,address,wallet from user where uid='"+uid+"'";
		
		try {
			rs=dao.executQuery(sql);
			if(rs.next()){	
				user.setUid(rs.getString("uid"));
				user.setUname(rs.getString("uname"));
				user.setUphone(rs.getString("uphone"));
				user.setUaddress(rs.getString("address"));
				user.setWallet(rs.getInt("wallet"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
  
	}
	//查询余额
	public int getwallet(String uid){
		ResultSet rs=null;
		int money=0;
		BaseDao dao=new BaseDao();
		String sql="select wallet from user where uid='"+uid+"'";
		rs=dao.executQuery(sql);
		try {
			if(rs.next()){
				money=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dao.close();
		return money;
	}
	//判断密码是否正确
	public boolean checkupwd(String uid,String upass){
		ResultSet rs=null;
		BaseDao dao=new BaseDao();
		String sql="select * from user where uid='"+uid+"' and upass='"+upass+"'";
		boolean mark=false;
		rs=dao.executQuery(sql);
		try {
			if(rs.next()){
				mark=true;
			}else{
				mark=false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return mark;
	}
	//修改密码
	public boolean changeupwd(String uid,String npass){
		int i=0;
		BaseDao dao=new BaseDao();
		
		String sql="update  user set upass='"+npass+"'  where uid='"+uid+"'";
		i=dao.executeUpdate(sql);
		if(i>0){
			return true;
		}else{
			return false;
		}
	}
	//修改用户信息
	public boolean changeinfo(String uid,String uname,String uphone,String uaddress){
		int i=0;
		BaseDao dao=new BaseDao();
		String sql="update  user set uname='"+uname+"',uphone='"+uphone+"',address='"+uaddress+"'  where uid='"+uid+"'";
		i=dao.executeUpdate(sql);
		if(i>0){
			return true;
		}else{
			return false;
		}
	}
	//充值
	public boolean addmoney(String uid,int money){
		int i=0;
		BaseDao dao=new BaseDao();
		int wallet=getwallet(uid);
		wallet+=money;
		String sql="update user set wallet='"+wallet+"' where uid='"+uid+"'";
		i=dao.executeUpdate(sql);
		if(i>0){
			return true;
		}else{
			return false;
		}
	}
	public boolean adminRegist(String uid,String upass,String uname,String uphone){
	     BaseDao dao=new BaseDao();
		PreparedStatement pstat=null;
		String sql="insert into admin values(?,?,?,?)";
		pstat=dao.createPst(sql);
		try {
			pstat.setString(1,uid);
			pstat.setString(2,upass);
			pstat.setString(3,uname);
			pstat.setString(4,uphone);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		if(dao.executeUpdate()>0){
			return true;
		}else{
			return false;
		}
}
}
