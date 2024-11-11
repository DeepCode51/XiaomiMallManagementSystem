package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.UserDao;
import beans.orderDao;

public class pay extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public pay() {
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
       String type=request.getParameter("type");
       String uid=(String)session.getAttribute("uid");
       String oid=request.getParameter("oid");
       int price=Integer.parseInt(request.getParameter("price"));
       price*=0.98;
       orderDao od=new orderDao();
       od.setPrice(oid, price);
       if(uid==null){
    	   
       }else{
    	
       if(type.equals("yue")){
    	   UserDao ud=new UserDao();
    	   int money=ud.getwallet(uid);
    	   if(money<price){
    		   request.setAttribute("msg", "支付失败，余额不足");
    	   }else{
    		   money=money-price;
    		   try {
				if(od.changeordersta(oid,money,uid)){
					 od.setTransAction(uid, oid,1,-price);
					  request.setAttribute("msg", "支付成功");
				   }else{
					   request.setAttribute("msg", "支付失败");
				   }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
    	   }
       }else if(type.equals("wx")){
    	   
       }else if(type.equals("zfb")){
    	  
       }
	
       RequestDispatcher rd=request.getRequestDispatcher("info/payinfo.jsp");
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
