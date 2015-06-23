package model;

import java.sql.SQLException;

import controller.DatabaseController;

public class Representation {

	private int id;
	private int idSpectacle;
	private String date;
	private double prix;
	private int nbBillets;
	private int nbBilletsVendus;
	private int nbBilletsReservation;
	private Salle salle;
	private int state;
	
    public Representation(){
    }
    
    public RepresentationBean getRepresentationBean(){
        RepresentationBean bean = new RepresentationBean();
        bean.setSalle(salle);
        bean.setDate(date);
        bean.setNbBilletsDispo(getNbBilletsDispo());
        bean.setPrix(prix);
        bean.setId(id);
        bean.setIdSpectacle(idSpectacle);
        return bean;
    }
    
    public int getNbBilletsDispo(){
        return nbBillets - nbBilletsReservation-nbBilletsVendus;
    }
    
    public boolean reserverBillets(int quantite){
        if (quantite <= getNbBilletsDispo()){
                nbBilletsReservation += quantite;
                return true;
        }
        return false;
    }
    
    public void annulerReservation(){
    	nbBilletsReservation = 0;
    }
    
    public void acheterBillets(){
    	
    	nbBilletsVendus += nbBilletsReservation;
    	nbBilletsReservation = 0;
    	
    	try {
			DatabaseController.getInstance().ReserverBillet(this.id,this.nbBilletsVendus);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    }

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getIdSpectacle() {
		return idSpectacle;
	}

	public void setIdSpectacle(int idSpectacle) {
		this.idSpectacle = idSpectacle;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public double getPrix() {
		return prix;
	}

	public void setPrix(double prix) {
		this.prix = prix;
	}

	public int getNbBillets() {
		return nbBillets;
	}

	public void setNbBillets(int nbBillets) {
		this.nbBillets = nbBillets;
	}

	public int getNbBilletsVendus() {
		return nbBilletsVendus;
	}

	public void setNbBilletsVendus(int nbBilletsVendus) {
		this.nbBilletsVendus = nbBilletsVendus;
	}

	public int getNbBilletsReservation() {
		return nbBilletsReservation;
	}

	public void setNbBilletsReservation(int nbBilletsReservation) {
		this.nbBilletsReservation = nbBilletsReservation;
	}

	public Salle getSalle() {
		return salle;
	}

	public void setSalle(Salle salle) {
		this.salle = salle;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

    
    
	
}
