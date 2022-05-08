
//const api = "http://127.0.0.1:8000/api/";
const api = "https://backendbanco.softmediko.com/api/";

var loading = document.getElementById('loading');
var mensaje = document.getElementById('mensaje');

function login(){
    var use = document.getElementById("usuario").value;
    var cla = document.getElementById("clave").value;
    var campos = document.getElementById('mensaje');
    if(use==''){
      campos.innerHTML='<div class="alert alert-danger" role="alert">Debes de digitar el usuario</div>';
      return false;
    }else{
      campos.innerHTML='';
    }
    if(cla==''){
      campos.innerHTML='<div class="alert alert-danger" role="alert">Debes de digitar la clave</div>';
      return false;
    }else{
      campos.innerHTML='';
    }

    Swal.showLoading()
    const datos = { usuario: use, pass :  cla };
    axios.post(api+'Cliente/login', datos)
        .then(function(res) {

          if(res.status==200) {
            
            if(res.datos !== 0){
                
                window.localStorage.setItem('dataname',res.data.datos.nombre+' '+res.data.datos.apellido);
                window.localStorage.setItem('dataid',res.data.datos.id);
                window.localStorage.setItem('datatoken',res.data.datos.token);
             
                window.location = 'pages/index.html';
            }else{
              Swal.fire('Usuario o contraseña incorrecta');
            }
          }
          console.log('rep:'+res);
        })
        .catch(function(err) {
          Swal.fire('Usuario o contraseña incorrecta');
          console.log(err);
        })
        .then(function() {
          //loading.style.display = 'none';
         // Swal.close();
        });
}

const contenedorQR = document.getElementById('contenedorQR');
const formulario = document.getElementById('formulario');

const QR = new QRCode(contenedorQR);

formulario.addEventListener('submit', (e) => {
	e.preventDefault();
  var pre = document.getElementById('link').value;
    if(pre==''){
      Swal.fire('Debes de digitar el valor');
      return false;
    }
    var id = window.localStorage.getItem('dataid');
    const datos = { id: id, pre :  pre };
    axios.post(api+'Movimientos/generar', datos)
        .then(function(res) {

          if(res.status==200) {
            console.log(res.data.datos);
            var co = res.data.datos;
            QR.makeCode('Referencia:'+co); 
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
});

function generar(){
    var pre = document.getElementById('link').value;
    if(pre==''){
      Swal.fire('Debes de digitar el valor');
      return false;
    }
    var id = window.localStorage.getItem('dataid');
    const datos = { id: id, pre :  pre };
    axios.post(api+'Movimientos/generar', datos)
        .then(function(res) {

          if(res.status==200) {


             const QR = new QRCode(contenedorQR);
            QR.makeCode(res.data.datos); 
          }
          console.log(res);
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

function pagar(cod){
  var id  = window.localStorage.getItem('dataid');
  const datosa = { ref: cod, id :  id };
  axios.post(api+'Movimientos/pagar', datosa)
      .then(function(res) {

        if(res.status==200) {
          console.log(res.data.datos);
          var co = res.data.msj;
          Swal.fire('Se genero el cobro con exito');
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

function cancelar(){
  window.location = 'pages/index.html';
}