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
                                            <header>Documentación a entregar
                                            <small><c:out value="${sessionScope.nombre}" /></small></header>
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
                                                    <th class="center">Documentacion</th>
                                                    <th class="center">Estado</th>
                                                    <th class="center">Archivo</th>
                                                    <th class="center"></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${datos}" var="docs">
                                                <tr>
                                                    <td class="center"> <c:out value="${docs.descripcion}"/></td>
                                                    <td class="center"> <c:out value="${docs.estado}"/></td>
                                                    <c:if test="${docs.numestado eq 3}">
                                                        <form:form method = "POST" modelAttribute = "fileUpload" enctype = "multipart/form-data">
                                                            <td class="center"><input type="hidden" name="descripcion" value="${docs.descripcion}"><input type = "file" name = "file" /></td>
                                                        <td class="center"><input type="submit" value="Subir Archivo"></td>    
                                                        </form:form>
                                                    </c:if>
                                                    <c:if test="${docs.numestado ne 3}">
                                                    <td class="center"><a href="download/${docs.nombre}_${docs.descripcion}" donwload="${docs.descripcion}_${docs.nombre}">${docs.descripcion}</a></td>
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
