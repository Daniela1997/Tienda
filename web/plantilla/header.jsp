<%-- 
    Document   : index
    Created on : 22-01-2018, 11:07:28
    Author     : Claudio Rubilar
--%>

<%@page import="javax.naming.InitialContext"%>
<%@page import="cl.beans.ServicioBeanLocal"%>
<%@ taglib  prefix="xx" uri="/WEB-INF/tlds/TAGiMG.tld"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%! private ServicioBeanLocal servicio;%>

<% 
    InitialContext ctx = new InitialContext();
    servicio =
     (ServicioBeanLocal)
    ctx.lookup("java:global/GestionMascotas2018/ServicioBean!cl.beans.ServicioBeanLocal");
            %>
   <c:set var="categorias" scope="page" value="<%= servicio.getCategorias() %>"/>
<!DOCTYPE html>
<html>
    <head>
         <!--Import Google Icon Font-->
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>

      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestion Mascota 2018</title>
    </head>
    <body>
       
        
    
