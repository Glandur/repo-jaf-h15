
package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ListeSpectacleServlet extends HttpServlet {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = -1903781564553956906L;
	public ListeSpectacleServlet() {
	}
		public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			//ArrayList<Spectacle> listSpectacles = new ArrayList<Spectacle>();
			SalleController salleCtrl;
			try {
				salleCtrl = SalleController.getInstance();
			
			request.setAttribute("salles",salleCtrl.getListeSalles());
			SpectacleController specCtrl= SpectacleController.getInstance();
			
			request.setAttribute("listeS",specCtrl.getListeSpectacle());
			//System.out.print(specCtrl.getListeSpectacle().size());
            RequestDispatcher dis=getServletContext().getRequestDispatcher("/spectacleliste.jsp");
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
        }

}