package es.upm.dit.isst.webLab.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.upm.dit.isst.webLab.dao.ReceiptDAO;
import es.upm.dit.isst.webLab.dao.ReceiptDAOImplementation;
import es.upm.dit.isst.webLab.model.Receipt;
import es.upm.dit.isst.webLab.model.Trip;


@WebServlet("/EditReceiptServlet")
public class EditReceiptServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int receiptId = Integer.parseInt(req.getParameter("receiptId"));
		
		
		ReceiptDAO receiptdao = ReceiptDAOImplementation.getInstance();
		Receipt receipt = receiptdao.read(receiptId);
		
		double amount = receipt.getAmount();

		String motive = receipt.getMotive();
		
		byte[] image = receipt.getImage();
		
		Trip trip = receipt.getTrip();
		
		Receipt newReceipt = new Receipt();
		newReceipt.setAmount(amount);
		newReceipt.setTrip(trip);
		newReceipt.setReceiptId(0);
		newReceipt.setMotive(motive);
		newReceipt.setImage(image);
		
		
		
		ReceiptDAO rdao = ReceiptDAOImplementation.getInstance();
		rdao.update(receipt);
		
		res.sendRedirect( req.getContextPath() + "/TripServlet?tripId=" + trip.getTripId());

	}
}