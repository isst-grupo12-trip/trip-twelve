package es.upm.dit.isst.webLab.dao;

import java.util.Collection;

import es.upm.dit.isst.webLab.model.Employee;

public interface EmployeeDAO {

	public void create (Employee employee);
	public Employee read (String email);
	public void update (Employee employee);
	public void delete (Employee employee);
	public Collection<Employee> readAll ();

}