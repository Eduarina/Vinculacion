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
                            Firmas de autoridades
                        </h1>
                    </section>

                    <!-- Main content -->
                    <section class="content">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="box box-primary">
                                    <!-- /.box-header -->
                                    <div class="box-body">
                                        <table id="example1" class="table table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th>Autoridad</th>
                                                    <th>Firma</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${firmas}" var="firma">
                                                <tr><td>
                                                    <c:if test="${firma.idFirma eq 1}">
                                                        <c:out value="Director de Facultad" />
                                                    </c:if>
                                                    <c:if test="${firma.idFirma eq 2}">
                                                        <c:out value="Coordinación de servicio social" />
                                                    </c:if>
                                                    </td>
                                                    <c:if test="${firma.path == '/'}">
                                                        <form method = "POST" action="addFirma" modelAttribute = "firma" enctype = "multipart/form-data">
                                                            <td>
                                                                <input type="hidden" name="descripcion" value="${firma.idFirma}">
                                                                <label for="descripcion">Nombre: </label>
                                                                <input type="text" name="descripcion" />
                                                                <input type = "file" name = "file" />
                                                                <input type="submit" value="Subir Archivo">
                                                            </td>    
                                                        </form>
                                                    </c:if>
                                                    <c:if test="${firma.path != '/'}">
                                                        <td><a href="eliminaFirma?id=${firma.idFirma}" class="btn btn-danger">Eliminar Firma</a></td>
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
            <!-- /.content-wrapper -->

            <jsp:include page="../includes/footer.jsp"></jsp:include>


        </div>

    </body>
</html>
