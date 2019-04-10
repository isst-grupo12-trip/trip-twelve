package es.upm.dit.isst.webLab.model;
import java.io.Serializable;
import java.util.Collection;

import javax.persistence.*;
@Entity
public class Receipt implements Serializable {
	@Id
	private int receiptId;
	private Byte[] image;
	private double amount;
	
	public Receipt() {
		
	}

	public int getReceiptId() {
		return receiptId;
	}

	public void setReceiptId(int receiptId) {
		this.receiptId = receiptId;
	}

	public Byte[] getImage() {
		return image;
	}

	public void setImage(Byte[] image) {
		this.image = image;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}
	
}
