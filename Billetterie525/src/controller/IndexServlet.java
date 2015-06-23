
package controller;


import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class IndexServlet extends HttpServlet {

        /**
	 * 
	 */
	
	
	private static final long serialVersionUID = -2057458517351969609L;
	
	public IndexServlet() {
	}
		public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			try {
				
			
			request.setAttribute("salles",SalleController.getInstance().getListeSalles());
			//File f = new File(getServletContext().getRealPath("listeStub/listeSpectacle.xml"));
		//	System.out.print(getServletContext().getContextPath());
					//.getRealPath("listeSpectacle.xml"));
			
		//	System.out.print(f.getPath());
			SpectacleController specCtrl= SpectacleController.getInstance();
			//SpectacleController specCtrl= new SpectacleController();
		//	specCtrl.setXmlF(f);
                
                //Spectacle s = specCtrl.getSpectacle(0);
                request.setAttribute("s0", specCtrl.getSpectacle(11));
                request.setAttribute("s1", specCtrl.getSpectacle(12));
                request.setAttribute("s2", specCtrl.getSpectacle(13));
                request.setAttribute("s3", specCtrl.getSpectacle(14));

                RequestDispatcher dis=getServletContext().getRequestDispatcher("/index.jsp");
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