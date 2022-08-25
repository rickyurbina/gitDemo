<?php
//  require 'conexion.php'

//  $con = new DataBase();
//  $pdo = $con->conectar();
//  $campo =$_POST["campo"];

 $stmt = Conexion::conectar()->prepare("SELECT * FROM socios WHERE nombres LIKE ? ORDER BY nombres ASC");

// $sql = "SELECT nombre FROM socios WHERE nombres LIKE ? ORDER BY nombres ASC";

//  $query = $pdo->prepare($sql);
//  $query->execute([$campo . '%']);
  $html = "";

while($row = $stmt->fetch(PDO::FETCH_ASSOC)){
    $html .= "<li>".$row["nombres"]."</li>";
}

echo json_encode($html, JSON_UNESCAPED_UNICODE);
?>

<style>

ul {
    list-style-type: none;
}
    </style>

<div class="page-header">
    <h4 class="page-title">Venta</h4>
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="#">Product Admin</a></li>
        <li class="breadcrumb-item active" aria-current="page">Add Product</li>
    </ol>
</div>


<div class="row ">

    <div class="col-lg-8">
        <form enctype="multipart/form-data" class="card" method="POST" autocomplete="off">
            <div class="card-header">
                <h3 class="card-title">Registro de nuevo producto</h3>

            </div>
            <div class="card-body">
                <div class="row">

                <div class="col-sm-12 col-md-12">
                    <div class="form-group">
                        <label class="form-label">Name</label>
                        <input id="tag" type="text" class="form-control" name="name" placeholder="Cliente" required >
                        <ul id="lista">


                        </ul>
                    </div>
                </div>
                <div class="col-sm-12 col-md-12">
                <div class="form-group">
                            <label class="form-label">Fecha De Venta</label>
                            <input class="form-control fc-datepicker" placeholder="MM/DD/YYYY" type="text" name="fechaNacimiento">
                        </div>
              
                        </div>
               
              


              
                
                <div class="col-sm-6 col-md-4">
                    <div class="form-group">
                        <input type="text" class="form-control" name="features" id="featuresBD" hidden>
                    </div>
                </div>

                <div class="col-md-5">

                </div>
                
                <div class="col-lg-3 col-sm-12"><p></p></div>
                    <div class="col-lg-6 col-sm-12">
                        
                    </div>    
                </div>
                
            </div>
            <div class="card-footer text-right">
                <button type="submit" name="registrar" class="btn btn-primary">Guardar</button>
            </div>
            <?php
                 $registro = new productos();
                 $registro -> ctrRegistra();
            ?>
        </form>

        <script src="../admin/js/peticiones.js"> </script>


    
    </div>
    <div class="col-xl-4 col-lg-12 col-md-12">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Productos</h3>                
            </div>
            <br>
            <form id="featuresForm">
                <div class="col-sm-12 col-md-12">
                    <div class="form-group" id="contenidoFt">
                        <div class="row">
                            
                            <div class="col-sm-6 col-md-6">
                                <label class="form-label">Producto</label>
                                <input type="text" class="form-control" id="featName">
                            </div>
                            
                            <div class="col-sm-6 col-md-6">
                                <label class="form-label">Precio</label>
                                <input type="text" class="form-control" id="featValue">
                            </div>
                      
                            
                        </div>
                    </div>
                </div>
      
                <div class="col-sm-12 col-md-12">
                <div class="form-group">
                            <label class="form-label">Cantidad</label>
                            
                            <input type="text" class="form-control" id="featValue">
                        </div>
                        </div>

                <div class="col-sm-12 col-md-12 text-right">
                                <br>
                                <button id="addproduct" class="btn btn-blue" >+</button>
                            </div>

                
                            <div class="col-sm-12 col-md-12">
                <div class="form-group">
                            <label class="form-label">Total de Venta: $0</label>
                        </div>
                        </div>



            </form>

            <hr>
            <div class="card-body">
                <div class="">
                    <div id="featList"></div>
                </div>
            </div>
        </div>
    </div>

</div>

<div class="card">
<div class="table-responsive">
										<table class="table mb-0">
											<thead>
												<tr>
													<th>#</th>
													<th>User Name</th>
													<th>Position</th>
													<th>Email</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td scope="row">1</td>
													<td>Amy	Bond</td>
													<td>Developer</td>
													<td>amy@gmail.com</td>
												</tr>
												<tr>
													<td scope="row">2</td>
													<td>Elizabeth McLean</td>
													<td>Tester</td>
													<td>elizabeth@gmail.com</td>
												</tr>
												<tr>
													<td scope="row">3</td>
													<td>Diana Wilkins</td>
													<td>Designer</td>
													<td>diana@gmail.com</td>
												</tr>
											</tbody>
										</table>
</div>
</div>