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
                                    <form role="form" method="POST">
                                        <div class="box-body">
                                            <div class="form-group col-md-6">
                                                <label for="nombre">Nombre del Encargado</label>
                                                <input id="nombre" name="nombre" type="text" class="form-control" placeholder="Nombre del Encargado..." onkeyup="javascript:this.value = this.value.toUpperCase();">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="usuario">Usuario</label>
                                                <input id="usuario" name="usuario" type="text" class="form-control" placeholder="Usuario...">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="password">Contraseña</label>
                                                <input id="password" name="password" type="password" class="form-control" placeholder="Contraseña...">
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label for="correo">Correo</label>
                                                <input id="correo" name="correo" type="email" class="form-control" placeholder="usuario@gmail.com...">
                                                <!--<input id="emailAddress" type="email" size="64" maxLength="64" required
                                                    placeholder="username@beststartupever.com" pattern=".+@beststartupever.com">-->
                                                <!-- /.input group -->
                                            </div>
                                        </div>
                                        <div class="box-footer">
                                            <button type="submit" class="btn btn-success">Aceptar</button>
                                            <a href="usuariosE" class="btn btn-default">Cancelar</a>
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
