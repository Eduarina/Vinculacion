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
    <jsp:include page="includes/head.jsp"></jsp:include>
        <!--
        BODY TAG OPTIONS:
        =================
        Apply one or more of the following classes to get the
        desired effect
        |---------------------------------------------------------|
        | SKINS         | skin-blue                               |
        |               | skin-black                              |
        |               | skin-purple                             |
        |               | skin-yellow                             |
        |               | skin-red                                |
        |               | skin-green                              |
        |---------------------------------------------------------|
        |LAYOUT OPTIONS | fixed                                   |
        |               | layout-boxed                            |
        |               | layout-top-nav                          |
        |               | sidebar-collapse                        |
        |               | sidebar-mini                            |
        |---------------------------------------------------------|
        -->
        <body class="hold-transition skin-green-light sidebar-mini">
            <div class="wrapper">

            <jsp:include page="includes/menu.jsp"></jsp:include>

            <jsp:include page="includes/lateral.jsp"></jsp:include>

                <!-- Content Wrapper. Contains page content -->
                <div class="content-wrapper">
                    <!-- Content Header (Page header) -->
                    <section class="content-header">
                        <h1>
                            Lista de Servicios Sociales
                            <small>Usuarios de Servicio</small>
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
                                        <a href="insertarUsuarioS" class="btn btn-primary">Agregar</a>
                                    </div>
                                    <!-- /.box-header -->
                                    <div class="box-body">
                                        <table id="example1" class="table table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th>Id</th>
                                                    <th>Nombre</th>
                                                    <th>Usuario</th>
                                                    <th>Contraseña</th>
                                                    <th>Correo</th>
                                                    <th>Matricula</th>
                                                    <th>Creditos</th>
                                                    <th>Semestre</th>
                                                    <th>Acciones</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${usuarios}" var="dato">
                                                <tr>
                                                    <td> <c:out value="${dato.idservicio}"/></td>
                                                    <td> <c:out value="${dato.nombre}"/></td>
                                                    <td> <c:out value="${dato.usuario}"/></td>
                                                    <td> <c:out value="${dato.password}"/></td>
                                                    <td> <c:out value="${dato.correo}"/></td>
                                                    <td> <c:out value="${dato.matricula}"/></td>
                                                    <td> <c:out value="${dato.creditos}"/></td>
                                                    <td> <c:out value="${dato.semestre}"/></td>
                                                    <td>
                                                        <a href="editarUsuarioS?id=${dato.idservicio}" class="btn btn-warning">Editar</a>
                                                        <a href="borrarUsuarioS?id=${dato.idservicio}" class="btn btn-danger">Eliminar</a>
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

            <jsp:include page="includes/footer.jsp"></jsp:include>


        </div>

    </body>
</html>
