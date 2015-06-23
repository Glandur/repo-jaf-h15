package controller;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import model.Client;
import model.Facture;

public class FactureController {

        private static FactureController instance;
        private ArrayList<Facture> factures;
        private int id;
        private FactureController(){
                
                try {
     factures = DatabaseController.getInstance().factureList();
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
                id=factures.size()+1;
        }
        
        public static FactureController getInstance(){
                if (instance == null)
                        instance = new FactureController();
                return instance;
        }
        
        public boolean traiterPaiementDuPanier(Client c, double prixTotal, PanierController panier){
                Facture facture=new Facture();
                facture.setClient(c);
                DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
                Date date = new Date();
                facture.setDate(dateFormat.format(date));
                facture.setNomClient(c.getPrenom() + " " +c.getNom());
                facture.setId(id);
                facture.setPrix((int) prixTotal);
                id=id++;
                
                for(int i=0; i<panier.getLstReserv().size(); i++)
                {
                        facture.ajouterRepresentation(panier.getLstReserv().get(i).getRep(),panier.getLstReserv().get(i).getQte());
                }
                
                boolean transacOK = facture.payerFacture(prixTotal);
                
                if(transacOK==true){
                        factures.add(facture);
                        
                        try {
							DatabaseController.getInstance().ecrireFacture(facture);
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
                        panier.acheterPanier();
                        return true;
                }
                else{
                        return false;
                }                         
        }
        
        public ArrayList<Facture> getFactures()
        {
                return factures;
        }
        
}