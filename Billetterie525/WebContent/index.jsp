<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<title>Billetterie525</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="css/spectacle.css" type="text/css" media="all" />
<script src="jquery-1.4.1.min.js" type="text/javascript"></script>
<script src="jquery.jcarousel.pack.js" type="text/javascript"></script>
<script src="jquery-func.js" type="text/javascript"></script>

</head>

<body>
<%@ page import="controller.PanierController"%>
<% PanierController pC = (PanierController)session.getAttribute("panierC"); %>

<%@ page import="model.Spectacle"%> 
<%@ page import="model.Salle"%>
<%@ page import="java.util.ArrayList" %>
<% Spectacle s0 = (Spectacle)request.getAttribute("s0"); %>
<% Spectacle s1 = (Spectacle)request.getAttribute("s1"); %>
<% Spectacle s2 = (Spectacle)request.getAttribute("s2"); %>
<% Spectacle s3 = (Spectacle)request.getAttribute("s3"); %>
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
                    <li><a href="index" class="active">Accueil</a>
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

                <div id="slider" class="box">
                    <div id="slider-holder">
                        <ul>
                            <li>
                                <a href="spectacle?id=<%=s0.getIdSpectacle()%>"><img src=<%=s0.getAffichePath()%> width="720" height="252"/>
                                </a> 
                            </li>
                            <li>
                                <a href="spectacle?id=<%=s1.getIdSpectacle()%>"><img src=<%=s1.getAffichePath()%> width="720" height="252"/>
                                </a>
                            </li>
                            <li>
                                <a href="spectacle?id=<%=s2.getIdSpectacle()%>"><img src=<%=s2.getAffichePath()%> width="720" height="252"/>
                                </a>
                            </li>
                            <li>
                                <a href="spectacle?id=<%=s3.getIdSpectacle()%>"><img src=<%=s3.getAffichePath()%> width="720" height="252"/>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div id="slider-nav"> <a href="#" class="active">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> </div>
                </div>
                <div class="products">
                    <div class="cl">&nbsp;</div>
                    <ul>
                        <li>
                            <a href="spectacle?id=<%=s1.getIdSpectacle()%>"><img src=<%=s1.getIconePath()%> max-width="235" max-height="387" min-width="235"/>
                            </a>
                            <div class="product-info">
                                <h3><%=s1.getArtiste()%></h3>
                                <div class="product-desc">
                                    <h4><%=s1.getCategorie()%></h4>
                                    <p><%=s1.getRepresentations()[0].getDate()%>
                                        <br /> <%=s1.getRepresentations()[0].getSalle().getVille()%>
                                    </p>
                                    <strong class="price"><%=s1.getRepresentations()[0].getPrix()%></strong> </div>
                            </div>
                        </li>
                        <li>
                            <a href="spectacle?id=<%=s2.getIdSpectacle()%>"><img src=<%=s2.getIconePath()%> max-width="235" max-height="387" min-width="235"/>
                            </a>
                            <div class="product-info">
                                <h3><%=s2.getArtiste()%></h3>
                                <div class="product-desc">
                                    <h4><%=s2.getCategorie()%></h4>
                                    <p><%=s2.getRepresentations()[1].getDate()%>
                                        <br /> <%=s2.getRepresentations()[1].getSalle().getVille()%>
                                    </p>
                                    <strong class="price"><%=s2.getRepresentations()[1].getPrix()%></strong> </div>
                            </div>
                        </li>
                        <li class="last">
                            <a href="spectacle?id=<%=s3.getIdSpectacle()%>"><img src=<%=s3.getIconePath()%> max-width="235" max-height="387" min-width="235"/>
                            </a>
                            <div class="product-info">
                                <h3><%=s3.getArtiste()%></h3>
                                <div class="product-desc">
                                    <h4><%=s3.getCategorie()%></h4>
                                    <p><%=s3.getRepresentations()[4].getDate()%>
                                        <br /> <%=s3.getRepresentations()[4].getSalle().getVille()%>
                                    </p>
                                    <strong class="price"><%=s3.getRepresentations()[4].getPrix()%></strong> </div>
                            </div>
                        </li>
                    </ul>
                    <div class="cl">&nbsp;</div>
                </div>

            </div>

            <div id="sidebar">
               <%@include file="sidebar.jsp" %>
            </div>
            <!-- End Sidebar -->
            <div class="cl">&nbsp;</div>
        </div>
    </div>
    <!-- End Side Full -->
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