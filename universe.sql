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
    description character varying(100),
    has_life boolean,
    age_in_millions_of_years integer NOT NULL,
    galaxy_type character varying(20),
    supercluster_id integer
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(10) NOT NULL,
    description text,
    age_in_millions_of_years integer
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
    name character varying(10) NOT NULL,
    description character varying(100),
    supports_life boolean,
    age_in_millions_of_years integer,
    planet_type character varying(20),
    distance_from_earth_in_lightyears integer,
    radius_compared_to_earth numeric(5,3),
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
    name character varying(10) NOT NULL,
    description character varying(100),
    has_life boolean,
    age_in_millions_of_years integer,
    distance_from_earth_in_lightyears integer,
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
-- Name: supercluster; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.supercluster (
    supercluster_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description character varying(100),
    has_life boolean,
    diameter_in_million_lightyears integer
);


ALTER TABLE public.supercluster OWNER TO freecodecamp;

--
-- Name: supercluster_supercluster_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.supercluster_supercluster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.supercluster_supercluster_id_seq OWNER TO freecodecamp;

--
-- Name: supercluster_supercluster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.supercluster_supercluster_id_seq OWNED BY public.supercluster.supercluster_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Name: supercluster supercluster_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.supercluster ALTER COLUMN supercluster_id SET DEFAULT nextval('public.supercluster_supercluster_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'The MIlky Way is the galaxy that includes out Solar System.', true, 13000, 'Barred Spiral Galaxy', 1);
INSERT INTO public.galaxy VALUES (3, 'Andromeda', 'The Andromeda Galaxy is the nearest large galaxy to the Milky Way', false, 10000, 'Barred Spiral Galaxy', 1);
INSERT INTO public.galaxy VALUES (4, 'Canis Major Dwarf', 'CMa Dwarf is a disputed dwarf irregular galaxy in the local group', false, 2200, 'irregular dwarf', 1);
INSERT INTO public.galaxy VALUES (5, 'Cygnus A', 'Cygnus A is a radio galaxy, and one of the strongest radio sources in the sky', false, 3, 'Radio Galaxy', 1);
INSERT INTO public.galaxy VALUES (6, 'Maffei I', 'Maffei 1 is a massive elliptical galaxy in the constellation Cassiopeia', false, 10000, 'Elliptical galaxy', 1);
INSERT INTO public.galaxy VALUES (7, 'Maffei II', 'Maffei 2 is an intermediate spiral galaxy in the constellation Cassiopeia', false, 10000, 'Intermediate spiral', 1);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 4, 'Moon', 'The moon is the Earth''s only natural satellite', 50);
INSERT INTO public.moon VALUES (2, 7, 'Io', 'Io is the innermost and third largest of the four Galilean moons of the planet Jupiter', 4500);
INSERT INTO public.moon VALUES (3, 7, 'Ganymede', 'Ganymede, a satellite of Jupiter, is the largest and most massive of the Solar System''s moons', 4500);
INSERT INTO public.moon VALUES (4, 5, 'Phobos', 'Phobos is the innermost and larger of the two natural satellites of Mars', 2700);
INSERT INTO public.moon VALUES (5, 5, 'Deimos', 'Deimos is the smaller and outermost of the two natural satallites of Mars', 2700);
INSERT INTO public.moon VALUES (6, 8, 'Titan', 'Titan is the largest moon of Saturn and the second-largest natural satellite in the Solar System', 4000);
INSERT INTO public.moon VALUES (7, 7, 'Europa', 'Europa is the smallest of the four Galilean moons orbiting Jupiter', 90);
INSERT INTO public.moon VALUES (8, 8, 'Enceladus', 'Enceladus is the sixth-largest moon of Saturn, and 19th largest in the Solar System', 1000);
INSERT INTO public.moon VALUES (9, 8, 'Mimas', 'Mimas is a moon of Saturn discovered in 1789 by William Herschel', 4500);
INSERT INTO public.moon VALUES (10, 10, 'Triton', 'Triton is the largest natural satellite of the planet Neptune, and was the first Neptunian moon to be discovered', 50);
INSERT INTO public.moon VALUES (11, 8, 'Iapetus', 'Iapetus is a moon of Saturn. It is the 24th if Saturn''s 83 known moons', 4560);
INSERT INTO public.moon VALUES (12, 11, 'Charon', 'Charon  is the largest of the five known natural satellites of the dwarf planet Pluto', 4600);
INSERT INTO public.moon VALUES (45, 7, 'Callisto', 'Callisto is the second-largest moon of Jupiter, after Ganymede', 4000);
INSERT INTO public.moon VALUES (46, 8, 'Hyperion', 'Hyperion is a moon of Saturn discovered in 1848', 4200);
INSERT INTO public.moon VALUES (47, 10, 'Nereid', 'Nereid is the third-largest moon of Neptune', 500);
INSERT INTO public.moon VALUES (48, 8, 'Rhea', 'Rhea is the second-largest moon of Saturn and the ninth-largest moon in the Solar System', 4500);
INSERT INTO public.moon VALUES (49, 8, 'Pan', 'Pan is the innermost named moon of Saturn', 4300);
INSERT INTO public.moon VALUES (51, 9, 'Oberon', 'Oberon is the outermost major moon of the planet Uranus', 3900);
INSERT INTO public.moon VALUES (52, 9, 'Umbriel', 'Umbriel is a moon of Uranus discovered on October 24, 1851', 4500);
INSERT INTO public.moon VALUES (50, 9, 'Titania', 'Titania is the largest of the moons of Uranus and the eighth largest moon in the Solar System', 4500);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Mercury', 'Mercury is the smallest planet in the Solar System', false, 4600, 'planet', 0, 0.382, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 'Venus is the second planet from the sun', false, 4600, 'planet', 0, 0.950, 1);
INSERT INTO public.planet VALUES (4, 'Earth', 'Earth is the third planet from the sun', true, 4600, 'planet', 0, 1.000, 1);
INSERT INTO public.planet VALUES (5, 'Mars', 'Mars is the fourth planet from the sun', false, 4600, 'planet', 0, 0.532, 1);
INSERT INTO public.planet VALUES (7, 'Jupiter', 'Jupiter is the fifth planet from the sun and the largest in the solar system', false, 4600, 'planet', 0, 11.209, 1);
INSERT INTO public.planet VALUES (8, 'Saturn', 'Saturn is the sixth planet from the sun', false, 4600, 'planet', 0, 9.440, 1);
INSERT INTO public.planet VALUES (9, 'Uranus', 'Uranus is the seventh planet from the sun', false, 4600, 'planet', 0, 4.007, 1);
INSERT INTO public.planet VALUES (10, 'Neptune', 'Neptune is the eighth planet from the sun', false, 4600, 'planet', 0, 3.883, 1);
INSERT INTO public.planet VALUES (11, 'Pluto', 'Pluto is a dwarf planet in the Kuiper Belt', false, 4600, 'dwarf planet', 0, 0.180, 1);
INSERT INTO public.planet VALUES (12, 'Proxima b', 'Proxima Centauri b is an exoplanet orbiting in the habitable zone of the red dwarf Proxima Centauri', false, 4853, 'exoplanet', 4, 1.080, 2);
INSERT INTO public.planet VALUES (13, 'Teeg. c', 'Teegarden''s Star C is a candidate exoplanet found orbiting in the habitable zone of Teegarden''s Star', false, 8000, 'exoplanet', 12, 1.040, 3);
INSERT INTO public.planet VALUES (14, 'Cancri e', '55 Cancri e is an exoplanet in the orbit of its Sun-like host 55 Cancri A', false, 8600, 'exoplanet', 41, 3.540, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The sun is the star in the center of the solar system', true, 4600, 0, 2);
INSERT INTO public.star VALUES (2, 'Pr. Cent', 'Proxima Centauri is a small, low mass star located 4.2465 light years away from the sun', false, 4850, 4, 2);
INSERT INTO public.star VALUES (3, 'Teegardens', 'Teegarden''s Star is an M-type red dwarf in the constallation Aries', false, 8000, 12, 2);
INSERT INTO public.star VALUES (4, 'Cancri A', '55 Cancri is a binary star system in the zodiac constellation of Cancer', false, 8700, 41, 2);
INSERT INTO public.star VALUES (5, 'Sirius', 'Sirius is the brightest star in the night sky', false, 242, 8, 2);
INSERT INTO public.star VALUES (6, 'Betelgeuse', 'Betelgeuse is a red supergiant and one of the largest stars visible to the naked eye', false, 8500, 600, 2);


--
-- Data for Name: supercluster; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.supercluster VALUES (1, 'Virgo', 'A mass concentration of galaxies containing the Virgo Cluster and Local Group.', true, 110);
INSERT INTO public.supercluster VALUES (2, 'Coma', 'The Coma Supercluster us a nearby supercluster of galaxies comprising the Coma and Leo Clusters', false, 20);
INSERT INTO public.supercluster VALUES (3, 'Hydra-Centaurus', 'The Hydra-Centaurus Supercluster is the closest neighbour of Virgo Supercluster', false, 0);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 52, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: supercluster_supercluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.supercluster_supercluster_id_seq', 3, true);


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
-- Name: supercluster supercluster_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.supercluster
    ADD CONSTRAINT supercluster_pkey PRIMARY KEY (supercluster_id);


--
-- Name: supercluster supercluster_supercluster_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.supercluster
    ADD CONSTRAINT supercluster_supercluster_id_key UNIQUE (supercluster_id);


--
-- Name: galaxy galaxy_supercluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_supercluster_id_fkey FOREIGN KEY (supercluster_id) REFERENCES public.supercluster(supercluster_id);


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

