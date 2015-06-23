<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <title>Spectacle</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="style.css" type="text/css" media="all" />
    <link rel="stylesheet" href="spectacle.css" type="text/css" media="all" />
</head>

<body>
<%@ page import="model.Spectacle"%> 
<%@ page import="model.RepresentationBean"%>
<%@ page import="model.Salle"%>
<%@ page import="controller.PanierController"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<% Spectacle s = (Spectacle)request.getAttribute("spectacle");%>

<% RepresentationBean[] reps = s.getRepresentations();%>
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
                        <img src=<%=s.getIconePath()%> max-width="200" max-height="148" alt=""/>
                        </br>
                        </br>
                        <h3><%=s.getArtiste()%></h3>
                        <h4><%=s.getCategorie()%></h4>
                        </br>
                        <h5>Information sur l'événement</h5>
                        </br>
                        <p><%=s.getDescription()%></p>
                    </div>
                    </br>
                    </br>
        			    <div id="schedule">
      					 <div id="schedule-holder">
                            <ul>
                            <%for(int i=0;i<reps.length;i++){ %>
                                <li><a href="representation?idS=<%=s.getIdSpectacle()%>&idR=<%=reps[i].getId()%>"><%=reps[i].getDate()%> </br></br><%=reps[i].getSalle().getNom()%></br></br><%=reps[i].getSalle().getVille()%> </a>
                                </li>  
                                <%}%>                           
                            </ul>
                        </div>
    </div>
                    <!--     <div class="more-nav"> <a href="#" class="prev">previous</a> <a href="#" class="next">next</a> </div> -->
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
