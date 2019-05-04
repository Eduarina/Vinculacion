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
                            Usuarios
                            <small>Editar Usuario</small>
                        </h1>
                        <!--                    <ol class="breadcrumb">
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
                                        <h3 class="box-title">Editar Usuario</h3>
                                    </div>
                                    <!-- /.box-header -->
                                    <!-- form start -->
                                <form:form action="editar" method="POST" modelAttribute="datos">
                                    <form:errors path="*" element="div" cssClass="alert alert-danger alert-dismissible"/>

                                    <%--  <spring:bind path="*">
                                        <c:forEach items="${status.errorMessages}" var="error">
                                            <div class="alert alert-danger alert-dismissible">
                                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                                <h4><i class="icon fa fa-info"></i> Error!</h4>
                                                ${error}
                                            </div>
                                        </c:forEach>      
                                    </spring:bind>
                                    <spring:bind path="*">
                                        <c:forEach items="${status.errorMessages}" var="error">
                                            <div class="callout callout-danger">
                                                <h4>I am a danger callout!</h4>
                                                ${error}
                                            </div>
                                        </c:forEach>      
</spring:bind> --%>
                                    <div class="box-body">
                                        <form:hidden path="idusuario"/>
                                        <form:hidden path="password"/>
                                        <form:hidden path="password2"/>
                                        <div class="form-group col-md-6">
                                            <%--<form:errors path="nombre" cssClass="alert alert-danger col-md-6" />--%>
                                            <form:label path="nombre">Nombre:</form:label>
                                            <c:set var="errorband"><form:errors path="nombre"/></c:set>
                                            <c:if test="${empty errorband}">
                                                <form:input path="nombre" autocomplete="off" type="text" cssClass="form-control" placeholder="Nombre..."  onkeyup="javascript:this.value = this.value.toUpperCase();"/>
                                            </c:if>
                                            <c:if test="${not empty errorband}">
                                                <form:input path="nombre" autocomplete="off" type="text" cssClass="form-control" placeholder="Nombre..."  style="border-color:red;" onkeyup="javascript:this.value = this.value.toUpperCase();"/>
                                            </c:if>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <form:label path="user">Usuario:</form:label>
                                            <c:set var="errorband"><form:errors path="user"/></c:set>
                                            <c:if test="${empty errorband}">
                                                <form:input path="user" autocomplete="off" type="text" cssClass="form-control" placeholder="Usuario..." onkeyup="javascript:this.value = this.value.toUpperCase();"/>
                                            </c:if>
                                            <c:if test="${not empty errorband}">
                                                <form:input path="user" autocomplete="off" type="text" cssClass="form-control" style="border-color:red;" placeholder="Usuario..." onkeyup="javascript:this.value = this.value.toUpperCase();"/>
                                            </c:if>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <form:label path="tipo">Tipo:</form:label>
                                            <c:set var="errorband"><form:errors path="password2"/></c:set>
                                            <c:if test="${empty errorband}">
                                                <form:select path="tipo" cssClass="form-control">
                                                    <form:option value="0">Seleccion...</form:option>
                                                    <form:options items="${tipo}"/>
                                                </form:select>
                                            </c:if>
                                            <c:if test="${not empty errorband}">
                                                <form:select path="tipo" cssClass="form-control" style="border-color:red;">
                                                    <form:option value="0">Seleccion...</form:option>
                                                    <form:options items="${tipo}"/>
                                                </form:select>
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