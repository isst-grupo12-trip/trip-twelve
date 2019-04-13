package es.upm.dit.isst.webLab.model;
import java.io.Serializable;
import java.util.Collection;

import javax.persistence.*;
@Entity
public class Receipt implements Serializable {
	@Id
	@GeneratedValue(strategy=GenerationType.TABLE)
	private int receiptId;
	private Byte[] image;
	private double amount;
	private String motive;

	@ManyToOne
	private Trip trip;
	
	public Trip getTrip() {
		return trip;
	}

	public void setTrip(Trip trip) {
		this.trip = trip;
	}

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
	public String getMotive() {
		return motive;
	}

	public void setMotive(String motive) {
		this.motive = motive;
	}
	
}
