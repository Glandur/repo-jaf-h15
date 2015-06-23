
package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PaiementServlet extends HttpServlet {

        /**
	 * 
	 */
	private static final long serialVersionUID = 3956749049484418857L;
	
	
	public PaiementServlet() {
	}
		public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			SalleController salleCtrl;
			try {
				salleCtrl = SalleController.getInstance();
			
			request.setAttribute("salles",salleCtrl.getListeSalles());
			String[] champs = new String[16];
            PanierController panier = (PanierController)request.getSession().getAttribute("panierC");
            
            int nb = panier.getReservations().size();
            request.setAttribute("nb", nb);
            
            for(int i=0;i<champs.length;i++)
            {
                    champs[i]="";
            }
            request.setAttribute("champs",champs);

            RequestDispatcher dis=getServletContext().getRequestDispatcher("/paiement.jsp");
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
        	//
        }

}