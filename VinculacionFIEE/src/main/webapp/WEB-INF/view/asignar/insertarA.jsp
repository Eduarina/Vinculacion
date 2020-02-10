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
                            <div class="col-md-12 col-sm-12">
                                <div class="card">
                                    <div class="card-header">
                                        <header>Nueva asignación</header>
                                    </div>
                                    <div class="card-body " id="bar-parent2">
                                        <!-- text form:input -->
                                    <form:form action="insercion" method="POST" modelAttribute="datos">
                                        <form:errors path="*" element="div" cssClass="alert alert-danger alert-dismissible"/>
                                        <div class="form-group">
                                            <%--<form:errors path="nombre" cssClass="alert alert-danger col-md-6" />--%>
                                            <form:label path="idMaestro">Maestro de la EE:</form:label>
                                            <c:set var="errorband"><form:errors path="idMaestro"/></c:set>
                                            <c:if test="${empty errorband}">
                                               <form:select path="idMaestro" class="form-control">
                                                    <c:choose>
                                                        <c:when test = "${sessionScope.tipo eq 3}">
                                                            <option value="${sessionScope.id}" selected="selected">${sessionScope.nombre}
                                                            </c:when>
                                                            <c:otherwise>
                                                            <option value="0">Seleccion...</option>
                                                            <c:forEach items="${nombres}" var="nombre">
                                                                <c:if test="${nombre.tipo eq 3 and nombre.estado eq 1}">
                                                                    <c:if test="${datos.idMaestro eq nombre.idusuario}">
                                                                        <option value="${nombre.idusuario}" selected="selected">${nombre.nombre}
                                                                        </c:if>
                                                                        <c:if test="${datos.idMaestro ne nombre.idusuario}">
                                                                        <option value="${nombre.idusuario}">${nombre.nombre}
                                                                        </c:if>
                                                                    </option>
                                                                </c:if>
                                                            </c:forEach>
                                                        </c:otherwise>
                                                    </c:choose>   
                                               </form:select>
                                            </c:if>
                                            <c:if test="${not empty errorband}">
                                               <form:select path="idMaestro" Class="form-control">
                                                    <option value="0">Seleccion...</option>
                                                    <c:forEach items="${nombres}" var="nombre">
                                                        <c:if test="${nombre.tipo eq 3}">
                                                            <c:if test="${datos.idMaestro eq nombre.idusuario}">
                                                                <option value="${nombre.idusuario}" selected="selected">${nombre.nombre}
                                                                </c:if>
                                                                <c:if test="${datos.idMaestro ne nombre.idusuario}">
                                                                <option value="${nombre.idusuario}">${nombre.nombre}
                                                                </c:if>
                                                            </option>
                                                        </c:if>
                                                    </c:forEach>
                                               </form:select>
                                            </c:if>
                                        </div>
                                        <div class="form-group">
                                            <%--<form:errors path="nombre" cssClass="alert alert-danger col-md-6" />--%>
                                            <form:label path="idEstudiante">Servicio Social:</form:label>
                                            <c:set var="errorband"><form:errors path="idEstudiante"/></c:set>
                                            <c:if test="${empty errorband}">
                                               <form:select class="form-control" path="idEstudiante">
                                                    <option value="0">Seleccion...</option>
                                                    <c:forEach items="${nombres}" var="nombre">
                                                        <c:if test="${nombre.tipo eq 5}">
                                                            <c:if test="${datos.idEstudiante eq nombre.idusuario}">
                                                                <option value="${nombre.idusuario}" selected="selected">${nombre.nombre}
                                                                </c:if>
                                                                <c:if test="${datos.idEstudiante ne nombre.idusuario}">
                                                                <option value="${nombre.idusuario}">${nombre.nombre}
                                                                </c:if>
                                                            </option>
                                                        </c:if>
                                                    </c:forEach>
                                               </form:select>
                                            </c:if>
                                            <c:if test="${not empty errorband}">
                                               <form:select path="idEstudiante" Class="form-control">
                                                    <option value="0">Seleccion...</option>
                                                    <c:forEach items="${nombres}" var="nombre">
                                                        <c:if test="${nombre.tipo eq 5}">
                                                            <c:if test="${datos.idEstudiante eq nombre.idusuario}">
                                                                <option value="${nombre.idusuario}" selected="selected">${nombre.nombre}
                                                                </c:if>
                                                                <c:if test="${datos.idEstudiante ne nombre.idusuario}">
                                                                <option value="${nombre.idusuario}">${nombre.nombre}
                                                                </c:if>
                                                            </option>
                                                        </c:if>
                                                    </c:forEach>
                                               </form:select>
                                            </c:if>
                                        </div>


                                        <button type="submit" class="btn btn-success btn-sm m-b-10">Aceptar</button>
                                        <a href="lista" class="btn btn-default btn-sm m-b-10">Cancelar</a>

                                    </form:form>
                                </div>

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
