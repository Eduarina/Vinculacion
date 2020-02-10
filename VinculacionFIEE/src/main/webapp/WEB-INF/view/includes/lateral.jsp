<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<spring:url value="/resources" var="urlPublic"/>

<aside id="left-panel" class="left-panel">
            <nav class="navbar navbar-expand-sm navbar-default">
                <div class="navbar-header">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main-menu" aria-controls="main-menu" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="./"><img src="${urlPublic}/assets/img/Logo-UV.jpg" alt="Logo"></a>
                <a class="navbar-brand hidden" href="./"><img src="${urlPublic}/assets/img/Logo-UV.jpg" alt="Logo"></a>
            </div>
            <div id="main-menu" class="main-menu collapse navbar-collapse">
            <ul class="nav navbar-nav">    
                <li class="active">
                        <a href="/VinculacionFIEE/home"> <i class="menu-icon fa fa-dashboard"></i>Inicio</a>
                    </li>
                    
            <c:if test="${ sessionScope.tipo <= 3 }">
            <h3 class="menu-title">Usuarios</h3><!-- /.menu-title -->
            <li class="menu-item-has-children dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-laptop"></i>Registros</a>
                <ul class="sub-menu children dropdown-menu">
                    <c:if test="${sessionScope.tipo <= 1}">
                        <li class="nav-item"><a href="/VinculacionFIEE/vinculacion/lista" class="nav-link "><i class="fa fa-file-text"></i>Vinculación</a></li>
                    </c:if>
                    <c:if test="${sessionScope.tipo <= 2}">
                        <li class="nav-item"><a href="/VinculacionFIEE/maestros/lista" class="nav-link "><i class="fa fa-file-text"></i>Maestros</a></li>
                        <li class="nav-item"><a href="/VinculacionFIEE/encargados/lista" class="nav-link "><i class="fa fa-file-text"></i>Encargados</a></li>
                    </c:if>
                    <c:if test="${sessionScope.tipo <= 3}">
                        <li class="nav-item"><a href="/VinculacionFIEE/alumnos/lista" class="nav-link "><i class="fa fa-file-text"></i>Alumnos</a></li>
                    </c:if>
                </ul>
            </li>
            </c:if>
            <c:if test="${sessionScope.tipo ne 5}">
            <h3 class="menu-title">Acciones</h3><!-- /.menu-title -->
            </c:if>
            <c:if test="${sessionScope.tipo eq 3}">
                <li class=""><a href="/VinculacionFIEE/asignacion/proyectos"><i class="menu-icon fa fa-calendar"></i> <span>Asignación Proyectos-Alumnos</span></a></li>
            </c:if>
            <c:if test="${sessionScope.tipo <= 1}">
                <li class=""><a href="/VinculacionFIEE/firmas/home"><i class="menu-icon fa fa-user-plus"></i> <span>Firmas de autoridades</span></a></li>
            </c:if>
            <c:if test="${sessionScope.tipo > 1 and sessionScope.tipo < 5}">
                <li class=""><a href="/VinculacionFIEE/alumnos/calificar"><i class="menu-icon fa fa-user-plus"></i> <span>Asentar calificación</span></a></li>
            </c:if>
            <c:if test="${sessionScope.tipo <= 2}">
                <li class=""><a href="/VinculacionFIEE/asignacion/lista"><i class="menu-icon fa fa-user-plus"></i> <span>Asignación de Alumnos</span></a></li>
            </c:if>
            <c:if test="${sessionScope.tipo eq 5}">
            <h3 class="menu-title">Bitacoras y reportes</h3><!-- /.menu-title -->
            <li class="menu-item-has-children dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-laptop"></i>Registros</a>
                <ul class="sub-menu children dropdown-menu">
                    <li><a href="/VinculacionFIEE/bitacoras/lista"><i class="fa fa-file-text"></i>Bitácora</a></li>
                    <li><a href="/VinculacionFIEE/reportes/lista"><i class="fa fa-file-text"></i>Reporte Mensual</a></li>
                </ul>
            </li>
            </c:if>
            <c:if test="${sessionScope.tipo eq 4}">
                <li class=""><a href="/VinculacionFIEE/proyecto/lista"><i class="menu-icon fa fa-calendar"></i> <span>Crear Proyecto</span></a></li>
            </c:if>
            <c:if test="${sessionScope.tipo eq 3 or sessionScope.tipo eq 4}">
                <li class=""><a href="/VinculacionFIEE/detalles"><i class="menu-icon fa fa-calendar"></i> <span>Revisar reportes</span></a></li>
            </c:if>
        <!-- Sidebar Menu -->
        </ul>
                </div>
            </nav>
        </aside>
        <!-- /.sidebar-menu -->
    
    <!-- /.sidebar -->