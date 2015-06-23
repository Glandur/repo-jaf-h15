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
<script src="jquery-1.4.1.min.js"></script>
<%@ page import="model.Salle"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="controller.PanierController"%>
<%@ page import="controller.SpectacleController"%>
<%@ page import="model.Spectacle"%>
<%@ page import="model.Reservation"%>
<%@ page import="model.Representation"%>
<%@ page import="java.util.ArrayList" %>

<%     PanierController panierC = PanierController.getInstance();
       SpectacleController cntrl = SpectacleController.getInstance();%>

    <div class="shell">
        <div id="header">
            <h1 id="logo"><a href="index">Billetterie525</a></h1>
             <div id="cart"> <a href="panier" class="cart-link">Votre panier</a>
                <div class="cl">&nbsp;</div>
                <span>Billets: <strong>0</strong></span> &nbsp;&nbsp;
                <span>Total: <strong>0</strong></span>
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
                        <li><a href="panier">Panier</a>
                        </li>
                        <li><a href="paiement">Paiement</a>
                        </li>
                        <li class="selected"><a href="confirmation">Confirmation</a>
                        </li>
                    </ul>
                </div>
                <h2>Confirmation de l'achat et du paiement</h2>
                </br>
                <div id="confirm-mess">
                    <p>Le paiement a été effectué.
                        <br /> Voici le numéro de confirmation de votre commande:
                        <br /> L33TH4X0R5
                        </br>Un courriel avec les e-tickets vous sera envoyé sous peu.</br>Merci d'avoir choisi Billetterie525</p>
                </div>
                <div id="confirmation">
                    <table>
                        <tr>
                         <%for(int i = 0 ; i < panierC.getLstReserv().size(); i++) {%>                         
                        	<%  Reservation r = panierC.getLstReserv().get(i);
                           		Representation rep = r.getRep();
                           		Spectacle spec = cntrl.getListeSpectacle().get(rep.getIdSpectacle());%>
                            <table class="panier-element">
                                <tr>
                                    <td class="date"><%=spec.getArtiste() %></td>
                                    <td class="date"> <%=rep.getDate() %></td>
                                    <td class="date"><%=rep.getSalle().getAdresse() %></td>
                                    <td class="date"><%=r.getQte() %> billets</td>
                                </tr>
                            </table>
                                        <%} %>
                        </tr>
                    </table>
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