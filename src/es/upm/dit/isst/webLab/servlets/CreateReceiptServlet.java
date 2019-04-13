package es.upm.dit.isst.webLab.servlets;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		double amount =(double) (request.getAttribute("amount"));
//		Byte[] image = (Byte[]) request.getAttribute("image");
		int tripId = (int) request.getAttribute("tripId");
		
		Receipt receipt = new Receipt();
		receipt.setAmount(amount);
//		receipt.setImage(image);
		
		TripDAO tdao = TripDAOImplementation.getInstance();
		Trip trip = tdao.read(tripId);
		
		
		Collection<Receipt> receipts = trip.getReceipts();
		receipts.add(receipt);
		
		trip.setReceipts(receipts);
		
		tdao.update(trip);
		
		response.sendRedirect( request.getContextPath() + "/TripServlet");
	}

}
