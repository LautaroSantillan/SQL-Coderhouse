CREATE SCHEMA prueba_coder; -- notación snake case
USE prueba_coder; -- keywords

create table users( 
	id_users int unsigned auto_increment primary key,
	name varchar (50) not null,
	lastName varchar (50) not null,
	dni int not null,
	/*email varchar (70),
	direccion varchar (80),
	telefono varchar (20),*/
	contact enum ('email','telefono','direccion') not null,
	value_contact varchar (70) not null
);