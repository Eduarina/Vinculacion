<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<spring:url value="/resources" var="urlPublic"/>
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
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card card-topline-green">
                                        <div class="card-head">
                                            <header>Lista de Servicios Sociales
                                            <small>Usuarios de Servicio</small></header>
                                            <div class="tools">
                                                <a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
                                                <a class="t-collapse btn-color fa fa-chevron-down" href="javascript:;"></a>
                                                <a class="t-close btn-color fa fa-times" href="javascript:;"></a>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <div class="row p-b-20">
                                                <div class="col-md-6 col-sm-6 col-6">
                                                    <div class="btn-group">
                                                        <a href="insertar" class="btn btn-success btn-sm m-b-10">Agregar</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <table class="table table-striped table-bordered table-hover table-checkable order-column" style="width: 100%" id="example1">
                                                <thead>
                                                <tr>
                                                    <th class="center">Id</th>
                                                    <th class="center">Nombre</th>
                                                    <th class="center">Usuario</th>
                                                    <th class="center">Correo</th>
                                                    <th class="center">Matricula</th>
                                                    <th class="center">Creditos</th>
                                                    <th class="center">Semestre</th>
                                                    <th class="center">Acciones</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${usuarios}" var="dato">
                                                <tr>
                                                    <td class="center"> <c:out value="${dato.idservicio}"/></td>
                                                    <td class="center"> <c:out value="${dato.nombre}"/></td>
                                                    <td class="center"> <c:out value="${dato.usuario}"/></td>
                                                    <td class="center"> <c:out value="${dato.correo}"/></td>
                                                    <td class="center"> <c:out value="${dato.matricula}"/></td>
                                                    <td class="center"> <c:out value="${dato.creditos}"/></td>
                                                    <td class="center"> <c:out value="${dato.semestre}"/></td>
                                                    <td class="center">
                                                        <a href="editarUsuarioS?id=${dato.idservicio}" class="btn btn-warning">Editar</a>
                                                        <a href="borrarUsuarioS?id=${dato.idservicio}" class="btn btn-danger">Eliminar</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                            </table>
                                                
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

            <jsp:include page="../includes/footer.jsp"></jsp:include>
</div>

        </div>

    </body>
</html>