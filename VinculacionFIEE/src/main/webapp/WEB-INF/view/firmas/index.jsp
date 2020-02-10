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
        <body>
        <jsp:include page="../includes/lateral.jsp"></jsp:include>
            <div id="right-panel" class="right-panel">
            <jsp:include page="../includes/menu.jsp"></jsp:include>


                <!-- Content Wrapper. Contains page content -->
                <div class="content mt-3">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-header">
                                    <div class="col-sm-6 col-lg-7">
                                        <header>Firmas de Autoridades</header>
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
        <!-- /.content-wrapper -->

        <jsp:include page="../includes/footer.jsp"></jsp:include>
    </body>
</html>
