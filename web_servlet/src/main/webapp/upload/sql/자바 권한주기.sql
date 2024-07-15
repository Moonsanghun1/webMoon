drop user java CASCADE ;

create user java IDENTIFIED by java;

grant CONNECT, RESOURCE, create view to java;
