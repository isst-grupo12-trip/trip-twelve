package es.upm.dit.isst.webLab.servlets;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.upm.dit.isst.webLab.dao.ReceiptDAO;
import es.upm.dit.isst.webLab.dao.ReceiptDAOImplementation;
import es.upm.dit.isst.webLab.dao.TripDAO;
import es.upm.dit.isst.webLab.dao.TripDAOImplementation;
import es.upm.dit.isst.webLab.model.Receipt;
import es.upm.dit.isst.webLab.model.Trip;

@WebServlet("/CreateReceiptServlet")
public class CreateReceiptServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		double amount =Double.parseDouble(request.getParameter("amount"));
//		Byte[] image = (Byte[]) request.getParameter("image");
		String motive = request.getParameter("motive");
		
		int tripId = Integer.parseInt(request.getParameter("tripId"));
		TripDAO tdao = TripDAOImplementation.getInstance();
		Trip trip = tdao.read(tripId);
		
		Receipt receipt = new Receipt();
		receipt.setAmount(amount);
		receipt.setTrip(trip);
		receipt.setReceiptId(0);
		receipt.setMotive(motive);
//		receipt.setImage(image);
		
		
		
		ReceiptDAO rdao = ReceiptDAOImplementation.getInstance();
		rdao.create(receipt);
		
		response.sendRedirect( request.getContextPath() + "/TripServlet?tripId=" + tripId);
	}

}
