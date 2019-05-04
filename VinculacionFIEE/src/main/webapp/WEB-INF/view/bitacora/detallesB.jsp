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
                            Detalles de Bitácora
                            <small></small>
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
                            <div class="col-md-12">
                                <div class="box box-primary">
                                    <div class="box-header with-border">
                                        <h3 class="box-title">Bitácora ${bitacora[0].numero}</h3>
                                </div>
                                <!-- /.box-header -->
                                <!-- form start -->

                                <div class="box-body">
                                    <div class="form-group col-md-6">
                                        <label for="nombre">Nombre del Alumno:</label><br>
                                        <c:if test="${empty usuario[0].nombre}">
                                            Dato por registrar
                                        </c:if>
                                        <c:if test="${not empty usuario[0].nombre}">
                                            ${usuario[0].nombre}
                                        </c:if>
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label for="matricula">Matricula:</label><br>
                                        <c:if test="${empty servicio[0].matricula}">
                                            Dato por registrar
                                        </c:if>
                                        <c:if test="${not empty servicio[0].matricula}">
                                            ${servicio[0].matricula}
                                        </c:if>
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label for="carrera">Programa Educativo:</label><br>
                                        <c:if test="${empty servicio[0].carrera}">
                                            Dato por registrar
                                        </c:if>
                                        <c:if test="${not empty servicio[0].carrera}">
                                            ${servicio[0].carrera}
                                        </c:if>
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label path="dependencia">Dependencia:</label><br>
                                        <c:if test="${empty bitacora[0].dependencia}">
                                            Dato por registrar
                                        </c:if>
                                        <c:if test="${not empty bitacora[0].dependencia}">
                                            ${bitacora[0].dependencia}
                                        </c:if>
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label path="direccion">Ubicación:</label><br>
                                        <c:if test="${empty bitacora[0].direccion}">
                                            Dato por registrar
                                        </c:if>
                                        <c:if test="${not empty bitacora[0].direccion}">
                                            ${bitacora[0].direccion}
                                        </c:if>
                                    </div>
                                    <div class="form-group col-md-2">
                                        <label for="datepicker">Fecha de Bitácora:</label><br>
                                        <c:if test="${empty bitacora[0].fecha}">
                                            Dato por registrar
                                        </c:if>
                                        <c:if test="${not empty bitacora[0].fecha}">
                                            ${bitacora[0].fecha}
                                        </c:if>
                                    </div>
                                    <div class="form-group col-md-2">
                                        <label path="datepicker2">Fecha de Vencimiento:</label><br>
                                        <c:if test="${empty bitacora[0].fechalim}">
                                            Dato por registrar
                                        </c:if>
                                        <c:if test="${not empty bitacora[0].fechalim}">
                                            ${bitacora[0].fechalim}
                                        </c:if>
                                    </div>
                                    <div class="form-group col-md-2">
                                        <label path="numero">Bitácora</label><br>
                                        <c:if test="${empty bitacora[0].numero}">
                                            Dato por registrar
                                        </c:if>
                                        <c:if test="${not empty bitacora[0].numero}">
                                            ${bitacora[0].numero}
                                        </c:if>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label path="actividades">Actividades Generales:</label><br>
                                        <c:if test="${empty bitacora[0].actividades}">
                                            Dato por registrar
                                        </c:if>
                                        <c:if test="${not empty bitacora[0].actividades}">
                                            ${bitacora[0].actividades}
                                        </c:if>
                                    </div>
                                    <!-- textarea -->
                                    <div class="form-group col-md-6">
                                        <label path="descripcion">Descripción de Actividades:</label><br>
                                        <c:if test="${empty bitacora[0].descripcion}">
                                            Dato por registrar
                                        </c:if>
                                        <c:if test="${not empty bitacora[0].descripcion}">
                                            ${bitacora[0].descripcion}
                                        </c:if>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label path="problemas">Problemas Encontrados:</label><br>
                                        <c:if test="${empty bitacora[0].problemas}">
                                            Dato por registrar
                                        </c:if>
                                        <c:if test="${not empty bitacora[0].problemas}">
                                            ${bitacora[0].problemas}
                                        </c:if>
                                    </div>
                                    <!-- textarea -->
                                    <div class="form-group col-md-6">
                                        <label path="soluciones">Soluciones Empleadas:</label><br>
                                        <c:if test="${empty bitacora[0].soluciones}">
                                            Dato por registrar
                                        </c:if>
                                        <c:if test="${not empty bitacora[0].soluciones}">
                                            ${bitacora[0].soluciones}
                                        </c:if>
                                    </div>
                                </div>
                                <div class="box-footer">
                                    <a href="lista" class="btn btn-default"><i class="fa fa-reply"></i> Volver</a>
                                </div>
                            </div>
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
