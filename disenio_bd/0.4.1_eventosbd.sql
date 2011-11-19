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
	id_tal int 			not null references taller(id_taller),
	dni_asi	int 			not null references asistente(id_asi),	
	hora_detasi			time not null, -- default current_time(),
	certificado_detasi		bit not null,	
	primary key (id_tal, dni_asi)
);


/*
	RESTRICCIONES
*/

/*
	INSERCIONES
*/

INSERT INTO universidad(nombre_uni,sigla_uni,region_uni) VALUES('Desconocido','','');
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

/*registros de eticagnu.org web*/
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('45467129',now(),'david jesús','mejía garcía','dmgmejia@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('70946138',now(),'Edder Alaín','Sanchez Baca','ed.0810@gmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('45736399',now(),'Mari­a Claudia ','Del Castillo Guzman','mdelcastillog@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('46654569',now(),'Angel Fernando','Quiroz Campos','angelfqc.18@gmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('46981734',now(),'Jose Fernando','Chucas Requejo','nandochucas@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('46204130',now(),'Giancarlo','Cordova','giancarlo_s89@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('46167777',now(),'Roberto','Reto','j.r.reto@gmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('45613370',now(),'susy arle','delgado nizama','suuu.xp@hotmail.es','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('40708301',now(),'emily lisseth','chacón sánchez','elchs0206@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('16786359',now(),'césar gabriel','farro acosta','cesargabrielfarro@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('42133971',now(),'edwin sebastian','musayon diaz','emusayon@usat.edu.pe','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('43942102',now(),'daniel edgardo','salazar lluén','lluen_2117@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('43104340',now(),'william ','vásquez regalado','wilvas10@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('43688921',now(),'ricardo david','iman espinoza','riman@usat.edu.pe','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('43568030',now(),'erickson','tejada mena','terick85@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('45574844',now(),'christian omar ','túllume salazar','bitocho11@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('41160677',now(),'jimmy robert','vergara frias','vergarafrias@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('47094725',now(),'henrry jonattan','espinola fernández','hemo12_ef@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('47143699',now(),'edward','cacho casas','edward_1738@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('45002261',now(),'josé carlos ','tello guevara','vga_70@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('46444681',now(),'ivan yimy','pariÑas alarcon','joseluis_1990_6@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('45016457',now(),'miguel angel','seclen ccapatinta','miguel_15_16@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('45027259',now(),'edwin enrique','sono suclupe','edwinsono@gmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('41812294',now(),'oscar ucchelly','romero cortez','oromeroc@usmp.pe','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('45652199',now(),'anguellmileydy dianacristina','rcchumi rodriguez','mileydideseo_yamor@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('45938722',now(),'edgard kimberley del vergel','castillo celis','kim_0989@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('46600441',now(),'aurea liliana','hermijo diaz','aurea_hd@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('71746098',now(),'bruno alonso','verona garcia','brunoal_1642@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('44642905',now(),'carlos omar','sandoval gutierrez','carlos_omar64@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('47351324',now(),'juan enrique','rojas sanchez','juan_r36@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('43661399',now(),'eber manuel','calderon calderon','eberc_19@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('42526333',now(),'cesar miguel','campos vasquez','cesarmigel22@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('42830291',now(),'jovanna del rocío','benites puse','shirleybp_is@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('46232712',now(),'jennifer massiel','asalde ugaz','jenny_love05_9@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('72205295',now(),'luis alberto','damian llontop','acuario.1992@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('73480516',now(),'evelyn patricia','saavedra delgado','patricia_4_11@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('47695885',now(),'saly del rosario','huaman ojeda','rosali_931@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('48299582',now(),'rosmirely','cueva calderón','mir12octubre@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('72745533',now(),'cinthia','carrasco molina','cinjucamo31@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('47596722',now(),'wendy estephania','gamarra salazar','wendy_gamarra@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('44519532',now(),'yuri marlon','pinedo bravo','pinedobrav@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('45633053',now(),'walter eduardo','ynche delgado','walter-sk12@live.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('46567790',now(),'ronald ivan','paz carrasco','ronald29_3@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('45509623',now(),'carlos alberto','vasquez perinango','carvap@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('43524046',now(),'wilson everth','cruz cabrera','wi_ever18@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('42796774',now(),'aldo gustavo francisco','del carpio hernández','subzero1331@gmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('44749293',now(),'milagros del pilar','seclén campos','milagros.seclen@gmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('16709079',now(),'julio césar josé','aguayo miranda','gopher_clp@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('44198402',now(),'jhon edinson','cobeñas ramirez','jhoncr_26@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('46962255',now(),'maría isabel ','cajusol manayay','marya16_04@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('46209116',now(),'carlos eduardo','ayala heredia','carlos_42_4@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('44055355',now(),'emmanuel yoel','llatas padilla','emmanuel-86@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('43071464',now(),'alan israel','paredes fajardo','a_pafa@hotmail.es','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('45483617',now(),'aderly joel','vásquez villalobos','vasquezader@gmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('47554700',now(),'wiman gianmarco','hernandez melendrez','wihermen@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('43098418',now(),'victor hugo','mariscal carhuamaca','fley8507@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('44806931',now(),'marita','fernandez rivera','iden_1432@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('46201035',now(),'carlos alberto','eneque vásquez','caev_644@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('45844774',now(),'alfredo jose','chinchay delgado','alfredo_jchd@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('45684186',now(),'ivan','tello huanca','ivath_89@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('73425239',now(),'alex paúl','mayanga arroyo','alexpaul_1092@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('48221945',now(),'erick joel','acuña cotrina','erick_bp_1@hotmail.es','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('47050641',now(),'karen fiorela','fernández calderón','fiori_17_92@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('45788096',now(),'marilyn del milagro','lizana olivos','mari-1840@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('16796115',now(),'julio césar','torres rivera','jctr_1977@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('27735493',now(),'carlos alberto','mejia zelada','cmejiaz1@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('15641182',now(),'juan alberto','cavero reyes','juan.cavero@servitelperu.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('72184371',now(),'luis miguel',' limo prieto','lui1_59@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('47219062',now(),'robinson joel','santamaría vidaurre','robinson201031@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('48151606',now(),'reluz montalvan ','victor raul','raul-leo-18@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('43984384',now(),'eduardo alejandro','vasquez diaz','edu.vasquez.diaz@gmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('45749998',now(),'irving fernando','montalvo gastelo','irving@xmonty.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('40545947',now(),'fernando martín','custodio eneque','fernando_mce@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('44411863',now(),'mary cory','aquino flores','cory_1504@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('76534163',now(),'julio césar','garcía rivas','j-c.16@live.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('72772575',now(),'lester moises ','mundaca aldana','lester_moises@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('03686355',now(),'lenin duberlin','aÑazco lazo','lenin.anazco@gmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('46078780',now(),'silvia mariel','figueroa colmenares','mariel2_2@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('72205296',now(),'juana rosa','valdivia agapito','rosa_jr10@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('47526653',now(),'yosselim stefanie ','montenegro farfan ','jemf_09_10_11@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('47066315',now(),'maria angelica ','suclupe giles ','ange_0913@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('47099924',now(),'miguel arturo','vasquez campos','vasquez_c_m_123@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('45781920',now(),'susan','katherinr','katheineisel@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('45840487',now(),'leonardo agustin','vera diaz','leonardo_vedi@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('45038264',now(),'erick','aurazo carhuatanta','erickaurazo@gmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('47812943',now(),'jose david','cordova mijahuanga','josedavidcordova@live.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('44567457',now(),'wilder roy','yamunaqué lucumi','yordan_494@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('16750473',now(),'harler','ayala farfan','aharler@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('47154711',now(),'fernando edgardo','gonzales vásquez','fegv.15@gmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('44834385',now(),'yodixa yossary','fernÁndez fernÁndez','xaryme_210@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('71538266',now(),'luis carlos','guevara matias','mtal232@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('43011021',now(),'gustavo christopher','peyte saca','christopher_1578@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('41023156',now(),'ignacio rodolfo','garcia garcia','roddy229@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('44512976',now(),'sindy ','calle gamonal','sinansu_87@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('16699561',now(),'marleni','martinez galindo','marlenimartinez@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('45385365',now(),'luis alberto','garcía heredia','scorpio_luis@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('44647105',now(),'robert franklin','mamani garces','robert_k12@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('40905823',now(),'jorge','cubas del castillo','cubasjorge@gmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('43496426',now(),'ray jhonatan','ventura arce','jhonatan_ventura85@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('46525209',now(),'santa cruz guevara','vladimir edilberto','sague_4790@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('71433279',now(),'franklin junior','barsallo medina','frank_13pe@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('47169357',now(),'eder paul','vidaurre gonzales','e_dr74@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('47485501',now(),'victor gabriel','torres salazar','victor20217@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('46943303',now(),'nicolas ','arroyo hernandez ','arroyo_15_2006@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('47010431',now(),'frank pierre','chambergo garcia','frank2304@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('72741931',now(),'cristopher josé damme','diaz santisteban','rasta.loko15@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('44631839',now(),'juan jose','chafloque capuñay','juanjosech_22@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('47288655',now(),'manuel enoc','verastegui jimenez ','manuel_10_84@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('45464904',now(),'milagros judith','tello san martín','erreway_23_71@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('47366976',now(),'katherine','suclupe santisteban','katty_love17s@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('41752220',now(),'gustavo alfredo','salazar torres','gsalazartorres@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('41830525',now(),'uriarte campos','louis charly ','louis_charly@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('42558459',now(),'vilma','oblitas saldaña','vilmaob845@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('43110688',now(),'juan carlos','malca chulli','juanormachulli@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('41634038',now(),'francisco iván','mechán zapata','fimz26@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('41344433',now(),'elisa ibet','granados alcántara','eiga5@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('40689695',now(),'tania genara','reyes flores','treyesf@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('41411250',now(),'victor arcadio','bernal fuentes','viberxp@gmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('72936407',now(),'detsi maribel','coronado vidal','libra_detsi92@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('44668692',now(),'david james','moreno chapoñan','davidjam7@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('44478886',now(),'denis angel','chavez torres','mrdenis77@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('45047421',now(),'flor de maria eulalia','paiva nicolas','florpaiva1_10@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('41085752',now(),'jaime david','chavarri silva','dachs_is@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('72538983',now(),'ingrid marion','puse chavesta','yaduk_neni1992@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('72928280',now(),'cesar arturo',' liza saldaña','cesar_virgo92@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('46533810',now(),'ricardo ivan','farroñan jaime','ivan_13_1@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('46925732',now(),'omar','ortega','omarz_12@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('47251811',now(),'julia aracely','ramirez sagastegui','ramirezsagastegui@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('47116850',now(),'marcelo alonso','tomanguilla higinio','marcelo_3067@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('70451978',now(),'alberto ','ramirez minaya','almoramirezz@gmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('47229477',now(),'cromwell','rubio fernández','crf_999@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('44340300',now(),'ivan marco antonio','pizarro castro','imapc_k69@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('48200966',now(),'salvador','coronel flores','salva_dor_24@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('16662179',now(),'carlos antonio martin','arroyo diaz','carlosj281@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('16683760',now(),'maria isabel','montaÑo ponce de leon','geminis69_14@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('47218229',now(),'yuliana fabiola','villegas eneque','fayuvi@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('44832989',now(),'juan chester','pinedo espinoza','juan-8866@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('46821673',now(),'carlos andres','ordoÑez rojas','carlitos095@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('41595035',now(),'ricardo ','cordova durand','perdurand@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('43254838',now(),'fabián alejandro','pérez acosta','fabix011@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('41721018',now(),'rafael','garcía chinguel','rgchinguel@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('48347850',now(),'maria del pilar','contreras montoya','maripi-16-94@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('73336218',now(),'oscar alexander','ballena vilchez','oscar-18b@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('46624213',now(),'jhonn edgar ','barboza davila ','jhon_03_46@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('42839881',now(),'arturo fabian','peralta renteria','artper9@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('70051387',now(),'carlos alberto','perez perez','calper_62@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('45006478',now(),'luis javier','casiano ramos','jcasiano20@gmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('16725642',now(),'roger ernesto','alarcón garcía','ralarcon@usat.edu.pe','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('40397436',now(),'walter','tarrillo mondragon','wtarrillo@yahoo.es','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('44063929',now(),'hector enrique ','carmen velez','hector_angelito20@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('42151378',now(),'carlos alberto','tuñoque santisteban','calin_903@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('43364390',now(),'helbert scott','medina ruiz','hsmedinar@gmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('43411581',now(),'juan francisco','paredes díaz','fran1824@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('45073891',now(),'sandra katerine','mera infantes','galaxi18@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('72970343',now(),'talia','diaz rosillo','thalia._13@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('48356405',now(),'goretty','luna niquen','gore_virgo@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('48136627',now(),'karen jeannett','castro figueroa ','mariposa02_92@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('38033839',now(),'ruth ingrid ','julca oblitas','ruth_14_1c@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('40955532',now(),'juan carlos','medina ruiz','jcmedinaruiz@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('45371399',now(),'yuri','cieza tenorio','rayu_20@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('45902354',now(),'deyvis','manayay gayoso','dvsmanayaygayoso@gmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('70884138',now(),'juan kenji','sosa paiva','jk.sosap@gmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('47163110',now(),'jose sanders dway','gonzàlez dìaz','zanders.d3@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('48046545',now(),'gustavo enrique','de la cruz quispe','enrique1565@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('46538277',now(),'richad andred','cumpa bardales','richardcumpoa@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('74233015',now(),'jean carlo ','castañeda ramirez','jeancarlo_594@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('47463580',now(),'erick ','saldaña leon','escorpio_1058@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('45344387',now(),'melissa catherine','fernandez sanchez','crazy_17_11@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('42315818',now(),'francis daniel','santoyo zeña','frasze2@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('47525833',now(),'nait elizabeth','quiroz sánchez','libra28_92@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('47575429',now(),'josé edinson','alva mamani','jose7729@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('47090765',now(),'ruddy hedynson','chero chiclayo','hedyn_10@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('43328348',now(),'walter manuel','sánchez muro','wsanchezmuro@gmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('45772103',now(),'antonio emilio','ferré chávez','emilio.lexinho88@live.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('45616083',now(),'katherine','díaz lópez','lisz.diaz@gmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('45394709',now(),'omar','rosell arce','omarrosell@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('74031922',now(),'césar jesús','villegas caballero','cesarje9@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('72212885',now(),'cinthya karina ','medianero chiscul','leo_19941@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('47694603',now(),'robinsson','ruiz martinez','robin_rm5@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('45041942',now(),'edinson noe','guerrero montalvan','edinson_est@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('44191407',now(),'johan erwin','medina vásquez','jhoan_0071@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('73204872',now(),'jorge luis','zÚÑiga rivas','reef_ja@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('47643369',now(),'emerson isaac','ayasta diaz','eayastadiaz@gmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('46453898',now(),'daniel ','patazca matallana','el_daniex@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('24301982',now(),'amelia ','cabanillas muro','jailema2011@gmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('72462390',now(),'maria victoria','palacin silva','mavipasi@gmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('42364197',now(),'juan isael ','chávez yrigoín','jichay2884@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('45854232',now(),'angelo ','zelada lozada','@@.@.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('45262457',now(),'césar augusto ','paz vásques','cesar_pv_1408@hotmail.com','E',1);
INSERT INTO asistente(dni_asi,fechaRegistro_asi,nombres_asi,apellidos_asi,correo_asi,tipo_asi,id_uni) VALUES ('42626564',now(),'sayra dorelly','monja ramirez','sayra_27@hotmail.com','E',1);