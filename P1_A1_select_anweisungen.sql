create table Personal(
	PersNr	integer primary key,
	name	varchar
);

create table Professoren(
	PersNr integer primary key,
	Rang	varchar,
	Raum	varchar
)inherits (Personal);

create table Assistenten(
	PersNr integer primary key,
	Fachgebiet	varchar,
	Boss	integer,
	foreign key(Boss) references Professoren(PersNr)
)inherits(Personal);


insert into Professoren
values(1, 'Jörg', 'hoher Rang', 'A1.1');
insert into Professoren
values(2, 'Thorsten', 'mittlerer Rang', 'A2.2');
insert into Professoren
values(3, 'Bernd', 'niedrieger Rang', 'A3.3');
insert into Personal
values(4, 'Dieter');
insert into Assistenten
values(5, 'Günter', 'Mathe', 1);
insert into Assistenten
values(6, 'Thomas', 'Mathe', 2);

select persnr, name from Personal order by persnr;

select pg.relname,persnr, name 
from Personal pers, pg_class pg 
where pers.tableoid = pg.oid 
order by pers.persnr;



