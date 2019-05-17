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
        <body class="hold-transition skin-green-light sidebar-mini">
            <div class="wrapper">

            <jsp:include page="../includes/menu.jsp"></jsp:include>

            <jsp:include page="../includes/lateral.jsp"></jsp:include>

                <!-- Content Wrapper. Contains page content -->
                <div class="content-wrapper">
                    <!-- Content Header (Page header) -->
                    <section class="content-header">
                        <h1>
                            Lista de Reportes Mensuales
                            <small></small>
                        </h1>
                        <ol class="breadcrumb">
                            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                            <li class="active">Inicio</li>
                        </ol>
                    </section>

                    <!-- Main content -->
                    <section class="content">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="box box-primary">
                                <c:if test="${sessionScope.tipo eq 4}">
                                    <div class="box-header with-border">
                                        <a href="generar" class="btn btn-primary"><i class="fa fa-plus-circle"></i><i class="fa fa-plus-circle" style="color: transparent"></i> Generar Reporte</a>
                                    </div>
                                </c:if>
                                <!-- /.box-header -->
                                <div class="box-body">
                                    <c:if test="${not empty message}">
                                        <div class="alert alert-danger alert-dismissible">${message}</div>
                                    </c:if>
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>Alumno</th>
                                                <th>Programa Educativo</th>
                                                <th>Matricula</th>
                                                <th>Reporte</th>
                                                <th>Fecha</th>
                                                <th>Fecha Limite</th>
                                                <th>Acciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${reportes}" var="dato">
                                                <tr>
                                                    <td> 
                                                        <c:forEach items="${usuarios}" var="usuario">
                                                            <c:if test="${dato.idservicio eq usuario.idusuario}">
                                                                <c:out value="${usuario.nombre}"/>
                                                            </c:if>
                                                        </c:forEach>
                                                    </td>
                                                    <td> 
                                                        <c:forEach items="${servicios}" var="usuario">
                                                            <c:if test="${dato.idservicio eq usuario.idusuario}">
                                                                <c:out value="${usuario.carrera}"/>
                                                            </c:if>
                                                        </c:forEach>
                                                    </td>
                                                    <td> 
                                                        <c:forEach items="${servicios}" var="usuario">
                                                            <c:if test="${dato.idservicio eq usuario.idusuario}">
                                                                <c:out value="${usuario.matricula}"/>
                                                            </c:if>
                                                        </c:forEach>
                                                    </td>
                                                    <td> <c:out value="${dato.numero}"/></td>
                                                    <td> <c:out value="${dato.fecha}"/></td>
                                                    <td> <c:out value="${dato.fechalim}"/></td>
                                                    <td>
                                                        <a href="editar?id=${dato.idreporte}" class="btn btn-warning"><i class="fa fa-edit"></i> Editar</a>
                                                        <a href="detalles?id=${dato.idreporte}" class="btn btn-info"><i class="fa fa-info-circle"></i> Detalles</a>
                                                        <a href="borrar?id=${dato.idreporte}" class="btn btn-danger" onclick="return confirm('Eliminar este registro podria causar inconsistencias en el sistema. ¿Estas seguro que deseas eliminar el registro?')" ><i class="fa fa-trash"></i> Eliminar</a>
<!--                                                        <button type="button" class="btn btn-danger" data-comment="id=${dato.idreporte}" data-toggle="modal" data-target="#modal-danger">
                                                            Launch Danger Modal
                                                        </button>
                                                        <a href="borrar?id=${dato.idreporte}" data-toggle="modal" data-target="#modal-danger" class="btn btn-warning"><i class="fa fa-edit"></i> Borrar</a>-->
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
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                </section>
                <!-- /.content -->
<!--                <div class="row">
                    <div class="col-xs-12">
                        <div class="box box-default">
                            <div class="box-header with-border">
                                <h3 class="box-title">Modal Examples</h3>
                            </div>
                            <div class="box-body">
                                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#modal-default">
                                    Launch Default Modal
                                </button>
                                <button type="button" class="btn btn-info" data-toggle="modal" data-target="#modal-info">
                                    Launch Info Modal
                                </button>
                                <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modal-danger">
                                    Launch Danger Modal
                                </button>
                                <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#modal-warning">
                                    Launch Warning Modal
                                </button>
                                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#modal-success">
                                    Launch Success Modal
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="modal-default">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">Default Modal</h4>
                            </div>
                            <div class="modal-body">
                                <p>One fine body&hellip;</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary">Save changes</button>
                            </div>
                        </div>
                         /.modal-content 
                    </div>
                     /.modal-dialog 
                </div>
                 /.modal 

                <div class="modal modal-primary fade" id="modal-primary">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">Primary Modal</h4>
                            </div>
                            <div class="modal-body">
                                <p>One fine body&hellip;</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-outline pull-left" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-outline">Save changes</button>
                            </div>
                        </div>
                         /.modal-content 
                    </div>
                     /.modal-dialog 
                </div>
                 /.modal 

                <div class="modal modal-info fade" id="modal-info">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">Info Modal</h4>
                            </div>
                            <div class="modal-body">
                                <p>One fine body&hellip;</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-outline pull-left" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-outline">Save changes</button>
                            </div>
                        </div>
                         /.modal-content 
                    </div>
                     /.modal-dialog 
                </div>
                 /.modal 

                <div class="modal modal-warning fade" id="modal-warning">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">Warning Modal</h4>
                            </div>
                            <div class="modal-body">
                                <p>One fine body&hellip;</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-outline pull-left" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-outline">Save changes</button>
                            </div>
                        </div>
                         /.modal-content 
                    </div>
                     /.modal-dialog 
                </div>
                 /.modal 

                <div class="modal modal-success fade" id="modal-success">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">Success Modal</h4>
                            </div>
                            <div class="modal-body">
                                <p>One fine body&hellip;</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-outline pull-left" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-outline">Save changes</button>
                            </div>
                        </div>
                         /.modal-content 
                    </div>
                     /.modal-dialog 
                </div>
                 /.modal 

                <div class="modal modal-danger fade" id="modal-danger">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">Eliminar Registro</h4>
                            </div>
                            <div class="modal-body">
                                <p>Eliminar este registro podria causar inconsistencias en el sistema.¿Estas seguro que desea continuar?</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-outline pull-left" data-dismiss="modal">Cerrar</button>
                                <button type="button" href="borrar?id=${dato.idreporte}" class="btn btn-outline">Eliminar Registro</button>
                            </div>
                        </div>
                         /.modal-content 
                    </div>
                     /.modal-dialog 
                </div>
                 /.modal 
                </section>
                 /.content 
            </div>
             /.content-wrapper -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
</div>
<!-- /.content-wrapper -->
<jsp:include page="../includes/modal.jsp"></jsp:include>
<jsp:include page="../includes/footer.jsp"></jsp:include>


</div>

</body>
</html>
