<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<spring:url value="/resources" var="urlPublic"/>
<!DOCTYPE html>
<html>
    <jsp:include page="../includes/head.jsp"></jsp:include>
        <body class="hold-transition skin-green-light sidebar-mini">
            <div class="wrapper">
            <jsp:include page="../includes/menu.jsp"></jsp:include>
            <jsp:include page="../includes/lateral.jsp"></jsp:include>
                <div class="content-wrapper">
                    <section class="content-header">
                        <h1>
                            Lista de Maestros
                            <small>Usuarios de Proyecto</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                            <li class="active">Inicio</li>
                        </ol>
                    </section>

                    <!-- Main content -->
                    <section class="content">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="box box-primary">
                                    <div class="box-header with-border">
                                        <a href="insertar" class="btn btn-primary">Agregar</a>
                                    </div>
                                    <!-- /.box-header -->
                                    <div class="box-body">
                                        <table id="example1" class="table table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th>Id</th>
                                                    <th>Nombre</th>
                                                    <th>Usuario</th>
                                                    <th>Correo</th>
                                                    <th>Acciones</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${usuarios}" var="dato">
                                                <tr>
                                                    <td> <c:out value="${dato.ID}"/></td>
                                                    <td> <c:out value="${dato.nombre}"/></td>
                                                    <td> <c:out value="${dato.usuario}"/></td>
                                                    <td> <c:out value="${dato.correo}"/></td>
                                                    <td>
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
                                <!-- /.box-body -->
                            </div>
                            <!-- /.box -->
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->

            <jsp:include page="../includes/footer.jsp"></jsp:include>


        </div>

    </body>
</html>
