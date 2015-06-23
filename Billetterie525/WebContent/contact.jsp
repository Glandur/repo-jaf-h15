<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <title>Contact</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="style.css" type="text/css" media="all" />
</head>

<body>
<%@ page import="model.Salle"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="controller.PanierController"%>
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
                    <li><a href="contact" class="active">Contact</a>
                    </li>
                </ul>
            </div>

        </div>

        <div id="main">
            <div class="cl">&nbsp;</div>
            <div id="content">
                <div id="contact" class="box">
                    <br>
                    <h1>Contactez-nous</h1>
                    </br>

                    <div class="contact">

                        <div>
                            </br>
                            <p>
                                <h2>Par téléphone</h2>
                                </br>
                                Si vous avez des questions sur un événement en particulier ou vous désirez effectuer un achat de billets par téléphone, veuillez nous contacter au 514-555-5555.
                                <br></br>
                                <h2>Par courriel</h2>
                                </br>
                                Veuillez fournir le plus de détails possible, afin que nous puissions vous transmettre la réponse la plus appropriée. SVP, notez qu'un délai de 48 heures ouvrables minimum est requis afin de recevoir une réponse. Pour toutes urgences, veuillez nous contacter par téléphone.</p>
                            </br>
                            <strong>Vous avez des questions?</strong>
                            <p></p>
                        </div>
                        </br>
                        <form action="IndexServlet" method="post class="plank-validator">
                            <input type="hidden" name="event" value="contact_us">
                            <table>
                                <tbody>
                                    <tr>
                                        <td width="140" align="right"><strong id="label-name">Votre nom</strong>
                                        </td>
                                        <td>
                                            <input class="required input_tx" type="text" name="name" value="">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td nowrap="" align="right"><strong id="lbl_email">Votre courriel</strong>
                                        </td>
                                        <td>
                                            <input class="email" type="text" name="email" value="">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right"><strong id="sujet">Sujet</strong>
                                        </td>
                                        <td>
                                            <select name="sujet" class="required">
                                                <option value="" selected="selected">Choisissez...</option>
                                                <option value="remboursement">Politique de remboursement</option>
                                                <option value="groupe">Vente aux groupes</option>
                                                <option value="carrieres">Opportunités de carrières</option>
                                                <option value="futur">Spectacles à  venir</option>
                                                <option value="autre">Autre</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top" align="right"><strong>Message</strong>
                                        </td>
                                        <td>
                                            <textarea name="message" wrap="soft" class="message"></textarea>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>
                                            <input type="submit" value="Soumettre" onclick="return contact();" />
                                            	<script type="text/javascript">
                                            	function contact() {
                                                    alert("Merci pour votre message. :)");
                                                    window.location = "index";
                                                    return true;
                                                }
                                            	</script>
                                            <input type="button" name="cancel" value="Annuler" />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <input type="text" name="description" value="" style="display:none">
                        </form>

                        <br>

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