<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<spring:url value="/resources" var="urlPublic"/>
<!-- Left side column. contains the logo and sidebar -->


    <!-- sidebar: style can be found in sidebar.less -->
    

        <!-- Sidebar user panel (optional) -->
        <div class="sidebar-container">
            <div class="sidemenu-container navbar-collapse collapse fixed-menu">
                <div id="remove-scroll">
                <ul class="sidemenu page-header-fixed" data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200" style="padding-top: 20px">
                    <li class="sidebar-toggler-wrapper hide">
                        <div class="sidebar-toggler">
                            <span></span>
                        </div>
                    </li>
                    <li class="sidebar-user-panel">
                        <div class="user-panel">
                            <div class="pull-left image">
                                <img src="${urlPublic}${sessionScope.src}" class="img-circle user-img-circle" alt="User Image">
                            </div>
                            <div class="pull-left info">
                                <a href="/VinculacionFIEE/login/perfil"><p>${sessionScope.nombre}</p></a>
                            </div>
                        </div>
                    </li>
                    <li class="nav-item start">Menú</li>
            <c:if test="${ sessionScope.tipo <= 3 }">
            <li class="nav-item start">
                <a href="#" class="nav-link nav-toggle"><i class="fa fa-files-o"></i> <span class="title">Registros</span>
                    <span class="arrow">
                        <!--<i class="fa fa-angle-left pull-right"></i>-->
                    </span>
                </a>
                <ul class="sub-menu" style="display: none;">
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
            <c:if test="${sessionScope.tipo eq 3}">
                <li class="active"><a href="/VinculacionFIEE/asignacion/proyectos"><i class="fa fa-calendar"></i> <span>Asignación Proyectos-Alumnos</span></a></li>
            </c:if>
            <c:if test="${sessionScope.tipo <= 1}">
                <li class="active"><a href="/VinculacionFIEE/firmas/home"><i class="fa fa-user-plus"></i> <span>Firmas de autoridades</span></a></li>
            </c:if>
            <c:if test="${sessionScope.tipo <= 2}">
                <li class="active"><a href="/VinculacionFIEE/asignacion/lista"><i class="fa fa-user-plus"></i> <span>Asignación de Alumnos</span></a></li>
            </c:if>
            <c:if test="${sessionScope.tipo eq 5}">
            <li class="treeview">
                <a href="#"><i class="fa fa-files-o"></i> <span>Registros</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="/VinculacionFIEE/bitacoras/lista"><i class="fa fa-file-text"></i>Bitácora</a></li>
                    <li><a href="/VinculacionFIEE/reportes/lista"><i class="fa fa-file-text"></i>Reporte Mensual</a></li>
                </ul>
            </li>
            </c:if>
            <c:if test="${sessionScope.tipo eq 4}">
                <li class="active"><a href="/VinculacionFIEE/proyecto/lista"><i class="fa fa-calendar"></i> <span>Crear Proyecto</span></a></li>
            </c:if>
            <c:if test="${sessionScope.tipo eq 3 or sessionScope.tipo eq 4}">
                <li class="active"><a href="/VinculacionFIEE/detalles"><i class="fa fa-calendar"></i> <span>Revisar reportes</span></a></li>
            </c:if>
        <!-- Sidebar Menu -->
        </ul>
                </div>
            </div>
        </div>
        <!-- /.sidebar-menu -->
    
    <!-- /.sidebar -->
