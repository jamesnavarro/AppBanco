
const url = "https://backendbanco.softmediko.com/api/";

//const url = "http://127.0.0.1:8000/api/";


function number_format (number, decimals, dec_point, thousands_sep) {
    // Strip all characters but numerical ones.
    number = (number + '').replace(/[^0-9+\-Ee.]/g, '');
    var n = !isFinite(+number) ? 0 : +number,
        prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
        sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
        dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
        s = '',
        toFixedFix = function (n, prec) {
            var k = Math.pow(10, prec);
            return '' + Math.round(n * k) / k;
        };
    // Fix for IE parseFloat(0.55).toFixed(0) = 0;
    s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
    if (s[0].length > 3) {
        s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
    }
    if ((s[1] || '').length < prec) {
        s[1] = s[1] || '';
        s[1] += new Array(prec - s[1].length + 1).join('0');
    }
    return s.join(dec);
}

function salir(){
  localStorage.clear();
  window.location = '../index.html';
}

function validarsession(){
  var use = window.localStorage.getItem('datatoken');
  if(!use){
    window.location = '../index.html';
  }
}
function cuentas() {
  var tk = window.localStorage.getItem('datatoken');
  var id = window.localStorage.getItem('dataid');
  const datos = { cliente: id };
  axios.post(url + 'Cuentas/lista', datos)
    .then(function (res) {
      if (res.status == 200) {
        console.log(res);
        let lista = res.data.datos;
        $('#listado').html("");
        let arreglo = lista.map(function (obj) {
          
          var td = '<tr><td><div class="card"> <div class="card-header">Cuenta de '+obj.tipo_tarjeta+'</div><div class="card-body">No. '+obj.numero+'<br><label for="">Saldo: <p class="text-right">$ '+number_format (obj.saldo)+'</p></label><div class="justify-content-md-end"><a href="#"  data-toggle="modal" data-target="#myModal" onclick="mov('+obj.numero+')" class="btn btn-outline-primary btn-sm"><i class="fa fa-eye"></i> Ver Movimientos</a></div></div></div></td></tr>';
          $('#listado').append(td);
        });
      }
    })
    .catch(function (err) {
      console.log(err);
    })
    .then(function () {
      //loading.style.display = 'none';
    });
}

function mov(id){

  let datos = { cuenta: id };
  axios.post(url + 'Movimientos', datos)
    .then(function (res) {
      if (res.status == 200) {
        console.log(res);
        let lista = res.data.datos;
        $('#movi').html("");
        let arreglo = lista.map(function (obj) {
          var level ='';var destino = '';
          if(obj.tipo_mov=='Out'){
            level ='danger';signo = '-';
            destino = 'Destino';
          }else{
            level ='success';signo = '+';
            destino = 'Origen';
          }
          var td = '<tr><td><div class="card"> <div class="card-body">Cuenta '+destino+'. '+obj.cuenta_destino+'<br><label for="">Valor: <p class="text-right"><small class="badge badge-'+level+'">$ '+signo+' '+number_format (obj.valor_mov)+'</small></p></label><br>Fecha Registro:'+obj.fecha_reg+'</div></div></td></tr>';
          $('#movi').append(td);
        });
      }
    })
    .catch(function (err) {
      console.log(err);
    })
    .then(function () {
      //loading.style.display = 'none';
    });
}
function bancos(){


  axios.get(url + 'Movimientos/bancos')
    .then(function (res) {
      if (res.status == 200) {
        console.log(res);
        let lista = res.data.datos;
        $('#banco').html('<option value="">Seleccione el banco</option>');
        let arreglo = lista.map(function (obj) {
          var level ='';var destino = '';
          if(obj.tipo_mov=='Out'){
            level ='danger';signo = '-';
            destino = 'Destino';
          }else{
            level ='success';signo = '+';
            destino = 'Origen';
          }
          var td = '<option value="'+obj.id+'">'+obj.nombre_banco+'</option>';
          $('#banco').append(td);
        });
      }
    })
    .catch(function (err) {
      console.log(err);
    })
    .then(function () {
      //loading.style.display = 'none';
    });
}

function addtercero(){
  var banco = document.getElementById("banco").value;
  var tercero = document.getElementById("cuenta").value;
  var alias = document.getElementById('alias').value;
  var cuenta  = window.localStorage.getItem('dataid');
  console.log(tercero.length);
  if(tercero.length>11 || tercero.length<11){
    Swal.fire('el numero de cuenta no es valido');
    document.getElementById("cuenta").value = '';
    return false;
  }
  if(banco==''){
    return false;
  }
  if(tercero==''){
    return false;
  }
  if(alias==''){
    return false;
  }
  Swal.showLoading()
  const datos = { cuenta:cuenta, alias:alias,tercero:tercero,banco:banco };
  axios.post(url+'Cuentas/relacionar', datos)
      .then(function(res) {
        console.log(res);
        if(res.status==200) {
          
         
            Swal.fire(res.data.msj);
            $("#myModalTerceros").modal('hide');
          
        }
        console.log('rep:'+res.data);
      })
      .catch(function(err) {
        Swal.fire('Error al guardar los datos');
        console.log(err);
      })
      .then(function() {
        //loading.style.display = 'none';
       // Swal.close();
      });
}
function terceros() {
  var tk = window.localStorage.getItem('datatoken');
  var id = window.localStorage.getItem('dataid');
  const datos = { cliente: id };
  axios.post(url + 'Cuentas/terceros', datos)
    .then(function (res) {
      if (res.status == 200) {
        console.log(res);
        let lista = res.data.datos;
       
        let arreglo = lista.map(function (obj) {
          var ter = "'"+obj.alias+"'";
          var td = '<tr><td><div class="card"> <div class="card-header">Nombre Tercero: '+obj.alias+'</div><div class="card-body">No. '+obj.cuenta_tercero+'<br><label for="">Transferir: </label><div class="justify-content-md-end"><a href="#"  data-toggle="modal" data-target="#myModalTran" onclick="transferir('+obj.cuenta_tercero+','+ter+')" class="btn btn-outline-primary btn-sm"><i class="fas fa-money-bill-alt"></i> Transferir Dinero </a></div></div></div></td></tr>';
          $('#listado').append(td);
        });
      }
    })
    .catch(function (err) {
      console.log(err);
    })
    .then(function () {
      //loading.style.display = 'none';
    });
}

function transferir(cuenta, ter){
     $("#cuenta_t").val(cuenta);
     $("#alias_t").val(ter);
}

function pagarterceros(){
  var destino =  $("#cuenta_t").val();
  var valor =  $("#valor_ter").val();
  var id = window.localStorage.getItem('dataid');
  datosa = {cliente:id, destino:destino, valor:valor, tipo:'Out'}
  axios.post(url+'Movimientos/movimientos', datosa)
  .then(function(res) {

    if(res.status==200) {
      console.log(res.data);
      var co = res.data.msj;
      Swal.fire(co);
      cuentas();
      $("#myModalTran").modal('hide');
    }
    
  })
  .catch(function(err) {
    Swal.fire('Error en generar el codigo qr');
    console.log(err);
  })
  .then(function() {
    //loading.style.display = 'none';
  // Swal.close();
  });
}