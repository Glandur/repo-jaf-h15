package model;

import java.util.ArrayList;


public class SalleStub extends ArrayList<Salle> implements ISalle {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3448028687949704623L;

	
	public SalleStub(){
		 
		 this.add(0, new Salle("Salle0","12 rue V","Montreal"));
		 this.add(1, new Salle("Salle1","34 rue W", "Brossard"));
		 this.add(2, new Salle("Salle2","56 rue X", "Longueuil"));
		 this.add(3, new Salle("Salle3","78 rue Y", "Laval"));
		 this.add(4, new Salle("Salle4","90 rue Z", "Montreal"));
		 		 
	}
	    

	@Override
	public ArrayList<Salle> getSalles() {
		// TODO Auto-generated method stub
		return this;
	}

	@Override
	public Salle getSalle(int id) {
		// TODO Auto-generated method stub
		return this.get(id);
	}

}
