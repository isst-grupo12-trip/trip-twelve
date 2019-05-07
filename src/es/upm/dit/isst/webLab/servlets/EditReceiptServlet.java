package es.upm.dit.isst.webLab.servlets;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;

import org.h2.util.IOUtils;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

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

@WebServlet("/EditReceiptServlet")
@MultipartConfig
public class EditReceiptServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int receiptId =  Integer.parseInt(req.getParameter( "receiptId" ));		
		int tripId = Integer.parseInt(req.getParameter("tripId"));
		
		
		ReceiptDAO receiptdao = ReceiptDAOImplementation.getInstance();
		Receipt receipt = receiptdao.read(receiptId);
		
		Double amount = -1.0;
		try {
			amount = Double.parseDouble(req.getParameter("amount"));
		} catch (NullPointerException | NumberFormatException e) {
			e.printStackTrace();
		}
		Part filePart = req.getPart("attachment");
		String motive = req.getParameter("motive");

		TripDAO tdao = TripDAOImplementation.getInstance();
		
		InputStream fileContent = filePart.getInputStream();
		byte[] image = IOUtils.readBytesAndClose(fileContent, -1);
//		byte[] image = receipt.getImage();
		
		
		Trip trip = tdao.read(tripId);
		
		receipt.setAmount(amount);
		receipt.setTrip(trip);
		receipt.setMotive(motive);
		receipt.setImage(image);
		
		
		
		ReceiptDAO rdao = ReceiptDAOImplementation.getInstance();
		rdao.update(receipt);
		
		res.sendRedirect( req.getContextPath() + "/TripServlet?tripId=" + tripId + "#receipts");
	}
}