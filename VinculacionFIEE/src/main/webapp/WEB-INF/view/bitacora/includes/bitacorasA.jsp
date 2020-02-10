<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="card" >
    <div class="card-header">
        <div class="col-sm-6 col-lg-7">
            <header>Bit�coras
                <small>Lista de Bit�coras</small></header>
        </div>
        <div class="float-right col-sm-5">
        <c:if test="${total ne 0}">
            <a href="generar" class="btn btn-primary"><i class="fa fa-plus-circle"></i><i class="fa fa-plus-circle" style="color: transparent"></i> Generar Bit�cora</a>
        </c:if>
        <c:if test="${total eq 0}">
            <h4>No te han asignado Proyecto</h4>
        </c:if>
        </div>


    </div>
    <!--<ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Inicio</li>
    </ol>-->

    <!-- Main content -->
    <div class="card-body">
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
                            Bit�cora #<c:out value="${dato.num_reporte}" />
                        </td>
                        <c:choose>
                            <c:when test="${dato.vbo_maestro == '1'}">
                                <td>Pendiente de Revision</td>
                            </c:when>
                            <c:when test="${dato.vbo_maestro == '2'}">
                                <td>Revisado</td>
                            </c:when>
                            <c:otherwise>
                                <td><c:out value="${dato.vbo_maestro}" /></td>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${dato.vbo_encargado == '1'}">
                                <td>Pendiente de Revision</td>
                            </c:when>
                            <c:when test="${dato.vbo_encargado == '2'}">
                                <td>Revisado</td>
                            </c:when> 
                            <c:otherwise>
                                <td><c:out value="${dato.vbo_encargado}" /></td>
                            </c:otherwise>
                        </c:choose>    
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