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
        <a href="../encargado/insertarE.jsp"></a>
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
                            Cargar proyecto
                        </h1>
                    </section>

                    <!-- Main content -->
                    <section class="content">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="box box-primary">
                                    <div class="box-header with-border">
                                        <form:form method="POST" style="font-size:16px;" action="cargar" modelAttribute="datos">
                                            <div class="form-group">
                                                <div class="col-sm-1"></div>
                                            <div class="col-sm-2" >
                                                <form:label path="nombre">Encargado: </form:label>
                                            </div>
                                            <div class="col-sm-7" >
                                                <form:input path="nombre" class="form-control" placeholder="Nombre" onkeydown="javascript:this.value = this.value.toUpperCase();"/>
                                            </div>
                                            <div class="col-sm-2">
                                                <input type="submit" class="btn btn-primary" value="Buscar">
                                            </div>
                                            <br>
                                        </div>
                                        </form:form>
                                </div>
                                    <div class="box-body" style="text-align: center;">
                                    <c:if test="${empty info}">
                                        <label>Primero debes buscar a un encargado</label>
                                    </c:if>
                                    <c:if test="${ not empty info}">
                                        <label>Primero debes buscar a un encargado</label>
                                    </c:if>
                                    </div>
                                    <div class="box-footer"></div>
                                <!-- /.box-body -->
                            </div>
                            <!-- /.box -->
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->

            <jsp:include page="../includes/footer.jsp"></jsp:include>


        </div>

    </body>
</html>
