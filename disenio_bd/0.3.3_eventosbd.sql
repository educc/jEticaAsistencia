/*
autor: edward1738@gmail.com
version: 0.3.3
fecha: 15/11/2011
*/

/*
	TABLAS
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
	fechaFin_eve	date not null
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


/*
	tipo_con: taller, conferencia, etc 
	aforo_con: total de personas para conferencia
	vacantes_con: asientos disponibles para conferencia
*/

create table conferencia
(
	id_con					int not null primary key auto_increment,
	tema_con				varchar(50) not null,
	fechaInicio_con			datetime not null,
	fechaFin_con			datetime not null,
	tipo_con				char(1) not null, 
	aforo_con				int not null,
	vacantes_con			int not null,
	costoEstudiante_con		decimal not null,
	costoProfesional_con	decimal not null,
	lugar_con				varchar(100) not null,
	id_eve					int not null references evento(id_eve),
	id_pon					int not null references evento(id_pon)
);

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
	id_uni				int not null references universidad(id_uni),
	id_eve				int not null references evento(id_eve)
);

/*
	certificado_detasi: 0 no pagó, 1 pagó
*/
create table detalle_asistencia
(
	id_detasi			int not null primary key auto_increment,
	hora_detasi			time not null, -- default current_time(),
	certificado_detasi	bit not null,
	id_con				int not null references conferencia(id_con),
	id_asi				int not null references asistente(id_asi)
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