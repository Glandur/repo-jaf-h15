import java.sql.SQLException;

import model.Facture;
import controller.DatabaseController;
import controller.FactureController;
import controller.SalleController;
import controller.SpectacleController;



public class maintesting {

	public static void main(String[] args) throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException {
		
		System.out.println("asd");
		DatabaseController dbc = DatabaseController.getInstance();
		
		dbc.ReserverBillet(12, 32);
		
		
		
	}

}
