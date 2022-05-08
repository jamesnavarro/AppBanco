<?php
include('header.php');
?>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">

      </div>
    </div><!-- /.container-fluid -->
  </section>

  <!-- Main content -->
  <section class="content" id="contenedor">
    <div class="container-fluid">
      <div class="row">
        <div class="col-12">
          <!-- Default box -->
          <div class="card">
            <div class="card-header">
              <h3 class="card-title">Tus Productos</h3>
              <div class="card-tools">

              </div>
            </div>
            <!-- /.card-header -->
            <div class="card-body p-0">

              <div class="row">
                <div class="col-sm-4">
                  <div class="card text-center" style="width:100%">
                    <img class="card-img-top" src="../img/logo.png" alt="Card image">
                    <div class="card-body">

                      <p class="card-text">Hola: <span id="age"></span></p>
                     
                      <a class="btn btn-app bg-blue"  data-toggle="modal" data-target="#myModalTerceros" onclick="bancos()">
                      <span class="badge bg-purple">0</span>
                      <i class="fas fa-users"></i> [+] Terceros
                      </a>
                      <a class="btn btn-app bg-blue">
                  
                      <i class="fas fa-credit-card"></i> Transferencias
                    </a>
                    <button class="btn btn-app bg-blue" onclick="javascript:scan()">
                  
                    <i class="fas fa-barcode"></i> Scanner
                    </button>
                    </div>
                  </div>
                </div>
                <div class="col-sm-8">
                  <div class="card-header">
                    <h3 class="card-title">Tus Cuentas</h3>
                    <div class="card-tools">

                    </div>
                  </div>
                  <table class="table table-sm">

                    <tbody id="listado">

                      <tr>
                        <td>
                        <div class="spinner-grow text-primary"></div>
                        </td>
                      </tr>


                    </tbody>



                  </table>
                </div>

              </div>


            </div>
            <!-- /.card-body -->
          </div>

          <!-- /.card -->
        </div>
      </div>
    </div>
  </section>
  <!-- /.content -->
</div>
<!-- /.content-wrapper -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">Movimientos</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <table class="table table-sm">
            <tbody id="movi">
              <tr>
                <td>Cargando..<div class="spinner-grow text-primary"></div></td>
              </tr>
            </tbody>
        </table>
      </div>
      <div class="modal-footer justify-content-between">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
 
      </div>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>
<div class="modal" id="myModalTerceros">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">Agregar Cuenta de Terceros</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <form action="/action_page.php" class="was-validated">
      <div class="form-group">
    <label for="uname">Banco:</label>
    <select class="form-control" id="banco" name="banco" required >
      <option value="">Seleccione..</option>
    </select>
    <div class="valid-feedback">Valid.</div>
    <div class="invalid-feedback">Digite el numero de cuenta del tercero.</div>
  </div>

  <div class="form-group">
    <label for="uname">Numero de cuenta:</label>
    <input type="number" class="form-control" id="cuenta" placeholder="Ej:12345678910" name="cuenta" required maxlength="11">
    <div class="valid-feedback">Valid.</div>
    <div class="invalid-feedback">Digite el numero de cuenta del tercero.</div>
  </div>
  <div class="form-group">
    <label for="pwd">Nombre del Tercero:</label>
    <input type="text" class="form-control" id="alias" placeholder="Ej: Pablo Perez" name="alias" required>
    <div class="valid-feedback">Valid.</div>
    <div class="invalid-feedback">Agregue un alias.</div>
  </div>
  
  <button type="button" class="btn btn-primary btn-block" onclick="addtercero()">Agregar Cuenta</button>
</form>
      </div>
      <div class="modal-footer justify-content-between">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
 
      </div>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>
<?php
include('footer.php');
?>
<script>
            function scan(){
                console.log('qr');
                cordova.plugins.barcodeScanner.scan(
                    function(result){
                        if(!result.cancelled){
                            if(result.format == 'QR_CODE'){
                                var code  = result.text;
                                alert('tu code es '+code);
                            }
                        }
                    },
                    function(error){
                        alert('error al scanear'+error);
                    }
                );
            }
        </script>
<script>
  $(document).ready(function() {
    validarsession();
    var k_nombre = window.localStorage.getItem('dataname');
      document.getElementById('foto').innerHTML = '<img src="../img/logo.png" class="img-circle elevation-2" alt="User Image">';
    
    document.getElementById('unombre').innerHTML = k_nombre;
    document.getElementById('age').innerHTML = k_nombre;
    cuentas();

  });
</script>