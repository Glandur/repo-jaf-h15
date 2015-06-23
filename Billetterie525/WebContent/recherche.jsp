<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <title>Liste des spectacles</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="style.css" type="text/css" media="all" />
    <link rel="stylesheet" href="spectacle.css" type="text/css" media="all" />
</head>

<body>
<%@ page import="model.Spectacle"%> 
<%@ page import="model.IListeSpectacle"%> 
<%@ page import="model.Salle"%>
<%@ page import="controller.PanierController"%>
<%@ page import="java.util.ArrayList" %>
<% ArrayList<Spectacle> listeSpec = (ArrayList<Spectacle>)request.getAttribute("lstRecherche");%>   
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
                    <li><a href="spectacleliste" class="active">Spectacles</a>
                    </li>
                    <li><a href="contact">Contact</a>
                    </li>
                </ul>
            </div>

        </div>

        <div id="main">
            <div class="cl">&nbsp;</div>
            <div id="content">
                <div id="spectacle_box">

                    <div>Trier par</div>
					<%for(int i=0;i<listeSpec.size();i++){ %>
                    <div class="spectacle_box">
                        <a href="spectacle?id=<%=listeSpec.get(i).getIdSpectacle()%>">
                        <img src=<%=listeSpec.get(i).getIconePath()%> max-width="235" max-height="387" min-width="235"/></a>
                        <h3><%=listeSpec.get(i).getArtiste()%></h3>
                        <h4><%=listeSpec.get(i).getCategorie()%></h4>
                        <div class="more_button"><a href="spectacle?id=<%=listeSpec.get(i).getIdSpectacle()%>"></a>
                        </div>
                    </div>
    				<%}%> 

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