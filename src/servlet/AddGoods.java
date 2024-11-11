package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.GoodsBean;
import beans.GoodsDao;
import beans.Tools;

import com.jspsmart.upload.Request;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

public class AddGoods extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AddGoods() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out
				.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		SmartUpload su=new SmartUpload();
		GoodsBean goods=new GoodsBean();
		GoodsDao dao=new GoodsDao();
		HttpSession session = request.getSession();
		String adminname=(String)session.getAttribute("admin_name");
		String gurl="uploadimage/";
		String rurl="";
		String ext="";
		String msg="";
		String ctype=request.getParameter("ctype");
		try {
			su.initialize(this.getServletConfig(), request, response);
			su.setAllowedFilesList("jpg,png");
			su.upload();
			com.jspsmart.upload.File myfile=su.getFiles().getFile(0);
			Request req=su.getRequest();
			String title=req.getParameter("title");
			String price=req.getParameter("price");
			String edition=req.getParameter("edition");
			String subtitle=req.getParameter("subtitle");
			String type=req.getParameter("type");
			String color=req.getParameter("color");
			String trait=req.getParameter("trait");
			String gid=req.getParameter("gid");
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String gdate=df.format(new Date());
			ext=myfile.getFileExt();
			Calendar cal=Calendar.getInstance();
			String newfilename=String.valueOf(cal.getTimeInMillis());
			String gimage=gurl+newfilename+"."+ext;
			myfile.saveAs(gimage,SmartUpload.SAVE_VIRTUAL);
			goods.setGid(dao.getgoodgid(type));
			goods.setGname(title);
			goods.setEdition(edition);
			goods.setColor(color);
			goods.setGimg(gimage);
			goods.setGprice(price);
			goods.setSubtitle(subtitle);
			goods.setType(type);
			goods.setDate(gdate);
			goods.setAdmin(adminname);
			goods.setTrait(trait);
			
			if(!myfile.isMissing()){
				if(ctype.equals("A")){	
					rurl="info/addGoodsinfo.jsp";
				   if(dao.addGoods(goods)){
					msg="1";
					
				    }else{
					msg="0";	
				    }
		  }else if(ctype.equals("B")){
			  rurl="info/ChangeGoodsinfo.jsp";
					goods.setGid(gid);
					if(dao.changeGoodsInfo(goods)){
						msg="1";
					}else{
						msg="0";	
					}
				}
			}else{
	
				goods.setGid(gid);
				if(ctype.equals("B")){
					 rurl="info/ChangeGoodsinfo.jsp";
					if(dao.changeGoodsInfo2(goods)){
						msg="1";
					}else{
						msg="0";	
					}
				}else if(ctype.equals("A")){
					rurl="info/addGoodsinfo.jsp";
					msg="-1";
				}
				
				
				
				
			}
		} catch (SmartUploadException e) {
			e.printStackTrace();
		}
		request.setAttribute("msg", msg);
		RequestDispatcher rd=request.getRequestDispatcher(rurl);
  		rd.forward(request, response);
		
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
