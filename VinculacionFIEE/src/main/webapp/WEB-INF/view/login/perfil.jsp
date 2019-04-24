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
            <c:if test="${sessionScope.user == null}">response.sendRedirect("/usuarios/lista");</c:if>
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
                                <c:when test="${sessionScope.tipo eq 1}">
                                    <div class="form-group col-md-6">
                                        <label>Idusuario</label><br>
                                        ${sessionScope.id}
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>Nombre</label><br>
                                        ${sessionScope.nombre}
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>Usuario</label><br>
                                        ${sessionScope.user}
                                    </div>
                                </div>
                            </c:when>
                            <c:when test="${sessionScope.tipo eq 2}">
                                <div class="form-group col-md-6">
                                    <label>Idvinculacion</label><br>
                                    <c:if test="${empty datos[0].idvinculacion}">
                                        Dato por registrar
                                    </c:if>
                                    <c:if test="${not empty datos[0].idvinculacion}">
                                        ${datos[0].idvinculacion}
                                    </c:if>
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Correo</label><br>
                                    <c:if test="${empty datos[0].correo}">
                                        Dato por registrar
                                    </c:if>
                                    <c:if test="${not empty datos[0].correo}">
                                        ${datos[0].correo}
                                    </c:if>
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Programa Educativo</label><br>
                                    <c:if test="${empty datos[0].carrera}">
                                        Dato por registrar
                                    </c:if>
                                    <c:if test="${not empty datos[0].carrera}">
                                        ${datos[0].carrera}
                                    </c:if>
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Idusuario</label><br>
                                    <c:if test="${empty datos[0].idusuario}">
                                        Dato por registrar
                                    </c:if>
                                    <c:if test="${not empty datos[0].idusuario}">
                                        ${datos[0].idusuario}
                                    </c:if>
                                </div>
                            </div>
                            <div class="box-footer">
                                <a href="editar" class="btn btn-warning"><i class="fa fa-edit"></i> Editar datos</a>
                            </div>
                        </c:when>
                        <c:when test="${sessionScope.tipo eq 4}">
                            <div class="form-group col-md-6">
                                <label>Idservicio</label><br>
                                <c:if test="${empty datos[0].idservicio}">
                                    Dato por registrar
                                </c:if>
                                <c:if test="${not empty datos[0].idservicio}">
                                    ${datos[0].idservicio}
                                </c:if>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Matricula</label><br>
                                <c:if test="${empty datos[0].matricula}">
                                    Dato por registrar
                                </c:if>
                                <c:if test="${not empty datos[0].matricula}">
                                    ${datos[0].matricula}
                                </c:if>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Créditos</label><br>
                                <c:if test="${datos[0].creditos eq 0}">
                                    Dato por registrar
                                </c:if>
                                <c:if test="${datos[0].creditos ne 0}">
                                    ${datos[0].creditos}
                                </c:if>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Correo</label><br>
                                <c:if test="${empty datos[0].correo}">
                                    Dato por registrar
                                </c:if>
                                <c:if test="${not empty datos[0].correo}">
                                    ${datos[0].correo}
                                </c:if>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Telefóno</label><br>
                                <c:if test="${empty datos[0].telefono}">
                                    Dato por registrar
                                </c:if>
                                <c:if test="${not empty datos[0].telefono}">
                                    ${datos[0].telefono}
                                </c:if>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Celular</label><br>
                                <c:if test="${empty datos[0].celular}">
                                    Dato por registrar
                                </c:if>
                                <c:if test="${not empty datos[0].celular}">
                                    ${datos[0].celular}
                                </c:if>
                            </div>
                            <div class="form-group col-md-12">
                                <label>Curriculum Vitae o Habilidades</label><br>
                                <c:if test="${empty datos[0].cv}">
                                    Dato por registrar
                                </c:if>
                                <c:if test="${not empty datos[0].cv}">
                                    <p>${datos[0].cv}</p>
                                </c:if>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Programa Educativo</label><br>
                                <c:if test="${empty datos[0].carrera}">
                                    Dato por registrar
                                </c:if>
                                <c:if test="${not empty datos[0].carrera}">
                                    ${datos[0].carrera}
                                </c:if>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Semestre</label><br>
                                <c:if test="${datos[0].semestre eq 0}">
                                    Dato por registrar
                                </c:if>
                                <c:if test="${datos[0].semestre ne 0}">
                                    ${datos[0].semestre}
                                </c:if>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Estatus</label><br>
                                <c:if test="${empty datos[0].estatus}">
                                    Dato por registrar
                                </c:if>
                                <c:if test="${not empty datos[0].estatus}">
                                    ${datos[0].estatus}
                                </c:if>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Horario</label><br>
                                <c:if test="${empty datos[0].horario}">
                                    Dato por registrar
                                </c:if>
                                <c:if test="${not empty datos[0].horario}">
                                    ${datos[0].horario}
                                </c:if>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Idusuario</label><br>
                                <c:if test="${empty datos[0].idusuario}">
                                    Dato por registrar
                                </c:if>
                                <c:if test="${not empty datos[0].idusuario}">
                                    ${datos[0].idusuario}
                                </c:if>
                            </div>
                    </div>
                    <div class="box-footer">
                        <a href="editar" class="btn btn-warning"><i class="fa fa-edit"></i> Editar datos</a>
                    </div>
                </c:when>
                <c:when test="${sessionScope.tipo eq 3}">
                    <div class="form-group col-md-6">
                        <label>Idmaestro</label><br>
                        <c:if test="${empty datos[0].idmaestro}">
                            Dato por registrar
                        </c:if>
                        <c:if test="${not empty datos[0].idmaestro}">
                            ${datos[0].idmaestro}
                        </c:if>
                    </div>
                    <div class="form-group col-md-6">
                        <label>Correo</label><br>
                        <c:if test="${empty datos[0].correo}">
                            Dato por registrar
                        </c:if>
                        <c:if test="${not empty datos[0].correo}">
                            ${datos[0].correo}
                        </c:if>
                    </div>
                    <div class="form-group col-md-6">
                        <label>Programa Educativo</label><br>
                        <c:if test="${empty datos[0].carrera}">
                            Dato por registrar
                        </c:if>
                        <c:if test="${not empty datos[0].carrera}">
                            ${datos[0].carrera}
                        </c:if>
                    </div>
                    <div class="form-group col-md-6">
                        <label>Idusuario</label><br>
                        <c:if test="${empty datos[0].idusuario}">
                            Dato por registrar
                        </c:if>
                        <c:if test="${not empty datos[0].idusuario}">
                            ${datos[0].idusuario}
                        </c:if>
                    </div>
                </div>
                <div class="box-footer">
                    <a href="editar" class="btn btn-warning"><i class="fa fa-edit"></i> Editar datos</a>
                </div>
            </c:when>
            <c:when test="${sessionScope.tipo eq 5}">
                <div class="form-group col-md-6">
                    <label>Idencargado</label><br>
                    <c:if test="${empty datos[0].idencargado}">
                        Dato por registrar
                    </c:if>
                    <c:if test="${not empty datos[0].idencargado}">
                        ${datos[0].idencargado}
                    </c:if>
                </div>
                <div class="form-group col-md-6">
                    <label>Correo</label><br>
                    <c:if test="${empty datos[0].correo}">
                        Dato por registrar
                    </c:if>
                    <c:if test="${not empty datos[0].correo}">
                        ${datos[0].correo}
                    </c:if>
                </div>
                <div class="form-group col-md-6">
                    <label>Dependencia</label><br>
                    <c:if test="${empty datos[0].dependencia}">
                        Dato por registrar
                    </c:if>
                    <c:if test="${not empty datos[0].dependencia}">
                        ${datos[0].dependencia}
                    </c:if>
                </div>
                <div class="form-group col-md-6">
                    <label>Dirección</label><br>
                    <c:if test="${empty datos[0].direccion}">
                        Dato por registrar
                    </c:if>
                    <c:if test="${not empty datos[0].direccion}">
                        ${datos[0].direccion}
                    </c:if>
                </div>
                <div class="form-group col-md-6">
                    <label>Teléfono</label><br>
                    <c:if test="${empty datos[0].telefono}">
                        Dato por registrar
                    </c:if>
                    <c:if test="${not empty datos[0].telefono}">
                        ${datos[0].telefono}
                    </c:if>
                </div>
                <div class="form-group col-md-6">
                    <label>Idusuario</label><br>
                    <c:if test="${empty datos[0].idusuario}">
                        Dato por registrar
                    </c:if>
                    <c:if test="${not empty datos[0].idusuario}">
                        ${datos[0].idusuario}
                    </c:if>
                </div>
            </div>
            <div class="box-footer">
                <a href="editar" class="btn btn-warning"><i class="fa fa-edit"></i> Editar datos</a>
            </div>
        </c:when>
    </c:choose>

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
