package book;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.MyTools;

/**
 * Servlet implementation class ReaderChangeAction
 */
@WebServlet("/ReaderChangeAction")
public class ReaderChangeAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReaderChangeAction() {
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
		int flag=0;
		BookDB beanDB=new BookDB();
		ReaderInfo reader=beanDB.getReaderInfo(id);
		if(reader==null) {
			flag=1;
			response.sendRedirect(request.getContextPath()+"/reader/change_pwd.jsp?loginflag="+flag);
		}
		else {
			if (reader.getPwd().equals(request.getParameter("pwd"))) {
				PwdInfo pwd=new PwdInfo();
				pwd.setCard(Integer.parseInt(request.getParameter("readerid")));
				pwd.setPwd(request.getParameter("pwd_1"));
				int count=beanDB.updatePwd(pwd);
				response.sendRedirect(request.getContextPath()+"/reader/change_pwd.jsp?loginflag="+flag);
			}
			else {
				flag=2;
				response.sendRedirect(request.getContextPath()+"/reader/change_pwd.jsp?loginflag="+flag);
			}
		}
	}

}
