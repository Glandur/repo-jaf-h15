<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <title>Billeterie525</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="style.css" type="text/css" media="all" />
</head>

<body>
<%@ page import="model.Salle"%>
<%@ page import="java.util.ArrayList" %>
    <div class="shell">
<%@ page import="controller.PanierController"%>

<%@ page import="model.Reservation"%>
<%@ page import="java.util.ArrayList" %>
<%
	Reservation panier = (Reservation)session.getAttribute("panier");
%>
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
                    <li><a href="contact" class="active">Contact</a>
                    </li>
                </ul>
            </div>

        </div>

        <div id="main">
            <div class="cl">&nbsp;</div>
            <div id="content">
                <div>
    
					<h1>Erreur 404</h1>
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