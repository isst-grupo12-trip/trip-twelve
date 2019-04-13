package es.upm.dit.isst.webLab.dao;

import java.util.Collection;

import es.upm.dit.isst.webLab.model.Receipt;
import es.upm.dit.isst.webLab.model.Trip;

public interface TripDAO {
	
	public void create (Trip trip);
	public Trip read (int tripId);
	public void update (Trip trip);
	public void delete (Trip trip);
	public Collection<Trip> readAll ();

}
