package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.GoodsDao;

public class cart extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public cart() {
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
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String uid=(String)session.getAttribute("uid");
		String gid=request.getParameter("gid");
		String type=request.getParameter("type");
		
		GoodsDao dao=new GoodsDao();
		if(uid==null){
			out.write("-1");
		}else{
		if(type.equals("A")){
			
		
			if(dao.addGoodsCart(uid, gid)){
				out.write("1");
			}else{
				out.write("0");
			}
       }else if(type.equals("B")){
    	   int num=Integer.parseInt(request.getParameter("num"));
         	dao.changenum(uid, gid, num);
			
       }else if(type.equals("C")){
    	   if(dao.cartdelete(uid,gid)){
    		   out.write("1");
    	   }else{
				out.write("0");
			}
       }else if(type.equals("D")){
    	   int checked=Integer.parseInt(request.getParameter("checked")); 
    	   dao.checkedstatus(gid, uid, checked);
       }
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
