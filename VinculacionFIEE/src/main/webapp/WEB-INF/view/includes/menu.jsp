<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<spring:url value="/resources" var="urlPublic"/>
<!-- Main Header -->


<header id="header" class="header">

            <div class="header-menu">

                <div class="col-sm-7">
                    <a id="menuToggle" class="menutoggle pull-left"><i class="fa fa fa-tasks"></i></a>
                    <div class="header-left">
                        <span class="logo-lg"><b>Vinculación</b>FIEE</span>
                    </div>
                </div>

                <div class="col-sm-5">
                    <div class="user-area dropdown float-right">
                        <a href="/VinculacionFIEE/login/perfil" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img src="${urlPublic}${sessionScope.src}" class="user-avatar rounded-circle" alt="User Image">
                            <small class="nav-link" >${sessionScope.nombre}.
                                <small>
                                    <c:if test="${sessionScope.tipo eq 1}">Administrador</c:if>
                                    <c:if test="${sessionScope.tipo eq 2}">Vinculación</c:if>
                                    <c:if test="${sessionScope.tipo eq 3}">Maestro</c:if>
                                    <c:if test="${sessionScope.tipo eq 5}">Estudiante</c:if>
                                    <c:if test="${sessionScope.tipo eq 4}">Encargado</c:if>
                                </small></small>
                        </a>

                        <div class="user-menu dropdown-menu">
                            <a class="nav-link" href="/VinculacionFIEE/login/perfil"><i class="fa fa-user"></i>Perfil</a>
                            <c:if test="${sessionScope.tipo eq 5}">
                            <a class="nav-link" href="/VinculacionFIEE/documentos/lista"><i class="fa fa-upload"></i> Documentos</a>
                            </c:if>    
                            <a class="nav-link" href="/VinculacionFIEE/login/logout"><i class="fa fa-power-off"></i> Cerrar Sesión</a>
                        </div>
                    </div>

                </div>
            </div>

        </header><!-- /header -->    