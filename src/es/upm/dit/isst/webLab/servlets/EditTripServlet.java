package es.upm.dit.isst.webLab.servlets;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.log.SystemLogHandler;

import es.upm.dit.isst.webLab.dao.EmployeeDAO;
import es.upm.dit.isst.webLab.dao.EmployeeDAOImplementation;
import es.upm.dit.isst.webLab.dao.TripDAO;
import es.upm.dit.isst.webLab.dao.TripDAOImplementation;
import es.upm.dit.isst.webLab.model.Employee;
import es.upm.dit.isst.webLab.model.Trip;


@WebServlet("/EditTripServlet")
public class EditTripServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int tripId = Integer.parseInt(req.getParameter( "tripId" ));
		
		TripDAO tripdao = TripDAOImplementation.getInstance();
		Trip trip = tripdao.read(tripId);
		
		String destiny = req.getParameter( "destination" );
		Date startDate = null;
		try {
			startDate = new SimpleDateFormat("dd/MM/yyyy").parse(req.getParameter( "startDate" ));
		} catch (ParseException e1) {
			try {
	            startDate = new SimpleDateFormat("yyyy-dd-MM hh:mm:ss").parse(req.getParameter("startDate"));
			} catch (ParseException e2) {
				e2.printStackTrace();
			}
		}
		
		Date endDate = null;
		try {
			endDate = new SimpleDateFormat("dd/MM/yyyy").parse(req.getParameter( "endDate" ));
		} catch (ParseException e) {
			try {
	            endDate = new SimpleDateFormat("yyyy-dd-MM hh:mm:ss").parse(req.getParameter("endDate"));
			} catch (ParseException e2) {
				e2.printStackTrace();
			}
		}
		String motive = req.getParameter("motive");
		Double amount = -1.0;
		try {
			amount = Double.parseDouble(req.getParameter("amount"));
		} catch (NullPointerException | NumberFormatException e) {
			e.printStackTrace();
		}
		String email = req.getParameter( "email" );
		EmployeeDAO edao = EmployeeDAOImplementation.getInstance();
		Employee traveller = edao.read(email);
	
		trip.setDestiny(destiny);
		trip.setAmount(amount);
		trip.setStartDate(startDate);
		trip.setEndDate(endDate);
		trip.setMotive(motive);
		trip.setState(0);
		trip.setTraveller(traveller);
		trip.setTripId(tripId);
		
	//	TripDAO tdao = TripDAOImplementation.getInstance();
		tripdao.update( trip );
		
		resp.sendRedirect( req.getContextPath() + "/EmployeeServlet?email=" + email );
	}
}
