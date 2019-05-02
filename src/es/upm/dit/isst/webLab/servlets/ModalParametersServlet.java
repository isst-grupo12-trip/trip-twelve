package es.upm.dit.isst.webLab.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;

import java.lang.Integer;

import es.upm.dit.isst.webLab.dao.EmployeeDAO;
import es.upm.dit.isst.webLab.dao.EmployeeDAOImplementation;
import es.upm.dit.isst.webLab.dao.TripDAO;
import es.upm.dit.isst.webLab.dao.TripDAOImplementation;
import es.upm.dit.isst.webLab.model.Employee;
import es.upm.dit.isst.webLab.model.Trip;

@WebServlet("/ModalParametersServlet")
public class ModalParametersServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int tripId = Integer.parseInt(req.getParameter( "tripId" ));
		
		Subject currentUser = SecurityUtils.getSubject();
		
		TripDAO tripdao = TripDAOImplementation.getInstance();
		Trip trip = tripdao.read(tripId);
		
		req.getSession().setAttribute("trip", trip);
		req.getSession().setAttribute("tripId", tripId);
		
		getServletContext().getRequestDispatcher( "/EditTripView.jsp?tripId=" + tripId + currentUser.getPrincipal() + trip ).forward( req, resp );
	}
}
