<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!-- Content Wrapper. Contains page content -->
<div class="card">
    <!-- Content Header (Page header) -->
    <div class="card-header">
        <h3>
            Perfil
            <small>
                Maestro
            </small>
        </h3>
    </div>

            <!-- /.box-header -->
            <div class="card-body">
                <h5 class="box-title">Datos de Usuario</h5>
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
                        <label>Correo: </label><br>
                        ${dato.correo}
                    </div>
                    <c:if test="${empty dato.firma}">
                        <div class="form-group col-md-6">
                            <label>Firma Pendiente</label><br>
                            <form method = "POST" modelAttribute = "command" enctype = "multipart/form-data">
                                <td><input type="hidden" name="descripcion" value="${sessionScope.id}"><input type = "file" name = "file" /></td>
                                <td><input type="submit" value="Subir Archivo"></td>    
                            </form>
                        </div>
                    </c:if>
                    <c:if test="${not empty dato.firma}">
                        <div class="form-group col-md-6">
                            <label>Firma Cargada</label><br>
                            <a class="btn btn-danger" href="eliminarFirmaM">Eliminar</a>
                        </div>
                    </c:if>
                </c:forEach>
                <!-- general form elements disabled -->
                <div class="form-group col-md-6">
                            <label>Foto Perfil</label><br>
                            <form method = "POST" action="photoperfil" modelAttribute = "command" enctype = "multipart/form-data">
                                <td><input type="hidden" name="descripcion" value=""><input type = "file" name = "file" /></td>
                                <td><input type="submit" value="Subir Archivo"></td>    
                            </form>
                        </div>
            </div>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->
