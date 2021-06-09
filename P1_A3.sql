-----Zeige Anzahl der Module, die mehr als 3 mal auftreten------
/*create function maxVorlesungen(n vlnoten[])
returns integer
as $info$
begin
	return select count(*) anz from maxVorl;
end;
$info$ 
LANGUAGE plpgsql;*/

CREATE TYPE vlnoten AS (
     note       REAL,
     vorlNr    INTEGER
);

create table Studenten(
	MatrNr integer primary key,
	Name varchar,
	Semester integer,
	Noten vlnoten[]
);

create table Personal(
	PersNr	integer primary key,
	name	varchar
);

create table Professoren(
	Persnr integer primary key,
	Rang	varchar,
	Raum	varchar
)inherits (Personal);

create table Vorlesungen(
	VorlNr	integer primary key,
	Titel	varchar,
	SWS		integer,
	gelesenVon	integer,
	foreign key(gelesenVon) references Professoren(PersNr)
);

create table pruefen(
	MatrNr	integer ,
	VorlNr	integer ,
	PersNr	integer ,
	Note	float,
	foreign key(MatrNr) references Studenten(MatrNr),
	foreign key(VorlNr) references Vorlesungen(VorlNr),
	foreign key(PersNr) references Professoren(PersNr)
);

insert into Professoren
values(1, 'Hans', 'oberboss', 'R1.1');
insert into Professoren
values(2, 'Jürgen', 'fizeboss', 'R2.55');

insert into Vorlesungen
values(1, 'Mathe 1', 5, 1);
insert into Vorlesungen
values(2, 'Numerische Mathematik', 5, 1);
insert into Vorlesungen
values(3, 'Theoretische Informatik', 5, 1);
insert into Vorlesungen
values(4, 'BWL', 5, 2);
insert into Vorlesungen
values(5, 'Controlling', 5, 2);
insert into Vorlesungen
values(6, 'Marketing', 5, 2);

insert into Studenten
values(1, 'Dieter', 2);
insert into Studenten
values(2, 'Jörg', 2);
insert into Studenten
values(3, 'Tom', 2);
insert into Studenten
values(4, 'Peter', 2);

insert into pruefen
values(1,1,1,1.0);
insert into pruefen
values(1,2,1,2.0);
insert into pruefen
values(1,3,1,3.0);
insert into pruefen
values(1,4,2,1.0);
insert into pruefen
values(1,5,2,2.0);
insert into pruefen
values(1,6,2,3.0);

insert into pruefen
values(1,1,1,1.0);
insert into pruefen
values(1,2,1,2.0);
insert into pruefen
values(1,3,1,3.0);
insert into pruefen
values(1,4,2,1.0);
insert into pruefen
values(1,5,2,2.0);
insert into pruefen
values(1,6,2,3.0);

