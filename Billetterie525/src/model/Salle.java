package model;

public class Salle {
	
	private String nom;
	private String adresse;
	private String ville;
	
	public Salle(String nom, String adresse,String ville) {
		this.nom = nom;
		this.adresse = adresse;
		this.ville = ville;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getAdresse() {
		return adresse;
	}
	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}
	
	public String getVille() {
		return ville;
	}
	public void setVille(String ville) {
		this.ville = ville;
	}

}
