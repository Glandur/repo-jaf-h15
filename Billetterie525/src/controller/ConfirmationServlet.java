
package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Client;

public class ConfirmationServlet extends HttpServlet {

        /**
	 * 
	 */
	private static final long serialVersionUID = 3956749049484418857L;
	
	
	public ConfirmationServlet() {
	}
		public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			SalleController salleCtrl;
			try {
				salleCtrl = SalleController.getInstance();
			
			request.setAttribute("salles",salleCtrl.getListeSalles());
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
			
			
			
            RequestDispatcher dis=getServletContext().getRequestDispatcher("/confirmation.jsp");
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
               doGet(request,response);
        }

}