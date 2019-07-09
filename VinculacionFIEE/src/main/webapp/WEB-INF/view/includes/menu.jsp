<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<spring:url value="/resources" var="urlPublic"/>
<!-- Main Header -->
<div class="page-header-inner">
    <div class="page-logo">
    <a href="/VinculacionFIEE">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini"><b>FIEE</b></span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg"><b>Vinculación</b>FIEE</span>
    </a>
</div>

<a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse">
                        <span></span>
                    </a>
<div class="top-menu">
    <ul class="nav navbar-nav pull-right">
        <li class="dropdown dropdown-user">
                    <!-- Menu Toggle Button -->
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <span class="hidden-xs">${sessionScope.nombre}</span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-default animated jello">
                        <!-- The user image in the menu -->
                        <li>
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
                        <li>
                            
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
                            <!-- /.row -->
                        </li>
                        <!-- Menu Footer-->
                        <li>
                            
                                <a href="/VinculacionFIEE/login/logout" class="btn btn-default btn-flat"><i class="fa fa-sign-out"></i> Cerrar Sesión</a>
                            
                        </li>
                    </ul>
                </li>
</ul>
</div>
                                </div>
    
    <!-- Logo -->
    
    <!-- Header Navbar -->
    <!--<nav class="navbar navbar-static-top" role="navigation">
        <!-- Sidebar toggle button
        <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>
         Navbar Right Menu 
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                User Account Menu 
                
            </ul>
        </div>
    </nav>-->
</header>