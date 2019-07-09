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
        <body class="page-header-fixed sidemenu-closed-hidelogo page-content-white page-md header-blue white-sidebar-color logo-white">
            <div class="page-wrapper">
                <div class="page-header navbar navbar-fixed-top">
            <jsp:include page="../includes/menu.jsp"></jsp:include>
                </div>
                <div class="page-container">
            <jsp:include page="../includes/lateral.jsp"></jsp:include>
            
                <!-- Content Wrapper. Contains page content -->
                <div class="page-content-wrapper">
                    <div class="page-content" style="min-height: 667px" >
                        <div id="content">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card card-topline-green">
                                        <div class="card-head">
                                            <header>Firmas de autoridades</header>
                                            <div class="tools">
                                                <a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
                                                <a class="t-collapse btn-color fa fa-chevron-down" href="javascript:;"></a>
                                                <a class="t-close btn-color fa fa-times" href="javascript:;"></a>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <table class="table table-striped table-bordered table-hover table-checkable order-column" style="width: 100%" id="example1">
                                                <thead>
                                                <tr>
                                                    <th class="center">Autoridad</th>
                                                    <th class="center">Firma</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${firmas}" var="firma">
                                                <tr><td class="center">
                                                    <c:if test="${firma.idFirma eq 1}">
                                                        <c:out value="Director de Facultad" />
                                                    </c:if>
                                                    <c:if test="${firma.idFirma eq 2}">
                                                        <c:out value="Coordinación de servicio social" />
                                                    </c:if>
                                                    </td>
                                                    <c:if test="${firma.path == '/'}">
                                                        <form method = "POST" action="addFirma" modelAttribute = "firma" enctype = "multipart/form-data">
                                                            <td class="center">
                                                                <input type="hidden" name="descripcion" value="${firma.idFirma}">
                                                                <label for="descripcion">Nombre: </label>
                                                                <input type="text" name="descripcion" />
                                                                <input type = "file" name = "file" />
                                                                <input type="submit" value="Subir Archivo">
                                                            </td>    
                                                        </form>
                                                    </c:if>
                                                    <c:if test="${firma.path != '/'}">
                                                        <td class="center"><a href="eliminaFirma?id=${firma.idFirma}" class="btn btn-danger">Eliminar Firma</a></td>
                                                    </c:if>
                                                </tr>    
                                            </c:forEach>    
                                        </tbody>
                                    </table>
                                                
                                        </div>
                                    </div>
                                </div>
                            </div>
                          
                            
                        </div>
                    </div>
                    <!-- Content Header (Page header) -->
                    
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->

            <jsp:include page="../includes/footer.jsp"></jsp:include>
</div>

        </div>

    </body>
</html>