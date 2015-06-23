package model;

import gti525.paiement.IPaiementDAO;
import gti525.paiement.InformationsPaiementTO;
import gti525.paiement.ReponseSystemePaiementTO;
import gti525.paiement.RequeteAuthorisationTO;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.math.MathContext;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;



public class PaiementDAO implements IPaiementDAO{
        
        private String date;
        private int codeAuthorisation;
        private InformationsPaiementTO info;
        private RequeteAuthorisationTO req;
        
        private String baseUrl = "http://gti525.herokuapp.com/transactions";
        JSONParser parser = new JSONParser();
        
        public PaiementDAO(String date,Client client,double prixTotal,int idFacture){
                this.date = date;
                BigDecimal prix = new BigDecimal(prixTotal, MathContext.DECIMAL64);
                info = new InformationsPaiementTO();
                info.setAmount(prix);
                info.setApi_key("8c1a2f3ba0e08cf6d5f5");
                info.setCard_number((long)client.getNoCC());
                info.setSecurity_code(client.getNoValidation());
                info.setFirst_name(client.getPrenomP());
                info.setLast_name(client.getNomP());
                info.setMonth(client.getExpMois());
                info.setYear(client.getExpAnnee());
                info.setOrder_id(1);
                info.setStore_id(1);
                
        }
        
        public String getDate() {
                return date;
        }

        public void setDate(String date) {
                this.date = date;
        }

        public int getCodeAuthorisation() {
                return codeAuthorisation;
        }

        public void setCodeAuthorisation(int codeAuthorisation) {
                this.codeAuthorisation = codeAuthorisation;
        }

        public InformationsPaiementTO getInfo() {
                return info;
        }

        public void setInfo(InformationsPaiementTO info) {
                this.info = info;
        }
        
        public RequeteAuthorisationTO getReq() {
                return req;
        }

        public void setReq(RequeteAuthorisationTO req) {
                this.req = req;
        }

        @Override
        public ReponseSystemePaiementTO approuverTransaction(RequeteAuthorisationTO requeteAutorisationTO) {
                
                ReponseSystemePaiementTO reponse = new ReponseSystemePaiementTO();              
                URL url = null;
        String link = baseUrl + "/"+requeteAutorisationTO.getTransaction_id()+".json?" +
                                "api_key="              + requeteAutorisationTO.getApi_key()            +       
                                "&store_id="    + requeteAutorisationTO.getStore_id()           ;
        System.out.println(link);
                                
                try {
                                url = new URL(link);
                        URLConnection conn = url.openConnection();
                        ((HttpURLConnection) conn).setRequestMethod("GET");
                        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                       
                        String jsonString="";
                        String line; while ((line = in.readLine()) != null) {
                            jsonString += line;
                        }
                        JSONObject  jsonObject = (JSONObject) parser.parse( jsonString );       
                        jsonObject =  (JSONObject) jsonObject.get("order");
                        
                        String status = (String) jsonObject.get("status");
                        if (status.equals("Completed")) {
                        reponse.setMessage(jsonObject.get("messages").toString());                      
                                reponse.setCode((Integer.valueOf(jsonObject.get("code").toString())));
                                reponse.setTransactionId(Integer.valueOf(jsonObject.get("transaction_id").toString()));
                                reponse.setStatus(jsonObject.get("status").toString());
                    }
                } catch (MalformedURLException e) {
                        e.printStackTrace();
                } catch (IOException e) {
                        e.printStackTrace();
                } catch (ParseException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                }
                return reponse; 
        }

        @Override
        public ReponseSystemePaiementTO effectuerPreauthorisation(InformationsPaiementTO informationPaiementTO) {
                
                ReponseSystemePaiementTO reponse = new ReponseSystemePaiementTO();      
        URL url = null;
        String link = baseUrl + ".json?" +
                                "api_key="              + informationPaiementTO.getApi_key()            +       
                                "&order_id="            + informationPaiementTO.getOrder_id()   +       
                                "&store_id="    + informationPaiementTO.getStore_id()           +
                                "&amount="              + informationPaiementTO.getAmount()                     +
                                "&first_name="  + informationPaiementTO.getFirst_name()         + 
                                "&last_name="   + informationPaiementTO.getLast_name()          +
                                "&card_number=" + informationPaiementTO.getCard_number()        +
                                "&security_code="+ informationPaiementTO.getSecurity_code()     +
                                "&year="                        + informationPaiementTO.getYear()               +
                                "&month="               + informationPaiementTO.getMonth();
                try {
                                url = new URL(link);
                        URLConnection conn = url.openConnection();
                        ((HttpURLConnection) conn).setRequestMethod("POST");
                        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                       
                        String jsonString="";
                        String line; 
                        while ((line = in.readLine()) != null) {
                            jsonString += line;
                        }
                        
                        JSONObject  jsonObject = (JSONObject) parser.parse( jsonString );       
                        jsonObject =  (JSONObject) jsonObject.get("order");
                        
                        String status = (String) jsonObject.get("status");
                        
                        if (status.equals("Accepted")) {
                        reponse.setMessage( jsonObject.get("messages").toString());                     
                                reponse.setCode((Integer.valueOf(jsonObject.get("code").toString())));
                                reponse.setTransactionId(Integer.valueOf(jsonObject.get("transaction_id").toString()));
                                reponse.setStatus( jsonObject.get("status").toString());
                    }
                                
                } catch (MalformedURLException e) {
                        e.printStackTrace();
                } catch (IOException e) {
                        e.printStackTrace();
                } catch (org.json.simple.parser.ParseException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                }
                
                return reponse;
                
        }

}