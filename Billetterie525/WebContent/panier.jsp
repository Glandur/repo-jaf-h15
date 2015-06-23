<%@page import="controller.SpectacleController"%>

<%@ page language="java" contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

 

<head>

    <title>Panier</title>

    <meta http-equiv="content-type" content="text/html; charset=utf-8" />

    <link rel="stylesheet" href="style.css" type="text/css" media="all" />

    <link rel="stylesheet" href="achat.css" type="text/css" media="all" />

</head>

 

<body>

<%@ page import="model.Salle"%>

<%@ page import="java.util.ArrayList" %>

<%@ page import="controller.PanierController"%>

<%

       PanierController panierC = (PanierController)request.getAttribute("panier");

       SpectacleController cntrl = (SpectacleController)SpectacleController.getInstance();

%>

 

<%@ page import="model.Spectacle"%>

<%@ page import="model.Reservation"%>

<%@ page import="model.Representation"%>

<%@ page import="java.util.ArrayList" %>

<%

       ArrayList<Spectacle> spectacles = (ArrayList<Spectacle>)request.getAttribute("spectacles");

%>

<%

       ArrayList<Reservation> representations = (ArrayList<Reservation>)request.getAttribute("representations");

%>

    <div class="shell">

 

        <div id="header">

            <h1 id="logo"><a href="index">Billetterie525 </a></h1>

 

 

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

<script src="jquery-1.4.1.min.js"></script>

 

        <div id="main">

            <div class="cl">&nbsp;</div>

            <div id="content">

                <div id="nav-paiement">

                    <ul>

                        <li class="selected"><a href="panier">Panier</a>

                        </li>

                        <li>Paiement

                        </li>

                        <li>Confirmation

                        </li>

                    </ul>

                </div>

                <div class="box">

                    <br>

                    <h1>Votre panier</h1>

                    </br>

                    <div>

                        <table id="panier">

                            <tr>

                                <th class="thumb"></th>

                                <th class="spectacle">Spectacle</th>

                                <th class="date">Date</th>

                                <th class="lieu">Lieu</th>

                                <th class="qty">Qté</th>

                                <th class="prix">Prix</th>

                            </tr>

                        </table>

 

                       

                        <%for(int i = 0 ; i < panierC.getLstReserv().size(); i++) {%>

                        <% Reservation r = panierC.getLstReserv().get(i);

                           Representation rep = r.getRep();

                           Spectacle spec = cntrl.getSpectacle(rep.getIdSpectacle());%>

                        <div>

                            <table class="panier-element">

                                <tr>

                                    <td class="thumb">

                                        <a href="spectacle?id=<%=rep.getId() %>"><img src="<%=spec.getAffichePath()%>">

                                        </a>

                                    </td>

                                    <td class="spectacle">

                                        <h3><%=spec.getArtiste() %></h3>

                                        <h4><%=spec.getCategorie() %></h4>

                                    </td>

                                    <td class="date"> <%=rep.getDate() %></td>

                                    <td class="lieu"><%=rep.getSalle().getAdresse() %></td>

                                    <td class="qty"><%=r.getQte() %></td>

                                    <td class="prix"><%=rep.getPrix() %></td>

                                    <td>
										<form method="post" action="PanierServlet"> 
                                        	<input name="delete"  type="submit"  value=" X ">
                                        	<input name="del-btn" type="hidden"  value=1></input>
										</form>
                                    </td>

                                </tr>

                            </table>

                        </div>

                                        <%} %>

                    

 

                        <div class="soustotal">

                            <h4>Sous-Total: <%=panierC.calculPrixTotal()%> $</h4>

                        </div>

                        </br>

						<div class="vider-btn">
							<form method="post" action="PanierServlet">
                            	<input name="vider-btn" type="submit" value="Vider le panier" readonly></a>
							</form>
                        </div>

                        </br>

                        <div class="confirm-btn"><a href="paiement">

                            <input name="confirm-btn" type="submit" value="Procéder au paiement" readonly></a>

                        </div>

                        </br>

                        </br>

                        <div class="timer">Période d'achat:

                        <span id="countdown" class="timer"></span>

                                               <script>

                                               var seconds = 300;

                                               function secondPassed() {

                                                   var minutes = Math.round((seconds - 30)/60);

                                                   var remainingSeconds = seconds % 60;

                                                   if (remainingSeconds < 10) {

                                                       remainingSeconds = "0" + remainingSeconds; 

                                                   }

                                                   document.getElementById('countdown').innerHTML = minutes + ":" + remainingSeconds;

                                                   if (seconds == 0) {

                                                       clearInterval(countdownTimer);

                                                            $.ajax({url: "AJAX.js", dataType: "script"});

                                                           

                                                   } else {

                                                       seconds--;

                                                   }

                                               }

                                              

                                               var countdownTimer = setInterval('secondPassed()', 1000);

                                               </script>

                        </div>

                        </br>

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
