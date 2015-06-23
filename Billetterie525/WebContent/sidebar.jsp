      <%@ page import="model.Salle"%>
<%@ page import="java.util.ArrayList" %>
<% ArrayList<Salle> listeSalle = (ArrayList<Salle>)request.getAttribute("salles");%>
                <!-- Search -->
                <div class="box search">
                    <h2>Rechercher par <span></span></h2>
                    <div class="box-content">
                        <form id="recherche" action="rechercheSpecs" method="get">
                            <label>Mot cl�s</label>
                            <input type="text" name="motsClef" class="field" />
                            </br>
                            <label>Ville</label>
                            <select name="ville" class="field">
                                <option value="">-- S�lectionner la ville --</option>
                                    <%for(int i=0;i<listeSalle.size();i++){ %>
                                <option value=<%=listeSalle.get(i).getVille()%> name="ville"><%=listeSalle.get(i).getNom()%> : <%=listeSalle.get(i).getVille()%></option>
                                <%}%> 
                            </select>
                            </br>
                            <input type="submit" name="submit" class="search-submit" value="Recherche" />
                        </form>
                    </div>
                </div>

                <div class="box categories">
                    <h2>Cat�gories <span></span></h2>
                    <div class="box-content">
                        <ul>
                            <li><a href="rechercheSpecs?motsClef=Humour">Humour</a>
                            </li>
                            <li><a href="rechercheSpecs?motsClef=Rock">Rock</a>
                            </li>
                            <li><a href="rechercheSpecs?motsClef=Pop">Pop</a>
                            </li>
                            <li><a href="rechercheSpecs?motsClef=Sport">Sport</a>
                            </li>
                            <li><a href="rechercheSpecs?motsClef=Th��tre">Th��tre</a>
                            </li>
                            <li><a href="rechercheSpecs?motsClef=Festivals">Festivals</a>
                            </li>
                            <li><a href="rechercheSpecs?motsClef=Expositions">Expositions</a>
                            </li>
                            <li><a href="rechercheSpecs?motsClef=Op�ra">Op�ra</a>
                            </li>
                            <li><a href="rechercheSpecs?motsClef=Magie">Magie</a>
                            </li>
                            <li><a href="rechercheSpecs?motsClef=ComediesMusicales">Com�dies Musicales</a>
                            </li>
                            <li><a href="rechercheSpecs?motsClef=Dance">Dance</a>
                            </li>
                            <li><a href="rechercheSpecs?motsClef=Techno">Techno</a>
                            </li>
                            <li class="last"><a href="rechercheSpecs?motsClef=Vari�t�s">Vari�t�s</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- End Categories -->
          