package es.upm.dit.isst.webLab.dao;

import java.util.Collection;

import org.hibernate.Session;

import es.upm.dit.isst.webLab.model.Employee;

public class EmployeeDAOImplementation implements EmployeeDAO {
	
	private static EmployeeDAOImplementation instancia = null;
	
	private EmployeeDAOImplementation() {}
	
	@Override
	public void create (Employee employee) {
		Session session = SessionFactoryService.get().openSession();
		try {
			session.beginTransaction();
			session.save(employee);
			session.getTransaction().commit();
		} catch (Exception e){
			//mensaje error
		} finally {
			session.close();
		}
	}
	
	@Override
	public void delete (Employee employee) {
		Session session = SessionFactoryService.get().openSession();
		try {
			session.beginTransaction();
			session.delete(employee);
			session.getTransaction().commit();
		} catch (Exception e){
			//mensaje error
		} finally {
			session.close();
		}
	}
	
	@Override
	public Employee read (String email) {
		Session session = SessionFactoryService.get().openSession();
		Employee employee = null;
		try {
			session.beginTransaction();
			employee = session.load(Employee.class, email);
			session.getTransaction().commit();
		} catch (Exception e){
			//mensaje error
		} finally {
			session.close();
		}
		return employee;
	}
	
	@Override
	public void update (Employee employee) {
		Session session = SessionFactoryService.get().openSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(employee);			
			session.getTransaction().commit();
		} catch (Exception e){
			//mensaje error
		} finally {
			session.close();
		}
	}
	
	@Override
	public Collection<Employee> readAll () {
		Session session = SessionFactoryService.get().openSession();
		Collection<Employee> employees = null;
		try {
			session.beginTransaction();
			employees = session.createQuery("select * from Employee").list();
			session.getTransaction().commit();
		} catch (Exception e){
			//mensaje error
		} finally {
			session.close();
		}
		return employees;
	}

	public static EmployeeDAOImplementation getInstance() {
		if (null == instancia) 
			instancia = new EmployeeDAOImplementation();
		return instancia;
	}
	
}
