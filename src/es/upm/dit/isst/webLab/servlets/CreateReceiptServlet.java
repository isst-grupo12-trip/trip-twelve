package es.upm.dit.isst.webLab.servlets;

import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.h2.util.IOUtils;

import es.upm.dit.isst.webLab.dao.ReceiptDAO;
import es.upm.dit.isst.webLab.dao.ReceiptDAOImplementation;
import es.upm.dit.isst.webLab.dao.TripDAO;
import es.upm.dit.isst.webLab.dao.TripDAOImplementation;
import es.upm.dit.isst.webLab.model.Receipt;
import es.upm.dit.isst.webLab.model.Trip;

@WebServlet("/CreateReceiptServlet")
@MultipartConfig
public class CreateReceiptServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Double amount = -1.0;
		try {
			amount = Double.parseDouble(request.getParameter("amount"));
		} catch (NullPointerException | NumberFormatException e) {
			e.printStackTrace();
		}
		Part filePart = request.getPart("attachment");
		String motive = request.getParameter("motive");

		TripDAO tdao = TripDAOImplementation.getInstance();
		
		InputStream fileContent = filePart.getInputStream();
		byte[] image = IOUtils.readBytesAndClose(fileContent, -1);
		
		int tripId = Integer.parseInt(request.getParameter("tripId"));
		Trip trip = tdao.read(tripId);
		
		Receipt receipt = new Receipt();
		receipt.setAmount(amount);
		receipt.setTrip(trip);
		receipt.setReceiptId(0);
		receipt.setMotive(motive);
		receipt.setImage(image);
		
		
		
		ReceiptDAO rdao = ReceiptDAOImplementation.getInstance();
		rdao.create(receipt);
		
		response.sendRedirect( request.getContextPath() + "/TripServlet?tripId=" + tripId);
	}

}
