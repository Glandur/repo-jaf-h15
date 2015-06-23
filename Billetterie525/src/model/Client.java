package model;

public class Client {


	private String nom;
    private String prenom;
    private String telephone;
    private String courriel;
    //private int adr;
    private String adresse;
    private int noApp;
    private String ville;
    private String codePostal;
    private String province;
    private String pays;
    
    private String prenomP;
    private String nomP;
    private double noCC;
    private int expMois;
    private int expAnnee;
    private int noValidation;
    
	public Client(String nom, String prenom, String telephone, String courriel,
			String adresse, String noApp, String ville,
			String codePostal, String province, String pays,
			String prenomP, String nomP, String noCC, String expMois, String expAnnee,
			String noValidation) {
		this.nom = nom;
		this.prenom = prenom;
		this.telephone = telephone;
		this.courriel = courriel;
		//this.noCivique = noCivique;
		this.adresse = adresse;
		if(noApp.equals("")){
			this.noApp=9999;
		}
		else{
			this.noApp = Integer.parseInt(noApp);
		}
		this.ville = ville;
		this.codePostal = codePostal;
		this.province = province;
		this.pays = pays;
		this.prenomP = prenomP;
		this.nomP = nomP;
		this.noCC = Double.parseDouble(noCC);
		this.expMois = Integer.parseInt(expMois);
		this.expAnnee = Integer.parseInt(expAnnee);
		this.noValidation = Integer.parseInt(noValidation);
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getCourriel() {
		return courriel;
	}

	public void setCourriel(String courriel) {
		this.courriel = courriel;
	}

//	public int getNoCivique() {
//		return noCivique;
//	}
//
//	public void setNoCivique(int noCivique) {
//		this.noCivique = noCivique;
//	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	public int getNoApp() {
		return noApp;
	}

	public void setNoApp(int noApp) {
		this.noApp = noApp;
	}

	public String getVille() {
		return ville;
	}

	public void setVille(String ville) {
		this.ville = ville;
	}

	public String getCodePostal() {
		return codePostal;
	}

	public void setCodePostal(String codePostal) {
		this.codePostal = codePostal;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getPays() {
		return pays;
	}

	public void setPays(String pays) {
		this.pays = pays;
	}

	public String getPrenomP() {
		return prenomP;
	}

	public void setPrenomP(String prenomP) {
		this.prenomP = prenomP;
	}
	
	public String getNomP() {
		return prenomP;
	}

	public void setNomP(String nomP) {
		this.nomP = nomP;
	}

	public double getNoCC() {
		return noCC;
	}

	public void setNoCC(double noCC) {
		this.noCC = noCC;
	}

	public int getExpMois() {
		return expMois;
	}

	public void setExpMois(int expMois) {
		this.expMois = expMois;
	}

	public int getExpAnnee() {
		return expAnnee;
	}

	public void setExpAnnee(int expAnnee) {
		this.expAnnee = expAnnee;
	}

	public int getNoValidation() {
		return noValidation;
	}

	public void setNoValidation(int noValidation) {
		this.noValidation = noValidation;
	}
	
	

}
