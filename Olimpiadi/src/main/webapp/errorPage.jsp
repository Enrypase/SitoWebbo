<%-- 
    Document   : ErrorPage
    Created on : 27 gen 2021, 16:21:32
    Author     : Enryp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>
        <link rel="icon" type="image/jpg" href="Favicon.jpg" />
    </head>
    <body>
        <h1>Errore</h1>
        <h2> <% 
            try{
            out.println(session.getAttribute("Error"));
            }
            catch(Exception e){
                
            }
        %> </h2>
    </body>
</html>
