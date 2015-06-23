package controller;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;


public class SessionListener implements HttpSessionListener{

	@Override
	public void sessionCreated(HttpSessionEvent event) {
		HttpSession session = event.getSession();
		PanierController pC = new PanierController();
		session.setAttribute("panierC", pC);
		session.setMaxInactiveInterval(10);	
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent event) {
		PanierController pC = (PanierController)event.getSession().getAttribute("panierC");
		pC.viderPanier(); 
		
	}

}