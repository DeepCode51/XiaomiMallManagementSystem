package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.orderBean;
import beans.orderDao;

public class transaction_detaile extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public transaction_detaile() {
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
		String uid=(String) session.getAttribute("uid");
		if(uid==null){
			request.getRequestDispatcher("ucenter.jsp").forward(request, response);
		}else{
		int recordesPerpage=10;
        int pageNo=Integer.parseInt(request.getParameter("pageNo"));
        orderDao odao=new orderDao();
        ArrayList<orderBean> transaction=new ArrayList<orderBean>();
        transaction=odao.getAlltransaction(pageNo, recordesPerpage,uid);
       int Count=odao.pageCount(recordesPerpage);
   
       request.setAttribute("Count", Count);
       request.setAttribute("pageNo", pageNo);
       request.setAttribute("transaction", transaction);
       request.getRequestDispatcher("transaction_detaile.jsp").forward(request, response);
	}}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
