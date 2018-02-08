create table almacen (
numero_almacen integer primary key,
ubicacion_almacen varchar(50));
 /*constraint pk_NUM_ALM primary key (Numero_Almacen)  ESTA ES OTRA FORMA DE AÑADIR PRIMARY KEY Y ESTA FORMA ES LA QUE SE TIENE QUE UTILIZAR */
      
      create or replace procedure guardar_almacen(my_Numero_Almacen IN integer, my_ubicacion_almacen IN varchar2)
      as
      begin
      insert into almacen values(my_numero_almacen,my_ubicacion_almacen);
      end;
      /
      --USAREMOS UN BLOQUE SQL PARA SABER SI ESTA BIEN NUESTRO PROCEDIMIENTO
      BEGIN 
      guardar_almacen(321,'Ecatepec');
      end;
      /
      create table cliente(
numero_cliente integer,
numero_almacen integer,
nombre_cliente varchar2(80),

constraint PK_n_c Primary Key(numero_cliente),
constraint FK_n_a Foreign Key(numero_almacen) references almacen (numero_almacen));

select * from cliente; 

create table ventas(
ID_ventas integer,
numero_cliente integer,
numero_vendedor integer,
monto_ventas float,

constraint PK_id_v Primary key(ID_ventas),
constraint FK1_n_cl foreign key(numero_cliente) references cliente(numero_cliente),
constraint FK2_n_ven foreign key(numero_vendedor) references vendedor(numero_vendedor));

create table vendedor(
numero_vendedor integer,
nombre_vendedor varchar2(80),
area_ventas varchar2(80),

constraint PK_n_v primary key(numero_vendedor));

--efectuaremos un select para verificar que se guardo almacen
select * from almacen;
--probar el procedimiento con netbeans

--ejemplo de un atvala y su procedimiento almacenado para guardar con 
--pk impuesto o artificial
 create table calificaciones(
 id_calificacion integer,
 materia varchar2(80),
 valor float,
 constraint pk_id_cal primary key(id_calificacion));
 
 --generamos secuencia
 
 create sequence sec_calificaciones
 start with 1
 increment by 1
 nomaxvalue;
 
 --aqui viene el procedimiento 
 create or replace procedure guardar_calificaciones(
 my_id_calificacion out integer,
 my_materia in varchar2,
 my_valor in float)
 
 as
 begin 
 select sec_calificaciones.nextval into my_id_calificacion from dual;
 insert into calificaciones values (my_id_calificacion, my_materia, my_valor);
 end;
 /
 
 