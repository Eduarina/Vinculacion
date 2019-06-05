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
                            Asignación de alumnos
                            <small>Asignaciones</small>
                        </h1>
                    </section>

                    <!-- Main content -->
                    <section class="content container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="box box-primary">
                                    <div class="box-header with-border">
                                        <h3 class="box-title">Nueva asignación</h3>
                                    </div>
                                <form:form action="insertar" method="POST" modelAttribute="datos">
                                    <form:errors path="*" element="div" cssClass="alert alert-danger alert-dismissible"/>

                                    <div class="box-body">
                                        <div class="form-group col-md-6">
                                            <form:label path="idProyecto">Proyecto:</form:label>
                                            <c:set var="errorband"><form:errors path="idProyecto"/></c:set>
                                            <c:if test="${empty errorband}">
                                                <select id="idProyecto" name="idProyecto" Class="form-control">
                                                    <option value="0">Seleccion...</option>
                                                    <c:forEach items="${nombres}" var="nombre">
                                                        <option value="${nombre.idProyecto}">${nombre.titulo}</option>
                                                    </c:forEach>
                                                </select>
                                            </c:if>
                                            <c:if test="${not empty errorband}">
                                                <select id="idProyecto" name="idProyecto" Class="form-control" style="border-color:red;">
                                                    <option value="0">Seleccion...</option>
                                                    <c:forEach items="${nombres}" var="nombre">
                                                        <option value="${nombre.idProyecto}">${nombre.titulo}</option>
                                                    </c:forEach>
                                                </select>
                                            </c:if>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <%--<form:errors path="nombre" cssClass="alert alert-danger col-md-6" />--%>
                                            <form:label path="idEstudiante">Alumno: </form:label>
                                            <c:set var="errorband"><form:errors path="idEstudiante"/></c:set>
                                            <c:if test="${empty errorband}">
                                                <select class="form-control" path="idEstudiante">
                                                    <option value="0">Seleccion...</option>
                                                    <c:forEach items="${estudiantes}" var="nombre">
                                                        <option value="${nombre.idestudiate}" selected="selected">${nombre.nombre}
                                                    </c:forEach>
                                                </select>
                                            </c:if>
                                            <c:if test="${not empty errorband}">
                                                <select class="form-control" path="idEstudiante" style="border-color: red;">
                                                    <option value="0">Seleccion...</option>
                                                    <c:forEach items="${estudiantes}" var="nombre">
                                                        <option value="${nombre.idestudiate}" selected="selected">${nombre.nombre}
                                                    </c:forEach>
                                                </select>
                                            </c:if>
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
