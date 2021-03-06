-- Protect against this script being sourced by psql.
\echo Use "CREATE EXTENSION" to load this file. \quit


-- Info for relation_create event.
CREATE TYPE relation_create_eventinfo AS (
	relation        REGCLASS,
	new				PG_CATALOG.PG_CLASS
);
CREATE FUNCTION get_relation_create_eventinfo()
	RETURNS relation_create_eventinfo
	LANGUAGE C
	AS 'schema_triggers', 'relation_create_eventinfo';


-- Info for relation_alter event.
CREATE TYPE relation_alter_eventinfo AS (
	relation		REGCLASS,
	old				PG_CATALOG.PG_CLASS,
	new				PG_CATALOG.PG_CLASS
);
CREATE FUNCTION get_relation_alter_eventinfo()
	RETURNS relation_alter_eventinfo
	LANGUAGE C
	AS 'schema_triggers', 'relation_alter_eventinfo';


-- Info for relation_drop event.
CREATE TYPE relation_drop_eventinfo AS (
	old_relation_oid REGCLASS,
	old				PG_CATALOG.PG_CLASS
);
CREATE FUNCTION get_relation_drop_eventinfo()
	RETURNS relation_drop_eventinfo
	LANGUAGE C
	AS 'schema_triggers', 'relation_drop_eventinfo';


-- Info for column_add event.
CREATE TYPE column_add_eventinfo AS (
	relation		REGCLASS,
	attnum			INT2,
	new				PG_CATALOG.PG_ATTRIBUTE
);
CREATE FUNCTION get_column_add_eventinfo()
	RETURNS column_add_eventinfo
	LANGUAGE C
	AS 'schema_triggers', 'column_add_eventinfo';


-- Info for column_alter event.
CREATE TYPE column_alter_eventinfo AS (
	relation		REGCLASS,
	attnum			INT2,
	old				PG_CATALOG.PG_ATTRIBUTE,
	new				PG_CATALOG.PG_ATTRIBUTE
);
CREATE FUNCTION get_column_alter_eventinfo()
	RETURNS column_alter_eventinfo
	LANGUAGE C
	AS 'schema_triggers', 'column_alter_eventinfo';


-- Info for column_drop event.
CREATE TYPE column_drop_eventinfo AS (
	relation		REGCLASS,
	attnum			INT2,
	old				PG_CATALOG.PG_ATTRIBUTE
);
CREATE FUNCTION get_column_drop_eventinfo()
	RETURNS column_drop_eventinfo
	LANGUAGE C
	AS 'schema_triggers', 'column_drop_eventinfo';


-- Info for trigger_create event.
CREATE TYPE trigger_create_eventinfo AS (
	trigger_oid		OID,
	is_internal		BOOLEAN,
	new				PG_CATALOG.PG_TRIGGER
);
CREATE FUNCTION get_trigger_create_eventinfo()
	RETURNS trigger_create_eventinfo
	LANGUAGE C
	AS 'schema_triggers', 'trigger_create_eventinfo';


-- Info for trigger_drop event.
CREATE TYPE trigger_drop_eventinfo AS (
	trigger_oid		OID,
	old				PG_CATALOG.PG_TRIGGER
);
CREATE FUNCTION get_trigger_drop_eventinfo()
	RETURNS trigger_drop_eventinfo
	LANGUAGE C
	AS 'schema_triggers', 'trigger_drop_eventinfo';
