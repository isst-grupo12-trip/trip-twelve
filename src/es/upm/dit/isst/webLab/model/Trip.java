package es.upm.dit.isst.webLab.model;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;

import javax.persistence.*;
@Entity
public class Trip implements Serializable{
	
	@Id
	private int tripId;
	private String destiny;
	private Date startDate;
	private Date endDate;
	private String motive;
	private String state;
	private String traveller;

	private double amount;
	@OneToMany
	private Collection<Receipt> receipts;
	
	public Trip() {
		
	}
	
}
