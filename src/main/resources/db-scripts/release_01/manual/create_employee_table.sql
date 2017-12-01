--liquibase formatted sql

--changeset pratik:1 runOnChange:false runAlways:false

-- Table: public.employee
-- DROP TABLE public.employee;
CREATE TABLE IF NOT EXISTS public.employee
(
  	id SERIAL PRIMARY KEY,
	first_name character varying(255) ,
	last_name character varying (255) ,
	email character varying (255) ,
	passowrd character varying (255) ,
	CONSTRAINT unique_email UNIQUE (email)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.employee OWNER TO postgresadmin;
GRANT ALL ON TABLE public.employee TO postgresadmin;
GRANT ALL ON TABLE public.employee TO public;