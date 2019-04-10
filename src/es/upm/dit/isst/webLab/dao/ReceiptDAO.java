package es.upm.dit.isst.webLab.dao;

import java.util.Collection;

import es.upm.dit.isst.webLab.model.Receipt;

public interface ReceiptDAO {

	public void create (Receipt receipt);
	public Receipt read (int receiptId);
	public void update (Receipt receipt);
	public void delete (Receipt receipt);
	public Collection<Receipt> readAll ();

}