package model;

public class RepresentationBean {
	
	 private int id;
     private int idSpectacle;
     private Salle salle;
     private int nbBilletsDispo;
     private String date;
     private double prix;
     
     
     
     public RepresentationBean(){
         
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



	public Salle getSalle() {
		return salle;
	}



	public void setSalle(Salle salle) {
		this.salle = salle;
	}



	public int getNbBilletsDispo() {
		return nbBilletsDispo;
	}



	public void setNbBilletsDispo(int nbBilletsDispo) {
		this.nbBilletsDispo = nbBilletsDispo;
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

     
}