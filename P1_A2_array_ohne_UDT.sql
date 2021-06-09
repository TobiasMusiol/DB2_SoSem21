
-----Zeige Anzahl der Module, die mehr als 3 mal auftreten------
create function anzahl_modul_zuoft(n float[][])
returns bigint
as $info$
begin
	return (select count(*)
				from(
					select count(*) as anz 
					from unnest(n[1:array_length(n, 1)][2:2]) as modul 
					group by modul 
				having count(*) > 3
				) as zuoft);
end;
$info$ 
LANGUAGE plpgsql;


create table Studierenden(
	MatrNr integer primary key,
	Name varchar,
	Semester integer,
	Noten float[][] check(anzahl_modul_zuoft(Noten) = 0) 
);

-- Array Element (z.B. {5.0,5555}) hinzufügen oder entfernen um check constrain zu testen --
insert into Studierenden
values(1, 'Hans', 1, '{{1.0,2222}, {2.0,1111}, {5.0,5555}, {5.0,5555}, {5.0,5555}}');
insert into Studierenden
values(2, 'Peter', 1, '{{1.0,2255}, {2.0,1444},{5.0,1111}, {5.0,1111}, {5.0,5555}, {5.0,1111}}');


select * from studierenden;

---Kontrolle, was die Funktion ausgibt---
--select * from anzahl_modul_zuoft('{{1.0,2222}, {2.0,1111}, {2.0,1111}, {2.0,1111}, {2.0,1111}, {5.0,5555}, {5.0,5555}, {5.0,5555}, {5.0,5555}, {5.0,5555}}');



