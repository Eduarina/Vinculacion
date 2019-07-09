<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
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
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card card-topline-green">
                                        <div class="card-head">
                                            <header> Usuarios
                                            <small>Lista de Usuarios</small></header>
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
                                                        <a href="insertar" class="btn btn-success btn-sm m-b-10">Agregar Usuario</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <table class="table table-striped table-bordered table-hover table-checkable order-column" style="width: 100%" id="example1">
                                                <thead>
                                            <tr>
                                                <!--                                                <th>Id</th>-->
                                                <th class="center">Matricula</th>
                                                <th class="center">Nombre</th>
                                                <th class="center">Carrera</th>
                                                <th class="center">Celular</th>
                                                <th class="center">Correo</th>
                                                <th class="center">Acciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${datos}" var="dato">
                                                <tr>
                                                    <td class="center"> <c:out value="${dato.Matricula}"/></td>
                                                    <td class="center"> <c:out value="${dato.Nombre}"/></td>
                                                    <td class="center"> <c:out value="${dato.Carrera}"/></td>
                                                    <td class="center"> <c:out value="${dato.Celular}"/></td>
                                                    <td class="center"> <c:out value="${dato.Correo}"/></td>
                                                    <td class="center">
                                                        <a href="/VinculacionFIEE/documentos/ver?id=${dato.ID}" class="btn btn-primary">Ver documentacion</a>
                                                        <a href="editar?id=${dato.ID}" class="btn btn-warning">Editar</a>
                                                        <c:if test="${dato.estado eq 1}">
                                                            <a href="borrarUsuarioM?id=${dato.ID}" class="btn btn-danger">Dar de baja</a>
                                                        </c:if> 
                                                        <c:if test="${dato.estado eq 2}">
                                                            <a href="borrarUsuarioM?id=${dato.ID}" class="btn btn-success">Dar de alta</a>
                                                        </c:if> 
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
