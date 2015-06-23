package controller;

import java.util.ArrayList;
 
import model.Reservation;
import model.Representation;
 
public class PanierController {
 
    private static PanierController pCtrl;
       private ArrayList<Reservation> reservations;
 
       public PanierController(){
             reservations = new ArrayList<Reservation>();         
       }
 
       public ArrayList<Reservation> getReservations() {
             for (int i=0;i<reservations.size();i++){
            if (reservations.get(i).isTooLate())
            {
                    this.supprimeItemPanier(i);
            }
    }
             return reservations;
       }
      
    public static PanierController getInstance(){
        if (pCtrl == null)
             pCtrl = new PanierController();
        return pCtrl;
}
 
       public int getQte(){
             int qt=0;
            
             for(int i=0; i<reservations.size();i++){
                    qt= qt+ reservations.get(i).getQte();
             }
            
             return qt;
       }
      
       public void viderPanier(){
             for(int i = 0; i < reservations.size(); i++){
                    reservations.get(i).getRep().annulerReservation();
             }
             reservations = new ArrayList<Reservation>();
       }
      
       public int calculPrixTotal(){
             int prixTotal = 0;
             for(int i = 0; i <reservations.size(); i++){
                    prixTotal += reservations.get(i).getQte() * reservations.get(i).getRep().getPrix();
             }
            
             return prixTotal;
       }
      
   
       public void ajoutItemPanier(Representation r, int qte){
             if(r.reserverBillets(qte)){
                    reservations.add(new Reservation(r, qte));
             }
       }
      
       public void acheterPanier(){
             for(int i = 0 ; i < reservations.size(); i++){
            
            	 //databasecontroller.acheterbillet(reservID, quantite);
            	 
            	 reservations.get(i).getRep().acheterBillets();
             
             }
            
             
             
             viderPanier();
            
       }
      
       public void modifQuantiteReserv(int index, int qte){
             int q = qte - reservations.get(index).getQte();
            
             if(q <= 0 || reservations.get(index).getRep().reserverBillets(q)){
                    reservations.set(index, new Reservation(reservations.get(index).getRep(), qte));
             }
       }
      
       public void supprimeItemPanier(int index){
             reservations.get(index).getRep().annulerReservation();
             reservations.remove(index);
       }
   
       public ArrayList<Reservation> getLstReserv(){
             return reservations;
       }
}