package servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.orderDao;

public class ChangeOrder extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ChangeOrder() {
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
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String oid=request.getParameter("oid");
		String type=request.getParameter("type");
		String sid=request.getParameter("sid");
		String uid=request.getParameter("uid");
		orderDao odao=new orderDao();
		if(type.equals("1")){
			
				if(odao.deliver(oid,sid)){
					out.write("1");
				}else{
					out.write("0");
				}
			
			
		}else if(type.equals("2")){
			if(odao.signfor(oid)){
				out.write("1");
			}else{
				out.write("0");
			}
			
		}else if(type.equals("3")){
			if(odao.cancle(oid)){
				out.write("1");
			}else{
				out.write("0");
			}
			
		}else if(type.equals("4")){
			if(!odao.getpay(oid)){
			if(odao.cancleorder(oid,uid)){
				out.write("1");
			}else{
				out.write("0");
			}}else{
				
				int price=odao.getorder(oid).getOprice();
				//request.getRequestDispatcher("/alipay.trade.page.pay-JAVA-UTF-8/alipay.trade.refund.jsp?WIDTRout_trade_no="+oid+"&WIDTRtrade_no=&WIDTRrefund_amount="+price+"&WIDTRrefund_reason=&WIDTRout_request_no=").forward(request, response);
				//ChangeOrder.sendGet("http://39.107.118.145:8080/alipay.trade.page.pay-JAVA-UTF-8/alipay.trade.refund.jsp","WIDTRout_trade_no="+oid+"&WIDTRtrade_no=&WIDTRrefund_amount="+price+"&WIDTRrefund_reason=&WIDTRout_request_no=");
			 	  
				//ChangeOrder.sendGet("http://39.107.118.145:8080/alipay.trade.page.pay-JAVA-UTF-8/alipay.trade.refund.jsp?WIDTRout_trade_no="+oid+"&WIDTRtrade_no=&WIDTRrefund_amount="+price+"&WIDTRrefund_reason=&WIDTRout_request_no=");
				ChangeOrder.sendGet("http://39.107.118.145:8080/alipay.trade.page.pay-JAVA-UTF-8/alipay.trade.refund.jsp", "WIDTRout_trade_no="+oid+"&WIDTRtrade_no=&WIDTRrefund_amount="+price+"&WIDTRrefund_reason=&WIDTRout_request_no=");
				odao.changeorder(oid);
				odao.setTransAction(uid, oid, 4,price);
				out.write("1");
			}
			
		}
		
		
	}
	 public static String sendGet(String url, String param) {
	        String result = "";
	        BufferedReader in = null;
	        try {
	            String urlNameString = url + "?" + param;
	            URL realUrl = new URL(urlNameString);
	            // 打开和URL之间的连接
	            URLConnection connection = realUrl.openConnection();
	            // 设置通用的请求属性
	            connection.setRequestProperty("accept", "*/*");
	            connection.setRequestProperty("connection", "Keep-Alive");
	            connection.setRequestProperty("user-agent",
	                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
	            // 建立实际的连接
	            connection.connect();
	            // 获取所有响应头字段
	            Map<String, List<String>> map = connection.getHeaderFields();
	            // 遍历所有的响应头字段
	            for (String key : map.keySet()) {
	                System.out.println(key + "--->" + map.get(key));
	            }
	            // 定义 BufferedReader输入流来读取URL的响应
	            in = new BufferedReader(new InputStreamReader(
	                    connection.getInputStream()));
	            String line;
	            while ((line = in.readLine()) != null) {
	                result += line;
	            }
	        } catch (Exception e) {
	            System.out.println("发送GET请求出现异常！" + e);
	            e.printStackTrace();
	        }
	        // 使用finally块来关闭输入流
	        finally {
	            try {
	                if (in != null) {
	                    in.close();
	                }
	            } catch (Exception e2) {
	                e2.printStackTrace();
	            }
	        }
	        return result;
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
