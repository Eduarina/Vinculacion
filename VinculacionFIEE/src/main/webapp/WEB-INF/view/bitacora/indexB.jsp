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

            <jsp:include page="../includes/menu.jsp"></jsp:include>

            <jsp:include page="../includes/lateral.jsp"></jsp:include>

                <!-- Content Wrapper. Contains page content -->
                <div class="content-wrapper">
                    <!-- Content Header (Page header) -->
                    <section class="content-header">
                        <h1>
                            Bitácoras
                            <small>Lista de Bitácoras</small>
                        </h1>
                        <!--<ol class="breadcrumb">
                            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                            <li class="active">Inicio</li>
                        </ol>-->
                    </section>

                    <!-- Main content -->
                    <section class="content">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="box box-primary">
                                <c:if test="${sessionScope.tipo eq 4}">
                                    <div class="box-header with-border">
                                        <a href="generar" class="btn btn-primary"><i class="fa fa-plus-circle"></i><i class="fa fa-plus-circle" style="color: transparent"></i> Generar Bitácora</a>
                                    </div>
                                </c:if>
                                <!-- /.box-header -->
                                <div class="box-body">
                                    <c:if test="${not empty message}">
                                        <div class="alert alert-danger alert-dismissible">${message}</div>
                                    </c:if>
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <!--                                                <th>Id</th>-->
                                                <th>Alumno</th>
                                                <th>Matricula</th>
                                                <th>Fecha</th>
                                                <th>Fecha Limite</th>
                                                <th>Bitácora #</th>
                                                <th>Acciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${bitacoras}" var="dato">
                                                <tr>
<!--                                                    <td> <c:out value="${dato.idbitacora}"/></td>-->
                                                    <td> 
                                                        <c:forEach items="${usuarios}" var="usuario">
                                                            <c:if test="${dato.idservicio eq usuario.idusuario}">
                                                                <c:out value="${usuario.nombre}"/>
                                                            </c:if>
                                                        </c:forEach>
                                                    </td>
                                                    <td> 
                                                        <c:forEach items="${servicios}" var="usuario">
                                                            <c:if test="${dato.idservicio eq usuario.idusuario}">
                                                                <c:out value="${usuario.matricula}"/>
                                                            </c:if>
                                                        </c:forEach>
                                                    </td>
                                                    <td> <c:out value="${dato.fecha}"/></td>
                                                    <td> <c:out value="${dato.fechalim}"/></td>
                                                    <td> <c:out value="${dato.numero}"/></td>
                                                    <td>
                                                        <a href="editar?id=${dato.idbitacora}" class="btn btn-warning"><i class="fa fa-edit"></i> Editar</a>
                                                        <a href="detalles?id=${dato.idbitacora}" class="btn btn-info"><i class="fa fa-info-circle"></i> Detalles</a>
                                                        <a href="borrar?id=${dato.idbitacora}" class="btn btn-danger" onclick="return confirm('Eliminar este registro podria causar inconsistencias en el sistema. ¿Estas seguro que deseas eliminar el registro?')"><i class="fa fa-trash"></i> Eliminar</a>
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
