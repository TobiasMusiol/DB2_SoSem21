BEGIN;

create table Studenten(
	MatrNr		integer primary key,
	sname		varchar,
	semester	integer
);

create table Personal(
	PersNr	integer primary key,
	name	varchar
);

create table Professor(
	Persnr integer primary key,
	Rang	varchar,
	Raum	varchar
)inherits (Personal);

create table Assistenten(
	Persnr integer primary key,
	Fachgebiet	varchar,
	Boss	integer,
	foreign key(Boss) references Professor(PersNr)
);

create table Vorlesung(
	VorlNr	integer primary key,
	Titel	varchar,
	SWS		integer,
	gelesenVon	integer,
	foreign key(gelesenVon) references Professor(PersNr)
);

create table pruefen(
	MatrNr	integer ,
	VorlNr	integer ,
	PersNr	integer ,
	Note	float,
	foreign key(MatrNr) references Studenten(MatrNr),
	foreign key(VorlNr) references Vorlesung(VorlNr),
	foreign key(PersNr) references Professor(PersNr)
);

create table hoeren(
	MartrNr		integer,
	VorlNr		integer,
	foreign key(MatrNr) references Studenten(MatrNr),
	foreign key(VorlNr) references Vorlesung(VorlNr)
);

create table voraussetzen(
	Vorgaenger	integer,
	Nachfolger	integer,
	foreign key(Vorgaenger) references Vorlesung(VorlNr),
	foreign key(Nachfolger) references Vorlesung(VorlNr)
);
	
END;