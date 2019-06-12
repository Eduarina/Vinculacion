<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="content-header">
                        <h1>
                            Bitácoras
                            <small>Lista de Bitácoras</small>
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
                                    <div class="box-header with-border">
                                        <a href="generar" class="btn btn-primary"><i class="fa fa-plus-circle"></i><i class="fa fa-plus-circle" style="color: transparent"></i> Generar Bitácora</a>
                                    </div>
                                <!-- /.box-header -->
                                <div class="box-body">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <!--                                                <th>Id</th>-->
                                                <th>Bitácora #</th>
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
                                                    <c:choose>
                                                    <c:when test="${dato.vbo_maestro eq 1}">
                                                        <td>Pendiente de Revision</td>
                                                    </c:when>
                                                    <c:when test="${dato.vbo_maestro eq 2}">
                                                        <td>Revisado</td>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <td><c:out value="${dato.vbo_maestro}" /></td>
                                                    </c:otherwise>
                                                    </c:choose>
                                                    <c:choose>
                                                    <c:when test="${dato.vbo_encargado eq 1}">
                                                        <td>Pendiente de Revision</td>
                                                    </c:when>
                                                    <c:when test="${dato.vbo_encargado eq 2}">
                                                        <td>Revisado</td>
                                                    </c:when> 
                                                    <c:otherwise>
                                                        <td><c:out value="${dato.vbo_encargado}" /></td>
                                                    </c:otherwise>
                                                    </c:choose>    
                                                    <td>
                                                        <a href="editar?id=${dato.idReporte}" class="btn btn-warning"><i class="fa fa-edit"></i> Editar</a>
                                                        <c:if test="${dato.vbo_encargado eq 2 && dato.vbo_maestro eq 2}">
                                                            <a href="exportar?id=${dato.idReporte}" class="btn btn-success"><i class="fa fa-trash"></i> Exportar</a>
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
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                </section>
                <!-- /.content -->
