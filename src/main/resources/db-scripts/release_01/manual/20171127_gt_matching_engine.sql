--liquibase formatted sql

--changeset pratik:1 runOnChange:false runAlways:false

ALTER TABLE "gt_src" 
	ADD COLUMN country_iso character varying(3000),
	ADD COLUMN rg_id character varying(3000),	
	ADD COLUMN rg_parent_id character varying(3000),
	ADD COLUMN rg_name character varying(3000),
	ADD COLUMN rg_country character varying(3000),
	ADD COLUMN rg_state character varying(3000),
	ADD COLUMN rg_city character varying(3000),
	ADD COLUMN rg_post_code character varying(3000),
	ADD COLUMN rg_type character varying(3000),
	ADD COLUMN resolved_type character varying(3000),
	ADD COLUMN resolved boolean,
	ADD COLUMN confidence_level character varying(100);

