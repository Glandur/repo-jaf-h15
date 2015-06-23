<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <title>Confirmation</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="style.css" type="text/css" media="all" />
    <link rel="stylesheet" href="achat.css" type="text/css" media="all" />
</head>
<body>
<%@ page import="model.Salle"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="controller.PanierController"%>
<%@ page import="controller.SpectacleController"%>
<%@ page import="model.Spectacle"%>
<%@ page import="model.Reservation"%>
<%@ page import="model.Representation"%>
<%@ page import="java.util.ArrayList" %>
  <%      	
ArrayList<Reservation> lr = (ArrayList<Reservation>)request.getAttribute("representations");
ArrayList<Integer> qte = (ArrayList<Integer>)request.getAttribute("quantite");
ArrayList<Spectacle> s = (ArrayList<Spectacle>)request.getAttribute("listeSpec");

    %>

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
                        <li>Paiement
                        </li>
                        <li class="selected">Confirmation
                        </li>
                    </ul>
                </div>
                <h2>Confirmation de l'achat et du paiement</h2>
                </br>
                                <div id="confirm-mess">
                               	<p><%=request.getAttribute("mesStatut") %></p>
                    	<p><%=request.getAttribute("mesFact") %>
                        <br /> Voici le numéro de confirmation de votre commande:
                        <br /> <%=request.getAttribute("mesID") %>
                        </br>Un courriel avec les e-tickets vous sera envoyé sous peu.</br>Merci d'avoir choisi Billetterie525</p>
                </div>
                <div id="facture">
                    <table>
                        <tr>
                        </tr>
                    </table>
                </div>

            </div>

            <div id="sidebar">
                 
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
