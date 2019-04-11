package es.upm.dit.isst.webLab.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.Integer;

import es.upm.dit.isst.webLab.dao.EmployeeDAO;
import es.upm.dit.isst.webLab.dao.EmployeeDAOImplementation;

@WebServlet("/EmployeeServlet")
public class EmployeeServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		EmployeeDAO edao = EmployeeDAOImplementation.getInstance();
		
		String emailEmployee = req.getParameter("email");
		
		req.getSession().setAttribute("employee", edao.read(emailEmployee));
		
		getServletContext().getRequestDispatcher( "/EmployeeView.jsp" ).forward( req, resp );
	}
}
