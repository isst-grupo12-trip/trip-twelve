package es.upm.dit.isst.webLab.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.crypto.hash.Sha256Hash;

import es.upm.dit.isst.webLab.dao.EmployeeDAO;
import es.upm.dit.isst.webLab.dao.EmployeeDAOImplementation;
import es.upm.dit.isst.webLab.model.Employee;

@WebServlet("/CreateEmployeeServlet")
public class CreateEmployeeServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter( "name" );
		String password = req.getParameter( "password" );
		String email = req.getParameter( "email" );
		String supervisor = req.getParameter( "supervisorEmail" );
		
		Employee employee = new Employee();
		employee.setName( name );
		employee.setEmail( email );
		employee.setSupervisor( supervisor );
		
		employee.setPassword( new Sha256Hash( password ).toString() );
		
		EmployeeDAO edao = EmployeeDAOImplementation.getInstance();
		edao.create( employee );
		resp.sendRedirect( req.getContextPath() + "/AdminServlet" );
	}
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		EmployeeDAO edao = EmployeeDAOImplementation.getInstance();
		req.getSession().setAttribute("employee", edao);
		getServletContext().getRequestDispatcher("/AdminView.jsp").forward(req, resp);
	}
	
}
