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
import java.util.Collection;

import es.upm.dit.isst.webLab.dao.EmployeeDAO;
import es.upm.dit.isst.webLab.dao.EmployeeDAOImplementation;
import es.upm.dit.isst.webLab.dao.ReceiptDAO;
import es.upm.dit.isst.webLab.dao.ReceiptDAOImplementation;
import es.upm.dit.isst.webLab.dao.TripDAO;
import es.upm.dit.isst.webLab.dao.TripDAOImplementation;
import es.upm.dit.isst.webLab.model.Receipt;
import es.upm.dit.isst.webLab.model.Trip;

@WebServlet("/TripServlet")
public class TripServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int tripId = Integer.parseInt(req.getParameter( "tripId" ));
		Subject currentUser = SecurityUtils.getSubject();
		Trip trip = new Trip();
		TripDAO tripdao = TripDAOImplementation.getInstance();
		trip = tripdao.read(tripId);

		req.getSession().setAttribute( "receipt_list", trip.getReceipts());
		
		req.getSession().setAttribute("trip", trip);
		
		getServletContext().getRequestDispatcher( "/TripView.jsp?tripId=" + tripId + currentUser.getPrincipal()).forward( req, resp );
	}
}
