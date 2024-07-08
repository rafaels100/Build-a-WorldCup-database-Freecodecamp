--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO postgres;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer,
    round character(15),
    winner character(20),
    opponent character(20),
    winner_goals integer,
    opponent_goals integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 2018, 'Final          ', 'France              ', 'Croatia             ', 4, 2);
INSERT INTO public.games VALUES (2, 2018, 'Third Place    ', 'Belgium             ', 'England             ', 2, 0);
INSERT INTO public.games VALUES (3, 2018, 'Semi-Final     ', 'Croatia             ', 'England             ', 2, 1);
INSERT INTO public.games VALUES (4, 2018, 'Semi-Final     ', 'France              ', 'Belgium             ', 1, 0);
INSERT INTO public.games VALUES (5, 2018, 'Quarter-Final  ', 'Croatia             ', 'Russia              ', 3, 2);
INSERT INTO public.games VALUES (6, 2018, 'Quarter-Final  ', 'England             ', 'Sweden              ', 2, 0);
INSERT INTO public.games VALUES (7, 2018, 'Quarter-Final  ', 'Belgium             ', 'Brazil              ', 2, 1);
INSERT INTO public.games VALUES (8, 2018, 'Quarter-Final  ', 'France              ', 'Uruguay             ', 2, 0);
INSERT INTO public.games VALUES (9, 2018, 'Eighth-Final   ', 'England             ', 'Colombia            ', 2, 1);
INSERT INTO public.games VALUES (10, 2018, 'Eighth-Final   ', 'Sweden              ', 'Switzerland         ', 1, 0);
INSERT INTO public.games VALUES (11, 2018, 'Eighth-Final   ', 'Belgium             ', 'Japan               ', 3, 2);
INSERT INTO public.games VALUES (12, 2018, 'Eighth-Final   ', 'Brazil              ', 'Mexico              ', 2, 0);
INSERT INTO public.games VALUES (13, 2018, 'Eighth-Final   ', 'Croatia             ', 'Denmark             ', 2, 1);
INSERT INTO public.games VALUES (14, 2018, 'Eighth-Final   ', 'Russia              ', 'Spain               ', 2, 1);
INSERT INTO public.games VALUES (15, 2018, 'Eighth-Final   ', 'Uruguay             ', 'Portugal            ', 2, 1);
INSERT INTO public.games VALUES (16, 2018, 'Eighth-Final   ', 'France              ', 'Argentina           ', 4, 3);
INSERT INTO public.games VALUES (17, 2014, 'Final          ', 'Germany             ', 'Argentina           ', 1, 0);
INSERT INTO public.games VALUES (18, 2014, 'Third Place    ', 'Netherlands         ', 'Brazil              ', 3, 0);
INSERT INTO public.games VALUES (19, 2014, 'Semi-Final     ', 'Argentina           ', 'Netherlands         ', 1, 0);
INSERT INTO public.games VALUES (20, 2014, 'Semi-Final     ', 'Germany             ', 'Brazil              ', 7, 1);
INSERT INTO public.games VALUES (21, 2014, 'Quarter-Final  ', 'Netherlands         ', 'Costa Rica          ', 1, 0);
INSERT INTO public.games VALUES (22, 2014, 'Quarter-Final  ', 'Argentina           ', 'Belgium             ', 1, 0);
INSERT INTO public.games VALUES (23, 2014, 'Quarter-Final  ', 'Brazil              ', 'Colombia            ', 2, 1);
INSERT INTO public.games VALUES (24, 2014, 'Quarter-Final  ', 'Germany             ', 'France              ', 1, 0);
INSERT INTO public.games VALUES (25, 2014, 'Eighth-Final   ', 'Brazil              ', 'Chile               ', 2, 1);
INSERT INTO public.games VALUES (26, 2014, 'Eighth-Final   ', 'Colombia            ', 'Uruguay             ', 2, 0);
INSERT INTO public.games VALUES (27, 2014, 'Eighth-Final   ', 'France              ', 'Nigeria             ', 2, 0);
INSERT INTO public.games VALUES (28, 2014, 'Eighth-Final   ', 'Germany             ', 'Algeria             ', 2, 1);
INSERT INTO public.games VALUES (29, 2014, 'Eighth-Final   ', 'Netherlands         ', 'Mexico              ', 2, 1);
INSERT INTO public.games VALUES (30, 2014, 'Eighth-Final   ', 'Costa Rica          ', 'Greece              ', 2, 1);
INSERT INTO public.games VALUES (31, 2014, 'Eighth-Final   ', 'Argentina           ', 'Switzerland         ', 1, 0);
INSERT INTO public.games VALUES (32, 2014, 'Eighth-Final   ', 'Belgium             ', 'United States       ', 2, 1);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 32, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- PostgreSQL database dump complete
--

