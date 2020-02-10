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
            <div class="right-panel">
            <jsp:include page="../includes/menu.jsp"></jsp:include>

            <div class="content mt-3">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                            <div class="card-header"><header>Asignación de alumnos
                                                        <small>Asignaciones</small></header></a></li>
                                                    </ul>
                                                </div>
                                                                    <div class="card-body " id="bar-parent2">
                                                                    <!-- text input -->
                                                                        <form:form action="insertar" method="POST" modelAttribute="datos">
                                    <form:errors name="*" element="div" cssClass="alert alert-danger alert-dismissible"/>

                                    
                                        <div class="form-group">
                                            <label path="idProyecto">Proyecto:</label>
                                            <c:set var="errorband"><form:errors name="idProyecto"/></c:set>
                                            <c:if test="${empty errorband}">
                                                <select name="idProyecto" Class="form-control">
                                                    <option value="0">Seleccion...</option>
                                                    <c:forEach items="${nombres}" var="nombre">
                                                        <option value="${nombre.idProyecto}">${nombre.titulo}</option>
                                                    </c:forEach>
                                                </select>
                                            </c:if>
                                            <c:if test="${not empty errorband}">
                                                <select name="idProyecto" Class="form-control">
                                                    <option value="0">Seleccion...</option>
                                                    <c:forEach items="${nombres}" var="nombre">
                                                        <option value="${nombre.idProyecto}">${nombre.titulo}</option>
                                                    </c:forEach>
                                                </select>
                                            </c:if>
                                        </div>
                                        <div class="form-group">
                                            <%--<form:errors name="nombre" cssClass="alert alert-danger col-md-6" />--%>
                                            <label path="idEstudiante">Alumno: </label>
                                            <c:set var="errorband"><form:errors name="idEstudiante"/></c:set>
                                            <c:if test="${empty errorband}">
                                                <select class="form-control" name="idEstudiante">
                                                    <option value="0">Seleccion...</option>
                                                    <c:forEach items="${estudiantes}" var="nombre">
                                                        <option value="${nombre.ID}">${nombre.nombre}
                                                    </c:forEach>
                                                </select>
                                            </c:if>
                                            <c:if test="${not empty errorband}">
                                                <select class="form-control" name="idEstudiante">
                                                    <option value="0">Seleccion...</option>
                                                    <c:forEach items="${estudiantes}" var="nombre">
                                                        <option value="${nombre.ID}">${nombre.nombre}
                                                    </c:forEach>
                                                </select>
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
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Content Header (Page header) -->
                    
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->

            
</div>
    <jsp:include page="../includes/footer.jsp"></jsp:include>
</div>
</body>
</html>