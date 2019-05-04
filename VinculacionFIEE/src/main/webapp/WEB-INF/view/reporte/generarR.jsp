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
                            Reportes
                            <small>Documentos</small>
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
                                        <h3 class="box-title">Nuevo</h3>
                                    </div>
                                    <!-- /.box-header -->
                                    <!-- form start -->
                                    <form action="generar" method="POST" modelAttribute="datos">
                                    <c:if test="${not empty message}">
                                        <div class="alert alert-danger alert-dismissible">${message}</div>
                                    </c:if>
                                    <div class="box-body">
                                        <div class="form-group col-md-6">
                                            <%--<form:errors path="nombre" cssClass="alert alert-danger col-md-6" />--%>
                                            <label for="numero">Número de Reporte:</label>
                                            <input id="numero" name="numero" autocomplete="off" type="number" min="1" max="12" Class="form-control" placeholder="Bitácora #..."/>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="idmaestro">Maestro:</label>
                                            <c:forEach items="${datos}" var="dato">
                                                <c:forEach items="${usuarios}" var="usuario">
                                                    <c:if test="${dato.idmaestro eq usuario.idusuario}">
                                                        <input id="idmaestro" name="idmaestro" disabled="true" value="${usuario.nombre}" type="text" Class="form-control" placeholder="Maestro..."/>
                                                    </c:if>
                                                </c:forEach>
                                            </c:forEach>

                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="idservicio">Servicio Social:</label>
                                            <c:forEach items="${datos}" var="dato">
                                                <c:forEach items="${usuarios}" var="usuario">
                                                    <c:if test="${dato.idservicio eq usuario.idusuario}">
                                                        <input id="idservicio" name="idservicio" disabled="true" value="${usuario.nombre}" type="text" Class="form-control" placeholder="Maestro..."/>
                                                    </c:if>
                                                </c:forEach>
                                            </c:forEach>

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
            </div>

            <!-- /.content -->
        </div>
        <!-- /.content-wrapper -->

        <jsp:include page="../includes/footer.jsp"></jsp:include>


    </div>

</body>
</html>
