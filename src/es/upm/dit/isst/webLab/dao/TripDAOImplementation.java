package es.upm.dit.isst.webLab.dao;

import java.util.Collection;

import org.hibernate.Session;

import es.upm.dit.isst.webLab.model.Trip;

public class TripDAOImplementation implements TripDAO {
	
	private static TripDAOImplementation instancia = null;
	
	private TripDAOImplementation() {}
	
	@Override
	public void create (Trip trip) {
		Session session = SessionFactoryService.get().openSession();
		try {
			session.beginTransaction();
			session.save(trip);
			session.getTransaction().commit();
		} catch (Exception e){
			//mensaje error
		} finally {
			session.close();
		}
	}
	
	@Override
	public void delete (Trip trip) {
		Session session = SessionFactoryService.get().openSession();
		try {
			session.beginTransaction();
			session.delete(trip);
			session.getTransaction().commit();
		} catch (Exception e){
			//mensaje error
		} finally {
			session.close();
		}
	}
	
	@Override
	public Trip read (int tripId) {
		Session session = SessionFactoryService.get().openSession();
		Trip trip = null;
		try {
			session.beginTransaction();
			trip = session.load(Trip.class, tripId);
			session.getTransaction().commit();
		} catch (Exception e){
			//mensaje error
		} finally {
			session.close();
		}
		return trip;
	}
	
	@Override
	public void update (Trip trip) {
		Session session = SessionFactoryService.get().openSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(trip);			
			session.getTransaction().commit();
		} catch (Exception e){
			//mensaje error
		} finally {
			session.close();
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Collection<Trip> readAll () {
		Session session = SessionFactoryService.get().openSession();
		Collection<Trip> trips = null;
		try {
			session.beginTransaction();
			trips = session.createQuery("from Trip").list();
			session.getTransaction().commit();
		} catch (Exception e){
			//mensaje error
		} finally {
			session.close();
		}
		return trips;
	}

	

	public static TripDAOImplementation getInstance() {
		if (null == instancia) 
			instancia = new TripDAOImplementation();
		return instancia;
	}

	
}
