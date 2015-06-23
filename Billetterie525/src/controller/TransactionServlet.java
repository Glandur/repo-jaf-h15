package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Client;


public class TransactionServlet extends HttpServlet {

        public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                String[] champs = new String[16];
                PanierController panier = (PanierController)request.getSession().getAttribute("panierC");
                int nbE=panier.getReservations().size();
                request.setAttribute("nbElements", nbE);
                
                for(int i=0;i<champs.length;i++)
                {
                        champs[i]="";
                }
                request.setAttribute("champs",champs);
                RequestDispatcher dis=getServletContext().getRequestDispatcher("/transaction.jsp");
        dis.forward(request, response);
        
        }
        public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                // TODO Auto-generated method stub
        }

}
