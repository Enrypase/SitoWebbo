<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="errorPage.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        
        <title>About Us</title>
        <%session.setAttribute("pagina", "aboutUs");%>
        <% if(request.getHeader("User-Agent").toLowerCase().contains("android")){ %>
              <%@include  file="./stile/telefono/head.html" %>
        <% session.setAttribute("piattaforma", "telefono");}else{ %>
              <%@include  file="./stile/computer/head.jsp" %>
        <% session.setAttribute("piattaforma", "pc");} %>
    </head>
    <body>
        <div class="griglia">
            <div class="titolo">About us:</div>
            <div class="testo"><h3>Perchè abbiamo realizzato questo sito?</h3><br>
                Questo sito è stato realizzato per mettere alla prova noi stessi, per migliorare le nostre competenze in ambito informatico e per sopperire alla necessità di una classifica per le olimpiadi che andremo a svolgere in classe. <br>
                <h3>Che tecnologie abbiamo utilizzato?</h3><br>
                Il sito si basa principalmente sul principio delle <b>Servlet</b>, le quali prevendono la possibilità di utilizzare dei <b>filtri</b> per controllare gli accessi, <b>JSP</b> per avere una dinamicità delle pagine, <b>html</b>, ovviamente, per la rappresentazione dei dati, <b>CSS</b> per dare uno stile alle pagine e <b>MySql</b> utilizzabile tramite delle librerie come, per esempio JDBC. Il tutto è stato realizzato in ambiente <b>Maven</b>.
                <h3>Chi ha realizzato questo sito?</h3>
                <span class="instagram">Instagram:</span><br> <a href="https://www.instagram.com/enrico_pasetto/" class="instaLink"> @Enrico_Pasetto</a>, <a href="https://www.instagram.com/constantin_cotruta/" class="instaLink"> @Constantin_Cotruta</a>, <a href="https://www.instagram.com/jackymattia.coni/" class="instaLink"> @Jackymattia.Coni</a>, <a href="https://www.instagram.com/michael_berlingieri/" class="instaLink"> @Michael_Berlingieri</a>, <a href="https://www.instagram.com/nadiafromthewidows/" class="instaLink"> @NadiaFromTheWidows</a>. <br>
                <span class="github">GitHub:</span><br> <a href="https://github.com/Enrypase/" class="gitLink"> @Enrico Pasetto</a>, <a href="https://github.com/NtinSgama/" class="gitLink"> @Constantin Cotruta</a>, <a href="https://github.com/JacopoMattiaMarconi/" class="gitLink"> @Jacopo Mattia Marconi</a>, <a href="https://github.com/miberl/" class="gitLink"> @Michael Berlingieri</a>, <a href="https://github.com/Nadiadv02/" class="gitLink"> @Nadia Dalle Vedove</a>. <br>
            </div>
        <div class="fondo"><div class="fondo"><%if(session.getAttribute("piattaforma").equals("telefono")){%><%@include  file="./stile/telefono/bottom.html"%><%}else{%><%@include  file="./stile/computer/bottom.html"%><%}%></div>
    </body>
</html>
