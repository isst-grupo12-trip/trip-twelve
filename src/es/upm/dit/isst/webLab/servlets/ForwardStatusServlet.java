package es.upm.dit.isst.webLab.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.upm.dit.isst.webLab.dao.TripDAO;
import es.upm.dit.isst.webLab.dao.TripDAOImplementation;
import es.upm.dit.isst.webLab.model.Trip;

@WebServlet("/ForwardStatusServlet")
public class ForwardStatusServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int tripId = Integer.parseInt(req.getParameter( "tripId" ));
		boolean isSupervisor = Boolean.parseBoolean(req.getParameter( "isSupervisor" ));
		Trip trip = new Trip();
		TripDAO tripdao = TripDAOImplementation.getInstance();
		trip = tripdao.read(tripId);
		trip.setState(1);
		String supervisorEmail = trip.getTraveller().getSupervisor();
		tripdao.update(trip);
		if (isSupervisor) {
			resp.sendRedirect( req.getContextPath() + "/SupervisorServlet?email="  + supervisorEmail);
		} else {
			resp.sendRedirect( req.getContextPath() + "/EmployeeServlet?email="  + supervisorEmail);
		}
	}
	
}
