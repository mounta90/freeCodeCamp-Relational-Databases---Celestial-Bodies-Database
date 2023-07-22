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
    diameter_in_parsecs integer,
    visual_morphology_category character varying(30) NOT NULL,
    magnetic_fields_in_microgauss integer
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
-- Name: meteor; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.meteor (
    meteor_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.meteor OWNER TO freecodecamp;

--
-- Name: meteor_meteor_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.meteor_meteor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.meteor_meteor_id_seq OWNER TO freecodecamp;

--
-- Name: meteor_meteor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.meteor_meteor_id_seq OWNED BY public.meteor.meteor_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    radius_in_km integer,
    gravity_in_meters_per_second_squared numeric(4,2),
    distance_from_parent_planet_in_km integer,
    planet_id integer NOT NULL
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
    description text,
    has_life boolean,
    diameter_in_km integer,
    gravity_in_meters_per_seconds_squared numeric(4,2),
    has_water boolean,
    star_id integer NOT NULL
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
    age_in_billion_years numeric(5,2),
    radius_in_solar_radius numeric(7,3),
    galaxy_id integer NOT NULL
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
-- Name: meteor meteor_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.meteor ALTER COLUMN meteor_id SET DEFAULT nextval('public.meteor_meteor_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 26800, 'Barred Spiral', 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 46560, 'Barred Spiral', 5);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 98600, 'Magellanic Spiral', 1);
INSERT INTO public.galaxy VALUES (4, 'Sagittarius Dwarf Spheroidal', 20000, 'Elliptical', NULL);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 5780, 'Irregular', NULL);
INSERT INTO public.galaxy VALUES (6, 'Triangulum', 18740, 'Spiral', NULL);


--
-- Data for Name: meteor; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.meteor VALUES (1, 'Barringer Meteor Crater', 1, 1);
INSERT INTO public.meteor VALUES (2, 'Tunguska Meteor', 1, 1);
INSERT INTO public.meteor VALUES (3, 'Comet Shoemaker-Levy 9', 3, 1);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1737, 1.62, 384400, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 11, 0.01, 6000, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 6, 0.00, 23460, 2);
INSERT INTO public.moon VALUES (4, 'Europa', 1561, 1.31, 670900, 3);
INSERT INTO public.moon VALUES (5, 'Io', 1822, 1.80, 421700, 3);
INSERT INTO public.moon VALUES (6, 'Ganymede', 2634, 1.43, NULL, 3);
INSERT INTO public.moon VALUES (7, 'Callisto', 2410, 1.24, 1883000, 3);
INSERT INTO public.moon VALUES (8, 'Titan', 2547, 1.35, 1221870, 6);
INSERT INTO public.moon VALUES (9, 'Rhea', 764, 0.26, 527108, 6);
INSERT INTO public.moon VALUES (10, 'Enceladus', 252, 0.11, 237948, 6);
INSERT INTO public.moon VALUES (11, 'Titania', 788, 0.37, 435910, 7);
INSERT INTO public.moon VALUES (12, 'Oberon', 761, 0.35, 583520, 7);
INSERT INTO public.moon VALUES (13, 'Ariel', 579, 0.25, 190900, 7);
INSERT INTO public.moon VALUES (14, 'Triton', 1353, 0.78, 354759, 8);
INSERT INTO public.moon VALUES (15, 'Nereid', 179, NULL, 5504000, 8);
INSERT INTO public.moon VALUES (16, 'Neso', 30, NULL, 48000000, 8);
INSERT INTO public.moon VALUES (17, 'Larissa', 97, 0.03, NULL, 8);
INSERT INTO public.moon VALUES (18, 'Charon', 606, 0.29, 19570, 11);
INSERT INTO public.moon VALUES (19, 'Nix', 25, NULL, 48694, 11);
INSERT INTO public.moon VALUES (20, 'Hydra', 26, NULL, 64738, 11);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'This is the planet where I live in.', true, 6378, 9.81, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'The planet next door to us.', NULL, 3389, 3.72, true, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'The biggest planet in the solar system.', NULL, 71492, 24.79, true, 1);
INSERT INTO public.planet VALUES (4, 'Venus', 'This is the second planet from the sun', NULL, 6052, 8.87, false, 1);
INSERT INTO public.planet VALUES (5, 'Mercury', 'This is the first planet from the sun.', NULL, 2440, 3.70, false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'This is the sixth planet from the sun.', NULL, 58232, 10.44, false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Looks like a giant light blue marble.', NULL, 25362, 8.69, false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Last of the solar system planets away from the sun.', NULL, 24622, 11.15, true, 1);
INSERT INTO public.planet VALUES (9, 'Ceres', 'A dwarf planet found in 1801.', NULL, 469, NULL, true, 1);
INSERT INTO public.planet VALUES (10, '90482 Orcus', 'A dwarf planet found in 2004.', NULL, NULL, NULL, true, 1);
INSERT INTO public.planet VALUES (11, 'Pluto', 'Sadly, not considered a planet anymore. Instead, it is a dwarf planet now.', NULL, 1188, 0.62, true, 1);
INSERT INTO public.planet VALUES (12, 'Haumea', 'A dwarf planet found in 2004.', NULL, 780, NULL, true, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4.60, 1.000, 1);
INSERT INTO public.star VALUES (2, 'Stephenson 2-18', NULL, 2150.000, 1);
INSERT INTO public.star VALUES (3, 'WOH G64', 0.05, 1540.000, 3);
INSERT INTO public.star VALUES (4, '51 Andromedae', 1.70, 21.300, 2);
INSERT INTO public.star VALUES (5, 'WOH S140', NULL, 1232.500, 3);
INSERT INTO public.star VALUES (6, 'SMC 18592', NULL, 1129.000, 5);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: meteor_meteor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.meteor_meteor_id_seq', 3, true);


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
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: meteor meteor_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.meteor
    ADD CONSTRAINT meteor_name_key UNIQUE (name);


--
-- Name: meteor meteor_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.meteor
    ADD CONSTRAINT meteor_pkey PRIMARY KEY (meteor_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: meteor meteor_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.meteor
    ADD CONSTRAINT meteor_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: meteor meteor_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.meteor
    ADD CONSTRAINT meteor_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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
