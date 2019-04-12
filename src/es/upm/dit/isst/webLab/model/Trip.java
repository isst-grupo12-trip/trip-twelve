package es.upm.dit.isst.webLab.model;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;

import javax.persistence.*;
@Entity
public class Trip implements Serializable{
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int tripId;
	private String destiny;
	private Date startDate;
	private Date endDate;
	private String motive;
	private int state;
	private Employee traveller;

	private double amount;
	@OneToMany
	private Collection<Receipt> receipts;
	
	public Trip() {
		
	}

	public int getTripId() {
		return tripId;
	}

	public void setTripId(int tripId) {
		this.tripId = tripId;
	}

	public String getDestiny() {
		return destiny;
	}

	public void setDestiny(String destiny) {
		this.destiny = destiny;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getMotive() {
		return motive;
	}

	public void setMotive(String motive) {
		this.motive = motive;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public Employee getTraveller() {
		return traveller;
	}

	public void setTraveller(Employee traveller) {
		this.traveller = traveller;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public Collection<Receipt> getReceipts() {
		return receipts;
	}

	public void setReceipts(Collection<Receipt> receipts) {
		this.receipts = receipts;
	}
	
}
