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
        <body class="hold-transition skin-green-light sidebar-mini fixed">
            <div class="wrapper">

            <jsp:include page="includes/menu.jsp"></jsp:include>

            <jsp:include page="includes/lateral.jsp"></jsp:include>

                <!-- Content Wrapper. Contains page content -->
                <div class="content-wrapper">
                    <!-- Content Header (Page header) -->
                    <section class="content-header">
                        <h1>
                            Registrar Proyecto
                            <small>Universidad Veracruzana</small>
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
                                        <h3 class="box-title">Registro</h3>
                                    </div>
                                    <!-- /.box-header -->
                                    <!-- form start -->
                                    <form role="form">
                                        <div class="box-body">
                                            <div class="form-group col-md-6">
                                                <label for="proyecto">Proyecto</label>
                                                <input id="proyecto" name="proyecto" type="text" class="form-control" placeholder="Nombre del Proyecto..." onkeyup="javascript:this.value = this.value.toUpperCase();">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="dependencia">Dependencia</label>
                                                <input id="dependencia" name="dependencia" type="text" class="form-control" placeholder="Nombre de la Dependencia..." onkeyup="javascript:this.value = this.value.toUpperCase();">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="responsable">Responsable del Proyecto</label>
                                                <input id="responsable" name="responsable" type="text" class="form-control" placeholder="Nombre del Responsable..." onkeyup="javascript:this.value = this.value.toUpperCase();">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="direccion">Dirección de la Dependencia</label>
                                                <input id="direccion" name="direccion" type="text" class="form-control" placeholder="Dirección de la dependencia..." onkeyup="javascript:this.value = this.value.toUpperCase();">
                                            </div>
                                            <!-- textarea -->
                                            <div class="form-group col-md-6">
                                                <label for="descripcion">Descripción del Proyecto</label>
                                                <textarea id="descripcion" name="descripcion" class="form-control" rows="3" placeholder="Descripción del proyecto..." onkeyup="javascript:this.value = this.value.toUpperCase();"></textarea>
                                            </div>
                                            <!-- textarea -->
                                            <div class="form-group col-md-6">
                                                <label for="actividades">Descripción de Actividades</label>
                                                <textarea id="actividades" name="actividades" class="form-control" rows="3" placeholder="Descripción de actividades..." onkeyup="javascript:this.value = this.value.toUpperCase();"></textarea>
                                            </div>
                                            <!-- phone mask -->
                                            <div class="form-group col-md-3">
                                                <label for="telefono">Teléfono</label>

                                                <div class="input-group">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-phone"></i>
                                                    </div>
                                                    <input type="text" class="form-control" data-inputmask='"mask": "(999) 999-9999"' data-mask>
                                                </div>
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label for="correo">Correo</label>
                                                <input id="correo" name="correo" type="email" class="form-control" placeholder="usuario@gmail.com...">
                                                <!--<input id="emailAddress" type="email" size="64" maxLength="64" required
                                                    placeholder="username@beststartupever.com" pattern=".+@beststartupever.com">-->
                                                <!-- /.input group -->
                                            </div>
                                            <!--select--> 
                                            <div class="form-group col-md-3">
                                                <label for="tiporegistro">Tipo de Registro</label>
                                                <select id="tiporegistro" name="tiporegistro" class="form-control">
                                                    <option value="sivu">SIVU</option>
                                                    <option value="sirei">SIREI</option>
                                                </select>
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label for="r">Registro</label>
                                                <input id="registro" name="registro" type="text" class="form-control" placeholder="No. de Registro..." onkeyup="javascript:this.value = this.value.toUpperCase();">
                                            </div>
                                            <div class="form-group col-md-5">
                                                <label for="entidades">Entidades Relacionadas</label>
                                                <input id="entidades" name="entidades" type="text" class="form-control" placeholder="Entidades separadas por comas..." onkeyup="javascript:this.value = this.value.toUpperCase();">
                                            </div>
                                            <!-- checkbox -->
                                            <div class="form-group col-md-1">
                                                <div class="checkbox">
                                                    <label for="Beca">
                                                        <input id="checkbox" name="checkbox" type="checkbox" onclick="disableMyText()">
                                                        <b>Beca</b>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label for="beca">Nombre de Beca</label>
                                                <input id="beca" name="beca" type="text" class="form-control" placeholder="Nombre de la Beca..." disabled onkeyup="javascript:this.value = this.value.toUpperCase();">
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label for="tipo">Tipo</label>
                                                <input id="tipo" name="tipo" type="text" class="form-control" placeholder="Tipo de beca..." disabled onkeyup="javascript:this.value = this.value.toUpperCase();">
                                            </div>
                                            <!--Date--> 
                                            <div class="form-group col-md-2">
                                                <label for="inicio">Fecha de Inicio</label>

                                                <div class="input-group date">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-calendar"></i>
                                                    </div>
                                                    <input id="inicio" name="datepicker" type="text" class="form-control pull-right-container">
                                                </div>
                                                <!--/.input group--> 
                                            </div>
                                            <!--Date--> 
                                            <div class="form-group col-md-2">
                                                <label for="fin">Fecha de Fin</label>

                                                <div class="input-group date">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-calendar"></i>
                                                    </div>
                                                    <input id="fin" name="datepicker" type="text" class="form-control pull-right-container">
                                                </div>
                                                <!--/.input group--> 
                                            </div>
                                            <div class="form-group col-md-2">
                                                <label for="alumnos">Alumnos Requeridos</label>
                                                <input id="alumnos" name="alumnos" type="number" class="form-control" min="1" max="5">
                                            </div>
                                            <div class="form-group col-md-2">
                                                <label for="horas">Horas Requeridos</label>
                                                <input id="horas" name="horas" type="number" class="form-control" min="4" max="6">
                                            </div>
                                            <!--select--> 
                                            <div class="form-group col-md-2">
                                                <label for="carrera">Carrera</label>
                                                <select id="carrera" name="carrera" class="form-control">
                                                    <option value="electrica">Ing. Eléctrica</option>
                                                    <option value="electronica">Ing. Electrónica y Comunicaciones</option>
                                                    <option value="informatica">Ing. Informática</option>
                                                    <option value="mecatronica">Ing. Mecatrónica</option>
                                                </select>
                                            </div>
                                            <!--select--> 
                                            <div class="form-group col-md-2">
                                                <label for="ingles">Nivel de Inglés</label>
                                                <select id="ingles" name="ingles" class="form-control">
                                                    <option value="1">Basico</option>
                                                    <option value="2">Intermedio</option>
                                                    <option value="3">Avanzado</option>
                                                </select>
                                            </div>
                                            <!-- /.form group -->
                                        </div>
                                        <div class="box-footer">
                                            <button type="submit" class="btn btn-primary">Aceptar</button>
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
