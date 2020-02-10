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
                                        <header>Registrar Maestro
                                            <small>Usuario de Proyecto</small></header>
                                    </div>
                                    <div class="card-body " id="bar-parent2">
                                        <!-- text form:input -->
                                        <form:form method="POST" style="font-size:16px;" action="/VinculacionFIEE/maestros/insertar" modelAttribute="maestro">
                                            <form:errors path="*" element="div" cssClass="alert alert-danger alert-dismissible"/>
                                            <div class="row form-group"><div class="col col-sm-1"></div><div class="col col-sm-2">
                                                <form:label path="nombre">Nombre: </form:label></div><div class="col col-sm-8">
                                            <c:set var="errorband"><form:errors path="nombre"/></c:set>
                                            <c:if test="${empty errorband}">
                                                <form:input path="nombre" class="form-control" autocomplete="off" placeholder="Nombre" />
                                            </c:if>
                                            <c:if test="${not empty errorband}">
                                                <form:input path="nombre" class="form-control" autocomplete="off" placeholder="Nombre" />
                                            </c:if>
                                            </div>
                                        </div>
                                        <div class="row form-group"><div class="col col-sm-1"></div><div class="col col-sm-2">
                                            <form:label path="correo">Correo: </form:label></div><div class="col col-sm-8">
                                            <c:set var="errorband"><form:errors path="correo"/></c:set>
                                            <c:if test="${empty errorband}">
                                                <form:input path="correo" type="email" class="form-control" autocomplete="off" placeholder="Correo" />
                                            </c:if>
                                            <c:if test="${not empty errorband}">
                                                <form:input path="correo" type="email" class="form-control" autocomplete="off" placeholder="Correo"  />
                                            </c:if>
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-sm-1"></div>
                                            <div class="col col-sm-2">
                                            <form:label path="usuario">Usuario:</form:label>
                                            </div>
                                            <div class="col col-sm-8">
                                            <c:set var="errorband"><form:errors path="usuario"/></c:set>
                                            <c:if test="${empty errorband}">
                                                <form:input path="usuario" class="form-control" autocomplete="off" placeholder="Usuario" />
                                            </c:if>
                                            <c:if test="${not empty errorband}">
                                                <form:input path="usuario" class="form-control" autocomplete="off" placeholder="Usuario" />
                                            </c:if>
                                            </div>
                                        </div>
                                        <div class="row form-group"
                                             ><div class="col col-sm-1"></div>
                                            <div class="col col-sm-2">
                                                <form:label path="pass">Contraseña: </form:label>
                                            </div>
                                            <div class="col col-sm-8">
                                            <c:set var="errorband"><form:errors path="pass"/></c:set>
                                            <c:if test="${empty errorband}">
                                                <form:input path="pass" type="password" autocomplete="off" required="required" class="form-control" placeholder="Contraseña"/>
                                            </c:if>
                                            <c:if test="${not empty errorband}">
                                                <form:input path="pass" type="password" autocomplete="off" required="required" class="form-control"  placeholder="Contraseña"/>
                                            </c:if>
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-sm-1"></div>
                                            <div class="col col-sm-2">
                                            <form:label path="pass2">Repetir contraseña: </form:label>
                                            </div>
                                            <div class="col col-sm-8">
                                            <c:set var="errorband"><form:errors path="pass2"/></c:set>
                                            <c:if test="${empty errorband}">
                                                <form:input path="pass2" type="password" autocomplete="off" required="required" class="form-control" placeholder="Contraseña"/>
                                            </c:if>
                                            <c:if test="${not empty errorband}">
                                                <form:input path="pass2" type="password" autocomplete="off" required="required"  class="form-control" placeholder="Contraseña"/>
                                            </c:if>
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-sm-1"></div>
                                            <div class="col col-sm-2">
                                            <form:label path="sexo">Sexo: </form:label>
                                            </div>
                                            <div class="col col-sm-8">
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
                                            <div class="modal-footer">
                                        <button type="submit" class="btn btn-success btn-sm m-b-10">Aceptar</button>
                                        <a href="lista" class="btn btn-secondary btn-sm m-b-10">Cancelar</a>

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
