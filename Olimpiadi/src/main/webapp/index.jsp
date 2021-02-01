<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="errorPage.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        
        <title> Home </title>
        <%session.setAttribute("pagina", "home");%>
        <% if(request.getHeader("User-Agent").toLowerCase().contains("android")){ %>
              <%@include  file="./stile/telefono/head.html" %>
        <% session.setAttribute("piattaforma", "telefono");}else{ %>
              <%@include  file="./stile/computer/head.jsp" %>
        <% session.setAttribute("piattaforma", "pc");} %>
    </head>
    <body>
            
        <div class="griglia">
            
            <div class="titolo">Home</div>
            <div class="sottotitolo">Benvenuto <b><%try{out.print(session.getAttribute("username").equals("null"));}catch(Exception e){out.print("Viewer");}%></b></div>
            <div class="testo">
                Questa è la pagina iniziale del sito. Da qui potrai accedere a tutte le pagine contenute in esso! <br>
                Nel caso in cui tu fossi un amministratore e abbia accesso alle credenziali <a href="" class="link">clicca qui</a> per effettuare il login.<br>
                Nel caso in cui tu volessi consultare la lista degli atleti e delle squadre <a href="" class="link">clicca qui</a>. <br>
                Se, invece, volessi avere più informazioni su come funziona il sito, con quali tecnologie è stato implementato e chi ha effettuato questo lavoro <a href="" class="link">clicca qui</a>.<br>
            </div>
            <div class="fondo"><%if(session.getAttribute("piattaforma").equals("telefono")){%><%@include  file="./stile/telefono/bottom.html"%><%}else{%><%@include  file="./stile/computer/bottom.html"%><%}%> </div>
        </div>
        
    </body>
</html>