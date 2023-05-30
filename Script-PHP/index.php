<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET,POST");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

// Conecta a la base de datos  con user, contraseña y nombre de la BD
$servidor = "localhost"; $user = "root"; $password = ""; $db = "ofertas";
$conexionBD = new mysqli($servidor, $user, $password, $db);


// Consulta datos y recepciona una clave para consultar dichos datos con dicha clave
if (isset($_GET["consultar"])){
    $sqlOfertas = mysqli_query($conexionBD,"SELECT * FROM oferta 
    INNER JOIN moneda on oferta.id_moneda = moneda.id_moneda
    INNER JOIN estado on oferta.id_estado = estado.id_estado WHERE id=".$_GET["consultar"]);
    if(mysqli_num_rows($sqlOfertas) > 0){
        $Ofertas = mysqli_fetch_all($sqlOfertas,MYSQLI_ASSOC);
        echo json_encode($Ofertas);
        exit();
    }
    else{  echo json_encode(["success"=>0]); }
}
//borrar pero se le debe de enviar una clave ( para borrado )
if (isset($_GET["borrar"])){
    $sqlOfertas = mysqli_query($conexionBD,"DELETE FROM oferta WHERE id=".$_GET["borrar"]);
    if($sqlOfertas){
        echo json_encode(["success"=>1]);
        exit();
    }
    else{  echo json_encode(["success"=>0]); }
}
//Inserta un nuevo registro y recepciona en método post
if(isset($_GET["insertar"])){
    $data = json_decode(file_get_contents("php://input"));
    $creador_oferta=$data->creador_oferta;
    $objeto=$data->objeto;
    $actividad=$data->actividad;
    $descripcion=$data->descripcion;
    $id_moneda=$data->id_moneda;
    $presupuesto=$data->presupuesto;
    $fecha_ini=$data->fecha_ini;
    $hora_ini=$data->hora_ini;
    $fecha_fin=$data->fecha_fin;
    $hora_fin=$data->hora_fin;
    $id_estado=$data->id_estado;
        if(($creador_oferta!="")&&($objeto!="")&&($actividad!="")&&($descripcion!="")&&($id_moneda!="")&&($presupuesto!="")&&($fecha_ini!="")&&($hora_ini!="")&&($fecha_fin!="")&&($hora_fin!="")&&($id_estado!="")){
            
    $sqlOfertas = mysqli_query($conexionBD,"INSERT INTO oferta(creador_oferta,objeto,actividad,descripcion,id_moneda,presupuesto,fecha_ini,hora_ini,fecha_fin,hora_fin,id_estado) VALUES('$creador_oferta','$objeto','$actividad','$descripcion','$id_moneda','$presupuesto','$fecha_ini','$hora_ini','$fecha_fin','$hora_fin','$id_estado') ");
    echo json_encode(["success"=>1]);
        }
    exit();
}
// Actualiza datos pero recepciona datos para realizar la actualización
if(isset($_GET["actualizar"])){
    
    $data = json_decode(file_get_contents("php://input"));

    $id=(isset($data->id))?$data->id:$_GET["actualizar"];
    $creador_oferta=$data->creador_oferta;
    $objeto=$data->objeto;
    $actividad=$data->actividad;
    $descripcion=$data->descripcion;
    $id_moneda=$data->id_moneda;
    $presupuesto=$data->presupuesto;
    $fecha_ini=$data->fecha_ini;
    $hora_ini=$data->hora_ini;
    $fecha_fin=$data->fecha_fin;
    $hora_fin=$data->hora_fin;
    $id_estado=$data->id_estado;
    
    $sqlOfertas = mysqli_query($conexionBD,"UPDATE oferta SET WHERE id='$id'");
    echo json_encode(["success"=>1]);
    exit();
}
// Consulta todos los registros de la tabla ofertas
$sqlOfertas = mysqli_query($conexionBD,"SELECT * FROM oferta 
INNER JOIN moneda on oferta.id_moneda = moneda.id_moneda
INNER JOIN estado on oferta.id_estado = estado.id_estado");
if(mysqli_num_rows($sqlOfertas) > 0){
    $Ofertas = mysqli_fetch_all($sqlOfertas,MYSQLI_ASSOC);
    echo json_encode($Ofertas);
}
else{ echo json_encode([["success"=>0]]); }


?>
