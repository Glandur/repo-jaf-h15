
package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ContactServlet extends HttpServlet {

        /**
	 * 
	 */
	private static final long serialVersionUID = 3956749049484418857L;
	
	
	public ContactServlet() {
	}
		public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			SalleController salleCtrl;
			try {
				salleCtrl = SalleController.getInstance();
			
			request.setAttribute("salles",salleCtrl.getListeSalles());
			
            RequestDispatcher dis=getServletContext().getRequestDispatcher("/contact.jsp");
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