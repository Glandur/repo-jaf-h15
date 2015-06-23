package model;

import java.util.Date;

public class Reservation {
	
	private Representation rep;
	private int qte;
	private long dateDebut;
	
	public Reservation(Representation r, int q) {
		rep = r;
		qte = q;
		dateDebut = (new Date().getTime());
				
	}

	public Representation getRep() {
		return rep;
	}

	public void setRep(Representation rep) {
		this.rep = rep;
	}

	public int getQte() {
		return qte;
	}

	public void setQte(int qte) {
		this.qte = qte;
	}
	
	
	public boolean isTooLate(){
		long dNow = (new Date().getTime());
		if((dNow-dateDebut)<(150000)){
			return false;
		}
		return true;
	}
	


}
