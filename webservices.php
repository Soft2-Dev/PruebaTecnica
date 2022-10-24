<?PHP
$hostname_localhost ="localhost";
$database_localhost ="descalic_puebatecnica";
$username_localhost ="descalic_puebatecnica";
$password_localhost ="WAV&8;HIgtC~";
$case=$_POST["case"];
$caseGet=$_GET["case"];
$json=array();
				
		$conexion = mysqli_connect($hostname_localhost,$username_localhost,$password_localhost,$database_localhost);



switch ($case) {
     	
    	case 1:
    	    $documento=$_POST["documento"];
        	$nombre=$_POST["nombre"];
        	$apellido=$_POST["apellido"];
        	$ciudad=$_POST["ciudad"];
        	$direccion=$_POST["direccion"];
        	$barrio=$_POST["barrio"];
        	$fecha=$_POST["fecha"];
    	    
                  $sql="SELECT * FROM `personas` WHERE `documento`='{$documento}'";
               
        	    $rpta=mysqli_query($conexion,$sql);
        	    $rpta=false;
        	    while($registro=mysqli_fetch_array($rpta)){
        	        $id= $registro['id'];
        		    $rpta=true;
                }
                if($rp){
                    $result["rp"] ='no';
                    $json['rpta'][]     =$result;
             
                    
                }else{
                   
        		    $sql="INSERT INTO `personas`( `documento`, `nombres`, `apellidos`, `fechaNacimiento`) VALUES ('{$documento}','{$nombre}','{$apellido}','{$fecha}')";
                    $rpta=mysqli_query($conexion,$sql);
                         if($rpta){
                              
                             $sql="SELECT * FROM `personas` WHERE `documento`='{$documento}'";
                           $rpta=mysqli_query($conexion,$sql);
                              while($registro=mysqli_fetch_array($rpta)){
                    	        $id= $registro['id'];
                    		    $sql="INSERT INTO `direcciones`( `ciudad`, `direccion`, `barrio`, `idPersona`) VALUES ('{$ciudad}','{$direccion}','{$barrio}','{$id}')";
                    		     $rpta=mysqli_query($conexion,$sql);
                    		 
                        		   if($rpta){
                        	
                                     $sql="SELECT * FROM `personas`";
                            		  $rpta=mysqli_query($conexion,$sql);
                                		       while($registro=mysqli_fetch_array($rpta)){
                                    	        $result["rp"] ='ok';
                                                $result["id"] =$registro['id'];
                                                $result["documento"] =$registro['documento'];
                                                $result["nombres"] =$registro['nombres'];
                                                $result["apellidos"] =$registro['apellidos'];
                                                $result["fechaNacimiento"] =$registro['fechaNacimiento'];
                                                $json['rpta'][]     =$result;
                    }
                        
                                    }
                    		   
                                }
                             
                         }
                }
                
    		break;
    		
    	
    	case 2:
    	    $id=$_POST["id"];
        	$ciudad=$_POST["ciudad"];
        	$direccion=$_POST["direccion"];
        	$barrio=$_POST["barrio"];
		    $sql="INSERT INTO `direcciones`( `ciudad`, `direccion`, `barrio`, `idPersona`) VALUES ('{$ciudad}','{$direccion}','{$barrio}','{$id}')";
		    $rpta=mysqli_query($conexion,$sql);
		       
    		   if($rpta){
    		       
    		       $sql="SELECT * FROM `direcciones` WHERE `idPersona`='{$id}'";
    		       $rpta=mysqli_query($conexion,$sql);
    		     
    		       while($registro=mysqli_fetch_array($rpta)){
        	       $result["rp"] ='ok';
                    $result["id"] =$registro['id'];
                    $result["ciudad"] =$registro['ciudad'];
                    $result["direccion"] =$registro['direccion'];
                    $result["barrio"] =$registro['barrio'];
                    $result["idPersona"] =$registro['idPersona'];
                    $json['rpta'][]     =$result;
                    }
    		       
    		       
                 
                }
	
    		break;	
}

switch ($caseGet) {
     	

    		
    	
    	case 1:
    
		    $sql="SELECT * FROM `personas`";
		    $rpta=mysqli_query($conexion,$sql);
    		  
    		       while($registro=mysqli_fetch_array($rpta)){
    		           $isRpta=true;
        	        $result["rp"] ='ok';
                    $result["id"] =$registro['id'];
                    $result["documento"] =$registro['documento'];
                    $result["nombres"] =$registro['nombres'];
                    $result["apellidos"] =$registro['apellidos'];
                    $result["fechaNacimiento"] =$registro['fechaNacimiento'];
                    $json['rpta'][]     =$result;
                    }
                    
                	if(!$isRpta){
    	            $result["rp"]='no';	
    				$json['rpta'][]=$result;
        	        }	
                	
    		       
    		break;	
    		
    	case 2:
            $id=$_GET["id"];
		    $sql="SELECT * FROM `direcciones` WHERE `idPersona`='{$id}'";
    		       $rpta=mysqli_query($conexion,$sql);
    		      //  echo $sql;
    		       while($registro=mysqli_fetch_array($rpta)){
    		            $isRpta=true;
        	       $result["rp"] ='ok';
                    $result["id"] =$registro['id'];
                    $result["ciudad"] =$registro['ciudad'];
                    $result["direccion"] =$registro['direccion'];
                    $result["barrio"] =$registro['barrio'];
                    $result["idPersona"] =$registro['idPersona'];
                    $json['rpta'][]     =$result;
                    }
                    
                    if(!$isRpta){
    	            $result["rp"]='no';	
    				$json['rpta'][]=$result;
        	        }	
                	
    		       
    		break;	
}


		
	
		mysqli_close($conexion);
		echo json_encode($json);
?>
