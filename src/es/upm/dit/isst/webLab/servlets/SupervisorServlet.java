package es.upm.dit.isst.webLab.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.upm.dit.isst.webLab.dao.EmployeeDAO;
import es.upm.dit.isst.webLab.dao.EmployeeDAOImplementation;
import es.upm.dit.isst.webLab.dao.TripDAO;
import es.upm.dit.isst.webLab.dao.TripDAOImplementation;

@WebServlet("/SupervisorServlet")
public class SupervisorServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		EmployeeDAO edao = EmployeeDAOImplementation.getInstance();
		
		String emailSupervisor = req.getParameter("email");
		
		req.getSession().setAttribute("supervisor", edao.read(emailSupervisor));
		
		TripDAO tdao = TripDAOImplementation.getInstance();
		req.getSession().setAttribute( "trip_list", tdao.readAll());
		
		getServletContext().getRequestDispatcher( "/SupervisorView.jsp" ).forward( req, resp );
	}
}
