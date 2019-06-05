<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="content-header">
                        <h1>
                            Bit�coras
                            <small>Lista de Bit�coras</small>
                        </h1>
                        <!--<ol class="breadcrumb">
                            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                            <li class="active">Inicio</li>
                        </ol>-->
                    </section>

                    <!-- Main content -->
                    <section class="content">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="box box-primary">
                                <c:if test="${cant eq 0}">
                                    <div class="box-header with-border">
                                        <a href="cargar" class="btn btn-primary"><i class="fa fa-plus-circle"></i><i class="fa fa-plus-circle" style="color: transparent"></i> Cargar Proyecto</a>
                                    </div>
                                </c:if>
                                <c:if test="${cant eq 1}">
                                    <div class="box-header with-border">
                                        <a href="generar" class="btn btn-primary"><i class="fa fa-plus-circle"></i><i class="fa fa-plus-circle" style="color: transparent"></i> Generar Bit�cora</a>
                                    </div>
                                </c:if>
                                <!-- /.box-header -->
                                <div class="box-body">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <!--                                                <th>Id</th>-->
                                                <th>Bit�cora #</th>
                                                <th>VBo. Maestro</th>
                                                <th>VBo. Encargado</th>
                                                <th>Acciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${bitacoras}" var="dato">
                                                <tr>
                                                    <td> 
                                                        Bitacora #<c:out value="${dato.num_reporte}" />
                                                    </td>
                                                    <c:if test="${dato.vbo_maestro eq 0}">
                                                        <td>Pendiente de Revision</td>
                                                    </c:if>
                                                    <c:if test="${dato.vbo_maestro eq 1}">
                                                        <td>Revisado</td>
                                                    </c:if> 
                                                    <c:if test="${dato.vbo_encargado eq 0}">
                                                        <td>Pendiente de Revision</td>
                                                    </c:if>
                                                    <c:if test="${dato.vbo_encargado eq 1}">
                                                        <td>Revisado</td>
                                                    </c:if> 
                                                    <td>
                                                        <a href="editar?id=${dato.idbitacora}" class="btn btn-warning"><i class="fa fa-edit"></i> Editar</a>
                                                        <a href="borrar?id=${dato.idbitacora}" class="btn btn-danger" onclick="return confirm('Eliminar este registro podria causar inconsistencias en el sistema. �Estas seguro que deseas eliminar el registro?')"><i class="fa fa-trash"></i> Eliminar</a>
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