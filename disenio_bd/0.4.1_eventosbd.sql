/*
autor: edward1738@gmail.com
version: 0.4.1
fecha: 18/11/2011
*/

/*
	TABLAS
*/

/* Tablas padres.
*/
create table universidad
(
	id_uni			int not null primary key auto_increment,
	nombre_uni		varchar(100) not null,
	sigla_uni		varchar(15) null,
	region_uni		varchar(50) not null
);

create table evento
(
	id_eve			int not null primary key auto_increment,
	nombre_eve		varchar(100) not null,
	fechaInicio_eve	date not null,
	fechaFin_eve	date not null,
	costoEstudiante_eve long not null,
	costoProfesional_eve long not null
);

create table ponente
(
	id_pon				int not null primary key auto_increment,
	nombres_pon			varchar(60) not null,
	apellidos_pon 		varchar(60) not null,
	especialidad_pon	varchar(80) null,
	dni_pon				char(8) null,
	telefonoCasa_pon	varchar(15) null,
	telefonoCelular_pon	varchar(15) null,
	correo_pon			varchar(40) null
);




/* TABLAS HIJOS.
*/

/*
	tipo_asi: estudiante/profesional
*/
create table asistente
(
	dni_asi				char(8) not null primary key,
	fechaRegistro_asi	time not null,
	nombres_asi			varchar(60) not null,
	apellidos_asi		varchar(60) not null,
	correo_asi			varchar(60) null,
	tipo_asi			char(1) not null,
	id_uni				int not null references universidad(id_uni)
);


/*
	tipo_con: taller, conferencia, etc 
	aforo_con: total de personas para conferencia
	vacantes_con: asientos disponibles para conferencia
*/
create table conferencia
(
	id_con					int not null primary key auto_increment,
	tema_con				varchar(150) not null,
	fechaInicio_con				datetime not null,
	fechaFin_con				datetime not null,
	aforo_con				int not null,
	vacantes_con				int not null,
	lugar_con				varchar(100) not null,
	id_eve					int not null references evento(id_eve),
	id_pon					int not null references ponente(id_pon)
);


/*
	- certificado_detasi: 0 no pagó, 1 pagó
	- talbla detalle debe tener como clave primaria las tablas que las crean
*/
create table asistencia_conferencia
(
	id_con				int not null references conferencia(id_con),
	dni_asi				int not null references asistente(dni_asi),
	hora_detasi			time not null, -- default current_time(),
	certificado_detasi		bit not null,	
	primary key (id_con, dni_asi)
);


create table taller
(
	id_tal					int not null primary key auto_increment,
	tema_tal				varchar(50) not null,
	fechaInicio_tal				datetime not null,
	fechaFin_tal				datetime not null,
	aforo_tal				int not null,
	vacantes_tal				int not null,
	lugar_tal				varchar(100) not null,
	costoEstudiante_tal 			long not null,
	costoProfesional_tal 			long not null,
	id_eve					int not null references evento(id_eve),
	id_pon					int not null references ponente(id_pon)
);


create table asistencia_taller
(
	id_taller int 			not null references taller(id_taller),
	dni_asi	int 			not null references asistente(id_asi),	
	hora_detasi			time not null, -- default current_time(),
	certificado_detasi		bit not null,	
	primary key (id_taller, dni_asi)
);


/*
	RESTRICCIONES
*/

/*
	INSERCIONES
*/

INSERT INTO universidad(nombre_uni,sigla_uni,region_uni) VALUES('Universidad de Chiclayo','UDCH','Lambayeque');
INSERT INTO universidad(nombre_uni,sigla_uni,region_uni) VALUES('Nacional Pedro Ruiz Gallo','UNPRG','Lambayeque');
INSERT INTO universidad(nombre_uni,sigla_uni,region_uni) VALUES('Católica Santo Toribio de Mogrovejo','USAT','Lambayeque');
INSERT INTO universidad(nombre_uni,sigla_uni,region_uni) VALUES('Universidad de Lambayeque','UDL','Lambayeque');
INSERT INTO universidad(nombre_uni,sigla_uni,region_uni) VALUES('Privada Juan Mejía Baca','','Lambayeque');
/*ponentes*/
INSERT INTO ponente(nombres_pon, apellidos_pon) VALUE('Gregorio','León');
INSERT INTO ponente(nombres_pon, apellidos_pon) VALUE('Robert','Puican Gutierres');
INSERT INTO ponente(nombres_pon, apellidos_pon) VALUE('Ivan','Uriarte Uriarte');
/*eventos*/
INSERT INTO evento(nombre_eve, fechaInicio_eve, fechaFin_eve, costoEstudiante_eve, costoProfesional_eve) VALUES('Llampageek','2011/11/18','2011/11/18',5,10);
/*conferencias*/
INSERT INTO conferencia(tema_con, fechaInicio_con, fechaFin_con, aforo_con, vacantes_con, lugar_con, id_eve, id_pon) VALUES('Firewall y Seguridad en Servidores','2011/11/18 10:00','2011/11/18 11:30',200,200,'USAT sala 803',1,1);
INSERT INTO conferencia(tema_con, fechaInicio_con, fechaFin_con, aforo_con, vacantes_con, lugar_con, id_eve, id_pon) VALUES('Servidores de Alta disponibilidad web con Software Libre','2011/11/18 11:30','2011/11/18 13:00',200,200,'USAT sala 803',1,2);
/*talleres*/
INSERT INTO taller(tema_tal, fechaInicio_tal, fechaFin_tal, aforo_tal, vacantes_tal, lugar_tal,costoEstudiante_tal, costoProfesional_tal, id_eve, id_pon) VALUES('Desarrollo de aplicaciones web con MVC','2011/11/18 15:00','2011/11/18 18:00',40,40,'USAT laboratorio 418',5,10,1,3);
