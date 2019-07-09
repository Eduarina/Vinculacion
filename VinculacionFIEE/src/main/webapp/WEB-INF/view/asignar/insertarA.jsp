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
                            <div class="profile-content">
                                <div class="row">
                                    <div class="col-md-12 col-sm-12">
                                        <div class="card">
                                            <div class="card-topline-green"></div>
                                            <div class="white-box">
                                                <div class="p-r1-20">
                                                    <ul class="nav customtab nav-tabs" role="tablist">
                                                        <li class="nav-item"><a href="#tab1" class="nav-link active show" data-toggle="tab"><header>Nueva asignación</header></a></li>
                                                    </ul>
                                                </div>
                                                <div class="tab-content">
                                                    <div class="tab-pane fontawesomw-demo active show" id="tab1">
                                                        <div class="row">
                                                            <div class="col-md-12 col-sm-12">

                                                                    <div class="card-body " id="bar-parent2">
                                                                    <!-- text input -->
                                                                        <form:form action="insercion" method="POST" modelAttribute="datos">
                                                                            <form:errors path="*" element="div" cssClass="alert alert-danger alert-dismissible"/>
                                                                                <div class="form-group">
                                                                                    <%--<form:errors path="nombre" cssClass="alert alert-danger col-md-6" />--%>
                                                                                    <label path="idMaestro">Maestro de la EE:</label>
                                                                                    <c:set var="errorband"><form:errors path="idMaestro"/></c:set>
                                                                                    <c:if test="${empty errorband}">
                                                                                        <select name="idMaestro" Class="form-control">
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
                                                                                            </select>
                                                                                    </c:if>
                                                                                    <c:if test="${not empty errorband}">
                                                                                        <select name="idMaestro" Class="form-control">
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
                                                                                        </select>
                                                                                    </c:if>
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <%--<form:errors path="nombre" cssClass="alert alert-danger col-md-6" />--%>
                                                                                    <label path="idEstudiante">Servicio Social:</label>
                                                                                    <c:set var="errorband"><form:errors path="idEstudiante"/></c:set>
                                                                                    <c:if test="${empty errorband}">
                                                                                        <select class="form-control" name="idEstudiante">
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
                                                                                        </select>
                                                                                    </c:if>
                                                                                    <c:if test="${not empty errorband}">
                                                                                        <select name="idEstudiante" Class="form-control">
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