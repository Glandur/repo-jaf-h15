package model;

import java.util.ArrayList;

import controller.SpectacleController;

public class FacadeRecherche {
	SpectacleController sControl = SpectacleController.getInstance();
	private ArrayList<Spectacle> list = sControl.getListeSpectacle();
	private ArrayList<Spectacle> returnedList = new ArrayList<Spectacle>();
	
	public FacadeRecherche(){
		
	}
	
	public ArrayList<Spectacle> rechercheSpectacle(String[] keyWords, String ville){
		returnedList.clear();
		
		if(!(keyWords.length == 1 && keyWords[0].contentEquals(""))){
		for(int i = 0 ; i < keyWords.length ; i++){
			for(int y = 0 ; y < list.size() ; y++){
				if(list.get(y).getArtiste().toLowerCase().contains(keyWords[i].toLowerCase())){
					if(!returnedList.contains(list.get(y)))
						returnedList.add(list.get(y));
					
				}
				if(list.get(y).getDescription().toLowerCase().contains(keyWords[i].toLowerCase())){
					if(!returnedList.contains(list.get(y)))
						returnedList.add(list.get(y));
					
				}
				if(list.get(y).getNom().toLowerCase().contains(keyWords[i].toLowerCase())){
					if(!returnedList.contains(list.get(y)))
						returnedList.add(list.get(y));
					
				}				
				if(list.get(y).getCategorie().toLowerCase().contains(keyWords[i].toLowerCase())){
					if(!returnedList.contains(list.get(y)))
						returnedList.add(list.get(y));
					
				}
			}
		}
		}
		
		if(ville != null & ville !=""){
				
			int i = 0;
			while(i < returnedList.size()){
				boolean salle = false;
				for(int y = 0 ; y < returnedList.get(i).getListeRepresentation().size() ; y++){
					if(returnedList.get(i).getListeRepresentation().get(y).getSalle().getVille().contains(ville))
						salle = true;
					}
			
				if(salle == false){
					returnedList.remove(i);
					i--;
				}
				i++;
			}		
		}
		
		
		return returnedList;
	}
	
	
	
	
}
