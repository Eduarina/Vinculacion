<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<spring:url value="/resources" var="urlPublic"/>
<!-- Main Header -->
<header class="main-header">

    <!-- Logo -->
    <a href="/VinculacionFIEE" class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini"><b>FIEE</b></span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg"><b>Vinculación</b>FIEE</span>
    </a>

    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>
        <!-- Navbar Right Menu -->
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <!-- User Account Menu -->
                <li class="dropdown user user-menu">
                    <!-- Menu Toggle Button -->
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <span class="hidden-xs">${sessionScope.nombre}</span>
                    </a>
                    <ul class="dropdown-menu">
                        <!-- The user image in the menu -->
                        <li class="user-header">
                            <p>
                                ${sessionScope.nombre}
                                <small>
                                    <c:if test="${sessionScope.tipo eq 1}">Administrador</c:if>
                                    <c:if test="${sessionScope.tipo eq 2}">Vinculación</c:if>
                                    <c:if test="${sessionScope.tipo eq 3}">Maestro</c:if>
                                    <c:if test="${sessionScope.tipo eq 5}">Estudiante</c:if>
                                    <c:if test="${sessionScope.tipo eq 4}">Encargado</c:if>
                                </small>
                            </p>
                        </li>
                        <!-- Menu Body -->
                        <li class="user-body">
                            <div class="row">
                            <c:if test="${sessionScope.tipo eq 5}">
                                <div class="col-xs-6 text-center">
                                    <a href="/VinculacionFIEE/documentos/lista"><i class="fa fa-upload"></i> Documentos</a>
                                </div>
                                <div class="col-xs-6 text-center">
                                    <a href="/VinculacionFIEE/login/perfil"><i class="fa fa-user"></i> Perfil</a>
                                </div>
                            </c:if>
                            <c:if test="${sessionScope.tipo ne 5}">
                                <div class="col-xs-6 text-center">
                                    <a href="/VinculacionFIEE/login/perfil"><i class="fa fa-user"></i> Perfil</a>
                                </div>
                            </c:if>    
                            </div>
                            <!-- /.row -->
                        </li>
                        <!-- Menu Footer-->
                        <li class="user-footer">
                            <div class="pull-right">
                                <a href="/VinculacionFIEE/login/logout" class="btn btn-default btn-flat"><i class="fa fa-sign-out"></i> Cerrar Sesión</a>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
</header>