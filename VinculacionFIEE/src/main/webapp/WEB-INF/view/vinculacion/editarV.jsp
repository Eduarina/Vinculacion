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
                            <div class="col-md-12 col-sm-12">
                                <div class="card">
                                    <div class="card-header"><header>Editar Administrador
                                            <small>Usuarios de Vinculación</small></header>
                                    </div>
                                    <div class="card-body " >
                                        <!-- text form:input -->
                                    <form:form action="editar" method="POST" modelAttribute="datos">
                                        <div class="card-body " id="bar-parent2">
                                            <div class="row">
                                                <div class="col-md-6 col-sm-6">               
                                                    <form:errors path="*" element="div" cssClass="alert alert-danger alert-dismissible"/>                                               
                                                    <form:hidden path="idusuario"/>
                                                    <div class="form-group">
                                                        <form:label path="nombre">Nombre:</form:label>
                                                        <form:hidden path="password"/>
                                                        <form:input type="hidden" path="password2"/>
                                                        <c:set var="errorband"><form:errors path="nombre"/></c:set>
                                                        <c:if test="${empty errorband}">
                                                            <form:input path="nombre" autocomplete="off" type="text" class="form-control" placeholder="Nombre..."  />
                                                        </c:if>
                                                        <c:if test="${not empty errorband}">
                                                            <form:input path="nombre" autocomplete="off" type="text" class="form-control" placeholder="Nombre..."  />
                                                        </c:if>
                                                    </div>
                                                    <div class="form-group">
                                                        <form:label path="user">Usuario:</form:label>
                                                        <c:set var="errorband"><form:errors path="user"/></c:set>
                                                        <c:if test="${empty errorband}">
                                                            <form:input path="user" autocomplete="off" type="text" class="form-control" placeholder="Usuario..." />
                                                        </c:if>
                                                        <c:if test="${not empty errorband}">
                                                            <form:input path="user" autocomplete="off" type="text" class="form-control" placeholder="Usuario..." />
                                                        </c:if>
                                                    </div>
                                                    <div class="form-group">
                                                        <form:label path="sexo">Sexo: </form:label>
                                                        <br>
                                                        <c:set var="errorband"><form:errors path="sexo"/></c:set>
                                                        <c:if test="${empty errorband}">
                                                           <form:select path="sexo" class="form-control">
                                                                <option value="0">Seleccion...</option>
                                                                <option value="H">Hombre</option>
                                                                <option value="M">Mujer</option>
                                                           </form:select>
                                                        </c:if>
                                                        <c:if test="${not empty errorband}">
                                                           <form:select path="sexo" class="form-control">
                                                                <option value="0">Seleccion...</option>
                                                                <option value="H">Hombre</option>
                                                                <option value="M">Mujer</option>
                                                           </form:select>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </div>
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
        <jsp:include page="../includes/footer.jsp"></jsp:include>

    </div>

</body>
</html>
