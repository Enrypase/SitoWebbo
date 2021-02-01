<%
    try{
        if(session.getAttribute("pagina").equals("home")){ %>
            <link rel="stylesheet" type="text/css" href="./stile/computer/generale.css"> 
        <%}
        else if(session.getAttribute("pagina").equals("aboutUs")){ %>
            <link rel="stylesheet" type="text/css" href="./stile/computer/aboutUs.css"> 
        <%}
    }
    catch(Exception e){
        System.out.println("NULLA");
    }
%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Anton&display=swap" rel="stylesheet">

<link rel="icon" type="image/jpg" href="./photo/olimpiadi.jpg" />