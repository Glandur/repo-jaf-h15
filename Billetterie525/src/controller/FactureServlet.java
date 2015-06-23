package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Client;
import model.Spectacle;


public class FactureServlet extends HttpServlet {

        public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                
                //PanierController panier = (PanierController)request.getSession().getAttribute("panierC");
        		PanierController panier = PanierController.getInstance();
                FactureController fCtrl = FactureController.getInstance();
                SpectacleController sCtrl= SpectacleController.getInstance();
                Client client = new Client(request.getParameter("nom"),
    					request.getParameter("prenom"),
    					request.getParameter("telephone"), 
    					request.getParameter("courriel"),
    					request.getParameter("adresse"),
                        request.getParameter("noApp"),
                        request.getParameter("ville"),
                        request.getParameter("codeP"),
                         request.getParameter("province"),request.getParameter("pays"),
                         request.getParameter("prenomP"),
                         request.getParameter("nomP"),
                          request.getParameter("ccNUM"),
                          request.getParameter("ccMois"),
                          request.getParameter("ccAnnee"),
                           request.getParameter("numVal"));
    			
                int nbE = panier.getReservations().size();
                request.setAttribute("nbElements", nbE);
                
                ArrayList<Spectacle> listeSpec = new ArrayList<Spectacle>();
                ArrayList<Integer> qte = new ArrayList<Integer>();
                
                
                for(int i=0;i<panier.getLstReserv().size();i++){
                	qte.add(panier.getLstReserv().get(i).getQte());
                        panier.getLstReserv().get(i).getRep().acheterBillets();
                        listeSpec.add(sCtrl.getSpectacle(panier.getLstReserv().get(i).getRep().getIdSpectacle()));                        
                }               
                request.setAttribute("representations", panier.getLstReserv());
                request.setAttribute("quantite", qte);
                request.setAttribute("spectacles", listeSpec);

                boolean transacOK=fCtrl.traiterPaiementDuPanier(client, panier.calculPrixTotal(),panier);
                request.setAttribute("transacOK", transacOK); 
                request.setAttribute("mesFact", fCtrl.getFactures().get(fCtrl.getFactures().size()-1).getMessage());
                request.setAttribute("mesID", fCtrl.getFactures().get(fCtrl.getFactures().size()-1).getID());
                request.setAttribute("mesStatut", fCtrl.getFactures().get(fCtrl.getFactures().size()-1).getStatus());

                
                
                RequestDispatcher dis=getServletContext().getRequestDispatcher("/facture.jsp");
        dis.forward(request, response);
        
        }
        public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                doGet(request,response);
        }

}
