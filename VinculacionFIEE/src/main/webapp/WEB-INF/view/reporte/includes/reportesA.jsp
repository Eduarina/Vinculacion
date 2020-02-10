<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="card">
<div class="card-header">
    <div class="col-sm-6 col-lg-7">
        <header>Reportes
            <small>Lista de Reportes</small></header>
    </div>
    <div class="float-right col-sm-5">
        <c:if test="${total ne 0}">
            <a href="generar" class="btn btn-primary"><i class="fa fa-plus-circle"></i><i class="fa fa-plus-circle" style="color: transparent"></i> Generar Reporte</a>
                </c:if>
    </div>


</div>
<!-- /.box-header -->
<div class="card-body">
    <table id="example1" class="table table-bordered table-striped">
        <thead>
            <tr>
                <!--                                                <th>Id</th>-->
                <th>Reporte #</th>
                <th>VBo. Maestro</th>
                <th>VBo. Encargado</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${reportes}" var="dato">
                <tr>
                    <td> 
                        Reporte #<c:out value="${dato.num_reporte}" />
                    </td>
                    <c:choose>
                        <c:when test="${dato.vbo_maestro == '1'}">
                            <td>Pendiente de Revision</td>
                        </c:when>
                        <c:when test="${dato.vbo_maestro == '2'}">
                            <td>Revisado</td>
                        </c:when> 
                        <c:otherwise>
                            <td>${dato.vbo_maestro}</td>
                        </c:otherwise>
                    </c:choose>
                    <c:if test="${dato.vbo_encargado == '1'}">
                        <td>Pendiente de Revision</td>
                    </c:if>
                    <c:if test="${dato.vbo_encargado == '2'}">
                        <td>Revisado</td>
                    </c:if> 
                    <td>
                        <c:if test="${dato.vbo_encargado ne '2' || dato.vbo_maestro ne '2'}">
                            <a href="editar?id=${dato.idReporte}" class="btn btn-warning"><i class="fa fa-edit"></i> Editar</a>
                        </c:if>
                        <c:if test="${dato.vbo_encargado == '2' && dato.vbo_maestro == '2'}">
                            <a href="exportar?id=${dato.idReporte}" class="btn btn-success"><i class="fa fa-trash"></i>Exportar</a>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
</div>