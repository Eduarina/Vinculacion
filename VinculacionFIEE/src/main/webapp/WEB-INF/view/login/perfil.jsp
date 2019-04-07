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
                            Perfil
                            <small>
                            <c:if test="${sessionScope.tipo eq 1}">Administrador</c:if>
                            <c:if test="${sessionScope.tipo eq 2}">Vinculación</c:if>
                            <c:if test="${sessionScope.tipo eq 3}">Maestro</c:if>
                            <c:if test="${sessionScope.tipo eq 4}">Servicio</c:if>
                            <c:if test="${sessionScope.tipo eq 5}">Encargado</c:if>
                            </small>
                        </h1>
                        <ol class="breadcrumb">
                            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                            <li class="active">Perfil</li>
                        </ol>
                    </section>

                    <!-- Main content -->
                    <section class="content container-fluid">

                        <!--------------------------
                        | Your Page Content Here |
                        -------------------------->

                        <!-- general form elements disabled -->
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">Datos de Usuario</h3>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                                <!-- text input -->
                            <c:choose>
                                <c:when test="${sessionScope.tipo eq 2}">
                                    <c:forEach items="${datos}" var="dato">
                                        <div class="form-group col-md-6">
                                            <label>Idmaestro</label><br>
                                            <c:if test="${empty dato.idvinculacion}">
                                                Dato por registrar
                                            </c:if>
                                            <c:if test="${not empty dato.idvinculacion}">
                                                ${dato.idvinculacion}
                                            </c:if>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label>Correo</label><br>
                                            <c:if test="${empty dato.correo}">
                                                Dato por registrar
                                            </c:if>
                                            <c:if test="${not empty dato.correo}">
                                                ${dato.correo}
                                            </c:if>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label>Carrera</label><br>
                                            <c:if test="${empty dato.carrera}">
                                                Dato por registrar
                                            </c:if>
                                            <c:if test="${not empty dato.carrera}">
                                                ${dato.carrera}
                                            </c:if>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label>Idusuario</label><br>
                                            <c:if test="${empty dato.idusuario}">
                                                Dato por registrar
                                            </c:if>
                                            <c:if test="${not empty dato.idusuario}">
                                                ${dato.idusuario}
                                            </c:if>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <a href="editar?id=${dato.idmaestro}" class="btn btn-warning">Editar datos</a>
                                        </div>
                                    </c:forEach>
                                </c:when>
                                <c:when test="${sessionScope.tipo eq 3}">
                                    <c:forEach items="${datos}" var="dato">
                                        <div class="form-group col-md-6">
                                            <label>Idservicio</label><br>
                                            <c:if test="${empty dato.idservicio}">
                                                Dato por registrar
                                            </c:if>
                                            <c:if test="${not empty dato.idservicio}">
                                                ${dato.idservicio}
                                            </c:if>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label>Matricula</label><br>
                                            <c:if test="${empty dato.matricula}">
                                                Dato por registrar
                                            </c:if>
                                            <c:if test="${not empty dato.matricula}">
                                                ${dato.matricula}
                                            </c:if>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label>Créditos</label><br>
                                            <c:if test="${empty dato.creditos}">
                                                Dato por registrar
                                            </c:if>
                                            <c:if test="${not empty dato.creditos}">
                                                ${dato.creditos}
                                            </c:if>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label>Correo</label><br>
                                            <c:if test="${empty dato.correo}">
                                                Dato por registrar
                                            </c:if>
                                            <c:if test="${not empty dato.correo}">
                                                ${dato.correo}
                                            </c:if>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label>Telefóno</label><br>
                                            <c:if test="${empty dato.telefono}">
                                                Dato por registrar
                                            </c:if>
                                            <c:if test="${not empty dato.telefono}">
                                                ${dato.telefono}
                                            </c:if>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label>Celular</label><br>
                                            <c:if test="${empty dato.celular}">
                                                Dato por registrar
                                            </c:if>
                                            <c:if test="${not empty dato.celular}">
                                                ${dato.celular}
                                            </c:if>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label>Curriculum Vitae o Habilidades</label><br>
                                            <c:if test="${empty dato.cv}">
                                                Dato por registrar
                                            </c:if>
                                            <c:if test="${not empty dato.cv}">
                                                ${dato.cv}
                                            </c:if>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label>Carrera</label><br>
                                            <c:if test="${empty dato.carrera}">
                                                Dato por registrar
                                            </c:if>
                                            <c:if test="${not empty dato.carrera}">
                                                ${dato.carrera}
                                            </c:if>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label>Semestre</label><br>
                                            <c:if test="${empty dato.semestre}">
                                                Dato por registrar
                                            </c:if>
                                            <c:if test="${not empty dato.semestre}">
                                                ${dato.semestre}
                                            </c:if>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label>Estatus</label><br>
                                            <c:if test="${empty dato.estatus}">
                                                Dato por registrar
                                            </c:if>
                                            <c:if test="${not empty dato.estatus}">
                                                ${dato.estatus}
                                            </c:if>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label>Horario</label><br>
                                            <c:if test="${empty dato.horario}">
                                                Dato por registrar
                                            </c:if>
                                            <c:if test="${not empty dato.horario}">
                                                ${dato.horario}
                                            </c:if>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label>Idusuario</label><br>
                                            <c:if test="${empty dato.idusuario}">
                                                Dato por registrar
                                            </c:if>
                                            <c:if test="${not empty dato.idusuario}">
                                                ${dato.idusuario}
                                            </c:if>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <a href="editar?id=${dato.idmaestro}" class="btn btn-warning">Editar datos</a>
                                        </div>
                                    </c:forEach>
                                </c:when>
                                <c:when test="${sessionScope.tipo eq 3}">
                                    <c:forEach items="${datos}" var="dato">
                                        <div class="form-group col-md-6">
                                            <label>Idmaestro</label><br>
                                            <c:if test="${empty dato.idvinculacion}">
                                                Dato por registrar
                                            </c:if>
                                            <c:if test="${not empty dato.idvinculacion}">
                                                ${dato.idvinculacion}
                                            </c:if>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label>Correo</label><br>
                                            <c:if test="${empty dato.correo}">
                                                Dato por registrar
                                            </c:if>
                                            <c:if test="${not empty dato.correo}">
                                                ${dato.correo}
                                            </c:if>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label>Carrera</label><br>
                                            <c:if test="${empty dato.carrera}">
                                                Dato por registrar
                                            </c:if>
                                            <c:if test="${not empty dato.carrera}">
                                                ${dato.carrera}
                                            </c:if>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label>Idusuario</label><br>
                                            <c:if test="${empty dato.idusuario}">
                                                Dato por registrar
                                            </c:if>
                                            <c:if test="${not empty dato.idusuario}">
                                                ${dato.idusuario}
                                            </c:if>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <a href="editar?id=${dato.idmaestro}" class="btn btn-warning">Editar datos</a>
                                        </div>
                                    </c:forEach>
                                </c:when>
                                <c:when test="${sessionScope.tipo eq 4}">
                                    <c:forEach items="${datos}" var="dato">
                                        <div class="form-group col-md-6">
                                            <label>Idmaestro</label><br>
                                            <c:if test="${empty dato.idvinculacion}">
                                                Dato por registrar
                                            </c:if>
                                            <c:if test="${not empty dato.idvinculacion}">
                                                ${dato.idvinculacion}
                                            </c:if>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label>Correo</label><br>
                                            <c:if test="${empty dato.correo}">
                                                Dato por registrar
                                            </c:if>
                                            <c:if test="${not empty dato.correo}">
                                                ${dato.correo}
                                            </c:if>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label>Carrera</label><br>
                                            <c:if test="${empty dato.carrera}">
                                                Dato por registrar
                                            </c:if>
                                            <c:if test="${not empty dato.carrera}">
                                                ${dato.carrera}
                                            </c:if>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label>Idusuario</label><br>
                                            <c:if test="${empty dato.idusuario}">
                                                Dato por registrar
                                            </c:if>
                                            <c:if test="${not empty dato.idusuario}">
                                                ${dato.idusuario}
                                            </c:if>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <a href="editar?id=${dato.idmaestro}" class="btn btn-warning">Editar datos</a>
                                        </div>
                                    </c:forEach>
                                </c:when>
                            </c:choose>
                        </div>
                        <!-- general form elements disabled -->
                    </div>
                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->

            <jsp:include page="../includes/footer.jsp"></jsp:include>


        </div>

    </body>
</html>
