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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter_in_lightyears integer,
    age_in_billions_of_years numeric(6,4),
    type character varying(30),
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: major_element; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.major_element (
    major_element_id integer NOT NULL,
    name character varying(30) NOT NULL,
    symbol character varying(5)
);


ALTER TABLE public.major_element OWNER TO freecodecamp;

--
-- Name: major_element_major_element_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.major_element_major_element_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.major_element_major_element_id_seq OWNER TO freecodecamp;

--
-- Name: major_element_major_element_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.major_element_major_element_id_seq OWNED BY public.major_element.major_element_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter_in_km integer,
    age_in_billions_of_years numeric(6,4),
    has_life boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter_in_km integer,
    age_in_billions_of_years numeric(6,4),
    has_life boolean,
    star_id integer,
    major_element_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter_in_km integer,
    age_in_billions_of_years numeric(6,4),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: major_element major_element_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.major_element ALTER COLUMN major_element_id SET DEFAULT nextval('public.major_element_major_element_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 87400, 13.4000, 'Barred Spiral', 'Is the galaxy that includes our Solar System');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', NULL, NULL, NULL, 'Is the closest to the Milky Way');
INSERT INTO public.galaxy VALUES (3, 'Antennae Galaxies', NULL, NULL, NULL, 'Looks like an insects antenna');
INSERT INTO public.galaxy VALUES (4, 'Backward Galaxy', NULL, NULL, NULL, 'It appears to rotate backwards');
INSERT INTO public.galaxy VALUES (5, 'Black Eye Galaxy', NULL, NULL, NULL, 'It has a dark band of
 absorbing light in fron tof its bright nucleus');
INSERT INTO public.galaxy VALUES (6, 'Condor  Galaxy', 665300, NULL, 'Spiral', 'Is named after a condor, which is a type of Vulture. Is the largest known spiral galaxy');


--
-- Data for Name: major_element; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.major_element VALUES (1, 'Iron', 'Fe');
INSERT INTO public.major_element VALUES (2, 'Helium', 'He');
INSERT INTO public.major_element VALUES (3, 'Hydrogen', 'H');
INSERT INTO public.major_element VALUES (4, 'Carbon', 'C');
INSERT INTO public.major_element VALUES (5, 'Oxygen', 'O');
INSERT INTO public.major_element VALUES (6, 'Nitrogen', 'N');
INSERT INTO public.major_element VALUES (7, 'Neon', 'Ne');
INSERT INTO public.major_element VALUES (8, 'Silicon', 'Si');
INSERT INTO public.major_element VALUES (9, 'Magnesium', 'Mg');
INSERT INTO public.major_element VALUES (10, 'Sulphur', 'S');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 2159, 4.4250, false, 3);
INSERT INTO public.moon VALUES (2, 'Deimos', 12, NULL, false, 4);
INSERT INTO public.moon VALUES (3, 'Phobos', 27, NULL, false, 4);
INSERT INTO public.moon VALUES (4, 'Callisto', 4821, NULL, false, 5);
INSERT INTO public.moon VALUES (5, 'Ganymede', 5286, NULL, false, 5);
INSERT INTO public.moon VALUES (6, 'Io', 3643, NULL, false, 5);
INSERT INTO public.moon VALUES (7, 'Europa', 3122, NULL, false, 5);
INSERT INTO public.moon VALUES (8, 'Themisto', 9, NULL, false, 5);
INSERT INTO public.moon VALUES (9, 'Amalthea', 167, NULL, false, 5);
INSERT INTO public.moon VALUES (10, 'Adrastea', 16, NULL, false, 5);
INSERT INTO public.moon VALUES (11, 'Thebe', 9, NULL, false, 5);
INSERT INTO public.moon VALUES (12, 'Valetudo', 17, NULL, false, 5);
INSERT INTO public.moon VALUES (13, 'Ersa', 16, NULL, false, 5);
INSERT INTO public.moon VALUES (14, 'Titan', 5149, NULL, false, 6);
INSERT INTO public.moon VALUES (15, 'Rhea', 1527, NULL, false, 6);
INSERT INTO public.moon VALUES (16, 'Iapetus', 1470, NULL, false, 6);
INSERT INTO public.moon VALUES (17, 'Dione', 1123, NULL, false, 6);
INSERT INTO public.moon VALUES (18, 'Tethys', 1062, NULL, false, 6);
INSERT INTO public.moon VALUES (19, 'Enceladus', 504, NULL, false, 6);
INSERT INTO public.moon VALUES (20, 'Mimas', 396, NULL, false, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4879, 4.6000, NULL, 1, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 12104, 4.6000, false, 1, 8);
INSERT INTO public.planet VALUES (3, 'Earth', 12756, 4.6000, true, 1, 5);
INSERT INTO public.planet VALUES (4, 'Mars', 6784, 4.6000, false, 1, 8);
INSERT INTO public.planet VALUES (5, 'Jupiter', 142984, 4.6000, false, 1, 3);
INSERT INTO public.planet VALUES (6, 'Saturn', 120526, 4.6000, false, 1, 3);
INSERT INTO public.planet VALUES (7, 'Uranus', 76677, 4.6000, false, 1, 3);
INSERT INTO public.planet VALUES (8, 'Neptune', 49528, 4.6000, false, 1, 3);
INSERT INTO public.planet VALUES (9, 'Aegis', NULL, NULL, false, 2, NULL);
INSERT INTO public.planet VALUES (10, '47 Ursae Majoris b', NULL, NULL, false, 2, NULL);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri d', 10332, NULL, false, 4, NULL);
INSERT INTO public.planet VALUES (12, 'Proxima Centauri b', NULL, NULL, false, 4, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'The Sun', 1390000, 4.6000, 1);
INSERT INTO public.star VALUES (2, 'Epsilon Eridani', 2, NULL, 1);
INSERT INTO public.star VALUES (3, '47 Ursae Majoris', NULL, NULL, 1);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', NULL, NULL, 1);
INSERT INTO public.star VALUES (5, 'Lalande 21185', NULL, NULL, 1);
INSERT INTO public.star VALUES (6, 'Ross 128', NULL, NULL, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: major_element_major_element_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.major_element_major_element_id_seq', 10, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: major_element major_element_major_element_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.major_element
    ADD CONSTRAINT major_element_major_element_id_key UNIQUE (major_element_id);


--
-- Name: major_element major_element_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.major_element
    ADD CONSTRAINT major_element_pkey PRIMARY KEY (major_element_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_major_element_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_major_element_id_fkey FOREIGN KEY (major_element_id) REFERENCES public.major_element(major_element_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

