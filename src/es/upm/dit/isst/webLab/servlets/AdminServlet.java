package es.upm.dit.isst.webLab.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.upm.dit.isst.webLab.dao.EmployeeDAO;
import es.upm.dit.isst.webLab.dao.EmployeeDAOImplementation;

@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		EmployeeDAO edao = EmployeeDAOImplementation.getInstance();
		req.getSession().setAttribute( "employee_list", edao.readAll());
		
		getServletContext().getRequestDispatcher( "/AdminView.jsp" ).forward( req, resp );
	}
}
