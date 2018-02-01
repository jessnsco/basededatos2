create table Vendedor (Numero_Vendedor integer primary key,Nombre_Vendedor varchar(50));
create table Almacen (Numero_Almacen integer primary key,Ubicacion_Almacen varchar(50));
create table Cliente (Numero_Cliente integer primary key,Nombre_Cliente varchar(50));
      /*constraint pk_NUM_ALM primary key (Numero_Almacen)  ESTA ES OTRA FORMA DE AÑADIR PRIMARY KEY Y ESTA FORMA ES LA QUE SE TIENE QUE UTILIZAR */
      
      create or replace procedure guardar_almacen(my_Numero_Almacen IN integer, my_Ubicacion_Almacen IN varchar2)
      as
      begin
      insert into Almacen values(my_Numero_Almacen,my_Ubicacion_Almacen);
      end;
      /
      --USAREMOS UN BLOQUE SQL PARA SABER SI ESTA BIEN NUESTRO PROCEDIMIENTO
      BEGIN 
      guardar_almacen(321,'Ecatepec')
      end;
      /
      select * from almacen;