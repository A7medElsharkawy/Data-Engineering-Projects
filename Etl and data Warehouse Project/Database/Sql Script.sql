
Create schema public

-- Table: public.dim_coustomer

-- DROP TABLE IF EXISTS public.dim_coustomer;

CREATE TABLE IF NOT EXISTS public.dim_coustomer
(
    cust_pk integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    customer_id character varying(255) COLLATE pg_catalog."default" NOT NULL,
    customer_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    segment character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT dim_coustomer_pkey PRIMARY KEY (cust_pk)
)


-- Table: public.dim_date

-- DROP TABLE IF EXISTS public.dim_date;

CREATE TABLE IF NOT EXISTS public.dim_date
(
    date_pk integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "Order Date" timestamp without time zone,
    "Year" bigint,
    quarter bigint,
    "Quarter (Q)" character varying(2) COLLATE pg_catalog."default",
    "Quarter & Year" character varying(9) COLLATE pg_catalog."default",
    "Month" bigint,
    "Month Name" character varying(3) COLLATE pg_catalog."default",
    "Month & Year" character varying(8) COLLATE pg_catalog."default",
    "Week of Year" bigint,
    "Week of Year (W)" character varying(7) COLLATE pg_catalog."default",
    "Day of Week" bigint,
    "Day Name" character varying(9) COLLATE pg_catalog."default",
    CONSTRAINT dim_date_pkey PRIMARY KEY (date_pk)
)

-- Table: public.dim_location

-- DROP TABLE IF EXISTS public.dim_location;

CREATE TABLE IF NOT EXISTS public.dim_location
(
    loc_pk integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "Postal Code" integer,
    city character varying(100) COLLATE pg_catalog."default",
    country character varying(100) COLLATE pg_catalog."default",
    region character varying(100) COLLATE pg_catalog."default",
    state character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT dim_location_pkey PRIMARY KEY (loc_pk)
)

-- Table: public.dim_mode

-- DROP TABLE IF EXISTS public.dim_mode;

CREATE TABLE IF NOT EXISTS public.dim_mode
(
    mode_id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 ) ,
    mode text COLLATE pg_catalog."default",
    CONSTRAINT dim_mode_pkey PRIMARY KEY (mode_id)
)

-- Table: public.dim_product

-- DROP TABLE IF EXISTS public.dim_product;

CREATE TABLE IF NOT EXISTS public.dim_product
(
    prod_pk bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 ),
    version integer,
    start_to timestamp without time zone,
    date_to timestamp without time zone,
    product_id character varying(17) COLLATE pg_catalog."default",
    product_name character varying(255) COLLATE pg_catalog."default",
    "Sub-Category" character varying(15) COLLATE pg_catalog."default",
    category character varying(15) COLLATE pg_catalog."default",
    CONSTRAINT dim_product_pkey PRIMARY KEY (prod_pk)
)


-- Table: public.fact_sales

-- DROP TABLE IF EXISTS public.fact_sales;

CREATE TABLE IF NOT EXISTS public.fact_sales
(
    "Order ID" text COLLATE pg_catalog."default",
    date_pk integer,
    cust_pk integer,
    loc_pk integer,
    mode_id integer,
    prod_pk bigint,
    sales double precision,
    quantity double precision,
    discount double precision,
    profit double precision,
    cost double precision
)