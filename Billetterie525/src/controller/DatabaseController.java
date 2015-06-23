package controller;
import java.sql.*;
import java.util.ArrayList;

import model.Client;
import model.Facture;
import model.Representation;
import model.Salle;
import model.Spectacle;

public class DatabaseController {
	private static DatabaseController DBCtrl;
	private static Connection con;
	private static Statement stmt;
	
	
	private DatabaseController() throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException{
		
		
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con = DriverManager.getConnection("jdbc:mysql://localhost/gti525labo4?" + "user=root&password=amitlu1");
			Statement stmt = con.createStatement();
		
	}
	
	public static DatabaseController getInstance() throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException{
		if(DBCtrl == null){
			DBCtrl = new DatabaseController();
		}
		
		return DBCtrl;
		
	}
	
	public ArrayList<Salle> salleList() throws SQLException{
		ArrayList<Salle> salleArray = new ArrayList<Salle>();
		
		PreparedStatement ps = con.prepareStatement("SELECT * FROM salles");
		ResultSet rs = ps.executeQuery();

		while(rs.next()){
			Salle s = new Salle("salle" + rs.getInt(1), rs.getString(2), rs.getString(3));
			salleArray.add(s);	
		}		
		return salleArray;
	}
	
	
	public ArrayList<Spectacle> spectacleList() throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException{
	
		ArrayList<Representation> lstRepresentation = new ArrayList<Representation>();
		PreparedStatement ps1 = con.prepareStatement("SELECT * FROM representations");
		ResultSet rs1 = ps1.executeQuery();
		
		while(rs1.next()){
			Representation repTemp = new Representation();
			repTemp.setId(rs1.getInt(1));
			repTemp.setDate(rs1.getString(2));
			repTemp.setPrix(rs1.getInt(3));
			repTemp.setIdSpectacle(rs1.getInt(4));
			Salle salle = SalleController.getInstance().getListeSalles().get(rs1.getInt(5));
			repTemp.setSalle(salle);
			repTemp.setNbBillets(rs1.getInt(6));
			repTemp.setNbBilletsReservation(rs1.getInt(7));
			
			lstRepresentation.add(repTemp);
		}
		
		ArrayList<Spectacle> spectacleArray = new ArrayList<Spectacle>();
		PreparedStatement ps2 = con.prepareStatement("SELECT * FROM spectacles");
		ResultSet rs2 = ps2.executeQuery();
		
		while(rs2.next()){
			Spectacle specTemp = new Spectacle() ;
			specTemp.setIdSpectacle(rs2.getInt(1));
			specTemp.setDescription(rs2.getString(2));
			specTemp.setNom(rs2.getString(3));
			specTemp.setArtiste(rs2.getString(4));
			specTemp.setCategorie(rs2.getString(5));
			specTemp.setAffichePath(rs2.getString(6));
			specTemp.setIconePath(rs2.getString(7));
			
			for(int i = 0 ; i < lstRepresentation.size(); i++){
				if(lstRepresentation.get(i).getIdSpectacle() == specTemp.getIdSpectacle())
					specTemp.addRepresentation(lstRepresentation.get(i));
			}
			
			spectacleArray.add(specTemp);
		}
		
		
		return spectacleArray;
	}
	
	public ArrayList<Facture> factureList() throws SQLException {
		
		ArrayList<Facture> factureArray = new ArrayList<Facture>();
		
		PreparedStatement ps = con.prepareStatement("SELECT * FROM factures");
		ResultSet rs = ps.executeQuery();

		while(rs.next()){
			Facture f = new Facture();
			f.setId(rs.getInt(1));
			f.setDate(rs.getString(2));
			f.setNomClient(rs.getString(3));
			f.setPrix(rs.getInt(4));
			factureArray.add(f);	
		}		
		return factureArray;
		
	}
	
	public void ecrireFacture(Facture facture) throws SQLException {
		
		PreparedStatement ps = con.prepareStatement("INSERT INTO factures (idFactures, date, nomClient, prix) values (?, ?, ?, ?)");
		ps.setInt(1, facture.getId());
		ps.setString(2, facture.getDate());
		ps.setString(3, facture.getNomClient());
		ps.setInt(4, facture.getPrix());
		
		ps.executeUpdate();
		
	}

	public void ReserverBillet(int id, int nbBilletsVendus) throws SQLException {
		
		PreparedStatement ps = con.prepareStatement("UPDATE representations SET nbBilletsReserver=? where idRepresentations=?");
		ps.setInt(1, nbBilletsVendus);
		ps.setInt(2, id);
		
		ps.executeUpdate();
		
	}

}