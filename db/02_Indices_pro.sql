use ferriplus;
create index nombre_personas on persona(Per_Nombre,Per_Apellido);
 /* puede ser muy util tener un indice que nos permita reducir el tiempo de busqueda al consultar 
  el nombre de una persona en nuestra base de datos, ya sea un cliente o un empleado*/
create index precio_cantidad on cantidad(can_PrecioUnidad);
create index precio_gramaje on gramaje(Gra_PrecioPeso);
/* se pueden implementar funciones que busquen un producto por su precio, con ayuda de este indice 
esto se lograra mas rapido*/
create unique index nombre_productos on producto(Pro_Nombre);
/* un cliente puede desear consultar si algun producto esta en nuestra base de datos, esto lo hara con el nombre y 
no con el id por lo que es necesario tener un indice para esta columna*/
create index fecha_factura on factura(Fac_fecha);
/*Ante cualquier tipo de reclamo o si se necesita la informacion es bueno que las facturas posean un indice por su 
fecha para consultar lo que se desee de manera mas rapida*/