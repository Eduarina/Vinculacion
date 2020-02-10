<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
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
                                        <header>Lista de Maestros
                                            <small>Usuarios Maestros</small></header>
                                    </div>
                                    <div class="float-right col-sm-5">
                                        <a href="insertar" class="btn btn-success btn-block">Agregar</a>
                                    </div>


                                </div>
                                <div class="card-body">
                                    <table class="table table-striped table-bordered table-hover table-checkable order-column" style="width: 100%" id="example1">
                                                <thead>
                                                <tr>
                                                    <th class="center">Id</th>
                                                    <th class="center">Nombre</th>
                                                    <th class="center">Usuario</th>
                                                    <th class="center">Correo</th>
                                                    <th class="center">Acciones</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${usuarios}" var="dato">
                                                <tr>
                                                    <td class="center"> <c:out value="${dato.ID}"/></td>
                                                    <td class="center"> <c:out value="${dato.nombre}"/></td>
                                                    <td class="center"> <c:out value="${dato.usuario}"/></td>
                                                    <td class="center"> <c:out value="${dato.correo}"/></td>
                                                    <td class="center">
                                                        <a href="editar?id=${dato.ID}" class="btn btn-warning">Editar</a>
                                                        <c:if test="${dato.estado eq 1}">
                                                            <a href="borrar?id=${dato.ID}" class="btn btn-danger">Dar de baja</a>
                                                        </c:if> 
                                                        <c:if test="${dato.estado eq 2}">
                                                            <a href="borrar?id=${dato.ID}" class="btn btn-success">Dar de alta</a>
                                                        </c:if> 
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                            </table>

                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </div>
        <!-- Content Header (Page header) -->

        <!-- /.content -->
        <!-- /.content-wrapper -->

        <jsp:include page="../includes/footer.jsp"></jsp:include>
    </body>
</html>
