<?php
	// Datos de la conexion
	$usuario = "admin";
	$password = "12345678";
	$servidor = "empresatextil.c8rmg1joxpyg.us-east-1.rds.amazonaws.com";
	$basededatos = "empresatextil";
	
	// Conexion con la base de datos
	$conexion = mysqli_connect( $servidor, $usuario, $password ) or die ("No se ha podido conectar al servidor de Base de datos");
	
	// Selección de la base de datos
	$db = mysqli_select_db( $conexion, $basededatos ) or die ( "Upps! Pues va a ser que no se ha podido conectar a la base de datos" );

	// Consulta
	$consulta = "SELECT * FROM gestion_empresarial";
	$resultado = mysqli_query( $conexion, $consulta ) or die ( "Algo ha ido mal en la consulta a la base de datos");
	
	// Mostrar resultados
	echo "<table borde='2'>";
	echo "<tr>";
	echo "<th>ID cliente</th>";
	echo "<th>Nombre</th>";
	echo "<th>Apellidos</th>";	
	echo "<th>email</th>";
	echo "</tr>";
	
	// Bucle while que recorre cada registro y muestra cada campo en la tabla.
	while ($columna = mysqli_fetch_array( $resultado ))
	{
		echo "<tr>";
		echo "<td>" . $columna['Id_cliente'] . "</td><td>" . $columna['Nombre'] . "</td><td>" . $columna['Apellidos'] . "</td><td>" . $columna['email'] . "</td>";
		echo "</tr>";
	}
	
	echo "</table>"; 

	// Cierre de conexion
	mysqli_close( $conexion );
?>