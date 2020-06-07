package book;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.*;

/**
 * Servlet implementation class BorrowLoginAction
 */
@WebServlet("/BorrowLoginAction")
public class BorrowLoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BorrowLoginAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id=Integer.parseInt(request.getParameter("readerid"));
		int flag;
		BookDB beanDB=new BookDB();
		ReaderInfo reader=beanDB.getReaderInfo(id);
		if(reader==null) {
			flag=1;
			response.sendRedirect(request.getContextPath()+"/reader/borrow.jsp?loginflag="+flag);
		}
		else {
			if (reader.getPwd().equals(request.getParameter("pwd"))) {
				request.getSession().setAttribute("ReaderInfo", reader);
				response.sendRedirect(request.getContextPath()+"/BorrowListAction?readerid="+id);
			}
			else {
				flag=2;
				response.sendRedirect(request.getContextPath()+"/reader/borrow.jsp?loginflag="+flag);
			}
		}
	}
}