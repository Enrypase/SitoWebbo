<%-- 
    Document   : log
    Created on : 27 gen 2021, 16:08:28
    Author     : Enryp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1> Benvenuto <%
             out.print(request.getSession().getAttribute("username"));
        %> </h1>
        <h2> Status: logged <%
                 out.print(request.getSession().getAttribute("logged"));
        %> </h2>
        <form action='LogOut'>
            <input type='submit' value='Log Out!'>
        </form>
        
        <a href="Modifica.jsp"> Qui modifichi </a>
        
        <% out.println(request.getHeader("Cache-Control")); %>
        <% out.println(request.getHeader("Pragma")); %>
        <% out.println(request.getHeader("Expires")); %>
        
    </body>
</html>
