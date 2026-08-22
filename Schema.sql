--
-- PostgreSQL database dump
--

\restrict ifKkj5uB4w3FxQ3ja3nZrHIA54go3fyibLdSLX5pvWlghXk78qQRlkgGqpsyCwX

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.4

-- Started on 2026-08-22 11:11:17

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 16923)
-- Name: album; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.album (
    album_id character varying(50) NOT NULL,
    title character varying(120),
    artist_id character varying(30)
);


ALTER TABLE public.album OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16927)
-- Name: artist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.artist (
    artist_id character varying(50) NOT NULL,
    name character varying(120)
);


ALTER TABLE public.artist OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16931)
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    customer_id integer NOT NULL,
    first_name character(50),
    last_name character(50),
    company character varying(120),
    address character varying(120),
    city character varying(50),
    state character varying(50),
    country character varying(50),
    postal_code character varying(50),
    phone character varying(50),
    fax character varying(50),
    email character varying(50),
    support_rep_id integer
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16937)
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    employee_id character varying(50) NOT NULL,
    last_name character(50),
    first_name character(50),
    title character varying(50),
    reports_to character varying(30),
    levels character varying(10),
    birthdate timestamp without time zone,
    hire_date timestamp without time zone,
    address character varying(120),
    city character varying(50),
    state character varying(50),
    country character varying(30),
    postal_code character varying(30),
    phone character varying(30),
    fax character varying(30),
    email character varying(30)
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16943)
-- Name: genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genre (
    genre_id character varying(50) NOT NULL,
    name character varying(120)
);


ALTER TABLE public.genre OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16947)
-- Name: invoice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invoice (
    invoice_id integer NOT NULL,
    customer_id integer,
    invoice_date timestamp without time zone,
    billing_address character varying(120),
    billing_city character varying(30),
    billing_state character varying(30),
    billing_country character varying(30),
    billing_postal character varying(30),
    total double precision
);


ALTER TABLE public.invoice OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16951)
-- Name: invoice_line; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invoice_line (
    invoice_line_id character varying(50) NOT NULL,
    invoice_id integer,
    track_id integer,
    unit_price double precision,
    quantity double precision
);


ALTER TABLE public.invoice_line OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16955)
-- Name: media_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.media_type (
    media_type_id character varying(50) NOT NULL,
    name character varying(120)
);


ALTER TABLE public.media_type OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16959)
-- Name: playlist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.playlist (
    playlist_id character varying(50) NOT NULL,
    name character varying(120)
);


ALTER TABLE public.playlist OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16963)
-- Name: playlist_track; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.playlist_track (
    playlist_id character varying(50),
    track_id integer
);


ALTER TABLE public.playlist_track OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16966)
-- Name: track; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.track (
    track_id integer NOT NULL,
    name character varying(150),
    album_id character varying(50),
    media_type_id character varying(50),
    genre_id character varying(50),
    composer character varying(190),
    milliseconds integer,
    bytes integer,
    unit_price double precision
);


ALTER TABLE public.track OWNER TO postgres;

--
-- TOC entry 4896 (class 2606 OID 16971)
-- Name: album album_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.album
    ADD CONSTRAINT album_pkey PRIMARY KEY (album_id);


--
-- TOC entry 4898 (class 2606 OID 16973)
-- Name: artist artist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artist
    ADD CONSTRAINT artist_pkey PRIMARY KEY (artist_id);


--
-- TOC entry 4900 (class 2606 OID 16975)
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_id);


--
-- TOC entry 4902 (class 2606 OID 16977)
-- Name: employee employee2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee2_pkey PRIMARY KEY (employee_id);


--
-- TOC entry 4904 (class 2606 OID 16979)
-- Name: genre genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (genre_id);


--
-- TOC entry 4908 (class 2606 OID 16981)
-- Name: invoice_line invoice_line_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice_line
    ADD CONSTRAINT invoice_line_pkey PRIMARY KEY (invoice_line_id);


--
-- TOC entry 4906 (class 2606 OID 16983)
-- Name: invoice invoice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT invoice_pkey PRIMARY KEY (invoice_id);


--
-- TOC entry 4910 (class 2606 OID 16985)
-- Name: media_type media_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media_type
    ADD CONSTRAINT media_type_pkey PRIMARY KEY (media_type_id);


--
-- TOC entry 4912 (class 2606 OID 16987)
-- Name: playlist playlist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlist
    ADD CONSTRAINT playlist_pkey PRIMARY KEY (playlist_id);


--
-- TOC entry 4914 (class 2606 OID 16989)
-- Name: track track_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.track
    ADD CONSTRAINT track_pkey PRIMARY KEY (track_id);


-- Completed on 2026-08-22 11:11:17

--
-- PostgreSQL database dump complete
--

\unrestrict ifKkj5uB4w3FxQ3ja3nZrHIA54go3fyibLdSLX5pvWlghXk78qQRlkgGqpsyCwX

