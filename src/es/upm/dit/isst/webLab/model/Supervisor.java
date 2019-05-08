package es.upm.dit.isst.webLab.model;

import java.util.Collection;

import javax.persistence.FetchType;
import javax.persistence.OneToMany;

@SuppressWarnings("serial")
public class Supervisor extends Employee {
	
	@OneToMany(mappedBy = "supervisor", fetch = FetchType.EAGER)
	private Collection<Trip> supervisedTrips;
	
	public Supervisor() {
		super();
	}

	public Collection<Trip> getSupervisedTrips() {
		return supervisedTrips;
	}

	public void setSupervisedTrips(Collection<Trip> supervisedTrips) {
		this.supervisedTrips = supervisedTrips;
	}

}
