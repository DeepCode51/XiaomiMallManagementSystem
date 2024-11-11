package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.UserBean;
import beans.UserDao;
import beans.orderBean;
import beans.orderDao;

public class orderinfo extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public orderinfo() {
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
		HttpSession session = request.getSession();
         orderDao dao=new orderDao();
         orderBean order=new orderBean();
         UserDao udao=new UserDao();
         UserBean user=new UserBean();
		 String uid=(String)session.getAttribute("uid");
		 String oid="";
	   String type=request.getParameter("type");
	   if(type.equals("0")){
		 user=udao.findUserInfo(uid);
		 if(user.getUaddress()==null){
		    request.setAttribute("msg", "请先添加收获信息");
		   RequestDispatcher rd=request.getRequestDispatcher("info/cartinfo.jsp");
		  		rd.forward(request, response);
		 }else{
			 oid=dao.insertorderinfo(uid);
			 order=dao.getorder(oid);
			 request.setAttribute("orderinfo", order);
				RequestDispatcher rd=request.getRequestDispatcher("orderinfo.jsp");
		  		rd.forward(request, response);
		 }
		 
	   }else if(type.equals("1")){
		 oid=request.getParameter("oid"); 
		 order=dao.getorder(oid);
		 request.setAttribute("orderinfo", order);
		 
			RequestDispatcher rd=request.getRequestDispatcher("orderinfo.jsp");
	  		rd.forward(request, response);   
	   }
	    
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

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out
				.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the POST method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
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
