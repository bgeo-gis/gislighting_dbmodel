
SET search_path = "SCHEMA_NAME", public, pg_catalog;


CREATE TABLE om_visit_cat (
    id serial NOT NULL PRIMARY KEY,
    name character varying(30),
    startdate date DEFAULT now(),
    enddate date,
    descript text,
    active boolean DEFAULT true,
    extusercat_id integer,
    duration text
);


CREATE TABLE om_visit_class (
    id serial NOT NULL PRIMARY KEY,
    idval character varying(30),
    descript text,
    active boolean DEFAULT true,
    ismultifeature boolean,
    ismultievent boolean,
    feature_type text,
    sys_role_id character varying(30)
);


CREATE TABLE om_visit_class_x_parameter (
    id serial NOT NULL PRIMARY KEY,
    class_id integer NOT NULL,
    parameter_id character varying(50) NOT NULL
);



CREATE TABLE om_visit (
    id bigserial NOT NULL PRIMARY KEY,
    visitcat_id integer NOT NULL,
    ext_code character varying(30),
    startdate timestamp(6) without time zone DEFAULT now(),
    enddate timestamp(6) without time zone DEFAULT now(),
    user_name character varying(50) DEFAULT "current_user"(),
    webclient_id character varying(50),
    expl_id integer,
    the_geom public.geometry(Point,25831),
    descript text,
    is_done boolean DEFAULT true,
    feature_type text,
    lot_id integer,
    class_id integer,
    suspendendcat_id integer
);



CREATE TABLE om_visit_event (
    id bigserial NOT NULL PRIMARY KEY,
    event_code character varying(16),
    visit_id bigint NOT NULL,
    position_id character varying(50),
    position_value double precision,
    parameter_id character varying(50) NOT NULL,
    value text,
    value1 integer,
    value2 integer,
    geom1 double precision,
    geom2 double precision,
    geom3 double precision,
    xcoord double precision,
    ycoord double precision,
    compass double precision,
    tstamp timestamp(6) without time zone DEFAULT now(),
    text text,
    index_val smallint,
    is_last boolean
);

CREATE TABLE om_visit_event_photo (
    id bigserial NOT NULL PRIMARY KEY,
    visit_id bigint NOT NULL,
    event_id bigint NOT NULL,
    tstamp timestamp(6) without time zone DEFAULT now(),
    value text,
    text text,
    compass double precision
);



CREATE TABLE om_visit_file (
    id bigserial NOT NULL PRIMARY KEY,
    visit_id bigint NOT NULL,
    filetype character varying(30),
    hash text,
    url text,
    xcoord double precision,
    ycoord double precision,
    compass double precision,
    fextension character varying(16),
    tstamp timestamp(6) without time zone DEFAULT now()
);

CREATE TABLE om_visit_filetype_x_extension (
    filetype character varying(30) NOT NULL,
    fextension character varying(16) NOT NULL
);


CREATE TABLE om_visit_lot (
    id serial NOT NULL PRIMARY KEY,
    idval character varying(30),
    startdate date DEFAULT now(),
    enddate date,
    visitclass_id integer,
    visitcat_id integer,
    descript text,
    active boolean DEFAULT true,
    team_id integer,
    duration text,
    feature_type text
);


CREATE TABLE om_visit_lot_x_arc (
    lot_id integer NOT NULL,
    arc_id character varying(16) NOT NULL,
    status integer,
    observations text
);


CREATE TABLE om_visit_lot_x_node (
    lot_id integer NOT NULL,
    node_id character varying(16) NOT NULL,
    status integer,
    observations text
);

--id idval???
CREATE TABLE om_visit_parameter_form_type (
    id character varying(50) NOT NULL,
    CONSTRAINT om_visit_parameter_form_type_check CHECK (((id)::text = ANY ((ARRAY['event_standard'::character varying, 'event_ud_arc_rehabit'::character varying, 'event_ud_arc_standard'::character varying])::text[])))
);


CREATE TABLE om_visit_parameter (
    id character varying(50) NOT NULL PRIMARY KEY,
    code character varying(30),
    parameter_type character varying(30) NOT NULL,
    feature_type character varying(30) NOT NULL,
    data_type character varying(16),
    criticity smallint,
    descript character varying(100),
    form_type character varying(30) NOT NULL,
    vdefault text,
    ismultifeature boolean,
    short_descript character varying(30)
);


CREATE TABLE om_visit_parameter_type (
    id character varying(30) NOT NULL PRIMARY KEY,
    descript text,
    go2plan boolean
);


CREATE TABLE om_visit_parameter_index (
    id bigserial NOT NULL PRIMARY KEY,
    parameter_id character varying(50),
    numval_from double precision,
    numval_to double precision,
    text_val text,
    bool_val boolean,
    index_val smallint
);

CREATE TABLE om_visit_parameter_cat_action (
    id serial NOT NULL PRIMARY KEY,
    action_name text
);


CREATE TABLE om_visit_parameter_x_parameter ( --pxp_id o id?
    pxp_id bigserial NOT NULL PRIMARY KEY,
    parameter_id1 character varying(50),
    parameter_id2 character varying(50),
    action_type integer,
    action_value text
);


CREATE TABLE om_visit_typevalue ( -- orden de los campos??
    typevalue character varying(50) NOT NULL,
    id character varying(30) NOT NULL,
    idval character varying(30),
    descript text
);


CREATE TABLE om_visit_value_criticity (
    id smallint NOT NULL PRIMARY KEY,
    descript text
);


CREATE TABLE om_visit_x_arc (
    id bigserial NOT NULL PRIMARY KEY,
    visit_id bigint NOT NULL,
    arc_id character varying(16) NOT NULL,
    is_last boolean DEFAULT true
);

CREATE TABLE om_visit_x_node (
    id bigserial NOT NULL PRIMARY KEY,
    visit_id bigint NOT NULL,
    node_id character varying(16) NOT NULL,
    is_last boolean DEFAULT true
);