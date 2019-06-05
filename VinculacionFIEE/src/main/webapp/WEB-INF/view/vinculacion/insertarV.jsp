<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<spring:url value="/resources" var="urlPublic"/>
<!DOCTYPE html>
<html>
    <jsp:include page="../includes/head.jsp"></jsp:include>
        <body class="hold-transition skin-green-light sidebar-mini">
            <div class="wrapper">

            <jsp:include page="../includes/menu.jsp"></jsp:include>
            <jsp:include page="../includes/lateral.jsp"></jsp:include>

                <div class="content-wrapper">
                    <section class="content-header">
                        <h1>
                            Registrar Administrador
                            <small>Usuario de Vinculación</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                            <li class="active">Inicio</li>
                        </ol>
                    </section>

                    <section class="content container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="box box-primary">
                                    <div class="box-header with-border">
                                        <h3 class="box-title">Nuevo Usuario</h3>
                                    </div>
                                    <div class="box-body">
                                    <form:form method="POST" style="font-size:16px;" action="/VinculacionFIEE/vinculacion/insertar" modelAttribute="usuario">
                                        <form:errors path="*" element="div" cssClass="alert alert-danger alert-dismissible"/>
                                        
                                        <div class="form-group">
                                            <div class="col-sm-2" >
                                                <form:label path="nombre">Nombre: </form:label>
                                                </div>
                                                <div class="col-sm-8" >
                                                <c:set var="errorband"><form:errors path="nombre"/></c:set>
                                                <c:if test="${empty errorband}">
                                                    <form:input path="nombre" class="form-control" autocomplete="off" placeholder="Nombre" onkeyup="javascript:this.value = this.value.toUpperCase();"/>
                                                </c:if>
                                                <c:if test="${not empty errorband}">
                                                    <form:input path="nombre" class="form-control" autocomplete="off" placeholder="Nombre" style="border-color:red;" onkeyup="javascript:this.value = this.value.toUpperCase();"/>
                                                </c:if>
                                            </div>
                                            <br>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-2" >
                                                <form:label path="user">Usuario:</form:label>
                                                </div>
                                                <div class="col-sm-8" >
                                                <c:set var="errorband"><form:errors path="user"/></c:set>
                                                <c:if test="${empty errorband}">
                                                    <form:input path="user" class="form-control" autocomplete="off" placeholder="Usuario" onkeyup="javascript:this.value = this.value.toUpperCase();"/>
                                                </c:if>
                                                <c:if test="${not empty errorband}">
                                                    <form:input path="user" class="form-control" autocomplete="off" placeholder="Usuario" style="border-color:red;" onkeyup="javascript:this.value = this.value.toUpperCase();"/>
                                                </c:if>
                                            </div>
                                            <br>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-2" >
                                                <form:label path="password">Contraseña: </form:label>
                                                </div>
                                                <div class="col-sm-8" >
                                                <c:set var="errorband"><form:errors path="password"/></c:set>
                                                <c:if test="${empty errorband}">
                                                    <form:input path="password" type="password" autocomplete="off" required="required" class="form-control" placeholder="Contraseña"/>
                                                </c:if>
                                                <c:if test="${not empty errorband}">
                                                    <form:input path="password" type="password" autocomplete="off" required="required" class="form-control" style="border-color:red;" placeholder="Contraseña"/>
                                                </c:if>
                                            </div>
                                            <br>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-2" >
                                                <form:label path="password2">Repetir contraseña: </form:label>
                                                </div>
                                                <div class="col-sm-8" >
                                                <c:set var="errorband"><form:errors path="password2"/></c:set>
                                                <c:if test="${empty errorband}">
                                                    <form:input path="password2" type="password" autocomplete="off" required="required" class="form-control" placeholder="Contraseña"/>
                                                </c:if>
                                                <c:if test="${not empty errorband}">
                                                    <form:input path="password2" type="password" autocomplete="off" required="required" class="form-control" style="border-color:red;" placeholder="Contraseña"/>
                                                </c:if>
                                            </div>
                                            <br>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-2" >
                                                <form:label path="sexo">Sexo: </form:label>
                                                </div>
                                                <div class="col-sm-8" >
                                                <c:set var="errorband"><form:errors path="sexo"/></c:set>
                                                <c:if test="${empty errorband}">
                                                    <form:select path="sexo" cssClass="form-control">
                                                        <form:option value="0">Seleccion...</form:option>
                                                        <form:options items="${sexo}"/>
                                                    </form:select>
                                                </c:if>
                                                <c:if test="${not empty errorband}">
                                                    <form:select path="sexo" cssClass="form-control" style="border-color:red;">
                                                        <form:option value="0">Seleccion...</form:option>
                                                        <form:options items="${sexo}"/>
                                                    </form:select>
                                                </c:if>
                                            </div>
                                            <br>
                                        </div>
                                        <div class="box-footer">
                                            <button type="submit" class="btn btn-success">Aceptar</button>
                                            <a href="lista" class="btn btn-default">Cancelar</a>
                                        </div>
                                    </form:form>
                                </div>
                            </div>
                        </div>
                    </div>

                </section>
            </div>

            <jsp:include page="../includes/footer.jsp"></jsp:include>
        </div>
    </body>
</html>
