--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE cosmos;
--
-- Name: cosmos; Type: DATABASE; Schema: -; Owner: galaxyuser
--

CREATE DATABASE cosmos WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';

ALTER DATABASE cosmos OWNER TO galaxyuser;

\connect cosmos

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: galaxyuser
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying NOT NULL,
    size integer NOT NULL,
    distance_from_sun integer,
    orbit_time_years numeric,
    is_circular boolean,
    has_rings boolean,
    description text,
    solar_system_id integer
);

ALTER TABLE public.asteroid OWNER TO galaxyuser;

--
-- Name: solar_system; Type: TABLE; Schema: public; Owner: galaxyuser
--

CREATE TABLE public.solar_system (
    solar_system_id integer NOT NULL,
    name character varying NOT NULL,
    age integer NOT NULL,
    distance_from_sun integer,
    galaxy_age_years numeric,
    has_planets boolean,
    has_life boolean,
    description text
);

ALTER TABLE public.solar_system OWNER TO galaxyuser;

--
-- Name: satellite; Type: TABLE; Schema: public; Owner: galaxyuser
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    name character varying NOT NULL,
    size integer NOT NULL,
    distance_from_planet integer,
    orbit_time_years numeric,
    is_circular boolean,
    has_atmosphere boolean,
    description text,
    planet_id integer
);

ALTER TABLE public.satellite OWNER TO galaxyuser;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: galaxyuser
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    size integer NOT NULL,
    distance_from_sun integer,
    orbit_time_years numeric,
    is_gaseous boolean,
    supports_life boolean,
    description text,
    star_id integer
);

ALTER TABLE public.planet OWNER TO galaxyuser;

--
-- Name: star; Type: TABLE; Schema: public; Owner: galaxyuser
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    size integer NOT NULL,
    distance_from_galaxy integer,
    life_span_years numeric,
    is_gaseous boolean,
    produces_energy boolean,
    description text,
    solar_system_id integer
);

ALTER TABLE public.star OWNER TO galaxyuser;

--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: galaxyuser
--

INSERT INTO public.asteroid VALUES (1, 'x', 100, 500000, 75, true, false, 'Asteroid X', 1);
INSERT INTO public.asteroid VALUES (2, 'y', 150, 700000, 120, true, false, 'Asteroid Y', 2);
INSERT INTO public.asteroid VALUES (3, 'z', 200, 300000, 65, false, true, 'Asteroid Z', 3);

--
-- Data for Name: solar_system; Type: TABLE DATA; Schema: public; Owner: galaxyuser
--

INSERT INTO public.solar_system VALUES (1, 'Solar Alpha', 5000, 200000, 4.5, true, true, 'Description of Solar Alpha');
INSERT INTO public.solar_system VALUES (2, 'Solar Beta', 8000, 400000, 7.5, false, false, 'Description of Solar Beta');

--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: galaxyuser
--

INSERT INTO public.satellite VALUES (1, 'Sat A', 20, 500, 1.5, true, true, 'Satellite A', 1);
INSERT INTO public.satellite VALUES (2, 'Sat B', 15, 300, 2.0, true, false, 'Satellite B', 2);

--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: galaxyuser
--

INSERT INTO public.planet VALUES (1, 'Planet X', 12000, 500000, 365, false, true, 'Planet X', 1);
INSERT INTO public.planet VALUES (2, 'Planet Y', 11000, 600000, 400, true, false, 'Planet Y', 2);

--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: galaxyuser
--

INSERT INTO public.star VALUES (1, 'Star Alpha', 500000, 1, 10.5, true, true, 'Star Alpha', 1);
INSERT INTO public.star VALUES (2, 'Star Beta', 800000, 2, 15.3, false, false, 'Star Beta', 2);

--
-- Constraints for Name: asteroid; Type: CONSTRAINT; Schema: public; Owner: galaxyuser
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);

--
-- Constraints for Name: solar_system; Type: CONSTRAINT; Schema: public; Owner: galaxyuser
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_pkey PRIMARY KEY (solar_system_id);

--
-- Constraints for Name: satellite; Type: CONSTRAINT; Schema: public; Owner: galaxyuser
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_pkey PRIMARY KEY (satellite_id);

--
-- Constraints for Name: planet; Type: CONSTRAINT; Schema: public; Owner: galaxyuser
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);

--
-- Constraints for Name: star; Type: CONSTRAINT; Schema: public; Owner: galaxyuser
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);

--
-- Foreign key constraints
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_solar_system_id_fkey FOREIGN KEY (solar_system_id) REFERENCES public.solar_system(solar_system_id);

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_solar_system_id_fkey FOREIGN KEY (solar_system_id) REFERENCES public.solar_system(solar_system_id);

-- 
-- PostgreSQL database dump complete 
--
