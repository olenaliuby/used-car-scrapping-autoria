--
-- PostgreSQL database dump
--

-- Dumped from database version 14.9 (Homebrew)
-- Dumped by pg_dump version 14.9 (Homebrew)

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: cinema_actor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cinema_actor (
    id bigint NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL
);


ALTER TABLE public.cinema_actor OWNER TO postgres;

--
-- Name: cinema_actor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cinema_actor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cinema_actor_id_seq OWNER TO postgres;

--
-- Name: cinema_actor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cinema_actor_id_seq OWNED BY public.cinema_actor.id;


--
-- Name: cinema_cinemahall; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cinema_cinemahall (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    rows integer NOT NULL,
    seats_in_row integer NOT NULL
);


ALTER TABLE public.cinema_cinemahall OWNER TO postgres;

--
-- Name: cinema_cinemahall_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cinema_cinemahall_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cinema_cinemahall_id_seq OWNER TO postgres;

--
-- Name: cinema_cinemahall_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cinema_cinemahall_id_seq OWNED BY public.cinema_cinemahall.id;


--
-- Name: cinema_genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cinema_genre (
    id bigint NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.cinema_genre OWNER TO postgres;

--
-- Name: cinema_genre_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cinema_genre_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cinema_genre_id_seq OWNER TO postgres;

--
-- Name: cinema_genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cinema_genre_id_seq OWNED BY public.cinema_genre.id;


--
-- Name: cinema_movie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cinema_movie (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    description text NOT NULL,
    duration integer NOT NULL,
    image character varying(100)
);


ALTER TABLE public.cinema_movie OWNER TO postgres;

--
-- Name: cinema_movie_actors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cinema_movie_actors (
    id bigint NOT NULL,
    movie_id bigint NOT NULL,
    actor_id bigint NOT NULL
);


ALTER TABLE public.cinema_movie_actors OWNER TO postgres;

--
-- Name: cinema_movie_actors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cinema_movie_actors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cinema_movie_actors_id_seq OWNER TO postgres;

--
-- Name: cinema_movie_actors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cinema_movie_actors_id_seq OWNED BY public.cinema_movie_actors.id;


--
-- Name: cinema_movie_genres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cinema_movie_genres (
    id bigint NOT NULL,
    movie_id bigint NOT NULL,
    genre_id bigint NOT NULL
);


ALTER TABLE public.cinema_movie_genres OWNER TO postgres;

--
-- Name: cinema_movie_genres_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cinema_movie_genres_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cinema_movie_genres_id_seq OWNER TO postgres;

--
-- Name: cinema_movie_genres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cinema_movie_genres_id_seq OWNED BY public.cinema_movie_genres.id;


--
-- Name: cinema_movie_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cinema_movie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cinema_movie_id_seq OWNER TO postgres;

--
-- Name: cinema_movie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cinema_movie_id_seq OWNED BY public.cinema_movie.id;


--
-- Name: cinema_moviesession; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cinema_moviesession (
    id bigint NOT NULL,
    show_time timestamp with time zone NOT NULL,
    cinema_hall_id bigint NOT NULL,
    movie_id bigint NOT NULL
);


ALTER TABLE public.cinema_moviesession OWNER TO postgres;

--
-- Name: cinema_moviesession_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cinema_moviesession_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cinema_moviesession_id_seq OWNER TO postgres;

--
-- Name: cinema_moviesession_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cinema_moviesession_id_seq OWNED BY public.cinema_moviesession.id;


--
-- Name: cinema_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cinema_order (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.cinema_order OWNER TO postgres;

--
-- Name: cinema_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cinema_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cinema_order_id_seq OWNER TO postgres;

--
-- Name: cinema_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cinema_order_id_seq OWNED BY public.cinema_order.id;


--
-- Name: cinema_ticket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cinema_ticket (
    id bigint NOT NULL,
    "row" integer NOT NULL,
    seat integer NOT NULL,
    movie_session_id bigint NOT NULL,
    order_id bigint NOT NULL
);


ALTER TABLE public.cinema_ticket OWNER TO postgres;

--
-- Name: cinema_ticket_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cinema_ticket_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cinema_ticket_id_seq OWNER TO postgres;

--
-- Name: cinema_ticket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cinema_ticket_id_seq OWNED BY public.cinema_ticket.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: station_carriage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.station_carriage (
    id bigint NOT NULL,
    carriage_type character varying(10) NOT NULL,
    number integer NOT NULL,
    seats integer NOT NULL,
    train_id bigint NOT NULL
);


ALTER TABLE public.station_carriage OWNER TO postgres;

--
-- Name: station_carriage_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.station_carriage ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.station_carriage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: station_crew; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.station_crew (
    id bigint NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    image character varying(100)
);


ALTER TABLE public.station_crew OWNER TO postgres;

--
-- Name: station_crew_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.station_crew ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.station_crew_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: station_journey; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.station_journey (
    id bigint NOT NULL,
    departure_time timestamp with time zone NOT NULL,
    arrival_time timestamp with time zone NOT NULL,
    route_id bigint NOT NULL,
    train_id bigint NOT NULL,
    image character varying(100)
);


ALTER TABLE public.station_journey OWNER TO postgres;

--
-- Name: station_journey_crew; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.station_journey_crew (
    id bigint NOT NULL,
    journey_id bigint NOT NULL,
    crew_id bigint NOT NULL
);


ALTER TABLE public.station_journey_crew OWNER TO postgres;

--
-- Name: station_journey_crew_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.station_journey_crew ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.station_journey_crew_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: station_journey_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.station_journey ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.station_journey_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: station_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.station_order (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.station_order OWNER TO postgres;

--
-- Name: station_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.station_order ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.station_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: station_route; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.station_route (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    distance integer NOT NULL,
    from_station_id bigint NOT NULL,
    to_station_id bigint NOT NULL
);


ALTER TABLE public.station_route OWNER TO postgres;

--
-- Name: station_route_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.station_route ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.station_route_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: station_station; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.station_station (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL
);


ALTER TABLE public.station_station OWNER TO postgres;

--
-- Name: station_station_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.station_station ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.station_station_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: station_ticket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.station_ticket (
    id bigint NOT NULL,
    seat integer NOT NULL,
    carriage_id bigint NOT NULL,
    journey_id bigint NOT NULL,
    order_id bigint NOT NULL
);


ALTER TABLE public.station_ticket OWNER TO postgres;

--
-- Name: station_ticket_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.station_ticket ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.station_ticket_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: station_train; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.station_train (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    number character varying(8) NOT NULL,
    train_type_id bigint NOT NULL,
    image character varying(100)
);


ALTER TABLE public.station_train OWNER TO postgres;

--
-- Name: station_train_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.station_train ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.station_train_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: station_traintype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.station_traintype (
    id bigint NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.station_traintype OWNER TO postgres;

--
-- Name: station_traintype_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.station_traintype ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.station_traintype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: user_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_user (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.user_user OWNER TO postgres;

--
-- Name: user_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_user_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.user_user_groups OWNER TO postgres;

--
-- Name: user_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_user_groups_id_seq OWNER TO postgres;

--
-- Name: user_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_user_groups_id_seq OWNED BY public.user_user_groups.id;


--
-- Name: user_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_user_id_seq OWNER TO postgres;

--
-- Name: user_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_user_id_seq OWNED BY public.user_user.id;


--
-- Name: user_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_user_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.user_user_user_permissions OWNER TO postgres;

--
-- Name: user_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: user_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_user_user_permissions_id_seq OWNED BY public.user_user_user_permissions.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: cinema_actor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cinema_actor ALTER COLUMN id SET DEFAULT nextval('public.cinema_actor_id_seq'::regclass);


--
-- Name: cinema_cinemahall id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cinema_cinemahall ALTER COLUMN id SET DEFAULT nextval('public.cinema_cinemahall_id_seq'::regclass);


--
-- Name: cinema_genre id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cinema_genre ALTER COLUMN id SET DEFAULT nextval('public.cinema_genre_id_seq'::regclass);


--
-- Name: cinema_movie id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cinema_movie ALTER COLUMN id SET DEFAULT nextval('public.cinema_movie_id_seq'::regclass);


--
-- Name: cinema_movie_actors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cinema_movie_actors ALTER COLUMN id SET DEFAULT nextval('public.cinema_movie_actors_id_seq'::regclass);


--
-- Name: cinema_movie_genres id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cinema_movie_genres ALTER COLUMN id SET DEFAULT nextval('public.cinema_movie_genres_id_seq'::regclass);


--
-- Name: cinema_moviesession id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cinema_moviesession ALTER COLUMN id SET DEFAULT nextval('public.cinema_moviesession_id_seq'::regclass);


--
-- Name: cinema_order id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cinema_order ALTER COLUMN id SET DEFAULT nextval('public.cinema_order_id_seq'::regclass);


--
-- Name: cinema_ticket id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cinema_ticket ALTER COLUMN id SET DEFAULT nextval('public.cinema_ticket_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: user_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_user ALTER COLUMN id SET DEFAULT nextval('public.user_user_id_seq'::regclass);


--
-- Name: user_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_user_groups ALTER COLUMN id SET DEFAULT nextval('public.user_user_groups_id_seq'::regclass);


--
-- Name: user_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.user_user_user_permissions_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add actor	6	add_actor
22	Can change actor	6	change_actor
23	Can delete actor	6	delete_actor
24	Can view actor	6	view_actor
25	Can add cinema hall	7	add_cinemahall
26	Can change cinema hall	7	change_cinemahall
27	Can delete cinema hall	7	delete_cinemahall
28	Can view cinema hall	7	view_cinemahall
29	Can add genre	8	add_genre
30	Can change genre	8	change_genre
31	Can delete genre	8	delete_genre
32	Can view genre	8	view_genre
33	Can add movie	9	add_movie
34	Can change movie	9	change_movie
35	Can delete movie	9	delete_movie
36	Can view movie	9	view_movie
37	Can add movie session	10	add_moviesession
38	Can change movie session	10	change_moviesession
39	Can delete movie session	10	delete_moviesession
40	Can view movie session	10	view_moviesession
41	Can add order	11	add_order
42	Can change order	11	change_order
43	Can delete order	11	delete_order
44	Can view order	11	view_order
45	Can add ticket	12	add_ticket
46	Can change ticket	12	change_ticket
47	Can delete ticket	12	delete_ticket
48	Can view ticket	12	view_ticket
49	Can add user	13	add_user
50	Can change user	13	change_user
51	Can delete user	13	delete_user
52	Can view user	13	view_user
53	Can add carriage	14	add_carriage
54	Can change carriage	14	change_carriage
55	Can delete carriage	14	delete_carriage
56	Can view carriage	14	view_carriage
57	Can add crew	15	add_crew
58	Can change crew	15	change_crew
59	Can delete crew	15	delete_crew
60	Can view crew	15	view_crew
61	Can add journey	16	add_journey
62	Can change journey	16	change_journey
63	Can delete journey	16	delete_journey
64	Can view journey	16	view_journey
65	Can add order	17	add_order
66	Can change order	17	change_order
67	Can delete order	17	delete_order
68	Can view order	17	view_order
69	Can add station	18	add_station
70	Can change station	18	change_station
71	Can delete station	18	delete_station
72	Can view station	18	view_station
73	Can add train type	19	add_traintype
74	Can change train type	19	change_traintype
75	Can delete train type	19	delete_traintype
76	Can view train type	19	view_traintype
77	Can add train	20	add_train
78	Can change train	20	change_train
79	Can delete train	20	delete_train
80	Can view train	20	view_train
81	Can add ticket	21	add_ticket
82	Can change ticket	21	change_ticket
83	Can delete ticket	21	delete_ticket
84	Can view ticket	21	view_ticket
85	Can add route	22	add_route
86	Can change route	22	change_route
87	Can delete route	22	delete_route
88	Can view route	22	view_route
\.


--
-- Data for Name: cinema_actor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cinema_actor (id, first_name, last_name) FROM stdin;
\.


--
-- Data for Name: cinema_cinemahall; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cinema_cinemahall (id, name, rows, seats_in_row) FROM stdin;
\.


--
-- Data for Name: cinema_genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cinema_genre (id, name) FROM stdin;
\.


--
-- Data for Name: cinema_movie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cinema_movie (id, title, description, duration, image) FROM stdin;
1	test	test	100	test
\.


--
-- Data for Name: cinema_movie_actors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cinema_movie_actors (id, movie_id, actor_id) FROM stdin;
\.


--
-- Data for Name: cinema_movie_genres; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cinema_movie_genres (id, movie_id, genre_id) FROM stdin;
\.


--
-- Data for Name: cinema_moviesession; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cinema_moviesession (id, show_time, cinema_hall_id, movie_id) FROM stdin;
\.


--
-- Data for Name: cinema_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cinema_order (id, created_at, user_id) FROM stdin;
\.


--
-- Data for Name: cinema_ticket; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cinema_ticket (id, "row", seat, movie_session_id, order_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	cinema	actor
7	cinema	cinemahall
8	cinema	genre
9	cinema	movie
10	cinema	moviesession
11	cinema	order
12	cinema	ticket
13	user	user
14	station	carriage
15	station	crew
16	station	journey
17	station	order
18	station	station
19	station	traintype
20	station	train
21	station	ticket
22	station	route
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2023-08-31 10:37:39.736669+01
2	contenttypes	0002_remove_content_type_name	2023-08-31 10:37:39.741823+01
3	auth	0001_initial	2023-08-31 10:37:39.770579+01
4	auth	0002_alter_permission_name_max_length	2023-08-31 10:37:39.77433+01
5	auth	0003_alter_user_email_max_length	2023-08-31 10:37:39.777148+01
6	auth	0004_alter_user_username_opts	2023-08-31 10:37:39.780469+01
7	auth	0005_alter_user_last_login_null	2023-08-31 10:37:39.783365+01
8	auth	0006_require_contenttypes_0002	2023-08-31 10:37:39.784776+01
9	auth	0007_alter_validators_add_error_messages	2023-08-31 10:37:39.787488+01
10	auth	0008_alter_user_username_max_length	2023-08-31 10:37:39.79026+01
11	auth	0009_alter_user_last_name_max_length	2023-08-31 10:37:39.793499+01
12	auth	0010_alter_group_name_max_length	2023-08-31 10:37:39.798434+01
13	auth	0011_update_proxy_permissions	2023-08-31 10:37:39.802494+01
14	auth	0012_alter_user_first_name_max_length	2023-08-31 10:37:39.806074+01
15	user	0001_initial	2023-08-31 10:37:39.835895+01
16	admin	0001_initial	2023-08-31 10:37:39.848973+01
17	admin	0002_logentry_remove_auto_add	2023-08-31 10:37:39.853014+01
18	admin	0003_logentry_add_action_flag_choices	2023-08-31 10:37:39.857224+01
19	cinema	0001_initial	2023-08-31 10:37:39.914601+01
20	sessions	0001_initial	2023-08-31 10:37:39.919364+01
21	user	0002_alter_user_managers_remove_user_username_and_more	2023-08-31 10:37:39.933112+01
22	station	0001_initial	2023-09-20 20:33:58.981231+01
23	station	0002_alter_carriage_number	2023-09-20 20:33:58.985708+01
24	station	0003_alter_train_number	2023-09-20 20:33:58.995476+01
25	station	0004_alter_train_options	2023-09-20 20:33:59.003938+01
26	station	0005_crew_image_journey_image_train_image	2023-09-20 20:33:59.010081+01
27	station	0006_alter_crew_options	2023-09-20 20:33:59.013127+01
28	station	0007_alter_journey_image	2023-09-20 20:33:59.017091+01
29	station	0008_alter_crew_image_alter_train_image	2023-09-20 20:33:59.02438+01
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: station_carriage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.station_carriage (id, carriage_type, number, seats, train_id) FROM stdin;
\.


--
-- Data for Name: station_crew; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.station_crew (id, first_name, last_name, image) FROM stdin;
\.


--
-- Data for Name: station_journey; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.station_journey (id, departure_time, arrival_time, route_id, train_id, image) FROM stdin;
\.


--
-- Data for Name: station_journey_crew; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.station_journey_crew (id, journey_id, crew_id) FROM stdin;
\.


--
-- Data for Name: station_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.station_order (id, created_at, user_id) FROM stdin;
\.


--
-- Data for Name: station_route; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.station_route (id, name, distance, from_station_id, to_station_id) FROM stdin;
\.


--
-- Data for Name: station_station; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.station_station (id, name, latitude, longitude) FROM stdin;
\.


--
-- Data for Name: station_ticket; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.station_ticket (id, seat, carriage_id, journey_id, order_id) FROM stdin;
\.


--
-- Data for Name: station_train; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.station_train (id, name, number, train_type_id, image) FROM stdin;
\.


--
-- Data for Name: station_traintype; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.station_traintype (id, name) FROM stdin;
\.


--
-- Data for Name: user_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_user (id, password, last_login, is_superuser, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$320000$kWRihNr4xxsDXqMxlueBeP$EDj4CLxHi7cDfUjY6g1hOgEqUnda4oZqKYc+8de/DcA=	\N	f			olena.liuby@gmail.com	f	t	2023-08-31 10:44:41.967471+01
\.


--
-- Data for Name: user_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: user_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 88, true);


--
-- Name: cinema_actor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cinema_actor_id_seq', 1, false);


--
-- Name: cinema_cinemahall_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cinema_cinemahall_id_seq', 1, false);


--
-- Name: cinema_genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cinema_genre_id_seq', 1, false);


--
-- Name: cinema_movie_actors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cinema_movie_actors_id_seq', 1, false);


--
-- Name: cinema_movie_genres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cinema_movie_genres_id_seq', 1, false);


--
-- Name: cinema_movie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cinema_movie_id_seq', 1, false);


--
-- Name: cinema_moviesession_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cinema_moviesession_id_seq', 1, false);


--
-- Name: cinema_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cinema_order_id_seq', 1, false);


--
-- Name: cinema_ticket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cinema_ticket_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 22, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 29, true);


--
-- Name: station_carriage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.station_carriage_id_seq', 1, false);


--
-- Name: station_crew_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.station_crew_id_seq', 1, false);


--
-- Name: station_journey_crew_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.station_journey_crew_id_seq', 1, false);


--
-- Name: station_journey_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.station_journey_id_seq', 1, false);


--
-- Name: station_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.station_order_id_seq', 1, false);


--
-- Name: station_route_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.station_route_id_seq', 1, false);


--
-- Name: station_station_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.station_station_id_seq', 1, false);


--
-- Name: station_ticket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.station_ticket_id_seq', 1, false);


--
-- Name: station_train_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.station_train_id_seq', 1, false);


--
-- Name: station_traintype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.station_traintype_id_seq', 1, false);


--
-- Name: user_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_user_groups_id_seq', 1, false);


--
-- Name: user_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_user_id_seq', 1, true);


--
-- Name: user_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_user_user_permissions_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: cinema_actor cinema_actor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cinema_actor
    ADD CONSTRAINT cinema_actor_pkey PRIMARY KEY (id);


--
-- Name: cinema_cinemahall cinema_cinemahall_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cinema_cinemahall
    ADD CONSTRAINT cinema_cinemahall_pkey PRIMARY KEY (id);


--
-- Name: cinema_genre cinema_genre_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cinema_genre
    ADD CONSTRAINT cinema_genre_name_key UNIQUE (name);


--
-- Name: cinema_genre cinema_genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cinema_genre
    ADD CONSTRAINT cinema_genre_pkey PRIMARY KEY (id);


--
-- Name: cinema_movie_actors cinema_movie_actors_movie_id_actor_id_dbce2e8a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cinema_movie_actors
    ADD CONSTRAINT cinema_movie_actors_movie_id_actor_id_dbce2e8a_uniq UNIQUE (movie_id, actor_id);


--
-- Name: cinema_movie_actors cinema_movie_actors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cinema_movie_actors
    ADD CONSTRAINT cinema_movie_actors_pkey PRIMARY KEY (id);


--
-- Name: cinema_movie_genres cinema_movie_genres_movie_id_genre_id_a9f555b6_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cinema_movie_genres
    ADD CONSTRAINT cinema_movie_genres_movie_id_genre_id_a9f555b6_uniq UNIQUE (movie_id, genre_id);


--
-- Name: cinema_movie_genres cinema_movie_genres_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cinema_movie_genres
    ADD CONSTRAINT cinema_movie_genres_pkey PRIMARY KEY (id);


--
-- Name: cinema_movie cinema_movie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cinema_movie
    ADD CONSTRAINT cinema_movie_pkey PRIMARY KEY (id);


--
-- Name: cinema_moviesession cinema_moviesession_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cinema_moviesession
    ADD CONSTRAINT cinema_moviesession_pkey PRIMARY KEY (id);


--
-- Name: cinema_order cinema_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cinema_order
    ADD CONSTRAINT cinema_order_pkey PRIMARY KEY (id);


--
-- Name: cinema_ticket cinema_ticket_movie_session_id_row_seat_04ba26fe_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cinema_ticket
    ADD CONSTRAINT cinema_ticket_movie_session_id_row_seat_04ba26fe_uniq UNIQUE (movie_session_id, "row", seat);


--
-- Name: cinema_ticket cinema_ticket_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cinema_ticket
    ADD CONSTRAINT cinema_ticket_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: station_carriage station_carriage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.station_carriage
    ADD CONSTRAINT station_carriage_pkey PRIMARY KEY (id);


--
-- Name: station_crew station_crew_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.station_crew
    ADD CONSTRAINT station_crew_pkey PRIMARY KEY (id);


--
-- Name: station_journey_crew station_journey_crew_journey_id_crew_id_85a16a3f_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.station_journey_crew
    ADD CONSTRAINT station_journey_crew_journey_id_crew_id_85a16a3f_uniq UNIQUE (journey_id, crew_id);


--
-- Name: station_journey_crew station_journey_crew_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.station_journey_crew
    ADD CONSTRAINT station_journey_crew_pkey PRIMARY KEY (id);


--
-- Name: station_journey station_journey_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.station_journey
    ADD CONSTRAINT station_journey_pkey PRIMARY KEY (id);


--
-- Name: station_order station_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.station_order
    ADD CONSTRAINT station_order_pkey PRIMARY KEY (id);


--
-- Name: station_route station_route_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.station_route
    ADD CONSTRAINT station_route_pkey PRIMARY KEY (id);


--
-- Name: station_station station_station_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.station_station
    ADD CONSTRAINT station_station_pkey PRIMARY KEY (id);


--
-- Name: station_ticket station_ticket_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.station_ticket
    ADD CONSTRAINT station_ticket_pkey PRIMARY KEY (id);


--
-- Name: station_train station_train_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.station_train
    ADD CONSTRAINT station_train_number_key UNIQUE (number);


--
-- Name: station_train station_train_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.station_train
    ADD CONSTRAINT station_train_pkey PRIMARY KEY (id);


--
-- Name: station_traintype station_traintype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.station_traintype
    ADD CONSTRAINT station_traintype_pkey PRIMARY KEY (id);


--
-- Name: station_carriage unique_carriage_number; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.station_carriage
    ADD CONSTRAINT unique_carriage_number UNIQUE (number, train_id);


--
-- Name: station_ticket unique_ticket; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.station_ticket
    ADD CONSTRAINT unique_ticket UNIQUE (carriage_id, seat, journey_id);


--
-- Name: user_user user_user_email_1c6f3d1a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_user
    ADD CONSTRAINT user_user_email_1c6f3d1a_uniq UNIQUE (email);


--
-- Name: user_user_groups user_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_user_groups
    ADD CONSTRAINT user_user_groups_pkey PRIMARY KEY (id);


--
-- Name: user_user_groups user_user_groups_user_id_group_id_bb60391f_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_user_groups
    ADD CONSTRAINT user_user_groups_user_id_group_id_bb60391f_uniq UNIQUE (user_id, group_id);


--
-- Name: user_user user_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_user
    ADD CONSTRAINT user_user_pkey PRIMARY KEY (id);


--
-- Name: user_user_user_permissions user_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_user_user_permissions
    ADD CONSTRAINT user_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: user_user_user_permissions user_user_user_permissions_user_id_permission_id_64f4d5b8_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_user_user_permissions
    ADD CONSTRAINT user_user_user_permissions_user_id_permission_id_64f4d5b8_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: cinema_genre_name_aef77e45_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cinema_genre_name_aef77e45_like ON public.cinema_genre USING btree (name varchar_pattern_ops);


--
-- Name: cinema_movie_actors_actor_id_642c67c5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cinema_movie_actors_actor_id_642c67c5 ON public.cinema_movie_actors USING btree (actor_id);


--
-- Name: cinema_movie_actors_movie_id_b967e574; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cinema_movie_actors_movie_id_b967e574 ON public.cinema_movie_actors USING btree (movie_id);


--
-- Name: cinema_movie_genres_genre_id_f599d5c9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cinema_movie_genres_genre_id_f599d5c9 ON public.cinema_movie_genres USING btree (genre_id);


--
-- Name: cinema_movie_genres_movie_id_d8653ddd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cinema_movie_genres_movie_id_d8653ddd ON public.cinema_movie_genres USING btree (movie_id);


--
-- Name: cinema_moviesession_cinema_hall_id_9b20e4f0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cinema_moviesession_cinema_hall_id_9b20e4f0 ON public.cinema_moviesession USING btree (cinema_hall_id);


--
-- Name: cinema_moviesession_movie_id_fbe18b1e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cinema_moviesession_movie_id_fbe18b1e ON public.cinema_moviesession USING btree (movie_id);


--
-- Name: cinema_order_user_id_05a6bf46; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cinema_order_user_id_05a6bf46 ON public.cinema_order USING btree (user_id);


--
-- Name: cinema_ticket_movie_session_id_dff49e20; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cinema_ticket_movie_session_id_dff49e20 ON public.cinema_ticket USING btree (movie_session_id);


--
-- Name: cinema_ticket_order_id_53f28fdd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cinema_ticket_order_id_53f28fdd ON public.cinema_ticket USING btree (order_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: station_carriage_train_id_f1113a2d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX station_carriage_train_id_f1113a2d ON public.station_carriage USING btree (train_id);


--
-- Name: station_journey_crew_crew_id_e4c231f7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX station_journey_crew_crew_id_e4c231f7 ON public.station_journey_crew USING btree (crew_id);


--
-- Name: station_journey_crew_journey_id_c152f020; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX station_journey_crew_journey_id_c152f020 ON public.station_journey_crew USING btree (journey_id);


--
-- Name: station_journey_route_id_df77b71b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX station_journey_route_id_df77b71b ON public.station_journey USING btree (route_id);


--
-- Name: station_journey_train_id_f92bba2f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX station_journey_train_id_f92bba2f ON public.station_journey USING btree (train_id);


--
-- Name: station_order_user_id_421e1351; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX station_order_user_id_421e1351 ON public.station_order USING btree (user_id);


--
-- Name: station_route_from_station_id_b4cbf7d1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX station_route_from_station_id_b4cbf7d1 ON public.station_route USING btree (from_station_id);


--
-- Name: station_route_to_station_id_81b28aeb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX station_route_to_station_id_81b28aeb ON public.station_route USING btree (to_station_id);


--
-- Name: station_ticket_carriage_id_0285cf81; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX station_ticket_carriage_id_0285cf81 ON public.station_ticket USING btree (carriage_id);


--
-- Name: station_ticket_journey_id_580ab315; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX station_ticket_journey_id_580ab315 ON public.station_ticket USING btree (journey_id);


--
-- Name: station_ticket_order_id_500e4f06; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX station_ticket_order_id_500e4f06 ON public.station_ticket USING btree (order_id);


--
-- Name: station_train_train_type_id_2d096788; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX station_train_train_type_id_2d096788 ON public.station_train USING btree (train_type_id);


--
-- Name: user_user_email_1c6f3d1a_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_user_email_1c6f3d1a_like ON public.user_user USING btree (email varchar_pattern_ops);


--
-- Name: user_user_groups_group_id_c57f13c0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_user_groups_group_id_c57f13c0 ON public.user_user_groups USING btree (group_id);


--
-- Name: user_user_groups_user_id_13f9a20d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_user_groups_user_id_13f9a20d ON public.user_user_groups USING btree (user_id);


--
-- Name: user_user_user_permissions_permission_id_ce49d4de; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_user_user_permissions_permission_id_ce49d4de ON public.user_user_user_permissions USING btree (permission_id);


--
-- Name: user_user_user_permissions_user_id_31782f58; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_user_user_permissions_user_id_31782f58 ON public.user_user_user_permissions USING btree (user_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cinema_movie_actors cinema_movie_actors_actor_id_642c67c5_fk_cinema_actor_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cinema_movie_actors
    ADD CONSTRAINT cinema_movie_actors_actor_id_642c67c5_fk_cinema_actor_id FOREIGN KEY (actor_id) REFERENCES public.cinema_actor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cinema_movie_actors cinema_movie_actors_movie_id_b967e574_fk_cinema_movie_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cinema_movie_actors
    ADD CONSTRAINT cinema_movie_actors_movie_id_b967e574_fk_cinema_movie_id FOREIGN KEY (movie_id) REFERENCES public.cinema_movie(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cinema_movie_genres cinema_movie_genres_genre_id_f599d5c9_fk_cinema_genre_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cinema_movie_genres
    ADD CONSTRAINT cinema_movie_genres_genre_id_f599d5c9_fk_cinema_genre_id FOREIGN KEY (genre_id) REFERENCES public.cinema_genre(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cinema_movie_genres cinema_movie_genres_movie_id_d8653ddd_fk_cinema_movie_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cinema_movie_genres
    ADD CONSTRAINT cinema_movie_genres_movie_id_d8653ddd_fk_cinema_movie_id FOREIGN KEY (movie_id) REFERENCES public.cinema_movie(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cinema_moviesession cinema_moviesession_cinema_hall_id_9b20e4f0_fk_cinema_ci; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cinema_moviesession
    ADD CONSTRAINT cinema_moviesession_cinema_hall_id_9b20e4f0_fk_cinema_ci FOREIGN KEY (cinema_hall_id) REFERENCES public.cinema_cinemahall(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cinema_moviesession cinema_moviesession_movie_id_fbe18b1e_fk_cinema_movie_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cinema_moviesession
    ADD CONSTRAINT cinema_moviesession_movie_id_fbe18b1e_fk_cinema_movie_id FOREIGN KEY (movie_id) REFERENCES public.cinema_movie(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cinema_order cinema_order_user_id_05a6bf46_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cinema_order
    ADD CONSTRAINT cinema_order_user_id_05a6bf46_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cinema_ticket cinema_ticket_movie_session_id_dff49e20_fk_cinema_mo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cinema_ticket
    ADD CONSTRAINT cinema_ticket_movie_session_id_dff49e20_fk_cinema_mo FOREIGN KEY (movie_session_id) REFERENCES public.cinema_moviesession(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cinema_ticket cinema_ticket_order_id_53f28fdd_fk_cinema_order_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cinema_ticket
    ADD CONSTRAINT cinema_ticket_order_id_53f28fdd_fk_cinema_order_id FOREIGN KEY (order_id) REFERENCES public.cinema_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: station_carriage station_carriage_train_id_f1113a2d_fk_station_train_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.station_carriage
    ADD CONSTRAINT station_carriage_train_id_f1113a2d_fk_station_train_id FOREIGN KEY (train_id) REFERENCES public.station_train(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: station_journey_crew station_journey_crew_crew_id_e4c231f7_fk_station_crew_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.station_journey_crew
    ADD CONSTRAINT station_journey_crew_crew_id_e4c231f7_fk_station_crew_id FOREIGN KEY (crew_id) REFERENCES public.station_crew(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: station_journey_crew station_journey_crew_journey_id_c152f020_fk_station_journey_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.station_journey_crew
    ADD CONSTRAINT station_journey_crew_journey_id_c152f020_fk_station_journey_id FOREIGN KEY (journey_id) REFERENCES public.station_journey(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: station_journey station_journey_route_id_df77b71b_fk_station_route_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.station_journey
    ADD CONSTRAINT station_journey_route_id_df77b71b_fk_station_route_id FOREIGN KEY (route_id) REFERENCES public.station_route(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: station_journey station_journey_train_id_f92bba2f_fk_station_train_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.station_journey
    ADD CONSTRAINT station_journey_train_id_f92bba2f_fk_station_train_id FOREIGN KEY (train_id) REFERENCES public.station_train(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: station_order station_order_user_id_421e1351_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.station_order
    ADD CONSTRAINT station_order_user_id_421e1351_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: station_route station_route_from_station_id_b4cbf7d1_fk_station_station_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.station_route
    ADD CONSTRAINT station_route_from_station_id_b4cbf7d1_fk_station_station_id FOREIGN KEY (from_station_id) REFERENCES public.station_station(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: station_route station_route_to_station_id_81b28aeb_fk_station_station_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.station_route
    ADD CONSTRAINT station_route_to_station_id_81b28aeb_fk_station_station_id FOREIGN KEY (to_station_id) REFERENCES public.station_station(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: station_ticket station_ticket_carriage_id_0285cf81_fk_station_carriage_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.station_ticket
    ADD CONSTRAINT station_ticket_carriage_id_0285cf81_fk_station_carriage_id FOREIGN KEY (carriage_id) REFERENCES public.station_carriage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: station_ticket station_ticket_journey_id_580ab315_fk_station_journey_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.station_ticket
    ADD CONSTRAINT station_ticket_journey_id_580ab315_fk_station_journey_id FOREIGN KEY (journey_id) REFERENCES public.station_journey(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: station_ticket station_ticket_order_id_500e4f06_fk_station_order_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.station_ticket
    ADD CONSTRAINT station_ticket_order_id_500e4f06_fk_station_order_id FOREIGN KEY (order_id) REFERENCES public.station_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: station_train station_train_train_type_id_2d096788_fk_station_traintype_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.station_train
    ADD CONSTRAINT station_train_train_type_id_2d096788_fk_station_traintype_id FOREIGN KEY (train_type_id) REFERENCES public.station_traintype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_user_groups user_user_groups_group_id_c57f13c0_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_user_groups
    ADD CONSTRAINT user_user_groups_group_id_c57f13c0_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_user_groups user_user_groups_user_id_13f9a20d_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_user_groups
    ADD CONSTRAINT user_user_groups_user_id_13f9a20d_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_user_user_permissions user_user_user_permi_permission_id_ce49d4de_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_user_user_permissions
    ADD CONSTRAINT user_user_user_permi_permission_id_ce49d4de_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_user_user_permissions user_user_user_permissions_user_id_31782f58_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_user_user_permissions
    ADD CONSTRAINT user_user_user_permissions_user_id_31782f58_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

