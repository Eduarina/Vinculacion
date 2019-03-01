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
                            Editar Reporte Mensual
                            <small></small>
                        </h1>
                        <ol class="breadcrumb">
                            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                            <li class="active">Inicio</li>
                        </ol>
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
                                        <h3 class="box-title">Reporte #</h3>
                                    </div>
                                    <!-- /.box-header -->
                                    <!-- form start -->
                                    <form role="form" method="POST">
                                        <div class="box-body">
                                            <div class="form-group col-md-6">
                                                <label for="nombre">Nombre del Alumno</label>
                                                <input id="nombre" name="nombre" type="text" class="form-control" value="${lista[0].nombre}" placeholder="Nombre del Alumno..." onkeyup="javascript:this.value = this.value.toUpperCase();">
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label for="carrera">Carrera</label>
                                                <input id="carrera" name="carrera" type="text" class="form-control" value="${lista[0].carrera}" placeholder="Carrera...">
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label for="correo">Correo</label>
                                                <input id="correo" name="correo" type="email" class="form-control" value="${lista[0].correo}" placeholder="usuario@gmail.com...">
                                                <!--<input id="emailAddress" type="email" size="64" maxLength="64" required
                                                    placeholder="username@beststartupever.com" pattern=".+@beststartupever.com">-->
                                                <!-- /.input group -->
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label for="telefono">Teléfono</label>
                                                <div class="input-group">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-phone"></i>
                                                    </div>
                                                    <input id="telefono" name="telefono" type="text" class="form-control" value="${lista[0].telefono}" data-inputmask='"mask": "(999) 999-9999"' data-mask>
                                                </div>
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label for="celular">Celular</label>
                                                <div class="input-group">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-phone"></i>
                                                    </div>
                                                    <input id="celular" name="celular" type="text" class="form-control" value="${lista[0].celular}" data-inputmask='"mask": "(999) 999-9999"' data-mask>
                                                </div>
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label for="matricula">Matricula</label>
                                                <input id="matricula" name="matricula" type="text" class="form-control" value="${lista[0].matricula}" placeholder="S13001317...">
                                            </div>
                                            <div class="form-group col-md-2">
                                                <label for="noreporte">Reporte</label>
                                                <input id="noreporte" name="noreporte" type="number" class="form-control" value="${lista[0].noreporte}" min="1" max="6">
                                            </div>
                                            <!--Date--> 
                                            <div class="form-group col-md-2">
                                                <label for="fecha">Fecha</label>

                                                <div class="input-group date">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-calendar"></i>
                                                    </div>
                                                    <input id="fecha" name="datepicker" type="text" value="${lista[0].fecha}" class="form-control pull-right-container">
                                                </div>
                                                <!--/.input group--> 
                                            </div>
                                            <div class="form-group col-md-2">
                                                <label for="dependencia">Dependencia</label>
                                                <input id="dependencia" name="dependencia" type="text" value="${lista[0].dependencia}" class="form-control" min="1" max="12">
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label for="telefonod">Teléfono de la Dependencia</label>
                                                <div class="input-group">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-phone"></i>
                                                    </div>
                                                    <input id="telefonod" name="telefonod" type="text" class="form-control" value="${lista[0].telefonod}" data-inputmask='"mask": "(999) 999-9999"' data-mask>
                                                </div>
                                            </div>
                                            <div class="form-group col-md-2">
                                                <label for="proyecto">Nombre del Proyecto</label>
                                                <input id="proyecto" name="proyecto" type="text" class="form-control" value="${lista[0].proyecto}" min="1" max="12">
                                            </div>
                                            <div class="form-group col-md-2">
                                                <label for="horario">Horario</label>
                                                <input id="horario" name="horario" type="text" class="form-control" value="${lista[0].horario}" min="1" max="12">
                                            </div>
                                            <!-- textarea -->
                                            <div class="form-group col-md-6">
                                                <label for="actividades">Actividades Generales</label>
                                                <textarea id="actividades" name="actividades" class="form-control" rows="3" placeholder="Actividades Generales..." onkeyup="javascript:this.value = this.value.toUpperCase();">${lista[0].actividades}</textarea>
                                            </div>
                                            <!-- textarea -->
                                            <div class="form-group col-md-6">
                                                <label for="descripcion">Descripción de Actividades</label>
                                                <textarea id="descripcion" name="descripcion" class="form-control" rows="3" placeholder="Descripción de Actividades..." onkeyup="javascript:this.value = this.value.toUpperCase();">${lista[0].descripcion}</textarea>
                                            </div>
                                        </div>
                                        <div class="box-footer">
                                            <button type="submit" class="btn btn-success">Aceptar</button>
                                            <a href="reportes" class="btn btn-default">Cancelar</a>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                    </section>
                    <!-- /.content -->
                </div>
                <!-- /.content-wrapper -->

            <jsp:include page="includes/footer.jsp"></jsp:include>


        </div>

    </body>
</html>
