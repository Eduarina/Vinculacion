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
        <body class="hold-transition skin-green-light sidebar-mini">
            <div class="wrapper">

            <jsp:include page="../includes/menu.jsp"></jsp:include>

            <jsp:include page="../includes/lateral.jsp"></jsp:include>
            <c:if test="${empty sessionScope['user']}">
                <c:redirect url="/bitacora/lista" />
            </c:if>
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Usuarios
                        <small>Lista de Usuarios</small>
                    </h1>
                    <!--                    <ol class="breadcrumb">
                                            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                                            <li class="active">Inicio</li>
                                        </ol>-->
                </section>

                <!-- Main content -->
                <section class="content container-fluid">

                    <!--------------------------
                    | Your Page Content Here |
                    -------------------------->
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <a href="insertar" class="btn btn-primary"><i class="fa fa-plus-circle"></i><i class="fa fa-plus-circle" style="color: transparent"></i> Agregar Usuario</a>
                                </div>
                                <!-- /.box-header -->
                                <div class="box-body">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <!--                                                <th>Id</th>-->
                                                <th>Nombre</th>
                                                <th>Usuario</th>
                                                <th>Tipo</th>
                                                <th>Acciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${datos}" var="dato">
                                                <tr>
<!--                                                    <td> <c:out value="${dato.idusuario}"/></td>-->
                                                    <td> <c:out value="${dato.nombre}"/></td>
                                                    <td> <c:out value="${dato.user}"/></td>
                                                    <td> 
                                                        <c:if test="${dato.tipo eq 1}">
                                                            <c:out value="Administrador"/>
                                                        </c:if>
                                                        <c:if test="${dato.tipo eq 2}">
                                                            <c:out value="Vinculacion"/>
                                                        </c:if>
                                                        <c:if test="${dato.tipo eq 3}">
                                                            <c:out value="Maestro"/>
                                                        </c:if>
                                                        <c:if test="${dato.tipo eq 4}">
                                                            <c:out value="Servicio"/>
                                                        </c:if>
                                                        <c:if test="${dato.tipo eq 5}">
                                                            <c:out value="Encargado"/>
                                                        </c:if>
                                                    </td>
                                                    <td>
                                                        <a href="editar?id=${dato.idusuario}" class="btn btn-warning"><i class="fa fa-edit"></i> Editar</a>
                                                        <a href="borrar?id=${dato.idusuario}" class="btn btn-danger"><i class="fa fa-trash"></i> Eliminar</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.box-body -->
                            </div>
                            <!-- /.box -->
                        </div>
                    </div>
                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->
        </div>
        <jsp:include page="../includes/footer.jsp"></jsp:include>


    </div>

</body>
</html>
