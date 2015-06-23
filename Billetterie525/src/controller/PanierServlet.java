package controller;
 
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
 

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 

import model.Representation;
import model.Spectacle;
 
public class PanierServlet extends HttpServlet {
 
        /**
       *
        */
       private static final long serialVersionUID = 3956749049484418857L;
      
      
       public PanierServlet() {
       }
             public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                    PanierController panierC = PanierController.getInstance();
                    SalleController salleCtrl;
					try {
						salleCtrl = SalleController.getInstance();
					
                    request.setAttribute("salles",salleCtrl.getListeSalles());
                    SpectacleController specCtrl = SpectacleController.getInstance();
                   
            
            request.setAttribute("panier", panierC);
            request.setAttribute("representations",panierC.getReservations());
          
           
            if (request.getParameter("Reserver") != null && request.getParameter("quantite") != null){
            	 int qte = Integer.parseInt(request.getParameter("quantite"));
            	 if(qte > 0){
	                 String ids = request.getParameter("res-val");
	                
	                 
	                String idSpectacle = ids.substring(0, ids.indexOf("."));
	                String idRepresentation = ids.substring(ids.indexOf(".")+1);
	            	Spectacle spec = specCtrl.getSpectacle(Integer.parseInt(idSpectacle));
	           
	            	panierC.ajoutItemPanier(spec.getRepresentation(Integer.parseInt(idRepresentation)), qte);
            	 }
            }
            else if(request.getParameter("delete") != null && request.getParameter("del-btn") != null){
            	panierC.supprimeItemPanier(Integer.parseInt(request.getParameter("X")));
            }
            else if(request.getParameter("vider-btn") != null){
            	panierC.viderPanier();            	
            }
             ArrayList<Spectacle> listeSpectacles = new ArrayList<Spectacle>();
            for(int i=0;i<panierC.getReservations().size();i++){
                   listeSpectacles.add(specCtrl.getSpectacle(panierC.getReservations().get(i).getRep().getIdSpectacle()));
            }
            request.setAttribute("spectacles", listeSpectacles);
            RequestDispatcher dis=getServletContext().getRequestDispatcher("/panier.jsp");
            dis.forward(request, response);
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
        public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                // TODO Auto-generated method stub
             request.getRequestDispatcher("/panier.jsp").forward(request, response);
        }
 
}