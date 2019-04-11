package es.upm.dit.isst.webLab.servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import es.upm.dit.isst.webLab.dao.ProfessorDAO;
import es.upm.dit.isst.webLab.dao.ProfessorDAOImplementation;
import es.upm.dit.isst.webLab.dao.TripDAO;
import es.upm.dit.isst.webLab.dao.TripDAOImplementation;
import es.upm.dit.isst.webLab.model.Professor;
import es.upm.dit.isst.webLab.model.Trip;

@WebServlet("/CreateTripServlet")
public class CreateTripServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String destiny = req.getParameter( "destination" );
		Date startDate = null;
		try {
			startDate = new SimpleDateFormat("dd/MM/yyyy").parse(req.getParameter( "startDate" ));
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		Date endDate = null;
		try {
			endDate = new SimpleDateFormat("dd/MM/yyyy").parse(req.getParameter( "endDate" ));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		String motive = req.getParameter("motive");
		Double amount = Double.parseDouble(req.getParameter("amount"));
		Trip trip = new Trip();
		trip.setDestiny(destiny);
		trip.setAmount(amount);
		trip.setStartDate(startDate);
		trip.setEndDate(endDate);
		trip.setMotive(motive);
		
		
		TripDAO tdao = TripDAOImplementation.getInstance();
		tdao.create( trip );
		
		getServletContext().getRequestDispatcher("/EmployeeView.jsp").forward(req, resp);
	}

}
