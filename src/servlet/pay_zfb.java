package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.orderDao;

public class pay_zfb extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public pay_zfb() {
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
		orderDao od=new orderDao();
		HttpSession session = request.getSession();
	      String uid=(String)session.getAttribute("uid");
		String out_trade_no=request.getParameter("out_trade_no");
 	    String trade_no=request.getParameter("trade_no");
 	    if(od.payzfb(out_trade_no, trade_no,uid)){
 	    	
 	    	od.setTransAction(uid, out_trade_no,2,-(od.getorder(out_trade_no).getOprice()));
 		   request.setAttribute("msg", "支付成功");
 	    }else{
			   request.setAttribute("msg", "支付失败");
		   }
 	   
 	  RequestDispatcher rd=request.getRequestDispatcher("info/payinfo.jsp");
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
