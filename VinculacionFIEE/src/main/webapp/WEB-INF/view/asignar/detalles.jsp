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
        <body class="hold-transition skin-green-light sidebar-mini">
            <div class="wrapper">

            <jsp:include page="../includes/menu.jsp"></jsp:include>
            <jsp:include page="../includes/lateral.jsp"></jsp:include>

                <!-- Content Wrapper. Contains page content -->
                <div class="content-wrapper">
                    <!-- Content Header (Page header) -->
                    <section class="content-header">
                        <h1>
                            Alumnos asignados a <c:out value="${nombre}" />
                            <small>Lista de asignaciones</small>
                        </h1>
                        <!--<ol class="breadcrumb">
                            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                            <li class="active">Inicio</li>
                        </ol>-->
                    </section>

                    <!-- Main content -->
                    <section class="content container-fluid">

                        <!--------------------------
                        | Your Page Content Here |
                        -------------------------->
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="box box-primary">
                                    <div class="box-header with-border">
                                        <a href="lista" class="btn btn-primary"><i class="fa fa-chevron-left"></i> Regresar</a>
                                    </div>
                                    <!-- /.box-header -->
                                    <div class="box-body">
                                        <table id="example1" class="table table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th>Estudiante</th>
                                                    <th>Correo</th>
                                                    <th>Carrera</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${lista}" var="dato">
                                                <tr>
                                                    <td> <c:out value="${dato.Nombre}"/></td>
                                                    <td> <c:out value="${dato.Correo}"/></td>
                                                    <td> <c:out value="${dato.Descripcion}"/></td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- /.box-body -->
                                </div>
                                <!-- /.box -->
                            </div>
                        </div>
                    </section>
                <!-- /.content -->
                </div>
                <!-- /.content-wrapper -->
            <jsp:include page="../includes/footer.jsp"></jsp:include>
            </div>

        </body>
</html>
