<%-- 
    Document   : Lista
    Created on : 27 gen 2021, 15:45:29
    Author     : Enryp
--%>

<%@page import="com.enrypase.olimpiadi.Atleta"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.enrypase.olimpiadi.DAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="stile.css">
        
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">        
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista Atleti</title>
        <link rel="icon" type="image/jpg" href="Favicon.jpg" />
    </head>
    <body>
        <div class="griglia">
            <div class="titolo"> <h1>Lista Atleti: </h1> </div>
            <div class="testo"> 
            <table border="1px">
                <tr> <td> Nome Atleta </td> <td> Cognome Atleta </td> <td> Punteggio </td> </tr>
                <%
                    //Interpretazione dati

                    DAO db = new DAO();
                    ArrayList<Atleta> atleti = db.getUserList();
                    for (int i = 0; i < atleti.size(); i++) {
                        out.println("<tr class='record'> <td> " + atleti.get(i).getNome() + " </td> <td> " + atleti.get(i).getCognome() + "</td> <td> " + atleti.get(i).getPunteggio() +  " </td> </tr>");
                    }
                %>
            </table>
            <br>
            </div>
            <div class="fondo">
            <a href="index.html"><img src="home.jpg" width="50vw" height="50vh"></a> 
            <a href="Info.html"><img src="info.jfif" width="50vw" height="50vh"></a>
            </div>
        </div>

    </body>
</html>
