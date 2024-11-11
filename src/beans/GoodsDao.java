package beans;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;





public class GoodsDao {
    //添加商品
	public boolean addGoods(GoodsBean goods){
		PreparedStatement pstat=null;
		int mark=0;
		String sql="insert into goods values (?,?,?,?,?,?,?,?,?,?,?,?)";
		BaseDao dao=new BaseDao();
		pstat=dao.createPst(sql);
		try {
			pstat.setString(1,goods.getGid());
			pstat.setString(2,goods.getGname());
			pstat.setString(3,goods.getGprice());
			pstat.setString(4,goods.getType());
			pstat.setString(5,goods.getSubtitle());
			pstat.setString(6,goods.getEdition());
			pstat.setString(7,goods.getColor());
			pstat.setString(8,"0");
			pstat.setString(9,goods.getGimg());
			pstat.setString(10,goods.getDate());
			pstat.setString(11,goods.getAdmin());
			pstat.setString(12,goods.getTrait());
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}   
		mark=dao.executeUpdate();
		dao.close();
		if(mark>0){
	return true;
		}else{
	return false;
		}	
   }
   
	
	//首页获取商品
	public ArrayList<GoodsBean> getGoodsList(){
		ArrayList<GoodsBean> GoodsList =new ArrayList<GoodsBean>();
		BaseDao dao=new BaseDao();
		ResultSet rs=null;
	    String sql="select gid,gname,gprice,subtitle,gimg,trait,status from goods  limit 15 ";
	      rs=dao.executQuery(sql);
	    
	      try {
			while(rs.next()){
				if(rs.getInt("status")==1){
					continue;
				}
				GoodsBean goods=new GoodsBean();
				goods.setGid(rs.getString(1));
				goods.setGname(rs.getString(2));
				goods.setGprice(rs.getString(3));
				goods.setSubtitle(rs.getString(4));
				goods.setGimg(rs.getString(5));
				goods.setTrait(rs.getString(6));
				GoodsList.add(goods);
			  }
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
	       dao.close();
	       return GoodsList;
	  
	}
	//商品精确查询
	public GoodsBean searchGoods(String gid){
		GoodsBean goods=new GoodsBean();
		BaseDao dao=new BaseDao();
		ResultSet rs=null;
		String sql="select gname,gprice,gtype,subtitle,edition,color,status,gimg,trait,gid from goods where gid='"+gid+"'";
		rs=dao.executQuery(sql);
		try {
			if(rs.next()){
					goods.setGname(rs.getString(1));
					goods.setGprice(rs.getString(2));
					goods.setGtype(rs.getString(3));
					goods.setSubtitle(rs.getString(4));
					goods.setEdition(rs.getString(5));
					goods.setColor(rs.getString(6));
					goods.setStatus(rs.getString(7));
					goods.setGimg(rs.getString(8));
					goods.setTrait(rs.getString(9));
					goods.setGid(gid);
				
				
			}
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		dao.close();
		return goods;
	}
	//生成商品编号
	public String getgoodgid(String type){
		GoodsBean goods=new GoodsBean();
		BaseDao dao=new BaseDao();
		int i=0;
		ResultSet rs=null;
		String gid="";
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String gdate = df.format(new Date()).replaceAll("-","");
		gid=type+gdate;
		
		String sql="select count(gid) from goods where date like '"+df.format(new Date())+"%'";
		rs=dao.executQuery(sql);
		try {
			if(rs.next()){
				i=rs.getInt("count(gid)");
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		dao.close();
		for(int x=3;String.valueOf(i).length()<x;x--){
			gid=gid+"0";
			
		}
		
		gid=gid+i;
		return gid;
	}
	//获取全部商品种类
	public ArrayList<GoodsBean> getAllGoodsType(){
		ArrayList<GoodsBean> list=new ArrayList<GoodsBean>();
		
		BaseDao dao=new BaseDao();
		ResultSet rs=null;
		String sql="select tid,tname from goods_type";
		rs=dao.executQuery(sql);
		try {
			while(rs.next()){
				GoodsBean goods=new GoodsBean();
					goods.setGid(rs.getString(1));
					goods.setType(rs.getString(2));
					list.add(goods);
			}
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dao.close();
		return list;
	}
	//添加商品种类
	public boolean addGoodsType(String tid,String tname){
		BaseDao dao=new BaseDao();
		PreparedStatement pstat=null;
		int mark=0;
		String sql="insert into goods_type(tid,tname) values (?,?)";
		pstat=dao.createPst(sql);
		try {
			pstat.setString(1, tid);
			pstat.setString(2, tname);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mark=dao.executeUpdate();
		dao.close();
		if(mark>0){
	return true;
		}else{
	return false;
		}	
		
	}
	//查询种类是否存在
	public boolean searchGoodsType(String tid){
		BaseDao dao=new BaseDao();
		ResultSet rs=null;
		boolean mark=false;
		String sql="select tid,tname from goods_type where tid='"+tid+"'";
		rs=dao.executQuery(sql);
		try {
			if(rs.next()){
				 mark=false;
				
			}else{
				mark=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mark;
	}
	//获取全部商品
	public ArrayList<GoodsBean> getAllGoods(int pageNo,int recordesPerpage){
    	ArrayList<GoodsBean> goodslist=new ArrayList<GoodsBean>();
    	BaseDao dao=new BaseDao();
    	ResultSet rs=null;
    	int i=1;
       String sql="select gid,gname,gprice,gtype,status,date,admin,gimg from goods";
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
        GoodsBean goods=new GoodsBean();
        goods.setGid(rs.getString(1));
        goods.setGname(rs.getString(2));
        goods.setGprice(rs.getString(3));
        goods.setGtype(rs.getString(4));
        goods.setStatus(rs.getString(5));
        goods.setDate(rs.getString(6));
        goods.setAdmin(rs.getString(7));
        goods.setGimg(rs.getString(8));
        goods.setPageNo(pageNo);
        goods.setNum(i);
        i++;
        goodslist.add(goods);  
		  }
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
    	dao.close();
    	return goodslist;
    }
	//总页数
	 public int pageCount(int recordesPerpage){
	    	BaseDao dao=new BaseDao();
	    	ResultSet rs=null;
	       String sql="select count(*) from goods";
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
	//下架商品
	 public boolean ChangeGoodsStatus(String gid){
	    	int rs;
	    	String sql=null;
	    	if(searchGoodsstatus(gid)){
	    	sql="update  goods set status=0 where gid='"+gid+"'";
	    	}else{
	    	sql="update  goods set status=1 where gid='"+gid+"'";	
	    	}  

			BaseDao db=new BaseDao();
	    rs=db.executeUpdate(sql);
	    db.close();
		if(rs>0){
			return true;
		}else{
			return false;
		}
	    	
	    }
	 //查询商品状态
	 public boolean searchGoodsstatus(String gid){
	    	BaseDao dao=new BaseDao();
	    	ResultSet rs=null;
	    	int status=0;
	        String sql="select status from goods where gid='"+gid+"'";
	       rs=dao.executQuery(sql);
	       try {
			if(rs.next()){
				status=rs.getInt("status");   
			   }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    	dao.close();
	    	if(status==1){
	    		return true;
	    	}else{
	    		return false;
	    		
	    	}
	 }   
	//获取某一商品信息
	    public GoodsBean getgoodsinfo(String gid){		
	    		BaseDao dao=new BaseDao();
	    		ResultSet rs=null;
	    	    String sql="select gname,gprice,subtitle,gimg,trait,status,gtype,tname,edition,color,gtype from goods,goods_type  where goods.gtype=goods_type.tid and gid='"+gid+"'";
	    
	    	    rs=dao.executQuery(sql);
	 				GoodsBean goods=new GoodsBean();
	    	      try {
	    			if(rs.next()){
	    				
	 
	   
	    				goods.setGid(gid);
	    				goods.setGname(rs.getString(1));
	    				goods.setGprice(rs.getString(2));
	    				goods.setSubtitle(rs.getString(3));
	    				goods.setGimg(rs.getString(4));
	    				goods.setTrait(rs.getString(5));
	    				goods.setStatus(rs.getString(6));
	    				goods.setGtype(rs.getString(7));
	    				goods.setType_name(rs.getString(8));
	    				goods.setEdition(rs.getString(9));
	    				goods.setColor(rs.getString(10));
	    				goods.setType(rs.getString(11));
	    				
	    			  }
	    		} catch (SQLException e) {
	    		
	    			e.printStackTrace();
	    		}
	    	       dao.close();
	    	       return goods;
	    	  
	    	}
	    //获取商品信息
	    public GoodsBean getALLgoodslist(){		
	    		BaseDao dao=new BaseDao();
	    		ResultSet rs=null;
	    	    String sql="select gid,gname,gprice,subtitle,gimg,trait,status,gtype,tname,edition,color,gtype from goods,goods_type  where goods.gtype=goods_type.tid";
	    	      rs=dao.executQuery(sql);
	 				GoodsBean goods=new GoodsBean();
	    	      try {
	    			while(rs.next()){
	    				
	    				if(rs.getInt("status")==1){
	    					continue;
	    				}
	   
	    				goods.setGid(rs.getString(1));
	    				goods.setGname(rs.getString(2));
	    				goods.setGprice(rs.getString(3));
	    				goods.setSubtitle(rs.getString(4));
	    				goods.setGimg(rs.getString(5));
	    				goods.setTrait(rs.getString(6));
	    				goods.setStatus(rs.getString(7));
	    				goods.setGtype(rs.getString(8));
	    				goods.setType_name(rs.getString(9));
	    				goods.setEdition(rs.getString(10));
	    				goods.setColor(rs.getString(11));
	    				goods.setType(rs.getString(12));
	    				
	    			  }
	    		} catch (SQLException e) {
	    		
	    			e.printStackTrace();
	    		}
	    	       dao.close();
	    	       return goods;
	    	  
	    	}
	    //修改商品信息
	    public boolean changeGoodsInfo(GoodsBean goods){
			BaseDao dao=new BaseDao();
			PreparedStatement pstat=null;
			int mark=0;
			String sql="update goods set gname=?,gprice=?,subtitle=?,edition=?,color=?,trait=?,gimg=? where gid=?";
			pstat=dao.createPst(sql);
			try {
				pstat.setString(1,goods.getGname());
				pstat.setString(2,goods.getGprice());
				pstat.setString(3,goods.getSubtitle());
				pstat.setString(4,goods.getEdition());
				pstat.setString(5,goods.getColor());
				pstat.setString(6,goods.getTrait());
				pstat.setString(7,goods.getGimg());
				pstat.setString(8,goods.getGid());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			mark=dao.executeUpdate();
			dao.close();
			if(mark>0){
		return true;
			}else{
		return false;
			}}
	    
	    public boolean changeGoodsInfo2(GoodsBean goods){
			BaseDao dao=new BaseDao();
			PreparedStatement pstat=null;
			int mark=0;
			String sql="update goods set gname=?,gprice=?,subtitle=?,edition=?,color=?,trait=? where gid=?";
			pstat=dao.createPst(sql);
			try {
				pstat.setString(1,goods.getGname());
				pstat.setString(2,goods.getGprice());
				pstat.setString(3,goods.getSubtitle());
				pstat.setString(4,goods.getEdition());
				pstat.setString(5,goods.getColor());
				pstat.setString(6,goods.getTrait());
				pstat.setString(7,goods.getGid());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			mark=dao.executeUpdate();
			dao.close();
			if(mark>0){
		return true;
			}else{
		return false;
			}}
	    //商品搜索
	    public ArrayList<GoodsBean> Search(String keyword){
			ArrayList<GoodsBean> GoodsList =new ArrayList<GoodsBean>();
			BaseDao dao=new BaseDao();
			ResultSet rs=null;
			 String sql="";
			if(keyword.equals("全部商品")){
			sql="select gid,gname,gprice,gimg,status,tname from goods inner join goods_type on gtype=tid";
			}else {
		    sql="select gid,gname,gprice,gimg,status,tname from goods inner join goods_type on gtype=tid where tname='"+keyword+"' or gname like '%"+keyword+"%'";
			} 
		    rs=dao.executQuery(sql);
		    
		      try {
				while(rs.next()){
					if(rs.getInt("status")==1){
						continue;
					}
					GoodsBean goods=new GoodsBean();
					goods.setGid(rs.getString(1));
					goods.setGname(rs.getString(2));
					goods.setGprice(rs.getString(3));
					goods.setGimg(rs.getString(4));
					GoodsList.add(goods);
				  }
			} catch (SQLException e) {
			
				e.printStackTrace();
			}
		       dao.close();
		       return GoodsList;
		  
		}
	    //个人购物车商品数量
	    public int checkexis(String uid,String gid){
	    	BaseDao dao=new BaseDao();
			ResultSet rs=null;
			int num=0;
			boolean check=false;
			String sql="select  num from cart where uid='"+uid+"' and gid='"+gid+"'";
			 rs=dao.executQuery(sql);
			 try {
				if(rs.next()){
					 num=rs.getInt(1);
				 }else{
					 num=0;
				 }
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			return num;
	    }
	    //加入购物车
	    public boolean addGoodsCart(String uid,String gid){
	    	BaseDao dao=new BaseDao();
			int rs=0;
			boolean check=false;
			String sql="";
			int num=checkexis(uid,gid);
			if(num==0){
				sql="insert into cart(uid,gid,num,checked) values('"+uid+"','"+gid+"','1','1')";
			}else{
				num++;
				sql="update cart set num='"+num+"' where uid='"+uid+"' and gid='"+gid+"'";
			}
			 rs=dao.executeUpdate(sql);
			 if(rs>0){
				 check=true;
			 }else{
				 check=false;
			 }
			return check;
	    }
	    
	    
	    //获取用户购物车
	    public ArrayList<GoodsBean> getUserCart(String uid){
	    	ArrayList<GoodsBean> list=new ArrayList<GoodsBean>();
	    	BaseDao dao=new BaseDao();
	    	
	    	ResultSet rs=null;
	    	String sql="select cart.gid,num,gname,gimg,gprice,checked from cart inner join goods  on cart.gid=goods.gid where uid='"+uid+"'";
	    	
	    	rs=dao.executQuery(sql);
	    	 try {
				while(rs.next()){
					GoodsBean goods=new GoodsBean();
					 goods.setGid(rs.getString(1));
					 goods.setNum(rs.getInt(2));
					 goods.setGname(rs.getString(3));
					 goods.setGimg(rs.getString(4));
					 goods.setGprice(rs.getString(5));
					 goods.setChecked(rs.getInt(6));
					 list.add(goods);
				 }
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return list;
	    }
	   
	  //购物车数量加减
	    public boolean changenum(String uid,String gid,int num){
	    	BaseDao dao=new BaseDao();
			int rs=0;
			boolean check=false;
			String sql="update cart set num='"+num+"' where uid='"+uid+"' and gid='"+gid+"'";
			 rs=dao.executeUpdate(sql);
			 if(rs>0){
				 check=true;
			 }else{
				 check=false;
			 }
			return check;
	    	
	    	
	    }
	  //购物车删除
	    public boolean cartdelete(String uid,String gid){
	    	BaseDao dao=new BaseDao();
			int rs=0;
			boolean check=false;
			String sql="delete from cart where uid='"+uid+"' and gid='"+gid+"'";
			 rs=dao.executeUpdate(sql);
			 if(rs>0){
				 check=true;
			 }else{
				 check=false;
			 }
			return check;
	    	
	    	
	    } 
	    //选中状态
	    public boolean checkedstatus(String gid,String uid,int checked){
	    	BaseDao dao=new BaseDao();
			int rs=0;
			boolean check=false;
			String sql="";
			if(checked==0){
				sql="update cart set checked=1 where uid='"+uid+"' and gid='"+gid+"'";
			}else{
				sql="update cart set checked=0 where uid='"+uid+"' and gid='"+gid+"'";
			}
           rs=dao.executeUpdate(sql);
			 if(rs>0){
				 check=true;
			 }else{
				 check=false;
			 }
			return check;
	    	
	    	
	    }
	    
	    
	    
	    
	    
}
