package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class orderDao {
  //订单号生成
  public String getoid(){
	  SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String gdate = df.format(new Date()).replaceAll("-","").replaceAll(":","").replaceAll(" ","");
		int a=(int) (Math.random()*1000);
		return gdate+a;
  }
  //查询订单是够已存在
  public boolean orderisexist(String uid,String oname,String oaddress,int oprice){
	  BaseDao dao=new BaseDao();
	  ResultSet rs=null;
	  boolean check=false;
	  String sql="select oid from ordertable where uid='"+uid+"' and oname='"+oname+"' and oaddress='"+oaddress+"' and oprice='"+oprice+"' and ostatus=0";
	  rs=dao.executQuery(sql);
      try {
		if(rs.next()){
			  check=true;
		  }else{
			  check=false;  
		  }
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return check;
  }
  
  //订单生成
  public String insertorderinfo(String uid){
	int num=0;
	 String oname="";
	  BaseDao dao=new BaseDao();
	  ResultSet rs=null;
	  orderBean order=new orderBean();
	  order.setOid(getoid());
	  int oprice=0;
	  
	  String sql="select uname,uphone,address,num,gname,gprice from (cart left join  user on user.uid=cart.uid) left join goods on  cart.gid=goods.gid  where cart.uid='"+uid+"' and checked=1";
	  rs=dao.executQuery(sql);
	  try {
		while(rs.next()){
			  order.setUname(rs.getString(1));
			  order.setOphone(rs.getString(2));
			  order.setOaddress(rs.getString(3));
			  num+=rs.getInt(4);
			  oname=oname+rs.getString(5)+"*"+rs.getInt(4)+"  <br>";
			  oprice=oprice+rs.getInt(6)*rs.getInt(4);
		  }
	} catch (SQLException e) {
		e.printStackTrace();
	}
	order.setOnum(num);
	order.setOname(oname);
	order.setOprice(oprice);
	if(orderisexist(uid, oname, order.getOaddress(),oprice )||order.getOnum()==0){
		return "";
	}else{
		
	int mark=0;
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String odate=df.format(new Date());
	sql="insert into ordertable(oid,uid,uname,oname,oaddress,oprice,ophone,odate,onum) " +
			"values('"+order.getOid()+"','"+uid+"','"+order.getUname()+"','"+oname+"','"+order.getOaddress()+"','"+oprice+"','"+order.getOphone()+"','"+odate+"','"+num+"')";
	mark=dao.executeUpdate(sql);
	if(mark>0){
		return order.getOid();
	}else{
		return "";
	}
		}
  }
  //根据订单号查询订单信息
  public orderBean getorder(String oid){
	  BaseDao dao=new BaseDao();
	  ResultSet rs=null;
	  orderBean order=new orderBean();
	  String sql="select uid,uname,oname,oaddress,oprice,ophone,odate,ostatus,onum from ordertable where oid='"+oid+"'";
	  rs=dao.executQuery(sql);
       try {
		if(rs.next()){
			   order.setUid(rs.getString(1));
			   order.setUname(rs.getString(2));
			   order.setOname(rs.getString(3));
			   order.setOaddress(rs.getString(4));
			   order.setOprice(rs.getInt(5));
			   order.setOphone(rs.getString(6));
			   order.setOdate(rs.getString(7));
			   order.setStatus(rs.getString(8));
			   order.setOnum(rs.getInt(9));
		   }
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	order.setOid(oid);
	return order;
  }
  //订单完成
  public boolean changeordersta(String oid,int money,String uid) throws SQLException{
	  BaseDao dao=new BaseDao();
	  int mark1=0;
	  int mark2=0;
	  int mark3=0;
	  String sql1="update ordertable set ostatus=1 where oid='"+oid+"'";
	  String sql2="update user set wallet='"+money+"' where uid='"+uid+"'";
	  String sql3="delete from cart where uid='"+uid+"' and checked=1";
	  mark1=dao.executeUpdate(sql1);
	  mark2=dao.executeUpdate(sql2);
	  mark3=dao.executeUpdate(sql3);
	if(mark1>0&&mark1>0){
		return true;
	}else{
		return false;
	}
  }
  //获取订单
   public ArrayList<orderBean> getorderlist(String type,String uid){
	   
	   ArrayList<orderBean> olist=new ArrayList<orderBean>();
	   BaseDao dao=new BaseDao();
	   ResultSet rs=null;
	   String sql="";
	   if(type.equals("-1")){
		   sql="select oid,uname,oname,oaddress,oprice,ophone,odate,ostatus,onum,cnumber from ordertable where uid='"+uid+"'";		   
	   }else if(type.equals("-2")){
		   sql="select oid,uname,oname,oaddress,oprice,ophone,odate,ostatus,onum,cnumber from ordertable";
	   }else{		   
		   sql="select oid,uname,oname,oaddress,oprice,ophone,odate,ostatus,onum,cnumber from ordertable where uid='"+uid+"'and ostatus='"+type+"'";
	   }
	   rs=dao.executQuery(sql);
	   try {
		while(rs.next()){
			orderBean order=new orderBean();
			  order.setOid(rs.getString(1));
			   order.setUname(rs.getString(2));
			   order.setOname(rs.getString(3));
			   order.setOaddress(rs.getString(4));
			   order.setOprice(rs.getInt(5));
			   order.setOphone(rs.getString(6));
			   order.setOdate(rs.getString(7));
			   order.setStatus(rs.getString(8));
			   order.setOnum(rs.getInt(9));
			   order.setCnumber(rs.getString(10));
			  olist.add(order);
		   }
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return olist;
   }
   //发货
   public boolean deliver(String oid,String sid){
	   BaseDao dao=new BaseDao();
	   int rs=0;
	   String sql="update ordertable set ostatus=2,cnumber='"+sid+"' where oid='"+oid+"'";
	   rs=dao.executeUpdate(sql);
	   if(rs>0){
		   return true;
	   }else{
		   return false;
	   }
	   
   }
   //签收
   public boolean signfor(String oid){
	   BaseDao dao=new BaseDao();
	   int rs=0;
	   String sql="update ordertable set ostatus=3 where oid='"+oid+"'";
	   rs=dao.executeUpdate(sql);
	   if(rs>0){
		   return true;
	   }else{
		   return false;
	   }
	   
   }
   //取消订单
   public boolean cancle(String oid){
	   BaseDao dao =new BaseDao();
	   int rs=0;
	   String sql="delete from ordertable where oid='"+oid+"'";
	   rs=dao.executeUpdate(sql);
	   if(rs>0){
		   return true;
	   }else{
		   return false;
	   }
	   
   }
   //订单退款状态
   public boolean changeorder(String oid){
	   BaseDao dao=new BaseDao();
	   int rs=0;
	   String sql="update ordertable set ostatus=4 where oid='"+oid+"'";
	   rs=dao.executeUpdate(sql);
	   if(rs>0){
		   return true;
	   }else{
		   return false;
	   }
   }
   //获取支付方式
   public boolean getpay(String oid){
	   BaseDao dao=new BaseDao();
	   ResultSet rs=null;
	   String trade_no="";
	   String sql="select trade_no from ordertable where oid='"+oid+"'";
	   rs=dao.executQuery(sql);
	   try {
		if(rs.next()){
			trade_no =rs.getString("trade_no");
		   }
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	if(trade_no==null){
		return false;
	}else{
		return true;
	}
	   
   }
   //退款
   public boolean cancleorder(String oid,String uid){
	 
	   BaseDao dao=new BaseDao();
	   UserDao udao=new UserDao();
	   int price=this.getorder(oid).getOprice();
	   int money=udao.getwallet(uid);
	   money+=price;
	   String sql="update user set wallet='"+money+"' where uid='"+uid+"'";
	   if(this.changeorder(oid)&&dao.executeUpdate(sql)>0){
		   this.setTransAction(uid, oid, 3, price);
		   return true;
	   }else{
		   return false;
	   } 
	  
   }
   //订单列表分页查询
	public ArrayList<orderBean> getAllOrder(int pageNo,int recordesPerpage,String type){
   	ArrayList<orderBean> goodslist=new ArrayList<orderBean>();
   	BaseDao dao=new BaseDao();
   	ResultSet rs=null;
   	int i=1;
   	String sql="";
   	if(type.equals("-1")){
   		sql="select oid,uname,oname,oaddress,oprice,ophone,odate,ostatus,onum,cnumber,uid from ordertable";
   	}else{
   		sql="select oid,uname,oname,oaddress,oprice,ophone,odate,ostatus,onum,cnumber,uid from ordertable where ostatus='"+type+"'";
   	}

     rs=dao.executQuery(sql);
     int begin=(pageNo-1)*recordesPerpage+1;
     int end=pageNo*recordesPerpage;
     int index=0;
     try {
		while(rs.next()){
			  index++;
			  if(index<begin){
				  continue;
			  }
			  if(index>end){
				  break;
			  }
			  orderBean order=new orderBean();
			  order.setOid(rs.getString(1));
			   order.setUname(rs.getString(2));
			   order.setOname(rs.getString(3));
			   order.setOaddress(rs.getString(4));
			   order.setOprice(rs.getInt(5));
			   order.setOphone(rs.getString(6));
			   order.setOdate(rs.getString(7));
			   order.setStatus(rs.getString(8));
			   order.setOnum(rs.getInt(9));
			   order.setCnumber(rs.getString(10));
			   order.setUid(rs.getString(11));
			   order.setPageNo(pageNo);
			   order.setNum(i);
			   i++;
			   goodslist.add(order);  
		  }
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
   	dao.close();
   	return goodslist;
   }
	//总页数
	 public int pageCount(int recordesPerpage,String type){
	    	BaseDao dao=new BaseDao();
	    	ResultSet rs=null;
	    	String sql="";
	    	if(type.equals("-1")){	    		
	    		sql="select count(*) from ordertable";
	    	}else{	    		
	    		sql="select count(*) from ordertable where ostatus='"+type+"'";
	    	}
	      rs=dao.executQuery(sql);
	      int Count=0;
	      try {
			if(rs.next()){
				Count=rs.getInt(1); 
			  }
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	      
		dao.close();
		return (Count-1)/recordesPerpage+1;
	    }
	//支付宝支付
	 public boolean payzfb(String oid,String trade_no,String uid){
		  BaseDao dao=new BaseDao();
		   int rs=0;
		   String sql="update ordertable set ostatus=1,trade_no='"+trade_no+"' where oid='"+oid+"'";
		   String sql2="delete from cart where uid='"+uid+"' and checked=1";
		   rs=dao.executeUpdate(sql);
		   rs=dao.executeUpdate(sql2);
		   if(rs>0){
			   return true;
		   }else{
			   return false;
		   }
	 }
   //交易明细
	 public void setTransAction(String uid,String oid,int i,int price){
		 
		 UserDao udao=new UserDao();
		 SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-ddHH:mm:ss");
			String date=df.format(new Date());
		 int wallet=udao.getwallet(uid);
		 BaseDao dao=new BaseDao();
	     String sql="insert into transaction_detaile values("+uid+","+oid+","+i+","+price+","+wallet+",'"+date+"')";

	     dao.executeUpdate(sql);
	     dao.close();	 
	 }
	//余额支付9.8折
	 public void setPrice(String oid,int price){
		 BaseDao dao=new BaseDao();
	     String sql="update ordertable set oprice='"+price+"'";
	     dao.executeUpdate(sql);
	     dao.close();	 
		 
	 }
	 //交易明细
	 public ArrayList<orderBean> getAlltransaction(int pageNo,int recordesPerpage,String uid){
		   	ArrayList<orderBean> transaction=new ArrayList<orderBean>();
		   	BaseDao dao=new BaseDao();
		   	ResultSet rs=null;
		   	int i=1;
		   	String sql="select oid,type,price,wallet,tdate from transaction_detaile where uid='"+uid+"'";
		     rs=dao.executQuery(sql);
		     int begin=(pageNo-1)*recordesPerpage+1;
		     int end=pageNo*recordesPerpage;
		     int index=0;
		     try {
				while(rs.next()){
					  index++;
					  if(index<begin){
						  continue;
					  }
					  if(index>end){
						  break;
					  }
					  orderBean order=new orderBean();
					  order.setOid(rs.getString(1));
					  order.setStatus(rs.getString(2));
					  order.setOprice(rs.getInt(3));
					  order.setWallet(rs.getString(4));
					  order.setDate(rs.getString(5));
					  order.setPageNo(pageNo);
					  transaction.add(order);  
				  }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		   	dao.close();
		   	return transaction;
		   }
			//总页数
			 public int pageCount(int recordesPerpage){
			    	BaseDao dao=new BaseDao();
			    	ResultSet rs=null;
			    	String sql="select count(*) from transaction_detaile";
			      rs=dao.executQuery(sql);
			      int Count=0;
			      try {
					if(rs.next()){
						Count=rs.getInt(1); 
					  }
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
			      
				dao.close();
				return (Count-1)/recordesPerpage+1;
			    }
}
