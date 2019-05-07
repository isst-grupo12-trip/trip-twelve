package es.upm.dit.isst.webLab.dao;

import java.util.Collection;

import org.hibernate.Session;

import es.upm.dit.isst.webLab.model.Receipt;

public class ReceiptDAOImplementation implements ReceiptDAO {
	
	private static ReceiptDAOImplementation instancia = null;
	
	private ReceiptDAOImplementation() {}

	@Override
	public void create (Receipt receipt) {
		Session session = SessionFactoryService.get().openSession();
		try {
			session.beginTransaction();
			session.save(receipt);
			session.getTransaction().commit();
		} catch (Exception e){
			//mensaje error
		} finally {
			session.close();
		}
	}
	
	@Override
	public void delete (Receipt receipt) {
		Session session = SessionFactoryService.get().openSession();
		try {
			session.beginTransaction();
			session.delete(receipt);
			session.getTransaction().commit();
		} catch (Exception e){
			//mensaje error
		} finally {
			session.close();
		}
	}
	
	@Override
	public Receipt read (int  receiptId) {
		Session session = SessionFactoryService.get().openSession();
		Receipt receipt = null;
		try {
			session.beginTransaction();
			receipt = session.load(Receipt.class, receiptId);
			session.getTransaction().commit();
		} catch (Exception e){
			//mensaje error
		} finally {
			session.close();
		}
		return receipt;
	}
	
	@Override
	public void update (Receipt receipt) {
		Session session = SessionFactoryService.get().openSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(receipt);			
			session.getTransaction().commit();
		} catch (Exception e){
			//mensaje error
		} finally {
			session.close();
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Collection<Receipt> readAll () {
		Session session = SessionFactoryService.get().openSession();
		Collection<Receipt> receipts = null;
		try {
			session.beginTransaction();
			receipts = session.createQuery("from Receipt").list();
			session.getTransaction().commit();
		} catch (Exception e){
			//mensaje error
		} finally {
			session.close();
		}
		return receipts;
	}
	
	public static ReceiptDAOImplementation getInstance() {
		if (null == instancia) 
			instancia = new ReceiptDAOImplementation();
		return instancia;
	}
	
}