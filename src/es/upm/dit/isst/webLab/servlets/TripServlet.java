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
import es.upm.dit.isst.webLab.dao.TripDAO;
import es.upm.dit.isst.webLab.dao.TripDAOImplementation;
import es.upm.dit.isst.webLab.model.Trip;

@WebServlet("/TripServlet")
public class TripServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int tripId = Integer.parseInt(req.getParameter( "tripId" ));
		
		Trip trip = new Trip();
		TripDAO tripdao = TripDAOImplementation.getInstance();
		trip = tripdao.read(tripId);
		
		req.getSession().setAttribute("trip", trip);
		
		getServletContext().getRequestDispatcher( "/TripView.jsp" ).forward( req, resp );
	}
}
