create table if not exists alumnos (
id serial primary key not null,
nombres varchar(250) not null,
apellidos varchar(250) not null,
carnet varchar(10) not null,
email varchar(250) not null,
telefono varchar (15),
fechaNacimiento date
);

create table if not exists materias (
id SERIAL primary key not null,
nombre varchar(250) not null,
uv int not null,
codigo varchar(12) not null,
tieneLaboratorio boolean default false
);

create table if not exists catedraticos (
id SERIAL primary key not null,
nombres varchar(250) not null,
apellidos varchar(250) not null,
carnet varchar(10) not null,
email varchar(250) not null
);

create table if not exists grupos (
id SERIAL primary key not null,
codigo varchar (4) not null,
idMateria int not null references materias(id),
idCatedratico int not null references catedraticos (id),
esLaboratorio boolean default false
);

create table if not exists inscripciones(
id SERIAL primary key not null,
idMateria int not null references materias(id),
idGrupo int not null references grupos (id),
idAlumno int not null references alumnos  (id),
ciclo int not null,
anio date not null
);

create table if not exists modalidades (
id SERIAL primary key not null,
nombre varchar(250) not null,
disponible boolean default true
);

insert into modalidades (nombre) values ('Virtual');
insert into modalidades (nombre) values ('Presencial');
insert into modalidades (nombre) values ('Semipresencial');

create table if not exists campus (
id SERIAL primary key not null,
codigo varchar (150) not null,
nombre varchar(250) not null,
direccion text
);

create table if not exists carreras (
id SERIAL primary key not null,
codigo varchar (150) not null,
nombre varchar(250) not null,
modalidad int not null references modalidades (id),
idCampus int not null references campus  (id)
);

create table if not exists pensums (
id SERIAL primary key not null,
idCarrera int not null references carreras (id),
anio date not null
);

create table if not exists materias_pensum (
id SERIAL primary key not null,
idCarrera int not null references carreras (id),
idMateria int not null references materias (id)
);

create table if not exists pensum_alumno (
id SERIAL primary key not null,
idAlumno int not null references alumnos (id),
idPensum int not null references pensums (id)
);

create table if not exists carrera_alumno (
id SERIAL primary key not null,
idAlumno int not null references alumnos (id),
idCarrera int not null references carreras (id)
);

create table if not exists actividades (
id SERIAL primary key not null,
idMateria int not null references materias (id),
nombre varchar (250) not null,
description text,
porcentaje int not null default 10
);

create table if not exists nota_alumno (
id SERIAL primary key not null,
idMateria int not null references materias (id),
idActividad int not null references actividades (id),
idAlumno int not null references alumnos (id),
idInscripcion int not null references inscripciones (id),
nota decimal not null default 0
);
