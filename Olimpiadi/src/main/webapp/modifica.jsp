<%-- 
    Document   : Modifica
    Created on : 29 gen 2021, 21:56:43
    Author     : Enryp
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.enrypase.olimpiadi.Atleta"%>
<%@page import="com.enrypase.olimpiadi.DAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="icon" type="image/jpg" href="Favicon.jpg" />
    </head>
    <body>
        <table>
            <tr> <td> Nome Atleta </td> <td> Cognome Atleta </td> <td> Punteggio </td> </tr>
        <%
            //Interpretazione dati
            
            DAO db = new DAO();
            ArrayList<Atleta> atleti = db.getUserList();
            for (int i = 0; i < atleti.size(); i++) {
                out.println("<tr> <td> " + atleti.get(i).getNome() + " </td> <td> " + atleti.get(i).getCognome() + "</td> <td> " + atleti.get(i).getPunteggio() +  " </td> </tr>");
            }
        %>
        </table>
        
        <h1> Chi modificare? </h1> <br>
        
        <form action="Modifica">
            <input type="text" value="Nome Atleta: " name="nome">
            <input type="text" value="Cognome Atleta: " name="cognome">
            <input type="text" value="Nuovo punteggio: " name="punti">
            <input type="submit" value="Invio">
        </form>
        
        <h1> Chi inserire? </h1> <br>
        
        <form action="Inserisci">
            <input type="text" value="Nome Atleta: " name="nome">
            <input type="text" value="Cognome Atleta: " name="cognome">
            <input type="text" value="Nuovo punteggio: " name="punti">
            <input type="submit" value="Invio">
        </form>
        
        <h1> Chi eliminare? </h1> <br>
        
        <form action="Elimina">
            <input type="text" value="Nome Atleta: " name="nome">
            <input type="text" value="Cognome Atleta: " name="cognome">
            <input type="submit" value="Invio">
        </form>
        
    </body>
</html>
