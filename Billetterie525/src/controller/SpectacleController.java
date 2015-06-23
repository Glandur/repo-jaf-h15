package controller;

import model.IListeSpectacle;
import model.Spectacle;
import model.FacadeRecherche;

import java.sql.SQLException;
import java.util.ArrayList;
public class SpectacleController {
	
    private static SpectacleController specCtrl;
    private ArrayList<Spectacle> listeSpectacle;
    private ArrayList<Spectacle> listeRechercheSpectacle;
    private static FacadeRecherche facade;
    private SpectacleController() throws ClassNotFoundException, InstantiationException, IllegalAccessException, SQLException{
    	listeSpectacle = DatabaseController.getInstance().spectacleList();
    	
    	//moar code here
            }
    
    public static SpectacleController getInstance(){
            if (specCtrl == null)
				try {
					specCtrl = new SpectacleController();
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
            return specCtrl;
    }
    
    public Spectacle getSpectacle(int id){
    	for(int i = 0 ; i < listeSpectacle.size(); i++){
            if(listeSpectacle.get(i).getIdSpectacle() == id)
    		return listeSpectacle.get(i);
    	}
    	return null;
    }
    
    public ArrayList<Spectacle> getListeSpectacle(){
            return listeSpectacle;
    }
    
    public ArrayList<Spectacle> getRechercheSpectacle(String[] keyWords, String ville){  		
    	if(facade == null)
    	facade = new FacadeRecherche();
    	
    		listeRechercheSpectacle = facade.rechercheSpectacle(keyWords, ville);
    		return listeRechercheSpectacle;
    }

//	public void setXmlF(File xmlF) {
//		this.xmlF = xmlF;
//	}
//    


}


