package es.upm.dit.isst.webLab.servlets;

import java.io.IOException;

import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.crypto.hash.Sha256Hash;

import es.upm.dit.isst.webLab.dao.ProfessorDAO;
import es.upm.dit.isst.webLab.dao.ProfessorDAOImplementation;
import es.upm.dit.isst.webLab.dao.TFGDAO;
import es.upm.dit.isst.webLab.dao.TFGDAOImplementation;
import es.upm.dit.isst.webLab.model.Professor;
import es.upm.dit.isst.webLab.model.TFG;


@WebServlet("/CreateTFGServlet")
public class CreateTFGServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter( "name" );
		String password = req.getParameter( "password" );
		String email = req.getParameter( "email" );
		String title = req.getParameter( "title" );
		int status = 1;
		Professor advisor = (Professor) req.getAttribute( "advisor" );
	
		/* byte[] document = (byte[]) req.getAttribute( "document" );
		double grade = (double) req.getAttribute( "grade" );*/

		TFG tfg = new TFG();
		tfg.setName( name );
		tfg.setEmail( email );
		tfg.setTitle( title );
		tfg.setStatus(status);
		tfg.setAdvisor(advisor);
		
		tfg.setPassword( new Sha256Hash( password ).toString() );
		
		TFGDAO tfgdao = TFGDAOImplementation.getInstance();
		tfgdao.create( tfg );
		resp.sendRedirect( req.getContextPath() + "/AdminServlet" );
	}
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		TFGDAO tfgdao = TFGDAOImplementation.getInstance();
		req.getSession().setAttribute("tfg", tfgdao);
		getServletContext().getRequestDispatcher("/AdminView.jsp").forward(req, resp);
	}
	
}
