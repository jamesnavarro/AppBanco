<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>BankApp</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../dist/css/adminlte.min.css">
  <script src="../js/controller.js"></script>
<!--   <link rel="stylesheet" href="../dist/css/style.css"> -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://rawgit.com/schmich/instascan-builds/master/instascan.min.js"></script>

</head>

<body class="sidebar-mini layout-navbar-fixed layout-fixed text-sm layout-footer-fixed" style="height: auto;">
  <!-- Site wrapper -->
  <div class="wrapper">
    <!-- Navbar -->
    <nav class="main-header navbar navbar-expand navbar-primary navbar-dark">
      <!-- Left navbar links -->
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
        </li>
     

      </ul>

      <!-- Right navbar links -->
      <ul class="navbar-nav ml-auto">
        <!-- Navbar Search -->
        <li class="nav-item">
          <a class="nav-link text-white" data-widget="fullscreen" href="#" role="button">
            <i class="fas fa-expand-arrows-alt"></i>
          </a>
        </li>

        <!-- Messages Dropdown Menu -->

        <!-- Notifications Dropdown Menu -->

        <li class="nav-item">
          <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
            <i class="fas fa-cog"></i>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#" role="button" onclick="salir()">
            <i class="fas fa-sign-out-alt"></i>
          </a>
        </li>
      </ul>
    </nav>
    <!-- /.navbar -->

    <!-- Main Sidebar Container -->
    <aside class="main-sidebar sidebar-dark-primary elevation-4">
      <!-- Brand Logo -->
      <a href="#" class="brand-link elevation-4">
        <img src="../img/logoaoa.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
        <span class="brand-text font-weight-light">BankApp</span>
      </a>

      <!-- Sidebar -->
      <div class="sidebar">
        <!-- Sidebar user (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
          <div class="image">
            <span id="foto"></span>

          </div>
          <div class="info">
            <a href="#" class="d-block" id="unombre">Usuario</a>

          </div>
        </div>

        <!-- SidebarSearch Form -->


        <!-- Sidebar Menu -->
        <nav class="mt-2">
          <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
            <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
               <li class="nav-item">
              <a href="siniestro_servicios.php" class="nav-link">
                <i class="fas fa-eye"></i>
                <p>
                  Home
                </p>
              </a>
            </li>
            <li class="nav-item">
              <a href="siniestro_uber.php" class="nav-link">
                <i class="fas fa-barcode"></i>
                <p>
                 Pagar con QR
                </p>
              </a>
            </li>
            
            <li class="nav-item">
              <a href="siniestros.php" class="nav-link">
                <i class="fas fa-battery-full"></i>
                <p>
                  Generar QR
                </p>
              </a>
            </li>
            <li class="nav-item">
              <a href="concluidos.php" class="nav-link">
                <i class="fas fa-flag"></i>
                <p>
                  Movimientos
                </p>
              </a>
            </li>
            <!-- <li class="nav-item">
              <a href="bitacora.php" class="nav-link">
                <i class="fas fa-book"></i>
                <p>
                  Bitacora
                </p>
              </a>
            </li> -->
          </ul>
        </nav>
        <!-- /.sidebar-menu -->
      </div>
      <!-- /.sidebar -->
    </aside>