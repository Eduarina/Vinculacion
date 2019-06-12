<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<spring:url value="/resources" var="urlPublic"/>
<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

        <!-- Sidebar user panel (optional) -->
        <div class="user-panel">
            <div class="pull-left image" style="height: 25px">
                <img src="${urlPublic}${sessionScope.src}" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <table> 
                    <tr> 
                        <td width=150 nowrap><a href="/VinculacionFIEE/login/perfil">${sessionScope.nombre}</a></td> 
                    </tr> 
                </table> 

                <!-- Status -->
                <!--<a href="#"><i class="fa fa-circle text-success"></i> Online</a>-->
            </div>
        </div>

        <!-- Sidebar Menu -->
        <ul class="sidebar-menu" data-widget="tree">
            <li class="header">Menú</li>
            <c:if test="${ sessionScope.tipo <= 3 }">
            <li class="treeview">
                <a href="#"><i class="fa fa-files-o"></i> <span>Registros</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <c:if test="${sessionScope.tipo <= 1}">
                        <li><a href="/VinculacionFIEE/vinculacion/lista"><i class="fa fa-file-text"></i>Vinculación</a></li>
                    </c:if>
                    <c:if test="${sessionScope.tipo <= 2}">
                        <li><a href="/VinculacionFIEE/maestros/lista"><i class="fa fa-file-text"></i>Maestros</a></li>
                        <li><a href="/VinculacionFIEE/encargados/lista"><i class="fa fa-file-text"></i>Encargados</a></li>
                    </c:if>
                    <c:if test="${sessionScope.tipo <= 3}">
                        <li><a href="/VinculacionFIEE/alumnos/lista"><i class="fa fa-file-text"></i>Alumnos</a></li>
                    </c:if>
                </ul>
            </li>
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
            <li class="active"><a href="/VinculacionFIEE/asignacion/proyectos"><i class="fa fa-calendar"></i> <span>Asignación Proyectos-Alumnos</span></a></li>
            </c:if>
            <c:if test="${sessionScope.tipo eq 3 or sessionScope.tipo eq 4}">
                <li class="active"><a href="/VinculacionFIEE/bitacoras/reporte"><i class="fa fa-calendar"></i> <span>Revisar reportes</span></a></li>
            </c:if>
        </ul>
        <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
</aside>