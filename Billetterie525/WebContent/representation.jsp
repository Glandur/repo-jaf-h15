<%@page import="controller.PanierController"%>

<%@ page language="java" contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

 

<head>

    <title>Représentation 1</title>

    <meta http-equiv="content-type" content="text/html; charset=utf-8" />

    <link rel="stylesheet" href="style.css" type="text/css" media="all" />

    <link rel="stylesheet" href="spectacle.css" type="text/css" media="all" />

</head>

 

<body>

<%@ page import="model.Salle"%>

<%@ page import="model.Spectacle"%>

<%@ page import="model.Representation"%>

<%@ page import="java.util.ArrayList" %>

<% Representation r = (Representation)request.getAttribute("representation");%>

<% Spectacle s = (Spectacle)request.getAttribute("spectacle");%>

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

                <div id="spectacle" class="box">

                    <div id="spectacledesc">

                        <a href="spectacle?id=<%=s.getIdSpectacle()%>"><img src=<%=s.getIconePath() %> alt="" /></a>

                        </br>

                        </br>

                        <h1><%=r.getDate() %></h1>

                        </br>

                        <h3><%=s.getArtiste()%></h3>

                        <h4><%=s.getCategorie()%></h4>

                        </br>

                        <h4><%=r.getSalle().getNom()%></h4>

                        <p><%=r.getSalle().getAdresse()%> <%=r.getSalle().getVille()%></p>

                        </br>

                        <span>Choix des billets</span>

                        <div class="ticket-picker">

                            </br>

                            <strong>régulier</strong>

                            <strong>$<%=String.format("%.2f", r.getPrix())%></strong>

                          

 

 

                        </div>

 

                        <div>

                            </br>

                            <p>Réserver mes places</p>

 

                            <div id="ticket-reserve">

                                <div>

 

                                    <select>

                                        <option>Réservez-moi les meilleurs</option>

                                        <optgroup label="$<%=String.format("%.2f", r.getPrix())%> (Incl. $6.00)">

                                            <option value="PAI">(PARTERRE) PARTERRE IMPAIR</option>

                                            <option value="PAP">(PARTERRE) PARTERRE PAIR</option>

                                            <option value="PAF">(FAUTEUIL ROULANT) PARTERRE</option>

                                        </optgroup>

                                    </select>

                                    <form action="panier" type="post">

                                         <span>($6.00 inclus pour frais d'administration)</span>

                                                       <div>

                                               <select name="quantite">

                                                       <option value="0">0</option>

                                                       <option value="1">1</option>

                                                       <option value="2">2</option>

                                                       <option value="3">3</option>

                                                       <option value="4">4</option>

                                                <option value="5">5</option>

                                                       <option value="6">6</option>

                                                       <option value="7">7</option>

                                                       <option value="8">8</option>

                                                       <option value="9">9</option>

                                                       <option value="10">10</option>

                                                </select>

 

                                                       </div>
										<form method="post" action="PanierServlet"> 
                                        	<input name="Reserver" value="Reserver" type="submit"></input>
                                        	<input type="hidden" name="res-val" value=<%=r.getIdSpectacle()+ "." + r.getId()%>></input>                                        	
										</form>
                                    </form>

                                </div>

                            </div>
                        </div>
                        <div>
                            </br>
                            <a href="#hide1" class="hide" id="hide1">+</a>
                            <a href="#show1" class="show" id="show1">-</a>
                            <div class="question">
                                <h5>Information sur l'événement</h5>
                            </div>
                            <div class="list">
                                <p><%=s.getDescription()%></p>
                            </div>
                        </div>
                    </div>
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

        <p class="left"> <a href="index.html">Accueil</a> <span>|</span> <a href="spectacleliste.html">Spectacles</a> <span>|</span><a href="contact.html">Contact</a> </p>

        <p class="right"> &copy; 2010 Shop Around. Design by <a href="http://chocotemplates.com">Chocotemplates.com</a> </p>

    </div>

    <!-- End Footer -->

    </div>

    <!-- End Shell -->

</body>

 

</html>