<!-- Content Wrapper. Contains page content -->
<div class="card">
    <!-- Content Header (Page header) -->
    <div class="card-header">
        <h1>
            Perfil
            <small>
                Administrador
            </small>
        </h1>
    </div>

            <!-- /.box-header -->
            <div class="card-body">
                <h3 class="box-title">Datos de Usuario</h3>

                <div class="form-group col-md-6">
                    <label>Nombre:</label><br>
                    ${sessionScope.nombre}
                </div>
                <div class="form-group col-md-6">
                    <label>Usuario:</label><br>
                    ${sessionScope.user}
                </div>
                <div class="form-group col-md-6">
                            <label>Foto Perfil</label><br>
                            <form method = "POST" action="photoperfil" modelAttribute = "command" enctype = "multipart/form-data">
                                <td><input type="hidden" name="descripcion" value=""><input type = "file" name = "file" /></td>
                                <td><input type="submit" value="Subir Archivo"></td>    
                            </form>
                        </div>
            </div>
        </div>