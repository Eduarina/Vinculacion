<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <title>JSP Page</title>
    </head>
    <body>
        
        <h1>Prueba DB</h1>
        <a href="<c:url value = "/getAlumnos"/>">Ver datos en DB</a>
        <br>
        <a href="<c:url value = "/insertAlumnos"/>">Cargar datos en DB</a>
    </body>
</html>
