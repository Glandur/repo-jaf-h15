package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class ListeRechercheServlet extends HttpServlet {

        /**
	 * 
	 */
	
	
	private static final long serialVersionUID = 1343532321213L;
	
	public ListeRechercheServlet() {
	}
		public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			SalleController salleCtrl;
			try {
				salleCtrl = SalleController.getInstance();
			
			request.setAttribute("salles",salleCtrl.getListeSalles());
			SpectacleController specCtrl= SpectacleController.getInstance();
			
			// Il faut passer un tableau de string de mot a la requete, c'est ces mots que la recherche va utiliser pour aller trouver les spectacles
			String mots = request.getParameter("motsClef");
			
			String ville = request.getParameter("ville");
			
			String[] motsSplit = mots.split(" ");
			
			// Utiliser 
			request.setAttribute("lstRecherche", specCtrl.getRechercheSpectacle(motsSplit, ville));

            RequestDispatcher dis=getServletContext().getRequestDispatcher("/recherche.jsp");
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
        	doGet(request, response);
        }

}


