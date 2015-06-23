<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <title>Paiement</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="style.css" type="text/css" media="all" />
    <link rel="stylesheet" href="achat.css" type="text/css" media="all" />
</head>

<body>
<%@ page import="model.Salle"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="controller.PanierController"%>
<% String[] champs = (String[])request.getAttribute("champs");%>

    <div class="shell">

        <div id="header">
            <h1 id="logo"><a href="index">Billetterie525</a></h1>

             <div id="cart"> <a href="panier" class="cart-link">Votre panier</a>

                <div class="cl">&nbsp;</div>

                <span>Billets: <strong><%=String.valueOf(PanierController.getInstance().getQte())%></strong></span> &nbsp;&nbsp;

                <span>Total: <strong><%=String.valueOf(PanierController.getInstance().calculPrixTotal()) %></strong></span>

           </div>

            <div id="navigation">
                <ul>
                    <li><a href="index">Accueil</a>
                    </li>
                    <li><a href="spectacleliste">Spectacles</a>
                    </li>
                    <li><a href="contact">Contact</a>
                    </li>
                </ul>
            </div>

        </div>

        <div id="main">
            <div class="cl">&nbsp;</div>
            <div id="content">
                <div id="nav-paiement">
                    <ul>
                        <li>Panier
                        </li>
                        <li class="selected">Paiement
                        </li>
                        <li>Confirmation
                        </li>
                    </ul>
                </div>
                <div id="pmtinfo">
                    <div>
                        <form method="post" id="pf" name="pmt_form" action="facture" onsubmit="return validateForm()">
                            <div class="infos">
                                <h2>Informations d'identification</h2>
                                </br>
                                <div>Prénom:
                                    <input required name="prenom" type="text" size="50" value=<%=champs[0]%>></input>
                                </div>
                                <div>Nom:
                                    <input required name="nom" type="text" size="50" value=<%=champs[1]%> ></input>
                                </div>
                                <div>Courriel:
                                    <input required name="courriel" type="email" value="" size="50"value=<%=champs[3]%> ></input>
                                </div>
                                <div>Adresse: (No. civique et rue)
                                    <input required name="adresse" type="text" value="" size="50" value=<%=champs[4]%>></input>
                                </div>
                                 <div>No d'app :
                                    <input name="noApp" type="number" value="" size="50" value=<%=champs[5]%>></input> 
                                </div>
                                <div>Ville:
                                    <input required name="ville" type="text" value="" size="50" value=<%=champs[6]%>></input>
                                </div>
                                <div>Code Postal (en format X1X1X1 ou X1X 1X1):
                                    <input required pattern="^[ABCEGHJKLMNPRSTVXY]{1}\d{1}[A-Z]{1} *\d{1}[A-Z]{1}\d{1}$" name="codeP" type="text" value="" size="50" value=<%=champs[7]%>></input>
                                </div>
                                <div>Province:
                                    <input required name="province" type="text" value="" size="50" value=<%=champs[8]%>></input>
                                </div>
                                <div>Pays:
                                    <input required name="pays" type="text" value="" size="50" value=<%=champs[9]%>></input>
                                </div>
                                <div>Téléphone:
                                    <input type="text" required pattern="(\+?\d[- .]*){7,13}" name="telephone" value=<%=champs[2]%>></input>
                                </div>
                            </div>
                            <div class="cc">
                                <h2>Information Carte de crédit</h2>
                                </br>
                                <div>Numéro Carte de Crédit:</br>
                                    <input required name="ccNUM" type="text" size="19" maxlength="40" value=<%=champs[10]%>></input>
                                </div>
                                <div>Date d'expiration:</div>
                                <div>
                                    <select required name="ccMois">
                                        <option value="" selected="selected">--Mois-- </option>
                                        <option value="01" <%if(champs[11].equals("01")){%>selected="selected"<%}%>>Janvier (01) </option>
                                        <option value="02"<%if(champs[11].equals("02")){%>selected="selected"<%}%>>Février (02) </option>
                                        <option value="03"<%if(champs[11].equals("03")){%>selected="selected"<%}%>>Mars (03) </option>
                                        <option value="04"<%if(champs[11].equals("04")){%>selected="selected"<%}%>>Avril (04) </option>
                                        <option value="05"<%if(champs[11].equals("05")){%>selected="selected"<%}%>>Mai (05) </option>
                                        <option value="06"<%if(champs[11].equals("06")){%>selected="selected"<%}%>>Juin (06) </option>
                                        <option value="07"<%if(champs[11].equals("07")){%>selected="selected"<%}%>>Juillet (07) </option>
                                        <option value="08"<%if(champs[11].equals("08")){%>selected="selected"<%}%>>Août (08) </option>
                                        <option value="09"<%if(champs[11].equals("09")){%>selected="selected"<%}%>>Septembre (09) </option>
                                        <option value="10"<%if(champs[11].equals("10")){%>selected="selected"<%}%>>Octobre (10) </option>
                                        <option value="11"<%if(champs[11].equals("11")){%>selected="selected"<%}%>>Novembre (11) </option>
                                        <option value="12"<%if(champs[11].equals("12")){%>selected="selected"<%}%>>Décembre (12) </option>
                                    </select>
                                    
                                    <select required name="ccAnnee">
                                        <option value="" selected="selected">--Année-- </option>
                                        <option value="2015" <%if(champs[12].equals("2015")){%>selected="selected"<%}%>>2015 </option>
                                        <option value="2016"<%if(champs[12].equals("2016")){%>selected="selected"<%}%>>2016 </option>
                                        <option value="2017"<%if(champs[12].equals("2017")){%>selected="selected"<%}%>>2017 </option>
                                        <option value="2018"<%if(champs[12].equals("2018")){%>selected="selected"<%}%>>2018 </option>
                                        <option value="2019"<%if(champs[12].equals("2019")){%>selected="selected"<%}%>>2019 </option>
                                        <option value="2020"<%if(champs[12].equals("2020")){%>selected="selected"<%}%>>2020 </option>
                                        <option value="2021"<%if(champs[12].equals("2021")){%>selected="selected"<%}%>>2021 </option>
                                        <option value="2022"<%if(champs[12].equals("2022")){%>selected="selected"<%}%>>2022 </option>
                                        <option value="2022"<%if(champs[12].equals("2023")){%>selected="selected"<%}%>>2023 </option>
                                    </select><br>
                                    <div>Numéro de validation:
                                    <input required name="numVal" type="number" size="50" value=<%=champs[13]%>></input>
                                	</div>
                                    <div>Prénom du propriétaire:
                                    <input required name="prenomP" type="text" size="50" value=<%=champs[14]%>></input>
                                	</div>
                                	<div>Nom du propriétaire:
                                    <input required name="nomP" type="text" size="50" value=<%=champs[15]%>></input>
                                	</div>
                                	
                                    
                                    <div class="achat-btn">
                                        </br>
                                        <input name="confirm-btn" id="bc" type="submit" value="Acheter" readonly></a>
                                    </div>
                                </div>
					<script>
					function validateForm() {
					    var x = document.forms["pmt_form"]["fname"].value;
					    if (x == null || x == "") {
					        alert("Name must be filled out");
					        return false;
					    }
					}
					</script>

                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div id="sidebar">
            
                 <%@include file="sidebar.jsp" %>
            </div>
            <!-- End Sidebar -->
            <div class="cl">&nbsp;</div>
        </div>



    </div>
    <!-- Footer -->
    <div id="footer">
        <p class="left"> <a href="index">Accueil</a> <span>|</span> <a href="spectacleliste">Spectacles</a> <span>|</span><a href="contact">Contact</a> </p>
        <p class="right"> &copy; 2010 Shop Around. Design by <a href="http://chocotemplates.com">Chocotemplates.com</a> </p>
    </div>
    <!-- End Footer -->
    </div>
    <!-- End Shell -->
</body>

</html>
