package model;

import gti525.paiement.ReponseSystemePaiementTO;
import gti525.paiement.RequeteAuthorisationTO;

import java.util.ArrayList;

public class Facture {

        private int id;
        private int prix;
        private String date;
        private String nomClient;
        private Client client;
        private PaiementDAO paiementDAO;
        protected ReponseSystemePaiementTO repFacture;
        
        private ArrayList<LigneFacture> lF;
        
        public Facture(){
                lF= new ArrayList<LigneFacture>();
        }
        
        public void ajouterRepresentation(Representation r,int quantite){
                lF.add(new LigneFacture(r, quantite));
        }
        
        public boolean payerFacture(double prixTotal){
        	paiementDAO = new PaiementDAO(date,client,prixTotal,id);
                ReponseSystemePaiementTO reponse = paiementDAO.effectuerPreauthorisation(paiementDAO.getInfo());
                
                if(reponse.getCode()==10200){
                        RequeteAuthorisationTO requeteAutorisationTO = new RequeteAuthorisationTO();
                        requeteAutorisationTO.setApi_key(paiementDAO.getInfo().getApi_key());
                        requeteAutorisationTO.setStore_id(paiementDAO.getInfo().getStore_id());
                        requeteAutorisationTO.setTransaction_id(reponse.getTransactionId());
                        ReponseSystemePaiementTO reponse2 =paiementDAO.approuverTransaction(requeteAutorisationTO);
                        paiementDAO.setCodeAuthorisation(reponse2.getCode());
                        repFacture = reponse;
                        return true;
  
                }
                else{
                        return false;
                }
        }

        public String getMessage(){
        	    return repFacture.getMessage();    	
        }
        public String getStatus(){
        	return repFacture.getStatus();
        }
        public String getID(){
        	return String.valueOf(repFacture.getTransactionId());
        }
        
        public int getId() {
                return id;
        }

        public void setId(int id) {
                this.id = id;
        }
        
        public int getPrix(){
        	return prix;
        }
        
        public void setPrix(int prix){
        	this.prix = prix;
        }

        public String getDate() {
                return date;
        }

        public void setDate(String date) {
                this.date = date;
        }

        public Client getClient() {
                return client;
        }

        public void setClient(Client client) {
                this.client = client;
        }

        public ArrayList<LigneFacture> getLignes() {
                return lF;
        }

        public void setLignes(ArrayList<LigneFacture> lignes) {
                this.lF = lignes;
        }

        public PaiementDAO getPaiement() {
                return paiementDAO;
        }

        public void setPaiement(PaiementDAO paiement) {
                this.paiementDAO = paiement;
        }

		public String getNomClient() {
			return nomClient;
		}

		public void setNomClient(String nomClient) {
			this.nomClient = nomClient;
		}
        
        
}