<?php
    header('Access-Control-Allow-Origin: *');
    //Esto es para que se pueda acceder a este servicio desde cualquier dominio



    $cn = mysqli_connect("localhost","root","","bd_tienda_videojuegos");
    
    //Se hace conexión a la base de datos, indicando:
    //Nombre del servidor de base de datos (localhost)
    //Nombre del usuario de la base de datos (root)
    //Contraseña del usuario de la base de datos ()
    //Nombre de la base de datos (empresa)

    $rs = mysqli_query($cn,"select * from videojuego");
    //Se indica la consulta SQL que se va a ejecutar 
    //indicando primero a que conexión de base de datos
    //se refiere ($cn)

    while($row = mysqli_fetch_assoc($rs)){
        //Con la estructura de repetición while, se examina
        //cada una de las filas de la consulta
        //donde en cada repetición $row representa
        //a cada fila   
        
        $res[] = array_map("utf8_encode",$row);
        //Asi los datos de cada fila se agregan
        //a un arreglo ($res[])
    }
    echo json_encode($res);
    //Con json_encode se convierte el arreglo ($res)
    //a formato JSON
    //con echo se imprime

    mysqli_close($cn)
    //Cierra la conexión a la base de datos
?>