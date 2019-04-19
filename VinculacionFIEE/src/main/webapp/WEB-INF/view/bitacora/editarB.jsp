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
                            Editar Bitácora
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
                                <form:form action="editar" method="POST" modelAttribute="datos">
                                    <form:errors path="*" element="div" cssClass="alert alert-danger alert-dismissible"/>

                                    <form:hidden path="idbitacora"/>
                                    <div class="box-body">
                                        <div class="form-group col-md-6">
                                            <label for="nombre">Nombre del Alumno</label>
                                            <input id="nombre" name="nombre" type="text" class="form-control" value="${usuario[0].nombre}" disabled="true" placeholder="Nombre del Alumno..." onkeyup="javascript:this.value = this.value.toUpperCase();">
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label for="matricula">Matricula</label>
                                            <input id="matricula" name="matricula" type="text" value="${servicio[0].matricula}" disabled="true" class="form-control" placeholder="S13001317...">
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label for="carrera">Programa Educativo</label>
                                            <input id="carrera" name="carrera" type="text" value="${servicio[0].carrera}" disabled="true" class="form-control" placeholder="Carrera...">
                                        </div>
                                        <div class="form-group col-md-3">
                                            <form:label path="dependencia">Dependencia</form:label>
                                            <form:input path="dependencia" type="text" cssClass="form-control" placeholder="Dependencia..." autocomplete="off" onkeyup="javascript:this.value = this.value.toUpperCase();"/>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <form:label path="direccion">Ubicación</form:label>
                                            <form:input path="direccion" type="text" cssClass="form-control" placeholder="Ubicación..." autocomplete="off" onkeyup="javascript:this.value = this.value.toUpperCase();"/>
                                        </div>
                                        <!--Date--> 
                                        <div class="form-group col-md-2">
                                            <label for="datepicker">Fecha de Bitácora</label>

                                            <div class="input-group date">
                                                <div class="input-group-addon">
                                                    <i class="fa fa-calendar"></i>
                                                </div>
                                                <input id="datepicker" name="datepicker" type="text" value="${bitacora[0].fecha}" class="form-control pull-right-container">
                                            </div>
                                            <!--/.input group--> 
                                        </div>
                                        <!--Date--> 
                                        <div class="form-group col-md-2">
                                            <label path="datepicker2">Fecha de Vencimiento</label>

                                            <div class="input-group date">
                                                <div class="input-group-addon">
                                                    <i class="fa fa-calendar"></i>
                                                </div>
                                                <input id="datepicker2" name="datepicker2" type="text" value="${bitacora[0].fechalim}" class="form-control pull-right-container" disabled="true">
                                            </div>
                                            <!--/.input group--> 
                                        </div>
                                        <div class="form-group col-md-2">
                                            <form:label path="numero">Bitácora</form:label>
                                            <form:input path="numero" type="text" disabled="true" value="${bitacora[0].numero}" cssClass="form-control"/>
                                        </div>
                                        <!-- textarea -->
                                        <div class="form-group col-md-6">
                                            <form:label path="actividades">Actividades Generales</form:label>
                                            <form:textarea path="actividades" cssClass="form-control" rows="3" placeholder="Actividades Generales..." autocomplete="off" onkeyup="javascript:this.value = this.value.toUpperCase();"/>
                                        </div>
                                        <!-- textarea -->
                                        <div class="form-group col-md-6">
                                            <form:label path="descripcion">Descripción de Actividades</form:label>
                                            <form:textarea path="descripcion" cssClass="form-control" rows="3" placeholder="Descripción de Actividades..." autocomplete="off" onkeyup="javascript:this.value = this.value.toUpperCase();"/>
                                        </div>
                                        <!-- textarea -->
                                        <div class="form-group col-md-6">
                                            <form:label path="problemas">Problemas Encontrados</form:label>
                                            <form:textarea path="problemas" cssClass="form-control" rows="3" placeholder="Problemas Encontrados..." autocomplete="off" onkeyup="javascript:this.value = this.value.toUpperCase();"/>
                                        </div>
                                        <!-- textarea -->
                                        <div class="form-group col-md-6">
                                            <form:label path="soluciones">Soluciones Empleadas</form:label>
                                            <form:textarea path="soluciones" cssClass="form-control" rows="3" placeholder="Soluciones Empleadas..." autocomplete="off" onkeyup="javascript:this.value = this.value.toUpperCase();"/>
                                        </div>
                                        <div class="form-group col-md-12">
                                            <form:label path="observaciones">Observaciones</form:label>
                                            <form:textarea path="observaciones" cssClass="form-control" rows="3" placeholder="Observaciones sobre la bitácora..." autocomplete="off" onkeyup="javascript:this.value = this.value.toUpperCase();"/>
                                        </div>
                                    </div>
                                    <div class="box-footer">
                                        <button type="submit" class="btn btn-success">Aceptar</button>
                                        <a href="lista" class="btn btn-default">Cancelar</a>
                                    </div>
                                </form:form>
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
