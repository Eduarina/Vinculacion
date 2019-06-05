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
                        Proyectos
                        <small>Lista de Proyectos</small>
                    </h1>
                </section>

                <!-- Main content -->
                <section class="content container-fluid">

                    <div class="row">
                        <div class="col-xs-12">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <a href="insertar" class="btn btn-primary"><i class="fa fa-plus-circle"></i><i class="fa fa-plus-circle" style="color: transparent"></i> Agregar Proyecto</a>
                                </div>
                                <!-- /.box-header -->
                                <div class="box-body">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>Nombre</th>
                                                <th>Dependencia</th>
                                                <th>Ubicación</th>
                                                <th>Horario</th>
                                                <th>Fecha Inicio</th>
                                                <th>Fecha Fin</th>
                                                <th>Objetivo</th>
                                                <th>Actividades</th>
                                                <th>Acciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${datos}" var="dato">
                                                <tr>
                                                    <td> <c:out value="${dato.Titulo}"/></td>
                                                    <td> <c:out value="${dato.Dependencia}"/></td>
                                                    <td> <c:out value="${dato.Ubicacion}"/></td>
                                                    <td> <c:out value="${dato.Horario}"/></td>
                                                    <td> <c:out value="${dato.FechaInicio}"/></td>
                                                    <td> <c:out value="${dato.FechaFin}"/></td>
                                                    <td> <c:out value="${dato.Objetivo}"/></td>
                                                    <td> <c:out value="${dato.Actividades}"/></td>
                                                    <td>
                                                        <a href="editar?id=${dato.idProyecto}" class="btn btn-warning">Editar</a>
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
