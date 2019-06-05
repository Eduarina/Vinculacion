<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Perfil
            <small>
                Estudiante
            </small>
        </h1>
    </section>

    <!-- Main content -->
    <section class="content container-fluid">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">Datos de Usuario</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <!-- text input -->
                <div class="form-group col-md-6">
                    <label>Nombre:</label><br>
                    ${sessionScope.nombre}
                </div>
                <div class="form-group col-md-6">
                    <label>Usuario:</label><br>
                    ${sessionScope.user}
                </div>
                    <c:forEach items="${datos}" var="dato">
                        <div class="form-group col-md-6">
                    <label>Matricula: </label><br>
                    ${dato.matricula}
                </div>
                <div class="form-group col-md-6">
                    <label>Carrera: </label><br>
                    ${dato.descripcion}
                </div>
                <div class="form-group col-md-6">
                    <label>Semestre:</label><br>
                    ${dato.semestre}
                </div>
                <div class="form-group col-md-6">
                    <label>Telefono: </label><br>
                    ${dato.telefono}
                </div>
                <div class="form-group col-md-6">
                    <label>Celular:</label><br>
                    ${dato.celular}
                </div>
                <c:if test="${empty dato.firma}">
                        <div class="form-group col-md-6">
                            <label>Firma Pendiente</label><br>
                            <form method = "POST" action="insertarFirmaEs" modelAttribute = "command" enctype = "multipart/form-data">
                                <td><input type="hidden" name="descripcion" value="${docs.descripcion}"><input type = "file" name = "file" /></td>
                                <td><input type="submit" value="Subir Archivo"></td>    
                            </form>
                        </div>
                    </c:if>
                    <c:if test="${not empty dato.firma}">
                        <div class="form-group col-md-6">
                            <label>Firma Cargada</label><br>
                            <a class="btn btn-danger" href="eliminarFirmaEs">Eliminar</a>
                        </div>
                    </c:if>
                    </c:forEach>
                <div class="form-group col-md-6">
                            <label>Foto Perfil</label><br>
                            <form method = "POST" action="photoperfil" modelAttribute = "command" enctype = "multipart/form-data">
                                <td><input type="hidden" name="descripcion" value=""><input type = "file" name = "file" /></td>
                                <td><input type="submit" value="Subir Archivo"></td>    
                            </form>
                        </div>
                <!-- general form elements disabled -->
            </div>
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->
