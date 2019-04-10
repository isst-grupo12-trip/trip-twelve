package es.upm.dit.isst.webLab.model;
import java.io.Serializable;
import java.util.Collection;

import javax.persistence.*;
@Entity
public class Receipt implements Serializable {
	@Id
	private int id;
	private Byte[] image;
	private double amount;
	
	public Receipt() {
		
	}
}
