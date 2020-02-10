<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="card">
    <div class="card-header">
        <h1>
            Documentos
            <small>Lista de Documentos</small>
        </h1>
    </div>

    <div class="card-body">
        <table id="example1" class="table table-bordered table-striped">
            <thead>
                <tr>
                    <!--                                                <th>Id</th>-->
                    <th>Alumno </th>
                    <th>Documento</th>
                    <th>Estado</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${lista}" var="dato">
                    <tr>
                        <td> 
                            <c:out value="${dato.nombreEstudiante}" />
                        </td>
                        <td> 
                            <c:out value="${dato.tipoReporte} ${dato.num}" />
                        </td>
                        <c:if test="${sessionScope.tipo eq 3}">
                            <c:choose>
                                <c:when test="${dato.estadoMaestro == '1'}" >
                                    <td><a href="" class="btn btn-danger">Pendiente de revision</a></td>
                                </c:when>
                                <c:when test="${dato.estadoMaestro == '2'}" >
                                    <td><button class="btn btn-success">Revisado</button></td>
                                </c:when>
                                <c:otherwise>
                                    <td><button class="btn btn-primary">Se realizaron observaciones</button></td>
                                </c:otherwise>
                            </c:choose>
                        </c:if>
                        <c:if test="${sessionScope.tipo eq 4}">
                            <c:choose>
                                <c:when test="${dato.estadoEncargado == '1'}" >
                                    <td><button href="" class="btn btn-danger">Pendiente de revision</button></td>
                                </c:when>
                                <c:when test="${dato.estadoEncargado == '2'}" >
                                    <td><button class="btn btn-success">Revisado</button></td>
                                </c:when>
                                <c:otherwise>
                                    <td><button class="btn btn-primary">Se realizaron observaciones</button></td>
                                </c:otherwise>
                            </c:choose>
                        </c:if>
                        <c:if test="${sessionScope.tipo eq 3}">
                            <c:choose>
                                <c:when test="${dato.estadoMaestro ne '2'}" >
                                    <td>
                                        <a href="revisar?id=${dato.idReporte}" class="btn btn-warning"><i class="fa fa-edit"></i> Revisar</a>
                                    </td>
                                </c:when>
                                <c:otherwise>
                                    <td>Sin ninguna acción disponible</td>
                                </c:otherwise>
                            </c:choose>
                        </c:if>
                        <c:if test="${sessionScope.tipo eq 4}">
                            <c:choose>
                                <c:when test="${dato.estadoEncargado ne '2'}" >
                                    <td>
                                        <a href="revisar?id=${dato.idReporte}" class="btn btn-warning"><i class="fa fa-edit"></i> Revisar</a>
                                    </td>
                                </c:when>
                                <c:otherwise>
                                    <td>Sin ninguna acción disponible</td>
                                </c:otherwise>
                            </c:choose>
                        </c:if>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <!-- /.box-body -->
</div>