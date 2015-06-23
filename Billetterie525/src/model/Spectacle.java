package model;

import java.util.ArrayList;

public class Spectacle {
	private int idSpectacle;
	private String nom;
	private String artiste;
	private String description;
	private String categorie;
	private String affichePath;
	private String iconePath;
	
	private ArrayList<Representation> listeRepresentation;
        
    public Spectacle(){
            listeRepresentation = new ArrayList<Representation>();
    }
    
    public RepresentationBean[] getRepresentations(){
            RepresentationBean[] representations = new RepresentationBean[listeRepresentation.size()];
            for (int i=0;i<listeRepresentation.size();i++)
                    representations[i] = listeRepresentation.get(i).getRepresentationBean();
            return representations;
    }
    
    public Representation getRepresentation(int id)
    {
            for(int i=0; i<listeRepresentation.size();i++)
            {
                    if(listeRepresentation.get(i).getId()==id){
                            return listeRepresentation.get(i);
                    }
            }
            return listeRepresentation.get(id);
    }
    
    public void addRepresentation(Representation r){
            listeRepresentation.add(r);
    }
    
    public String toString(){
            return "nom : " + nom + "    desc : " + description;
    }

	public int getIdSpectacle() {
		return idSpectacle;
	}

	public void setIdSpectacle(int idSpectacle) {
		this.idSpectacle = idSpectacle;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getArtiste() {
		return artiste;
	}

	public void setArtiste(String artiste) {
		this.artiste = artiste;
	}
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCategorie() {
		return categorie;
	}

	public void setCategorie(String categorie) {
		this.categorie = categorie;
	}

	public String getAffichePath() {
		return affichePath;
	}

	public void setAffichePath(String affichePath) {
		this.affichePath = affichePath;
	}
	
	public String getIconePath() {
		return iconePath;
	}

	public void setIconePath(String iconePath) {
		this.iconePath = iconePath;
	}

	public ArrayList<Representation> getListeRepresentation() {
		return listeRepresentation;
	}

	public void setListeRepresentation(ArrayList<Representation> listeRepresentation) {
		this.listeRepresentation = listeRepresentation;
	}
	
    
    
	
}
