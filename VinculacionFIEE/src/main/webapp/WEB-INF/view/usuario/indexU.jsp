<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<spring:url value="/resources" var="urlPublic"/>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
    <jsp:include page="../includes/head.jsp"></jsp:include>
        <body>
        <jsp:include page="../includes/lateral.jsp"></jsp:include>
            <div id="right-panel" class="right-panel">
            <jsp:include page="../includes/menu.jsp"></jsp:include>


                <!-- Content Wrapper. Contains page content -->
                <div class="content mt-3">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-header">
                                    <div class="col-sm-6 col-lg-7">
                                        <header>Lista de Estudiantes</header>
                                    </div>
                                    <div class="float-right col-sm-5">
                                        <a href="insertar" class="btn btn-success btn-block">Agregar</a>
                                    </div>


                                </div>
                                <div class="card-body">
                                    <table class="table table-striped table-bordered table-hover table-checkable order-column" style="width: 100%; font-size: 13px;" id="example1">
                                        <thead>
                                            <tr>
                                                <th class="center">Matricula</th>
                                                <th class="center">Nombre</th>
                                                <th class="center">Carrera</th>
                                                <th class="center">Celular</th>
                                                <th class="center">Correo</th>
                                                <th class="center">Acciones</th>
                                                <c:if test="${sessionScope.tipo > 1 and sessionScope.tipo < 5}">
                                                <th class="center"></th>
                                                </c:if>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${datos}" var="dato">
                                            <tr>
                                                <td class="center"> <c:out value="${dato.Matricula}"/></td>
                                                <td class="center"> <c:out value="${dato.Nombre}"/></td>
                                                <td class="center"> <c:out value="${dato.Carrera}"/></td>
                                                <td class="center"> <c:out value="${dato.Celular}"/></td>
                                                <td class="center"> <c:out value="${dato.Correo}"/></td>
                                                <td class="center">
                                                    <a href="/VinculacionFIEE/documentos/ver?id=${dato.ID}" class="btn btn-sm btn-primary">Documentación</a>
                                                    <a href="editar?id=${dato.ID}" class="btn btn-sm btn-warning">Editar</a>
                                                    <c:if test="${dato.estado eq 1}">
                                                        <a href="borrar?id=${dato.ID}" class="btn btn-sm btn-danger">Dar de baja</a>
                                                    </c:if> 
                                                    <c:if test="${dato.estado eq 2}">
                                                        <a href="borrar?id=${dato.ID}" class="btn btn-sm btn-success">Dar de alta</a>
                                                    </c:if> 
                                                </td>
                                                <c:if test="${sessionScope.tipo > 1 and sessionScope.tipo < 5}">
                                                    <td class="center">
                                                        <a href="califica?id=${dato.ID}" class="btn btn-sm btn-info">Calificar</a>
                                                    </td>
                                                </c:if> 
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>
                </div>
        <!-- /.content -->
        <!-- /.content-wrapper -->
        <jsp:include page="../includes/footer.jsp"></jsp:include>
        <script>
            $(document).ready(function () {
                $("#example1").on("click", "td button.cal", function () {
                    alert(this.id);
                });
            });
        </script>
    </body>
</html>
