<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Alumnos</title>
</head>
<body>

</br>
   
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
            </tr>

            </thead>

            <tbody>
            <c:forEach items="${alumnos}" var="dato">
                <tr>
                    <td> <c:out value="${dato.id}"/></td>
                    <td> <c:out value="${dato.nombre}"/></td>
                    
                    </tr>

            </c:forEach>
             </tbody>


        </table>

</body>

</html>
