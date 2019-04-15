package es.upm.dit.isst.webLab.servlets;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

@WebServlet("/ShowImageServlet")
public class ShowImageServlet extends HttpServlet {

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int receiptId =  Integer.parseInt(request.getParameter( "receiptId" ));
        Receipt receipt = new Receipt();
        ReceiptDAO recdao = ReceiptDAOImplementation.getInstance();
		receipt = recdao.read(receiptId);
        		
		byte[] receiptImageBytes = receipt.getImage();
		InputStream in = new ByteArrayInputStream(receiptImageBytes);
		BufferedImage receiptImage = ImageIO.read(in);
		
		response.setContentType("image/jpeg");
		OutputStream out = response.getOutputStream();
		ImageIO.write(receiptImage, "jpg", out);
		out.close();
	}
}
