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
                            Registrar Encargado de Proyecto
                            <small>Usuario de Proyecto</small>
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
                                        <h3 class="box-title">Nuevo Usuario</h3>
                                    </div>
                                    <!-- /.box-header -->
                                    <!-- form start -->
                                        <div class="box-body">
                                            <form:form method="POST" style="font-size:16px;" action="/VinculacionFIEE/encargados/insertar" modelAttribute="nuevo">
                                        <div class="form-group">
                                            <div class="col-sm-2" >
                                                <form:label path="nombre">Nombre: </form:label>
                                            </div>
                                            <div class="col-sm-8" >
                                                <form:input path="nombre" class="form-control" placeholder="Nombre" onkeydown="javascript:this.value = this.value.toUpperCase();"/>
                                            </div>
                                            <br>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-2" >
                                                <form:label path="correo">Correo: </form:label>
                                            </div>
                                            <div class="col-sm-8" >
                                                <form:input path="correo" class="form-control" placeholder="Correo" onkeydown="javascript:this.value = this.value.toUpperCase();"/>
                                            </div>
                                            <br>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-2" >
                                                <form:label path="telefono">Telefono: </form:label>
                                            </div>
                                            <div class="col-sm-8" >
                                                <form:input path="telefono" class="form-control" placeholder="Telefono" onkeydown="javascript:this.value = this.value.toUpperCase();"/>
                                            </div>
                                            <br>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-2" >
                                                <form:label path="usuario">Usuario:</form:label>
                                            </div>
                                            <div class="col-sm-8" >
                                                <form:input path="usuario" class="form-control" placeholder="Usuario" onkeydown="javascript:this.value = this.value.toUpperCase();"/>
                                            </div>
                                            <br>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-2" >
                                                <form:label path="pass">Contraseña: </form:label>
                                            </div>
                                            <div class="col-sm-8" >
                                                <form:input path="pass" type="password" autocomplete="off" required="required" class="form-control" placeholder="Contraseña"/>
                                            </div>
                                            <br>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-2" >
                                                <form:label path="pass2">Repetir contraseña: </form:label>
                                            </div>
                                            <div class="col-sm-8" >
                                                <form:input path="pass2" type="password" autocomplete="off" required="required" class="form-control" placeholder="Contraseña"/>
                                            </div>
                                            <br>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-2" >
                                                <form:label path="sexo">Sexo: </form:label>
                                            </div>
                                            <div class="col-sm-8" >
                                                <form:select path="sexo" cssClass="form-control">
                                                    <form:option value="0">Seleccion...</form:option>
                                                    <form:option value="H">Hombre</form:option>
                                                    <form:option value="H">Mujer</form:option>
                                                </form:select>
                                            </div>
                                            <br>
                                        </div>
                                        <div class="box-footer">
                                            <button type="submit" class="btn btn-success">Aceptar</button>
                                            <a href="lista" class="btn btn-default">Cancelar</a>
                                        </div>
                                    </form:form>
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
