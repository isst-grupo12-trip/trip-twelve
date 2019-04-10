package es.upm.dit.isst.webLab.model;
import java.io.Serializable;
import java.util.Collection;
import javax.persistence.*;
@Entity
public class Employee implements Serializable{
	@Id
	private String email;
	private String password;
	private String name;
	private String supervisor;
	
	@OneToMany(mappedBy = "traveller", fetch = FetchType.EAGER)
	private Collection<Trip> trips;
	
	public Employee() {
		
	}
	
}
