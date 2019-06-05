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
    </section>
    <!-- /.content -->
</div>