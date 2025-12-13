-- CRUD：Create
-- create table: C
create table city (
	tid INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT not null);
create table flight (
	fid INTEGER PRIMARY KEY AUTOINCREMENT,
	origin TEXT not null,
	destination TEXT not null,
	duration INTEGER not null);

insert into flight (
	origin, destination, duration)
VALUES
	('LOS', 'BST', 420),
	('LOS', 'SAN', 75),
	('SAN', 'NYK', 390);

INSERT INTO city (name)
	VALUES ('SAN FRANSISCO'), ('BOSTON'), ('LOS ANGELES'), ('NEW YORK');
-------------------------------------------------
-- U: update
UPDATE flight
	SET origin = 'bst',
	destination = 'wst',
	duration = 450
	where fid = 4;

-- D: delete
DELETE from flight
where origin = 1;

CREATE table city_flight (
	tid INTEGER not null,
	fid INTEGER not null,
	FOREIGN KEY (tid) REFERENCES city (tid),
	FOREIGN KEY (fid) REFERENCES flight (fid)
	);