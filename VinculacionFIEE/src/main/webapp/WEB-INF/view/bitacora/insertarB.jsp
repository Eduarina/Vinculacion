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
                            <small>Editar Bitácora</small>
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
                                        <h3 class="box-title">Bitácora #</h3>
                                    </div>
                                    <!-- /.box-header -->
                                    <!-- form start -->
                                    <form action="insertar" role="form" method="POST">
                                        <div class="box-body">
                                            <div class="form-group col-md-6">
                                                <label for="alumno">Nombre del Alumno:</label>
                                                <input id="alumno" name="alumno" type="text" class="form-control" placeholder="Nombre del Alumno..." onkeyup="javascript:this.value = this.value.toUpperCase();">
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label for="matricula">Matricula:</label>
                                                <input id="matricula" name="matricula" type="text" class="form-control" placeholder="S13001317...">
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label for="carrera">Carrera:</label>
                                                <input id="carrera" name="carrera" type="text" class="form-control" placeholder="Carrera...">
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label for="dependencia">Dependencia:</label>
                                                <input id="dependencia" name="dependencia" type="text" class="form-control" placeholder="Dependencia...">
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label for="ubicacion">Ubicación:</label>
                                                <input id="ubicacion" name="ubicacion" type="text" class="form-control" placeholder="Dependencia...">
                                            </div>
                                            <!--Date--> 
                                            <div class="form-group col-md-2">
                                                <label for="fechaini">Fecha de Inicio:</label>

                                                <div class="input-group date">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-calendar"></i>
                                                    </div>
                                                    <input id="fechaini" name="datepicker" type="text" class="form-control pull-right-container">
                                                </div>
                                                <!--/.input group--> 
                                            </div>
                                            <!--Date--> 
                                            <div class="form-group col-md-2">
                                                <label for="fechafin">Fecha de Fin:</label>
                                                <div class="input-group date">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-calendar"></i>
                                                    </div>
                                                    <input id="fechafin" name="datepicker" type="text" class="form-control pull-right-container">
                                                </div>
                                                <!--/.input group--> 
                                            </div>
                                            <div class="form-group col-md-2">
                                                <label for="nobitacora">Bitácora:</label>
                                                <input id="nobitacora" name="nobitacora" type="number" class="form-control" min="1" max="12">
                                            </div>
                                            <!-- textarea -->
                                            <div class="form-group col-md-6">
                                                <label for="actividades">Actividades Generales:</label>
                                                <textarea id="actividades" name="actividades" class="form-control" rows="3" placeholder="Actividades Generales..." onkeyup="javascript:this.value = this.value.toUpperCase();"></textarea>
                                            </div>
                                            <!-- textarea -->
                                            <div class="form-group col-md-6">
                                                <label for="descripcion">Descripción de Actividades:</label>
                                                <textarea id="descripcion" name="descripcion" class="form-control" rows="3" placeholder="Descripción de Actividades..." onkeyup="javascript:this.value = this.value.toUpperCase();"></textarea>
                                            </div>
                                            <!-- textarea -->
                                            <div class="form-group col-md-6">
                                                <label for="problemas">Problemas Encontrados:</label>
                                                <textarea id="problemas" name="problemas" class="form-control" rows="3" placeholder="Problemas Encontrados..." onkeyup="javascript:this.value = this.value.toUpperCase();"></textarea>
                                            </div>
                                            <!-- textarea -->
                                            <div class="form-group col-md-6">
                                                <label for="soluciones">Soluciones Empleadas:</label>
                                                <textarea id="soluciones" name="soluciones" class="form-control" rows="3" placeholder="Soluciones Empleadas..." onkeyup="javascript:this.value = this.value.toUpperCase();"></textarea>
                                            </div>
                                        </div>
                                        <div class="box-footer">
                                            <button type="submit" class="btn btn-success">Aceptar</button>
                                            <a href="lista" class="btn btn-default">Cancelar</a>
                                        </div>
                                    </form>
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
