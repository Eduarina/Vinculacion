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

            <div class="content-wrapper">
                    <section class="content-header">
                        <h1>
                            Documentación a entregar
                            <small><c:out value="${sessionScope.nombre}" /></small>
                        </h1>
                    </section>

                    <!-- Main content -->
                    <section class="content">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="box box-primary">
                                    <div class="box-header with-border">
                                        <table class="table table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th>Documentacion</th>
                                                    <th>Estado</th>
                                                    <th>Archivo</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${datos}" var="docs">
                                                <tr>
                                                    <td> <c:out value="${docs.descripcion}"/></td>
                                                    <td> <c:out value="${docs.estado}"/></td>
                                                    <c:if test="${docs.numestado eq 3}">
                                                        <td><input type = "file" name = "file" /></td>
                                                    </c:if>
                                                    <c:if test="${docs.numestado eq 3}">
                                                    <td><a>Archivo</a></td>
                                                    </c:if>
                                                    <c:if test="${docs.numestado eq 3}">
                                                        <td><input type="submit" value="Subir Archivo"></td>
                                                    </c:if>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
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

            <jsp:include page="../includes/footer.jsp"></jsp:include>


        </div>

    </body>
</html>
