package controller;

import model.ISalle;
import model.Salle;
import model.SalleStub;

import java.sql.SQLException;
import java.util.ArrayList;

public class SalleController {
    private static SalleController salleCtrl;
    private ArrayList<Salle> listeSalle;
    
   // private ArrayList<Salle> salles = new ArrayList<Salle>();
    private SalleController() {
    	
    	try {
			listeSalle = DatabaseController.getInstance().salleList();
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
    
    public static SalleController getInstance() throws ClassNotFoundException, InstantiationException, IllegalAccessException, SQLException{
            if (salleCtrl == null)
                    salleCtrl = new SalleController();
            return salleCtrl;
    }
    
    public ArrayList<Salle> getListeSalles()
    {
            return listeSalle;
    }

}
