--
-- PostgreSQL database cluster dump
--

-- Started on 2026-01-12 12:05:29

\restrict JAeE5ikmadeRn6crlh7tu5cFJNoyJGl6lQsV7q3xxlQ4jzoQPJx73SKu1pUC519

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:EIrl41fl/GxErod08tHAdQ==$JeMfbHspIau8HmWbB2y+k4LDpJ6GqTtMGIb4MzFUorc=:el8EVuOACuRW+kkFDECUdOTI8mU61LlTVyxYOz4Mk/M=';

--
-- User Configurations
--








\unrestrict JAeE5ikmadeRn6crlh7tu5cFJNoyJGl6lQsV7q3xxlQ4jzoQPJx73SKu1pUC519

--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

\restrict toSSnXgIbgBa14BJ7LSmNRO42ITcGBco2qqaPm9ZCkgIoPx6y8C7Zh8hfYNm7IV

-- Dumped from database version 16.10
-- Dumped by pg_dump version 16.10

-- Started on 2026-01-12 12:05:29

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

-- Completed on 2026-01-12 12:05:29

--
-- PostgreSQL database dump complete
--

\unrestrict toSSnXgIbgBa14BJ7LSmNRO42ITcGBco2qqaPm9ZCkgIoPx6y8C7Zh8hfYNm7IV

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

\restrict Oce6J3UBHLltXYn7OQRtM0etdaQVlLzEsmE7ZuxJrLnVMrPJIxfJLYgoiVYDbFo

-- Dumped from database version 16.10
-- Dumped by pg_dump version 16.10

-- Started on 2026-01-12 12:05:30

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

--
-- TOC entry 2 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 5011 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 223 (class 1259 OID 24891)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    sno integer,
    category_name character varying(150) NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    image character varying(255)
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 24890)
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_id_seq OWNER TO postgres;

--
-- TOC entry 5012 (class 0 OID 0)
-- Dependencies: 222
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- TOC entry 219 (class 1259 OID 16426)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    sno integer NOT NULL,
    image character varying(255),
    product character varying(255) NOT NULL,
    category character varying(255) NOT NULL,
    action character varying(50)
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16425)
-- Name: categories_sno_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_sno_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_sno_seq OWNER TO postgres;

--
-- TOC entry 5013 (class 0 OID 0)
-- Dependencies: 218
-- Name: categories_sno_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_sno_seq OWNED BY public.products.sno;


--
-- TOC entry 221 (class 1259 OID 16435)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    sno integer NOT NULL,
    category_name character varying(255) NOT NULL,
    image character varying(255)
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16434)
-- Name: category_sno_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_sno_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.category_sno_seq OWNER TO postgres;

--
-- TOC entry 5014 (class 0 OID 0)
-- Dependencies: 220
-- Name: category_sno_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_sno_seq OWNED BY public.category.sno;


--
-- TOC entry 217 (class 1259 OID 16399)
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    phone character varying(20),
    start date,
    end_date date,
    type character varying(50),
    location character varying(255),
    status character varying(50)
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16398)
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customers_id_seq OWNER TO postgres;

--
-- TOC entry 5015 (class 0 OID 0)
-- Dependencies: 216
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- TOC entry 235 (class 1259 OID 24959)
-- Name: invoices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invoices (
    id integer NOT NULL,
    menu_id integer,
    subtotal numeric(12,2) DEFAULT 0,
    gst numeric(12,2) DEFAULT 0,
    grand_total numeric(12,2) DEFAULT 0,
    advance numeric(12,2) DEFAULT 0,
    balance numeric(12,2) DEFAULT 0,
    lead_counters numeric(12,2) DEFAULT 0,
    water_bottles numeric(12,2) DEFAULT 0,
    cooking_charges numeric(12,2) DEFAULT 0,
    labour_charges numeric(12,2) DEFAULT 0,
    transport_charges numeric(12,2) DEFAULT 0,
    created_at timestamp without time zone DEFAULT now(),
    price numeric(12,2) DEFAULT 0,
    total numeric(12,2) DEFAULT 0
);


ALTER TABLE public.invoices OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 24958)
-- Name: invoices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.invoices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.invoices_id_seq OWNER TO postgres;

--
-- TOC entry 5016 (class 0 OID 0)
-- Dependencies: 234
-- Name: invoices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.invoices_id_seq OWNED BY public.invoices.id;


--
-- TOC entry 231 (class 1259 OID 24933)
-- Name: menu_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu_categories (
    id integer NOT NULL,
    context_id integer,
    category_name character varying(150) NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.menu_categories OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 24932)
-- Name: menu_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menu_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.menu_categories_id_seq OWNER TO postgres;

--
-- TOC entry 5017 (class 0 OID 0)
-- Dependencies: 230
-- Name: menu_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menu_categories_id_seq OWNED BY public.menu_categories.id;


--
-- TOC entry 229 (class 1259 OID 24920)
-- Name: menu_contexts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu_contexts (
    id integer NOT NULL,
    menu_id integer,
    event_date date,
    meal character varying(50),
    members integer,
    buffet character varying(50),
    created_at timestamp without time zone DEFAULT now(),
    price numeric(10,2) DEFAULT 0,
    total numeric(10,2) DEFAULT 0
);


ALTER TABLE public.menu_contexts OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 24919)
-- Name: menu_contexts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menu_contexts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.menu_contexts_id_seq OWNER TO postgres;

--
-- TOC entry 5018 (class 0 OID 0)
-- Dependencies: 228
-- Name: menu_contexts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menu_contexts_id_seq OWNED BY public.menu_contexts.id;


--
-- TOC entry 233 (class 1259 OID 24946)
-- Name: menu_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu_items (
    id integer NOT NULL,
    category_id integer,
    item_name character varying(200) NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.menu_items OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 24945)
-- Name: menu_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menu_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.menu_items_id_seq OWNER TO postgres;

--
-- TOC entry 5019 (class 0 OID 0)
-- Dependencies: 232
-- Name: menu_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menu_items_id_seq OWNED BY public.menu_items.id;


--
-- TOC entry 227 (class 1259 OID 24912)
-- Name: menus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menus (
    id integer NOT NULL,
    customer_name character varying(200),
    contact character varying(30),
    place character varying(200),
    date date,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.menus OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 24911)
-- Name: menus_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menus_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.menus_id_seq OWNER TO postgres;

--
-- TOC entry 5020 (class 0 OID 0)
-- Dependencies: 226
-- Name: menus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menus_id_seq OWNED BY public.menus.id;


--
-- TOC entry 225 (class 1259 OID 24899)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    category_id integer,
    product character varying(200) NOT NULL,
    image character varying(255),
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 24898)
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_id_seq OWNER TO postgres;

--
-- TOC entry 5021 (class 0 OID 0)
-- Dependencies: 224
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;


--
-- TOC entry 4784 (class 2604 OID 24894)
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- TOC entry 4783 (class 2604 OID 16438)
-- Name: category sno; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN sno SET DEFAULT nextval('public.category_sno_seq'::regclass);


--
-- TOC entry 4781 (class 2604 OID 16402)
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- TOC entry 4798 (class 2604 OID 24962)
-- Name: invoices id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoices ALTER COLUMN id SET DEFAULT nextval('public.invoices_id_seq'::regclass);


--
-- TOC entry 4794 (class 2604 OID 24936)
-- Name: menu_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_categories ALTER COLUMN id SET DEFAULT nextval('public.menu_categories_id_seq'::regclass);


--
-- TOC entry 4790 (class 2604 OID 24923)
-- Name: menu_contexts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_contexts ALTER COLUMN id SET DEFAULT nextval('public.menu_contexts_id_seq'::regclass);


--
-- TOC entry 4796 (class 2604 OID 24949)
-- Name: menu_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items ALTER COLUMN id SET DEFAULT nextval('public.menu_items_id_seq'::regclass);


--
-- TOC entry 4788 (class 2604 OID 24915)
-- Name: menus id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menus ALTER COLUMN id SET DEFAULT nextval('public.menus_id_seq'::regclass);


--
-- TOC entry 4786 (class 2604 OID 24902)
-- Name: product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- TOC entry 4782 (class 2604 OID 16429)
-- Name: products sno; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN sno SET DEFAULT nextval('public.categories_sno_seq'::regclass);


--
-- TOC entry 4993 (class 0 OID 24891)
-- Dependencies: 223
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, sno, category_name, created_at, image) FROM stdin;
1	1	Prasadam	2026-01-06 13:57:53.984956	uploads/1760248956721-Prasadam.png
2	2	Breakfast	2026-01-06 13:57:53.984956	uploads/1760248989398-BreakFast.png
3	3	Welcome Drinks	2026-01-06 13:57:53.984956	uploads/1760249003183-welcome Drink.png
4	4	Welcome Snacks	2026-01-06 13:57:53.984956	uploads/1760249080215-Welcome Snack.png
5	5	Salads	2026-01-06 13:57:53.984956	uploads/1760249093721-Salad.png
6	6	Roti	2026-01-06 13:57:53.984956	uploads/1760249102648-Roti.png
7	7	Rice	2026-01-06 13:57:53.984956	uploads/1760249131560-Rice.png
8	8	North Curries	2026-01-06 13:57:53.984956	uploads/1760249140577-North Curries.png
9	9	South Curries	2026-01-06 13:57:53.984956	uploads/1760249155976-South Curries.png
10	10	Dal & Liquids	2026-01-06 13:57:53.984956	uploads/1760249170511-Dal & liquids.png
11	11	Pickles & Powders	2026-01-06 13:57:53.984956	uploads/1760249182392-Pickles & powders.png
12	12	Sweets	2026-01-06 13:57:53.984956	uploads/1760249203391-Sweet.png
13	13	Hot	2026-01-06 13:57:53.984956	uploads/1760249216007-Hot.png
14	14	Chinese Counter	2026-01-06 13:57:53.984956	uploads/1760249226479-Chinese Counter.png
15	15	Chat Counter	2026-01-06 13:57:53.984956	uploads/1760249240775-Chat Counter.png
16	16	Fruit Stall	2026-01-06 13:57:53.984956	uploads/1760249252455-Fruit Stall.png
17	17	Pan Counter	2026-01-06 13:57:53.984956	uploads/1760249275166-Paan Counter.png
18	18	Dessert	2026-01-06 13:57:53.984956	uploads/1760249287094-Dessert.png
19	19	Snacks	2026-01-06 13:57:53.984956	uploads/1760249299422-Snacks.png
20	20	Tiffins	2026-01-06 13:57:53.984956	uploads/1760249309886-Tiffins.png
21	21	Sarray	2026-01-06 13:57:53.984956	uploads/1760249340351-Sweet.png
22	22	Common Items	2026-01-06 13:57:53.984956	uploads/1760249357694-Common items.png
23	93	hello	2026-01-06 16:10:46.924996	\N
\.


--
-- TOC entry 4991 (class 0 OID 16435)
-- Dependencies: 221
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (sno, category_name, image) FROM stdin;
1	Prasadam	uploads\\1760248956721-Prasadam.png
2	Breakfast	uploads\\1760248989398-BreakFast.png
3	Welcome Drinks	uploads\\1760249003183-welcome Drink.png
4	Welcome Snacks	uploads\\1760249080215-Welcome  Snack.png
5	Salads	uploads\\1760249093721-Salad.png
6	Roti	uploads\\1760249102648-Roti.png
7	Rice	uploads\\1760249131560-Rice.png
8	North Curries	uploads\\1760249140577-North Curries.png
9	South Curries	uploads\\1760249155976-South Curries.png
10	Dal & Liquids	uploads\\1760249170511-Dal & liquids.png
11	Pickles & Powders	uploads\\1760249182392-Pickles & powders.png
12	Sweets	uploads\\1760249203391-Sweet.png
13	Hot	uploads\\1760249216007-Hot.png
14	Chinese Counter	uploads\\1760249226479-Chinese Counter.png
15	Chat Counter	uploads\\1760249240775-Chat Counter.png
16	Fruit Stall	uploads\\1760249252455-Fruit Stall.png
17	Pan Counter	uploads\\1760249275166-Paan Counter.png
18	Dessert	uploads\\1760249287094-Dessert.png
19	Snacks	uploads\\1760249299422-Snacks.png
20	Tiffins	uploads\\1760249309886-Tiffins.png
21	Sarray	uploads\\1760249340351-Sweet.png
22	Common Items	uploads\\1760249357694-Common items.png
\.


--
-- TOC entry 4987 (class 0 OID 16399)
-- Dependencies: 217
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (id, name, phone, start, end_date, type, location, status) FROM stdin;
4	Maria Rodriguez	333-555-1234	2025-03-10	2026-03-10	Commercial	Tokyo, Japan	Active
5	James Brown	222-777-8888	2025-04-25	2026-04-25	Residential	Toronto, Canada	Pending
7	Anusha	8989898989	2024-07-12	2024-07-12	Brithday 	vidya nagar	new
8	ashok kumar	888888888	2025-03-12	2025-05-13	Marriage	Kphp	new
10	Anusha	8499042581	2026-03-12	2026-03-15	Marriage	Nizamabad	new
2	Alice Johnsons	555-123-4567	2025-05-14	2026-05-14	Residential	London, UK	Active
9	Anusha	12345667890	2025-12-21	2025-12-22	Marriage	KPHP	new
3	Robert Williams	444-987-6543	2025-06-19	2026-06-19	Residential	Sydney, Australia	Active
\.


--
-- TOC entry 5005 (class 0 OID 24959)
-- Dependencies: 235
-- Data for Name: invoices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.invoices (id, menu_id, subtotal, gst, grand_total, advance, balance, lead_counters, water_bottles, cooking_charges, labour_charges, transport_charges, created_at, price, total) FROM stdin;
12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-11-01 14:33:19.16879	0.00	0.00
13	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-11-01 14:43:27.64469	0.00	0.00
20	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-11-11 15:27:35.1597	0.00	0.00
21	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-11-11 15:28:14.868642	0.00	0.00
56	106	15000.00	2700.00	17700.00	7000.00	10700.00	3.00	8.00	750.00	1200.00	400.00	2025-11-19 12:38:14.337288	0.00	0.00
57	108	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	2025-11-19 12:52:00.611939	0.00	0.00
59	130	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	2025-12-09 12:35:28.722975	0.00	0.00
60	132	743000.00	9000.00	752000.00	10000.00	742000.00	90000.00	8000.00	6000.00	4000.00	5000.00	2025-12-09 12:51:43.755626	0.00	0.00
61	134	57500.00	0.00	57500.00	0.00	57500.00	9000.00	0.00	0.00	0.00	0.00	2025-12-12 13:36:56.448283	0.00	0.00
62	135	690000.00	0.00	690000.00	0.00	690000.00	0.00	0.00	0.00	0.00	0.00	2025-12-24 15:51:38.696764	0.00	0.00
63	136	97398.00	0.00	97398.00	0.00	97398.00	89998.00	0.00	0.00	0.00	0.00	2025-12-25 14:31:52.299547	0.00	0.00
64	137	243000.00	800.00	243800.00	9002.00	234798.00	400.00	500.00	600.00	700.00	800.00	2025-12-25 14:40:12.549754	0.00	0.00
65	143	292002.00	0.00	292002.00	5000.00	287002.00	25000.00	20000.00	8000.00	5000.00	20002.00	2025-12-26 17:19:57.058927	0.00	0.00
66	144	5300.00	800.00	6100.00	200.00	5900.00	500.00	900.00	800.00	700.00	400.00	2025-12-29 12:19:36.633687	0.00	0.00
67	145	5500.00	0.00	5500.00	0.00	5500.00	0.00	0.00	0.00	0.00	500.00	2025-12-29 13:29:59.174568	0.00	0.00
68	146	4500.00	0.00	4500.00	0.00	4500.00	0.00	0.00	0.00	0.00	500.00	2025-12-29 14:36:25.656503	0.00	0.00
69	147	2000.00	0.00	2000.00	0.00	2000.00	0.00	0.00	0.00	1000.00	0.00	2025-12-30 11:56:43.410437	0.00	0.00
77	156	1000.00	0.00	1000.00	0.00	1000.00	0.00	0.00	0.00	1000.00	0.00	2025-12-30 17:01:36.595161	0.00	0.00
78	157	104400.00	5220.00	109620.00	0.00	109620.00	0.00	0.00	0.00	6000.00	4000.00	2026-01-05 16:03:20.403313	0.00	0.00
79	158	8100.00	0.00	8100.00	0.00	8100.00	0.00	0.00	0.00	0.00	0.00	2026-01-06 14:02:59.634962	0.00	0.00
80	163	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	2026-01-06 14:22:00.053792	0.00	0.00
81	167	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	2026-01-06 14:23:08.37256	0.00	0.00
82	178	2500.00	0.00	2500.00	0.00	2500.00	0.00	0.00	0.00	0.00	0.00	2026-01-11 16:49:07.058537	0.00	0.00
83	179	3000.00	0.00	3000.00	0.00	3000.00	0.00	0.00	0.00	0.00	0.00	2026-01-11 16:59:43.937425	0.00	0.00
84	182	13000.00	650.00	13650.00	5000.00	8650.00	0.00	0.00	0.00	0.00	0.00	2026-01-11 17:40:04.848782	0.00	0.00
85	183	38500.00	1925.00	40425.00	0.00	40425.00	0.00	1200.00	0.00	2000.00	2500.00	2026-01-11 17:48:03.060809	0.00	0.00
86	184	18000.00	0.00	18000.00	0.00	18000.00	0.00	0.00	0.00	0.00	0.00	2026-01-12 11:52:08.260466	0.00	0.00
\.


--
-- TOC entry 5001 (class 0 OID 24933)
-- Dependencies: 231
-- Data for Name: menu_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu_categories (id, context_id, category_name, created_at) FROM stdin;
1	1	Prasadam	2025-10-31 12:24:31.224354
21	90	Desserts	2025-11-19 12:38:14.337288
22	148	Breakfast	2026-01-11 16:49:03.992909
23	149	Breakfast	2026-01-11 16:59:42.735545
24	149	Welcome Drinks	2026-01-11 16:59:42.758933
25	150	Prasadam	2026-01-11 16:59:42.798032
26	150	Breakfast	2026-01-11 16:59:42.814418
27	150	Welcome Drinks	2026-01-11 16:59:42.836449
28	151	Roti	2026-01-11 17:39:29.655803
29	151	Rice	2026-01-11 17:39:29.667143
30	151	North Curries	2026-01-11 17:39:29.675217
31	151	South Curries	2026-01-11 17:39:29.683861
32	151	Dal & Liquids	2026-01-11 17:39:29.701813
33	151	Pickles & Powders	2026-01-11 17:39:29.712762
34	151	Sweets	2026-01-11 17:39:29.721249
35	151	Hot	2026-01-11 17:39:29.726605
36	151	Chinese Counter	2026-01-11 17:39:29.732598
37	151	Fruit Stall	2026-01-11 17:39:29.737577
38	151	Chat Counter	2026-01-11 17:39:29.742414
39	151	Common Items	2026-01-11 17:39:29.754178
40	152	Roti	2026-01-11 17:48:01.686017
41	152	Rice	2026-01-11 17:48:01.709292
42	152	South Curries	2026-01-11 17:48:01.715292
43	152	Dal & Liquids	2026-01-11 17:48:01.729575
44	152	Pickles & Powders	2026-01-11 17:48:01.74376
45	152	Sweets	2026-01-11 17:48:01.757221
46	152	Hot	2026-01-11 17:48:01.764477
47	152	Common Items	2026-01-11 17:48:01.772097
48	153	Prasadam	2026-01-12 11:52:05.92843
49	153	Breakfast	2026-01-12 11:52:05.989407
50	153	Welcome Drinks	2026-01-12 11:52:06.076765
51	153	Welcome Snacks	2026-01-12 11:52:06.132819
52	154	Prasadam	2026-01-12 11:52:06.184856
53	154	Breakfast	2026-01-12 11:52:06.210962
54	154	Welcome Drinks	2026-01-12 11:52:06.255969
55	154	Welcome Snacks	2026-01-12 11:52:06.300834
56	155	Prasadam	2026-01-12 11:52:06.37882
57	155	Breakfast	2026-01-12 11:52:06.402402
58	155	Welcome Drinks	2026-01-12 11:52:06.452597
59	155	Welcome Snacks	2026-01-12 11:52:06.487313
60	155	Salads	2026-01-12 11:52:06.51144
61	155	Roti	2026-01-12 11:52:06.54826
\.


--
-- TOC entry 4999 (class 0 OID 24920)
-- Dependencies: 229
-- Data for Name: menu_contexts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu_contexts (id, menu_id, event_date, meal, members, buffet, created_at, price, total) FROM stdin;
1	\N	\N	\N	\N	\N	2025-10-26 14:51:48.053356	0.00	0.00
90	106	2026-03-15	Lunch	150	true	2025-11-19 12:38:14.337288	0.00	0.00
91	108	2025-11-20	Lunch	80	Buffet	2025-11-19 12:51:59.491541	0.00	0.00
95	110	2025-11-22	Lunch	80	Buffet	2025-11-22 12:35:31.679907	0.00	0.00
96	110	2025-11-22	Lunch	60	Buffet	2025-11-22 12:35:31.750436	0.00	0.00
97	110	2025-11-22	Lunch	80		2025-11-22 12:35:31.778587	0.00	0.00
98	111	2025-11-22	Lunch	80	Buffet	2025-11-22 12:35:42.523871	0.00	0.00
99	111	2025-11-22	Lunch	60	Buffet	2025-11-22 12:35:42.558711	0.00	0.00
100	111	2025-11-22	Lunch	80		2025-11-22 12:35:42.592106	0.00	0.00
101	112	2025-11-22	Lunch	80	Buffet	2025-11-22 12:36:01.350092	0.00	0.00
102	112	2025-11-22	Lunch	60	Buffet	2025-11-22 12:36:01.387892	0.00	0.00
103	112	2025-11-22	Lunch	80		2025-11-22 12:36:01.428258	0.00	0.00
23	\N	\N	\N	\N	\N	2025-10-29 15:29:08.55479	0.00	0.00
107	132	2025-12-10	Breakfast	70	Buffet	2025-12-09 12:51:41.869732	0.00	0.00
108	134	2025-12-13	Lunch	70	Buffet	2025-12-12 13:36:54.538137	0.00	0.00
109	134	2025-12-13	Lunch	50	Buffet	2025-12-12 13:36:54.624847	0.00	0.00
110	135	2025-12-25	Breakfast	400	Buffet	2025-12-24 15:51:35.098162	0.00	0.00
111	135	2025-12-26	Breakfast	500	Buffet	2025-12-24 15:51:35.175152	0.00	0.00
112	136	2025-12-26	Lunch	50	Buffet	2025-12-25 14:31:50.962236	0.00	0.00
113	136	2025-12-27	Lunch	50	Buffet	2025-12-25 14:31:51.004638	0.00	0.00
114	137	2025-12-26	Lunch	400	Buffet	2025-12-25 14:40:11.0952	0.00	0.00
115	142	2025-12-26	Lunch	400	Buffet	2025-12-25 16:46:42.121879	0.00	0.00
116	143	2025-12-27	Breakfast	50	Buffet	2025-12-26 17:19:53.559831	0.00	0.00
117	143	2025-12-27	Lunch	200	Buffet	2025-12-26 17:19:53.598776	0.00	0.00
118	143	2025-12-27	Dinner	250	Buffet	2025-12-26 17:19:53.686776	0.00	0.00
119	144	2025-12-30	Breakfast	40	Buffet	2025-12-29 12:19:35.136113	0.00	0.00
120	145	2025-12-30	Lunch	50	Buffet	2025-12-29 13:29:54.380575	0.00	0.00
122	\N	\N	\N	\N	\N	2025-12-29 14:31:09.073484	\N	\N
123	146	2025-12-30	Lunch	50	Buffet	2025-12-29 14:36:24.169982	\N	\N
124	147	2025-12-31	Snacks	20	Buffet	2025-12-30 11:56:41.772053	\N	\N
132	156	2026-01-01	Snacks	40	Buffet	2025-12-30 17:01:34.137294	\N	\N
133	157	2026-01-08	Breakfast	80		2026-01-05 16:03:18.313711	\N	\N
134	157	2026-01-08	Lunch	100		2026-01-05 16:03:18.420842	\N	\N
135	158	2026-01-07	Lunch	80		2026-01-06 14:02:57.611961	\N	\N
136	158	2026-01-15	Lunch	50		2026-01-06 14:02:57.737131	\N	\N
137	159	2026-01-07	Lunch	80		2026-01-06 14:20:43.659752	\N	\N
138	163	2026-01-07	Lunch	80		2026-01-06 14:21:55.376488	\N	\N
139	163	2026-01-15	Lunch	50		2026-01-06 14:21:55.41842	\N	\N
140	164	2026-01-07	Lunch	80		2026-01-06 14:22:38.839418	\N	\N
141	167	2026-01-07	Lunch	80		2026-01-06 14:23:05.134847	\N	\N
142	167	2026-01-15	Lunch	50		2026-01-06 14:23:05.169519	\N	\N
143	169	2026-01-09	Breakfast	20	Buffet	2026-01-10 12:54:47.039838	\N	\N
144	172	2026-01-09	Breakfast	20	Buffet	2026-01-10 12:56:04.29307	\N	\N
145	174	2026-01-09	Breakfast	20	Buffet	2026-01-10 15:35:46.635547	\N	\N
146	175	2026-01-09	Breakfast	20	Buffet	2026-01-10 15:57:38.905817	\N	\N
147	177	2026-01-12	Breakfast	23	Buffet	2026-01-11 14:48:13.110849	\N	\N
148	178	2026-01-14	Lunch	50	SITTING	2026-01-11 16:49:03.94711	\N	\N
149	179	2026-01-14	Lunch	50	SITTING	2026-01-11 16:59:42.660783	\N	\N
150	179	2026-01-12	Lunch	50	Buffet	2026-01-11 16:59:42.792951	\N	\N
151	182	2026-01-17	Lunch	25	Buffet	2026-01-11 17:39:29.564748	\N	\N
152	183	2026-01-19	Lunch	80	Buffet	2026-01-11 17:48:01.624255	\N	\N
153	184	2026-01-13	Breakfast	20	Buffet	2026-01-12 11:52:05.860957	\N	\N
154	184	2026-01-13	Lunch	20	Buffet	2026-01-12 11:52:06.177497	\N	\N
155	184	2026-01-13	Dinner	20	Buffet	2026-01-12 11:52:06.372275	\N	\N
\.


--
-- TOC entry 5003 (class 0 OID 24946)
-- Dependencies: 233
-- Data for Name: menu_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu_items (id, category_id, item_name, created_at) FROM stdin;
1	\N	Idly	2025-10-29 11:27:04.173832
2	\N	Chakkara Pongal	2025-10-29 11:27:10.605334
3	\N	Kesar Halwa	2025-10-29 11:27:10.611422
4	\N	Paramannam	2025-10-29 11:27:10.618724
5	\N	Chakkara Pongal	2025-10-29 11:27:10.633947
6	\N	Kesar Halwa	2025-10-29 11:27:10.642469
7	\N	Paramannam	2025-10-29 11:27:10.651303
8	\N	Payasam	2025-10-29 11:27:10.65836
9	\N	Pulihora	2025-10-29 11:27:10.665461
10	\N	Bread Butter Jam	2025-10-29 11:27:10.672274
11	\N	Bread Toast	2025-10-29 11:27:10.678401
12	\N	Hot Pongal	2025-10-29 11:27:10.684667
13	\N	Idly	2025-10-29 11:27:10.690621
14	\N	Mysore Bajji	2025-10-29 11:27:10.695985
15	\N	Doas Stall	2025-10-29 11:27:10.701828
16	\N	Pesarattu	2025-10-29 11:27:10.707649
17	\N	Puri With Alu Curry	2025-10-29 11:27:10.714433
18	\N	Sandwich	2025-10-29 11:27:10.720019
19	\N	Veg. Upma	2025-10-29 11:27:10.725865
20	\N	Wada	2025-10-29 11:27:10.731847
21	\N	Steam Idly	2025-10-29 11:27:10.737712
22	\N	Idly	2025-10-29 11:27:18.564248
23	\N	Mango Juice	2025-10-29 12:13:55.495185
24	\N	Mocktail Counter	2025-10-29 12:13:55.501348
25	\N	Litchi Coconut	2025-10-29 12:13:55.504191
26	\N	Pineapple Juice	2025-10-29 12:13:55.507528
27	\N	American Dollar	2025-10-29 12:13:55.513094
28	\N	Badam Chekki	2025-10-29 12:13:55.516151
29	\N	Mixture	2025-10-29 12:13:55.518618
30	\N	Onion Pakodi	2025-10-29 12:13:55.520816
31	\N	Onion Rings	2025-10-29 12:13:55.523053
32	\N	Tomato Rings	2025-10-29 12:13:55.526508
33	\N	Vankaya Pakodi	2025-10-29 12:13:55.528997
34	\N	Masala Wada	2025-10-29 12:13:55.531166
35	\N	Mirchi Bajji	2025-10-29 12:13:55.533268
36	\N	Minapa Wada	2025-10-29 12:13:55.536255
37	\N	Capsicum Rings	2025-10-29 12:13:55.53892
38	\N	Cabbage Pakodi	2025-10-29 12:13:55.541571
39	\N	Dahi Wada	2025-10-29 12:13:55.544001
40	\N	Alu Bajji	2025-10-29 12:13:55.546112
41	\N	Alu Bonda	2025-10-29 12:13:55.547988
42	\N	Aratikaya Bajji	2025-10-29 12:13:55.549977
43	\N	Mango Juice	2025-10-29 12:14:04.713016
45	\N	Litchi Coconut	2025-10-29 12:14:04.718839
46	\N	Pineapple Juice	2025-10-29 12:14:04.72161
47	\N	American Dollar	2025-10-29 12:14:04.726571
48	\N	Badam Chekki	2025-10-29 12:14:04.728969
49	\N	Mixture	2025-10-29 12:14:04.73167
50	\N	Onion Pakodi	2025-10-29 12:14:04.733975
51	\N	Onion Rings	2025-10-29 12:14:04.736236
52	\N	Tomato Rings	2025-10-29 12:14:04.73839
53	\N	Vankaya Pakodi	2025-10-29 12:14:04.740667
54	\N	Masala Wada	2025-10-29 12:14:04.742877
55	\N	Mirchi Bajji	2025-10-29 12:14:04.745648
56	\N	Minapa Wada	2025-10-29 12:14:04.74794
57	\N	Capsicum Rings	2025-10-29 12:14:04.749847
58	\N	Cabbage Pakodi	2025-10-29 12:14:04.751683
59	\N	Dahi Wada	2025-10-29 12:14:04.753717
60	\N	Alu Bajji	2025-10-29 12:14:04.75583
61	\N	Alu Bonda	2025-10-29 12:14:04.757809
62	\N	Aratikaya Bajji	2025-10-29 12:14:04.759698
63	\N	Mango Juice	2025-10-29 15:15:01.603931
64	\N	Mocktail Counter	2025-10-29 15:15:01.609585
65	\N	Litchi Coconut	2025-10-29 15:15:01.612467
66	\N	Pineapple Juice	2025-10-29 15:15:01.615931
67	\N	American Dollar	2025-10-29 15:15:01.622847
68	\N	Badam Chekki	2025-10-29 15:15:01.626089
69	\N	Mixture	2025-10-29 15:15:01.62928
70	\N	Onion Pakodi	2025-10-29 15:15:01.632008
71	\N	Onion Rings	2025-10-29 15:15:01.634403
72	\N	Tomato Rings	2025-10-29 15:15:01.636792
73	\N	Vankaya Pakodi	2025-10-29 15:15:01.639179
74	\N	Masala Wada	2025-10-29 15:15:01.641306
75	\N	Mirchi Bajji	2025-10-29 15:15:01.643775
76	\N	Minapa Wada	2025-10-29 15:15:01.645854
77	\N	Capsicum Rings	2025-10-29 15:15:01.647845
78	\N	Cabbage Pakodi	2025-10-29 15:15:01.650013
79	\N	Dahi Wada	2025-10-29 15:15:01.652056
80	\N	Alu Bajji	2025-10-29 15:15:01.653968
81	\N	Alu Bonda	2025-10-29 15:15:01.656187
82	\N	Aratikaya Bajji	2025-10-29 15:15:01.658279
83	\N	Mango Juice	2025-10-29 15:15:09.761238
84	\N	Mocktail Counter	2025-10-29 15:15:09.763853
85	\N	Litchi Coconut	2025-10-29 15:15:09.76632
86	\N	Pineapple Juice	2025-10-29 15:15:09.769057
87	\N	American Dollar	2025-10-29 15:15:09.774227
88	\N	Badam Chekki	2025-10-29 15:15:09.776775
89	\N	Mixture	2025-10-29 15:15:09.779202
90	\N	Onion Pakodi	2025-10-29 15:15:09.781502
91	\N	Onion Rings	2025-10-29 15:15:09.783803
92	\N	Tomato Rings	2025-10-29 15:15:09.786049
93	\N	Vankaya Pakodi	2025-10-29 15:15:09.788431
94	\N	Masala Wada	2025-10-29 15:15:09.790581
95	\N	Mirchi Bajji	2025-10-29 15:15:09.792798
96	\N	Minapa Wada	2025-10-29 15:15:09.795064
97	\N	Capsicum Rings	2025-10-29 15:15:09.797233
98	\N	Cabbage Pakodi	2025-10-29 15:15:09.799572
99	\N	Dahi Wada	2025-10-29 15:15:09.801973
100	\N	Alu Bajji	2025-10-29 15:15:09.80404
101	\N	Alu Bonda	2025-10-29 15:15:09.806108
102	\N	Aratikaya Bajji	2025-10-29 15:15:09.808247
103	\N	Mango Juice	2025-10-29 15:17:24.889999
104	\N	Mocktail Counter	2025-10-29 15:17:24.894154
105	\N	Litchi Coconut	2025-10-29 15:17:24.897191
106	\N	Pineapple Juice	2025-10-29 15:17:24.900632
107	\N	American Dollar	2025-10-29 15:17:24.907971
108	\N	Badam Chekki	2025-10-29 15:17:24.911787
109	\N	Mixture	2025-10-29 15:17:24.915344
110	\N	Onion Pakodi	2025-10-29 15:17:24.920617
111	\N	Onion Rings	2025-10-29 15:17:24.92362
112	\N	Tomato Rings	2025-10-29 15:17:24.92594
113	\N	Vankaya Pakodi	2025-10-29 15:17:24.928275
114	\N	Masala Wada	2025-10-29 15:17:24.930702
115	\N	Mirchi Bajji	2025-10-29 15:17:24.933231
116	\N	Minapa Wada	2025-10-29 15:17:24.936017
117	\N	Capsicum Rings	2025-10-29 15:17:24.938747
118	\N	Cabbage Pakodi	2025-10-29 15:17:24.941516
119	\N	Dahi Wada	2025-10-29 15:17:24.94443
120	\N	Alu Bajji	2025-10-29 15:17:24.94698
121	\N	Alu Bonda	2025-10-29 15:17:24.949413
122	\N	Aratikaya Bajji	2025-10-29 15:17:24.951972
123	\N	Mango Juice	2025-10-29 15:37:08.787554
124	\N	Mocktail Counter	2025-10-29 15:37:08.793013
125	\N	Litchi Coconut	2025-10-29 15:37:08.795873
126	\N	Pineapple Juice	2025-10-29 15:37:08.798227
127	\N	American Dollar	2025-10-29 15:37:08.804695
128	\N	Badam Chekki	2025-10-29 15:37:08.806955
129	\N	Mixture	2025-10-29 15:37:08.809425
130	\N	Onion Pakodi	2025-10-29 15:37:08.811795
131	\N	Onion Rings	2025-10-29 15:37:08.814496
132	\N	Tomato Rings	2025-10-29 15:37:08.816649
133	\N	Vankaya Pakodi	2025-10-29 15:37:08.818811
134	\N	Masala Wada	2025-10-29 15:37:08.820978
135	\N	Mirchi Bajji	2025-10-29 15:37:08.82301
136	\N	Minapa Wada	2025-10-29 15:37:08.825063
137	\N	Capsicum Rings	2025-10-29 15:37:08.827047
138	\N	Cabbage Pakodi	2025-10-29 15:37:08.829032
139	\N	Dahi Wada	2025-10-29 15:37:08.831074
140	\N	Alu Bajji	2025-10-29 15:37:08.833259
141	\N	Alu Bonda	2025-10-29 15:37:08.835251
142	\N	Aratikaya Bajji	2025-10-29 15:37:08.837298
143	\N	Dry Fruit Milk Shake	2025-10-29 17:20:09.680544
144	\N	Litchi Coconut	2025-10-29 17:20:09.685096
145	\N	Mango Juice	2025-10-29 17:20:09.687836
146	\N	Golden Tikki	2025-10-29 17:20:09.70092
147	\N	Cheese Balls	2025-10-29 17:20:09.703411
148	\N	Veg. Manchuria	2025-10-29 17:20:09.70601
149	\N	Veg. Bullet	2025-10-29 17:20:09.709096
150	\N	Alu Chenna Chat	2025-10-29 17:20:09.711946
151	\N	Pasta Salad	2025-10-29 17:20:09.71473
152	\N	Baby Naan	2025-10-29 17:20:09.717216
153	\N	Palak Roomali Roti	2025-10-29 17:20:09.719799
154	\N	Tandoori Roti	2025-10-29 17:20:09.722393
155	\N	Bagara Rice	2025-10-29 17:20:09.724749
156	\N	Hundi Biryani	2025-10-29 17:20:09.727211
157	\N	Jackfruit Biryani	2025-10-29 17:20:09.729747
158	\N	Dal Makhani	2025-10-29 17:20:09.732329
159	\N	Khurchan Paneer	2025-10-29 17:20:09.735476
160	\N	Palak Alu	2025-10-29 17:20:09.738001
161	\N	Alu Gobi Mutter	2025-10-29 17:20:09.740526
162	\N	Alu Fry	2025-10-29 17:20:09.742939
163	\N	Gutti Vankaya (White)	2025-10-29 17:20:09.745507
164	\N	Vankaya Karam	2025-10-29 17:20:09.747943
165	\N	Palakura Pappu	2025-10-29 17:20:09.750405
166	\N	Mudda Pappu	2025-10-29 17:20:09.753092
167	\N	Tomato Pappu	2025-10-29 17:20:09.755919
168	\N	Korivi Karam	2025-10-29 17:20:09.758166
169	\N	Tomato Pachadi	2025-10-29 17:20:09.760386
170	\N	Mango Pickle	2025-10-29 17:20:09.76239
171	\N	Carrot Halwa	2025-10-29 17:20:09.764771
172	\N	Dil Jamun	2025-10-29 17:20:09.767034
173	\N	Double Ka Meeta	2025-10-29 17:20:09.769445
174	\N	Baked Rasagulla	2025-10-29 17:20:09.772017
175	\N	Dahi Wada	2025-10-29 17:20:09.774612
176	\N	Cabbage Pakodi	2025-10-29 17:20:09.776838
177	\N	Onion Rings	2025-10-29 17:20:09.779115
178	\N	Mirchi Bajji	2025-10-29 17:20:09.78156
179	\N	Cheese Chilly Toast	2025-10-29 17:20:09.784703
180	\N	Italian Pasta With White	2025-10-29 17:20:09.788135
181	\N	Panneer Tikka	2025-10-29 17:20:09.791019
182	\N	Pani Puri (2 Types)	2025-10-29 17:20:09.793512
183	\N	Spl. Pav Bhaji	2025-10-29 17:20:09.795812
184	\N	Zeera Alu Chat	2025-10-29 17:20:09.798026
185	\N	Dahi Papidi	2025-10-29 17:20:09.800476
186	\N	Foreign Fruits	2025-10-29 17:20:09.802774
187	\N	Sweet Pan	2025-10-29 17:20:09.805626
188	\N	Chocolate Pan	2025-10-29 17:20:09.808496
189	\N	Vanilla	2025-10-29 17:20:09.810954
190	\N	Fruit Salad	2025-10-29 17:20:09.813496
191	\N	White Rice	2025-10-29 17:20:09.816203
192	\N	Challa Mirchi	2025-10-29 17:20:09.818793
193	\N	Vadiyallu	2025-10-29 17:20:09.821336
194	\N	Kandi Podi	2025-10-29 17:20:09.823632
195	\N	Ghee	2025-10-29 17:20:09.826246
196	\N	Curd	2025-10-29 17:20:09.828634
197	\N	Papad	2025-10-29 17:20:09.831107
198	\N	Paan	2025-10-29 17:20:09.833851
199	\N	Dry Fruit Milk Shake	2025-10-29 17:20:31.676782
200	\N	Litchi Coconut	2025-10-29 17:20:31.679836
201	\N	Mango Juice	2025-10-29 17:20:31.682173
202	\N	Golden Tikki	2025-10-29 17:20:31.6844
203	\N	Cheese Balls	2025-10-29 17:20:31.686645
204	\N	Veg. Manchuria	2025-10-29 17:20:31.688721
205	\N	Veg. Bullet	2025-10-29 17:20:31.690713
206	\N	Alu Chenna Chat	2025-10-29 17:20:31.692929
207	\N	Pasta Salad	2025-10-29 17:20:31.695344
208	\N	Baby Naan	2025-10-29 17:20:31.698525
209	\N	Palak Roomali Roti	2025-10-29 17:20:31.700927
210	\N	Tandoori Roti	2025-10-29 17:20:31.703238
211	\N	Bagara Rice	2025-10-29 17:20:31.705309
212	\N	Hundi Biryani	2025-10-29 17:20:31.707756
213	\N	Jackfruit Biryani	2025-10-29 17:20:31.709866
214	\N	Dal Makhani	2025-10-29 17:20:31.712374
215	\N	Khurchan Paneer	2025-10-29 17:20:31.714688
216	\N	Palak Alu	2025-10-29 17:20:31.716853
217	\N	Alu Gobi Mutter	2025-10-29 17:20:31.718849
218	\N	Alu Fry	2025-10-29 17:20:31.721391
219	\N	Gutti Vankaya (White)	2025-10-29 17:20:31.723875
220	\N	Vankaya Karam	2025-10-29 17:20:31.726502
221	\N	Palakura Pappu	2025-10-29 17:20:31.728934
222	\N	Mudda Pappu	2025-10-29 17:20:31.731421
223	\N	Tomato Pappu	2025-10-29 17:20:31.73394
224	\N	Korivi Karam	2025-10-29 17:20:31.737058
225	\N	Tomato Pachadi	2025-10-29 17:20:31.740078
226	\N	Mango Pickle	2025-10-29 17:20:31.742669
227	\N	Carrot Halwa	2025-10-29 17:20:31.744935
228	\N	Dil Jamun	2025-10-29 17:20:31.747017
229	\N	Double Ka Meeta	2025-10-29 17:20:31.748856
230	\N	Baked Rasagulla	2025-10-29 17:20:31.751049
231	\N	Dahi Wada	2025-10-29 17:20:31.753749
232	\N	Cabbage Pakodi	2025-10-29 17:20:31.755937
233	\N	Onion Rings	2025-10-29 17:20:31.758018
234	\N	Mirchi Bajji	2025-10-29 17:20:31.760498
235	\N	Cheese Chilly Toast	2025-10-29 17:20:31.762779
236	\N	Italian Pasta With White	2025-10-29 17:20:31.764996
237	\N	Panneer Tikka	2025-10-29 17:20:31.76703
238	\N	Pani Puri (2 Types)	2025-10-29 17:20:31.769214
239	\N	Spl. Pav Bhaji	2025-10-29 17:20:31.771517
240	\N	Zeera Alu Chat	2025-10-29 17:20:31.773586
241	\N	Dahi Papidi	2025-10-29 17:20:31.775541
242	\N	Foreign Fruits	2025-10-29 17:20:31.777579
243	\N	Sweet Pan	2025-10-29 17:20:31.779581
244	\N	Chocolate Pan	2025-10-29 17:20:31.781609
245	\N	Vanilla	2025-10-29 17:20:31.783567
246	\N	Fruit Salad	2025-10-29 17:20:31.785625
247	\N	White Rice	2025-10-29 17:20:31.787516
248	\N	Challa Mirchi	2025-10-29 17:20:31.789482
249	\N	Vadiyallu	2025-10-29 17:20:31.791468
250	\N	Kandi Podi	2025-10-29 17:20:31.793505
251	\N	Ghee	2025-10-29 17:20:31.795417
252	\N	Curd	2025-10-29 17:20:31.797506
253	\N	Papad	2025-10-29 17:20:31.799508
254	\N	Paan	2025-10-29 17:20:31.801474
255	\N	Dry Fruit Milk Shake	2025-10-29 17:21:01.575564
256	\N	Litchi Coconut	2025-10-29 17:21:01.579095
257	\N	Mango Juice	2025-10-29 17:21:01.581515
258	\N	Golden Tikki	2025-10-29 17:21:01.584446
259	\N	Cheese Balls	2025-10-29 17:21:01.586811
260	\N	Veg. Manchuria	2025-10-29 17:21:01.588997
261	\N	Veg. Bullet	2025-10-29 17:21:01.591112
262	\N	Alu Chenna Chat	2025-10-29 17:21:01.593396
263	\N	Pasta Salad	2025-10-29 17:21:01.595593
264	\N	Baby Naan	2025-10-29 17:21:01.597676
265	\N	Palak Roomali Roti	2025-10-29 17:21:01.599822
266	\N	Tandoori Roti	2025-10-29 17:21:01.601981
267	\N	Bagara Rice	2025-10-29 17:21:01.604335
268	\N	Hundi Biryani	2025-10-29 17:21:01.606451
269	\N	Jackfruit Biryani	2025-10-29 17:21:01.608369
270	\N	Dal Makhani	2025-10-29 17:21:01.610347
271	\N	Khurchan Paneer	2025-10-29 17:21:01.612456
272	\N	Palak Alu	2025-10-29 17:21:01.614551
273	\N	Alu Gobi Mutter	2025-10-29 17:21:01.616987
274	\N	Alu Fry	2025-10-29 17:21:01.619917
275	\N	Gutti Vankaya (White)	2025-10-29 17:21:01.62262
276	\N	Vankaya Karam	2025-10-29 17:21:01.624899
277	\N	Palakura Pappu	2025-10-29 17:21:01.626949
278	\N	Mudda Pappu	2025-10-29 17:21:01.628976
279	\N	Tomato Pappu	2025-10-29 17:21:01.630889
280	\N	Korivi Karam	2025-10-29 17:21:01.633009
281	\N	Tomato Pachadi	2025-10-29 17:21:01.635067
282	\N	Mango Pickle	2025-10-29 17:21:01.637184
283	\N	Carrot Halwa	2025-10-29 17:21:01.640185
284	\N	Dil Jamun	2025-10-29 17:21:01.642462
285	\N	Double Ka Meeta	2025-10-29 17:21:01.64455
286	\N	Baked Rasagulla	2025-10-29 17:21:01.646542
287	\N	Dahi Wada	2025-10-29 17:21:01.648488
288	\N	Cabbage Pakodi	2025-10-29 17:21:01.650966
289	\N	Onion Rings	2025-10-29 17:21:01.653129
290	\N	Mirchi Bajji	2025-10-29 17:21:01.655136
291	\N	Cheese Chilly Toast	2025-10-29 17:21:01.657109
292	\N	Italian Pasta With White	2025-10-29 17:21:01.659125
293	\N	Panneer Tikka	2025-10-29 17:21:01.661055
294	\N	Pani Puri (2 Types)	2025-10-29 17:21:01.664052
295	\N	Spl. Pav Bhaji	2025-10-29 17:21:01.666402
296	\N	Zeera Alu Chat	2025-10-29 17:21:01.668419
297	\N	Dahi Papidi	2025-10-29 17:21:01.6705
298	\N	Foreign Fruits	2025-10-29 17:21:01.672663
299	\N	Sweet Pan	2025-10-29 17:21:01.674737
300	\N	Chocolate Pan	2025-10-29 17:21:01.676799
301	\N	Vanilla	2025-10-29 17:21:01.679078
302	\N	Fruit Salad	2025-10-29 17:21:01.681162
303	\N	White Rice	2025-10-29 17:21:01.683618
304	\N	Challa Mirchi	2025-10-29 17:21:01.685784
305	\N	Vadiyallu	2025-10-29 17:21:01.687898
306	\N	Kandi Podi	2025-10-29 17:21:01.690096
307	\N	Ghee	2025-10-29 17:21:01.692122
308	\N	Curd	2025-10-29 17:21:01.694249
309	\N	Papad	2025-10-29 17:21:01.696471
310	\N	Paan	2025-10-29 17:21:01.698484
311	\N	Idly	2025-10-29 17:45:32.799484
312	\N	Hot Pongal	2025-10-29 17:45:32.805493
313	\N	Pesarattu	2025-10-29 17:45:32.808118
314	\N	Veg. Upma	2025-10-29 17:45:32.812095
315	\N	Cobbarl Chutney	2025-10-29 17:45:32.8147
316	\N	Allam Chutney	2025-10-29 17:45:32.816872
317	\N	Idly Karam Podi	2025-10-29 17:45:32.819066
318	\N	Sambar 	2025-10-29 17:45:32.821151
319	\N	White Chutney	2025-10-29 17:45:32.823601
320	\N	Tea	2025-10-29 17:45:32.825973
321	\N	Coffee	2025-10-29 17:45:32.828355
322	\N	Payasam	2025-10-29 17:45:32.830855
323	\N	Veg Lolly Pop	2025-10-29 17:45:32.835522
324	\N	Babycorn Papad Hotgarlic Stick	2025-10-29 17:45:32.838033
325	\N	Sprout Fruit Ball	2025-10-29 17:45:32.84028
326	\N	Pulka	2025-10-29 17:45:32.842345
327	\N	Roomali Roti	2025-10-29 17:45:32.844509
328	\N	Poori	2025-10-29 17:45:32.846928
329	\N	Veg. Palov	2025-10-29 17:45:32.849229
330	\N	Veg. Fried Rice	2025-10-29 17:45:32.851263
331	\N	Pulihora	2025-10-29 17:45:32.853215
332	\N	Chole Masala	2025-10-29 17:45:32.855366
333	\N	Bendi Fry	2025-10-29 17:45:32.857672
334	\N	Mushroom Mutter	2025-10-29 17:45:32.86
335	\N	Veg. Kofta	2025-10-29 17:45:32.862097
336	\N	Cabbage Beans Coconut Poriyal	2025-10-29 17:45:32.86438
337	\N	Dondakaya Karam	2025-10-29 17:45:32.866592
338	\N	Alu Tomato Curry	2025-10-29 17:45:32.869154
339	\N	Tomato Pappu	2025-10-29 17:45:32.871471
340	\N	Ulva Charu With Cream	2025-10-29 17:45:32.873906
341	\N	Sambar	2025-10-29 17:45:32.876361
342	\N	Rasam	2025-10-29 17:45:32.87868
343	\N	Raitha	2025-10-29 17:45:32.881214
344	\N	Tomato Roti Pachadi	2025-10-29 17:45:32.883966
345	\N	Gongura Pickle	2025-10-29 17:45:32.886182
346	\N	Dosakaya Pachadi	2025-10-29 17:45:32.888564
347	\N	Mango Pickle	2025-10-29 17:45:32.890851
348	\N	Qubani Ka Meeta	2025-10-29 17:45:32.893457
349	\N	Malai Chenna Toast	2025-10-29 17:45:32.895977
350	\N	Kala Jamun	2025-10-29 17:45:32.898307
351	\N	Kaju Pista Roll	2025-10-29 17:45:32.900741
352	\N	Mixture	2025-10-29 17:45:32.903056
353	\N	Masala Wada	2025-10-29 17:45:32.905569
354	\N	Corn. Veg. Fried Rice	2025-10-29 17:45:32.907879
355	\N	French Fries	2025-10-29 17:45:32.910299
356	\N	Dice Star Manchuria	2025-10-29 17:45:32.912999
357	\N	Veg. Shangai Roll	2025-10-29 17:45:32.915501
358	\N	Spl. Pav Bhaji	2025-10-29 17:45:32.918157
359	\N	Ravva Pani Puri	2025-10-29 17:45:32.920822
360	\N	Corn Bhel Puri	2025-10-29 17:45:32.923493
361	\N	Dokla	2025-10-29 17:45:32.925876
362	\N	Indian Fruits	2025-10-29 17:45:32.927963
363	\N	Fire Pan	2025-10-29 17:45:32.930149
364	\N	Sada Pan	2025-10-29 17:45:32.932374
365	\N	Honey Moon Delight	2025-10-29 17:45:32.934739
366	\N	Ice Gola	2025-10-29 17:45:32.937165
367	\N	White Rice	2025-10-29 17:45:32.93987
368	\N	Challa Mirchi	2025-10-29 17:45:32.942104
369	\N	Frimes	2025-10-29 17:45:32.944161
370	\N	Kandi Podi	2025-10-29 17:45:32.946155
371	\N	Ghee	2025-10-29 17:45:32.9481
372	\N	Curd	2025-10-29 17:45:32.950067
373	\N	Paan	2025-10-29 17:45:32.952134
374	\N	Samosa	2025-10-29 17:45:32.958147
375	\N	Pop Corn	2025-10-29 17:45:32.960356
376	\N	Punugulu	2025-10-29 17:45:32.962464
377	\N	Palak Pakodi	2025-10-29 17:45:32.964633
378	\N	Veg Bonda	2025-10-29 17:45:32.966694
379	\N	Cobbarl Chutney	2025-10-29 17:45:32.968831
380	\N	Tea	2025-10-29 17:45:32.970954
381	\N	Coffee	2025-10-29 17:45:32.973895
382	\N	Karam Podi	2025-10-29 17:45:32.977273
383	\N	Fruit Punch	2025-10-29 17:45:32.987601
384	\N	Dragon Roll	2025-10-29 17:45:32.990763
385	\N	Chapathi	2025-10-29 17:45:32.99341
386	\N	Pulka	2025-10-29 17:45:32.995937
387	\N	Veg. Fried Rice	2025-10-29 17:45:32.998486
388	\N	Amritsari Chole	2025-10-29 17:45:33.001267
389	\N	Dal Makhani	2025-10-29 17:45:33.003541
390	\N	Alu Tomato Curry	2025-10-29 17:45:33.005779
391	\N	Rasam	2025-10-29 17:45:33.008074
392	\N	Raitha	2025-10-29 17:45:33.010266
393	\N	Badam Chekki	2025-10-29 17:45:33.0126
394	\N	Carrot Halwa	2025-10-29 17:45:33.014978
395	\N	Onion Pakodi	2025-10-29 17:45:33.017498
396	\N	Ice Cream (Vanilla)	2025-10-29 17:45:33.020461
397	\N	Chakkara Pongal	2025-10-31 16:11:03.861481
398	\N	Kesar Halwa	2025-10-31 16:11:03.867889
399	\N	Paramannam	2025-10-31 16:11:03.871262
400	\N	Payasam	2025-10-31 16:11:03.875003
401	\N	Pulihora	2025-10-31 16:11:03.878013
402	\N	Bread Butter Jam	2025-10-31 16:11:03.881219
403	\N	Bread Toast	2025-10-31 16:11:03.884824
404	\N	Kesar Halwa	2025-10-31 16:12:18.533854
405	\N	Paramannam	2025-10-31 16:12:18.549774
406	\N	Payasam	2025-10-31 16:12:18.553431
407	\N	Pulihora	2025-10-31 16:12:18.556595
408	\N	Bread Butter Jam	2025-10-31 16:12:18.559672
409	\N	Bread Toast	2025-10-31 16:12:18.569065
410	\N	Kesar Halwa	2025-10-31 16:35:46.210183
411	\N	Paramannam	2025-10-31 16:35:46.218607
412	\N	Payasam	2025-10-31 16:35:46.222563
413	\N	Pulihora	2025-10-31 16:35:46.225633
414	\N	Bread Butter Jam	2025-10-31 16:35:46.230145
415	\N	Bread Toast	2025-10-31 16:35:46.23346
416	\N	Kesar Halwa	2025-10-31 16:41:17.144174
417	\N	Paramannam	2025-10-31 16:41:17.15108
418	\N	Payasam	2025-10-31 16:41:17.158683
419	\N	Pulihora	2025-10-31 16:41:17.166379
420	\N	Bread Butter Jam	2025-10-31 16:41:17.169677
421	\N	Bread Toast	2025-10-31 16:41:17.172611
422	\N	Kesar Halwa	2025-11-01 10:35:51.77953
423	\N	Paramannam	2025-11-01 10:35:51.790223
424	\N	Payasam	2025-11-01 10:35:51.793509
425	\N	Pulihora	2025-11-01 10:35:51.797698
426	\N	Kesar Halwa	2025-11-01 10:38:29.413131
427	\N	Paramannam	2025-11-01 10:38:29.418893
428	\N	Payasam	2025-11-01 10:38:29.424636
429	\N	Pulihora	2025-11-01 10:38:29.429255
430	\N	Kesar Halwa	2025-11-01 10:40:16.603387
431	\N	Paramannam	2025-11-01 10:40:16.606753
432	\N	Payasam	2025-11-01 10:40:16.60888
433	\N	Pulihora	2025-11-01 10:40:16.610994
434	\N	Kesar Halwa	2025-11-01 12:09:16.605564
435	\N	Kesar Halwa	2025-11-01 12:23:10.248572
436	\N	Kesar Halwa	2025-11-01 12:24:23.736382
437	\N	Kesar Halwa	2025-11-01 12:28:40.135124
438	\N	Kesar Halwa	2025-11-01 12:28:47.351411
439	\N	Kesar Halwa	2025-11-01 12:28:53.75346
440	\N	Kesar Halwa	2025-11-01 12:31:50.394199
441	\N	Kesar Halwa	2025-11-01 12:34:11.006912
442	\N	Pulihora	2025-11-01 12:34:11.01313
443	\N	Payasam	2025-11-01 12:34:11.01646
444	\N	Chakkara Pongal	2025-11-01 12:34:11.019667
445	\N	Paramannam	2025-11-01 12:34:11.02301
446	\N	Kesar Halwa	2025-11-01 12:34:17.888585
447	\N	Pulihora	2025-11-01 12:34:17.890946
448	\N	Payasam	2025-11-01 12:34:17.893288
449	\N	Chakkara Pongal	2025-11-01 12:34:17.895703
450	\N	Paramannam	2025-11-01 12:34:17.898145
451	\N	Kesar Halwa	2025-11-01 12:34:53.251896
452	\N	Pulihora	2025-11-01 12:34:53.254945
453	\N	Payasam	2025-11-01 12:34:53.257145
454	\N	Chakkara Pongal	2025-11-01 12:34:53.25952
455	\N	Paramannam	2025-11-01 12:34:53.261638
456	\N	Idly	2025-11-01 14:47:21.158606
457	\N	Fruit Punch	2025-11-01 15:17:25.834535
458	\N	Veg. Manchuria	2025-11-01 15:17:25.84444
459	\N	Cheese Balls	2025-11-01 15:17:25.850278
460	\N	Green Salad	2025-11-01 15:17:25.855687
461	\N	Chapathi	2025-11-01 15:17:25.862449
462	\N	Karvepaku Rice	2025-11-01 15:17:25.868369
463	\N	Veg. Dhum Ka Biryani	2025-11-01 15:17:25.875742
464	\N	Coconut Rice	2025-11-01 15:17:25.882336
465	\N	Alu Fry	2025-11-01 15:17:25.888665
466	\N	Gutti Vankaya	2025-11-01 15:17:25.895028
467	\N	Bendi Fry	2025-11-01 15:17:25.901141
468	\N	Palakura Pappu	2025-11-01 15:17:25.907186
469	\N	Sambar	2025-11-01 15:17:25.912905
470	\N	Rasam	2025-11-01 15:17:25.918353
471	\N	Dosaavakaya	2025-11-01 15:17:25.923017
472	\N	Tomato Pachadi	2025-11-01 15:17:25.928112
473	\N	Burelu	2025-11-01 15:17:25.933486
474	\N	Mirchi Bajji	2025-11-01 15:17:25.938667
475	\N	Fruit Stall	2025-11-01 15:17:25.943318
476	\N	Chocolate Fountain	2025-11-01 15:17:25.948758
477	\N	Butter Scotch	2025-11-01 15:17:25.953791
478	\N	Curd	2025-11-01 15:17:25.958923
479	\N	Vadiyallu	2025-11-01 15:17:25.964324
480	\N	White Rice	2025-11-01 15:17:25.969787
481	\N	Paan	2025-11-01 15:17:25.97583
482	\N	Karam Podi	2025-11-01 15:17:25.981647
483	\N	Challa Mirchi	2025-11-01 15:17:25.986691
484	\N	Fruit Punch	2025-11-01 15:17:53.738536
485	\N	Veg. Manchuria	2025-11-01 15:17:53.746988
486	\N	Cheese Balls	2025-11-01 15:17:53.753334
487	\N	Green Salad	2025-11-01 15:17:53.759301
488	\N	Chapathi	2025-11-01 15:17:53.765498
489	\N	Karvepaku Rice	2025-11-01 15:17:53.771802
490	\N	Veg. Dhum Ka Biryani	2025-11-01 15:17:53.778254
491	\N	Coconut Rice	2025-11-01 15:17:53.784459
492	\N	Alu Fry	2025-11-01 15:17:53.790756
493	\N	Gutti Vankaya	2025-11-01 15:17:53.797038
494	\N	Bendi Fry	2025-11-01 15:17:53.802828
495	\N	Palakura Pappu	2025-11-01 15:17:53.809219
496	\N	Sambar	2025-11-01 15:17:53.815378
497	\N	Rasam	2025-11-01 15:17:53.821385
498	\N	Dosaavakaya	2025-11-01 15:17:53.828402
499	\N	Tomato Pachadi	2025-11-01 15:17:53.834578
500	\N	Burelu	2025-11-01 15:17:53.840694
501	\N	Mirchi Bajji	2025-11-01 15:17:53.8469
502	\N	Fruit Stall	2025-11-01 15:17:53.853114
503	\N	Chocolate Fountain	2025-11-01 15:17:53.859633
504	\N	Butter Scotch	2025-11-01 15:17:53.865959
505	\N	Curd	2025-11-01 15:17:53.872094
506	\N	Vadiyallu	2025-11-01 15:17:53.878747
507	\N	White Rice	2025-11-01 15:17:53.884755
508	\N	Paan	2025-11-01 15:17:53.891229
509	\N	Karam Podi	2025-11-01 15:17:53.897204
510	\N	Challa Mirchi	2025-11-01 15:17:53.903282
511	\N	Allam Pachadi	2025-11-11 13:00:31.352411
512	\N	Cobbari Pachadi	2025-11-11 13:00:31.36426
513	\N	Dosaavakaya	2025-11-11 13:00:31.370715
514	\N	Gutti Vankaya	2025-11-11 13:00:31.376565
515	\N	Gutti Vankaya (White)	2025-11-11 13:00:31.382699
516	\N	Kanda Bachali	2025-11-11 13:00:31.388973
517	\N	Kosambari	2025-11-11 13:00:31.395984
518	\N	Mulakada Tomatoo	2025-11-11 13:00:31.402163
519	\N	Mulakkada Tomato Curry	2025-11-11 13:00:31.408341
520	\N	Panasapottu Kura	2025-11-11 13:00:31.414308
521	\N	Vankaya Allam Pachhi Mirchi	2025-11-11 13:00:31.420307
522	\N	Vankaya Karam	2025-11-11 13:00:31.426783
523	\N	Veg Koottu	2025-11-11 13:00:31.432652
524	\N	Zeera Alu	2025-11-11 13:00:31.438716
525	\N	Allam Pachadi	2025-11-11 13:04:19.595034
526	\N	Cobbari Pachadi	2025-11-11 13:04:19.607214
527	\N	Dosaavakaya	2025-11-11 13:04:19.613519
528	\N	Gutti Vankaya	2025-11-11 13:04:19.619495
529	\N	Gutti Vankaya (White)	2025-11-11 13:04:19.626534
530	\N	Kanda Bachali	2025-11-11 13:04:19.632828
531	\N	Kosambari	2025-11-11 13:04:19.639917
532	\N	Mulakada Tomatoo	2025-11-11 13:04:19.646247
533	\N	Mulakkada Tomato Curry	2025-11-11 13:04:19.65266
534	\N	Panasapottu Kura	2025-11-11 13:04:19.659039
535	\N	Vankaya Allam Pachhi Mirchi	2025-11-11 13:04:19.665333
536	\N	Vankaya Karam	2025-11-11 13:04:19.671863
537	\N	Veg Koottu	2025-11-11 13:04:19.678357
538	\N	Zeera Alu	2025-11-11 13:04:19.684471
539	\N	Allam Pachadi	2025-11-11 15:26:23.439391
540	\N	Cobbari Pachadi	2025-11-11 15:26:23.444017
541	\N	Dosaavakaya	2025-11-11 15:26:23.446926
542	\N	Gutti Vankaya	2025-11-11 15:26:23.449594
543	\N	Gutti Vankaya (White)	2025-11-11 15:26:23.452876
544	\N	Kanda Bachali	2025-11-11 15:26:23.455434
545	\N	Kosambari	2025-11-11 15:26:23.458533
546	\N	Mulakada Tomatoo	2025-11-11 15:26:23.461293
547	\N	Mulakkada Tomato Curry	2025-11-11 15:26:23.463671
548	\N	Panasapottu Kura	2025-11-11 15:26:23.466144
549	\N	Vankaya Allam Pachhi Mirchi	2025-11-11 15:26:23.468433
550	\N	Vankaya Karam	2025-11-11 15:26:23.470634
551	\N	Veg Koottu	2025-11-11 15:26:23.472752
552	\N	Zeera Alu	2025-11-11 15:26:23.475197
553	\N	Allam Pachadi	2025-11-11 15:26:47.057649
554	\N	Cobbari Pachadi	2025-11-11 15:26:47.061505
555	\N	Dosaavakaya	2025-11-11 15:26:47.0643
556	\N	Gutti Vankaya	2025-11-11 15:26:47.066958
557	\N	Gutti Vankaya (White)	2025-11-11 15:26:47.06969
558	\N	Kanda Bachali	2025-11-11 15:26:47.072243
559	\N	Kosambari	2025-11-11 15:26:47.074818
560	\N	Mulakada Tomatoo	2025-11-11 15:26:47.077532
561	\N	Mulakkada Tomato Curry	2025-11-11 15:26:47.079883
562	\N	Panasapottu Kura	2025-11-11 15:26:47.082024
563	\N	Vankaya Allam Pachhi Mirchi	2025-11-11 15:26:47.084596
564	\N	Vankaya Karam	2025-11-11 15:26:47.086483
565	\N	Veg Koottu	2025-11-11 15:26:47.088324
566	\N	Zeera Alu	2025-11-11 15:26:47.090268
567	\N	Allam Pachadi	2025-11-11 15:41:53.250641
568	\N	Cobbari Pachadi	2025-11-11 15:41:53.255684
569	\N	Dosaavakaya	2025-11-11 15:41:53.258226
570	\N	Gutti Vankaya	2025-11-11 15:41:53.260575
571	\N	Gutti Vankaya (White)	2025-11-11 15:41:53.26335
572	\N	Kanda Bachali	2025-11-11 15:41:53.26596
573	\N	Kosambari	2025-11-11 15:41:53.268403
574	\N	Mulakada Tomatoo	2025-11-11 15:41:53.270584
575	\N	Mulakkada Tomato Curry	2025-11-11 15:41:53.273509
576	\N	Panasapottu Kura	2025-11-11 15:41:53.275893
577	\N	Vankaya Allam Pachhi Mirchi	2025-11-11 15:41:53.278198
578	\N	Vankaya Karam	2025-11-11 15:41:53.281222
579	\N	Veg Koottu	2025-11-11 15:41:53.283475
580	\N	Zeera Alu	2025-11-11 15:41:53.285687
581	\N	Allam Pachadi	2025-11-11 15:43:11.737162
582	\N	Cobbari Pachadi	2025-11-11 15:43:11.740594
583	\N	Dosaavakaya	2025-11-11 15:43:11.743085
584	\N	Gutti Vankaya	2025-11-11 15:43:11.745363
585	\N	Gutti Vankaya (White)	2025-11-11 15:43:11.747796
586	\N	Kanda Bachali	2025-11-11 15:43:11.749904
587	\N	Kosambari	2025-11-11 15:43:11.752031
588	\N	Mulakada Tomatoo	2025-11-11 15:43:11.754322
589	\N	Mulakkada Tomato Curry	2025-11-11 15:43:11.756631
590	\N	Panasapottu Kura	2025-11-11 15:43:11.758826
591	\N	Vankaya Allam Pachhi Mirchi	2025-11-11 15:43:11.761148
592	\N	Vankaya Karam	2025-11-11 15:43:11.763226
593	\N	Veg Koottu	2025-11-11 15:43:11.766039
594	\N	Zeera Alu	2025-11-11 15:43:11.768409
595	\N	Allam Pachadi	2025-11-11 15:44:32.908737
596	\N	Cobbari Pachadi	2025-11-11 15:44:32.915277
597	\N	Dosaavakaya	2025-11-11 15:44:32.918296
598	\N	Gutti Vankaya	2025-11-11 15:44:32.921409
599	\N	Gutti Vankaya (White)	2025-11-11 15:44:32.924344
600	\N	Kanda Bachali	2025-11-11 15:44:32.927069
601	\N	Kosambari	2025-11-11 15:44:32.930005
602	\N	Mulakada Tomatoo	2025-11-11 15:44:32.932887
603	\N	Mulakkada Tomato Curry	2025-11-11 15:44:32.935883
604	\N	Panasapottu Kura	2025-11-11 15:44:32.938592
605	\N	Vankaya Allam Pachhi Mirchi	2025-11-11 15:44:32.941789
606	\N	Vankaya Karam	2025-11-11 15:44:32.944674
607	\N	Veg Koottu	2025-11-11 15:44:32.947708
608	\N	Zeera Alu	2025-11-11 15:44:32.950545
609	\N	Allam Pachadi	2025-11-11 16:43:23.128848
610	\N	Cobbari Pachadi	2025-11-11 16:43:23.13751
611	\N	Dosaavakaya	2025-11-11 16:43:23.143183
612	\N	Gutti Vankaya	2025-11-11 16:43:23.148276
613	\N	Gutti Vankaya (White)	2025-11-11 16:43:23.153194
614	\N	Kanda Bachali	2025-11-11 16:43:23.159909
615	\N	Kosambari	2025-11-11 16:43:23.164653
616	\N	Mulakada Tomatoo	2025-11-11 16:43:23.173732
617	\N	Mulakkada Tomato Curry	2025-11-11 16:43:23.181088
618	\N	Panasapottu Kura	2025-11-11 16:43:23.188361
619	\N	Vankaya Allam Pachhi Mirchi	2025-11-11 16:43:23.195771
620	\N	Vankaya Karam	2025-11-11 16:43:23.202685
621	\N	Veg Koottu	2025-11-11 16:43:23.209008
622	\N	Zeera Alu	2025-11-11 16:43:23.215279
623	\N	Allam Pachadi	2025-11-11 16:55:33.475256
624	\N	Cobbari Pachadi	2025-11-11 16:55:33.485659
625	\N	Dosaavakaya	2025-11-11 16:55:33.492401
626	\N	Gutti Vankaya	2025-11-11 16:55:33.499683
627	\N	Gutti Vankaya (White)	2025-11-11 16:55:33.506308
628	\N	Kanda Bachali	2025-11-11 16:55:33.512954
629	\N	Kosambari	2025-11-11 16:55:33.519769
630	\N	Mulakada Tomatoo	2025-11-11 16:55:33.526837
631	\N	Mulakkada Tomato Curry	2025-11-11 16:55:33.540461
632	\N	Panasapottu Kura	2025-11-11 16:55:33.547077
633	\N	Vankaya Allam Pachhi Mirchi	2025-11-11 16:55:33.553843
634	\N	Vankaya Karam	2025-11-11 16:55:33.56083
635	\N	Veg Koottu	2025-11-11 16:55:33.567258
636	\N	Zeera Alu	2025-11-11 16:55:33.573842
637	\N	Chakkara Pongal	2025-11-13 14:42:19.673342
638	\N	Kesar Halwa	2025-11-13 14:42:19.679444
639	\N	Bread Butter Jam	2025-11-13 14:42:19.682263
640	\N	Bread Toast	2025-11-13 14:42:19.684867
641	\N	Chakkara Pongal	2025-11-13 14:42:19.689766
642	\N	Kesar Halwa	2025-11-13 14:42:19.693309
643	\N	Hot Pongal	2025-11-13 14:42:19.69575
644	\N	Idly	2025-11-13 14:42:19.698089
645	\N	Chakkara Pongal	2025-11-13 16:44:08.706677
646	\N	Kesar Halwa	2025-11-13 16:44:08.710682
647	\N	Bread Butter Jam	2025-11-13 16:44:08.716315
648	\N	Bread Toast	2025-11-13 16:44:08.719319
649	\N	Chakkara Pongal	2025-11-13 16:44:08.725339
650	\N	Kesar Halwa	2025-11-13 16:44:08.728211
651	\N	Hot Pongal	2025-11-13 16:44:08.73066
652	\N	Idly	2025-11-13 16:44:08.73312
653	\N	Chakkara Pongal	2025-11-13 16:48:59.851018
654	\N	Kesar Halwa	2025-11-13 16:48:59.855965
655	\N	Bread Butter Jam	2025-11-13 16:48:59.859182
656	\N	Bread Toast	2025-11-13 16:48:59.862492
657	\N	Chakkara Pongal	2025-11-13 16:48:59.867944
658	\N	Kesar Halwa	2025-11-13 16:48:59.870916
659	\N	Hot Pongal	2025-11-13 16:48:59.873399
660	\N	Idly	2025-11-13 16:48:59.875747
661	\N	Chakkara Pongal	2025-11-13 16:49:17.535837
662	\N	Kesar Halwa	2025-11-13 16:49:17.53907
663	\N	Bread Butter Jam	2025-11-13 16:49:17.541399
664	\N	Bread Toast	2025-11-13 16:49:17.5441
665	\N	Chakkara Pongal	2025-11-13 16:49:17.548492
666	\N	Kesar Halwa	2025-11-13 16:49:17.550493
667	\N	Hot Pongal	2025-11-13 16:49:17.552659
668	\N	Idly	2025-11-13 16:49:17.554733
669	\N	Chakkara Pongal	2025-11-13 16:51:05.839453
670	\N	Kesar Halwa	2025-11-13 16:51:05.843363
671	\N	Bread Butter Jam	2025-11-13 16:51:05.845659
672	\N	Bread Toast	2025-11-13 16:51:05.847654
673	\N	Chakkara Pongal	2025-11-13 16:51:05.852089
674	\N	Kesar Halwa	2025-11-13 16:51:05.854327
675	\N	Hot Pongal	2025-11-13 16:51:05.856548
676	\N	Idly	2025-11-13 16:51:05.858807
677	\N	Chakkara Pongal	2025-11-13 16:51:30.186488
678	\N	Kesar Halwa	2025-11-13 16:51:30.190282
679	\N	Bread Butter Jam	2025-11-13 16:51:30.193273
680	\N	Bread Toast	2025-11-13 16:51:30.19575
681	\N	Chakkara Pongal	2025-11-13 16:51:30.202537
682	\N	Kesar Halwa	2025-11-13 16:51:30.205356
683	\N	Hot Pongal	2025-11-13 16:51:30.208307
684	\N	Idly	2025-11-13 16:51:30.211137
685	\N	Chakkara Pongal	2025-11-13 16:58:17.703745
686	\N	Kesar Halwa	2025-11-13 16:58:17.708465
687	\N	Bread Butter Jam	2025-11-13 16:58:17.711303
688	\N	Bread Toast	2025-11-13 16:58:17.714186
689	\N	Chakkara Pongal	2025-11-13 16:58:17.722867
690	\N	Kesar Halwa	2025-11-13 16:58:17.727543
691	\N	Hot Pongal	2025-11-13 16:58:17.731241
692	\N	Idly	2025-11-13 16:58:17.735025
693	\N	Chakkara Pongal	2025-11-14 10:44:18.232848
694	\N	Kesar Halwa	2025-11-14 10:44:18.237563
695	\N	Bread Butter Jam	2025-11-14 10:44:18.240629
696	\N	Bread Toast	2025-11-14 10:44:18.243667
697	\N	Chakkara Pongal	2025-11-14 10:44:18.250259
698	\N	Kesar Halwa	2025-11-14 10:44:18.253113
699	\N	Hot Pongal	2025-11-14 10:44:18.255808
700	\N	Idly	2025-11-14 10:44:18.257938
701	\N	Chakkara Pongal	2025-11-14 10:46:10.295827
702	\N	Kesar Halwa	2025-11-14 10:46:10.299619
703	\N	Bread Butter Jam	2025-11-14 10:46:10.302447
704	\N	Bread Toast	2025-11-14 10:46:10.305291
705	\N	Chakkara Pongal	2025-11-14 10:46:10.311001
706	\N	Kesar Halwa	2025-11-14 10:46:10.313643
707	\N	Hot Pongal	2025-11-14 10:46:10.31657
708	\N	Idly	2025-11-14 10:46:10.319149
709	\N	Chakkara Pongal	2025-11-14 10:47:50.248153
710	\N	Kesar Halwa	2025-11-14 10:47:50.251375
711	\N	Bread Butter Jam	2025-11-14 10:47:50.253402
712	\N	Bread Toast	2025-11-14 10:47:50.255982
713	\N	Chakkara Pongal	2025-11-14 10:52:43.819794
714	\N	Kesar Halwa	2025-11-14 10:52:43.823625
715	\N	Bread Butter Jam	2025-11-14 10:52:43.826146
716	\N	Bread Toast	2025-11-14 10:52:43.83121
717	\N	Chakkara Pongal	2025-11-14 10:53:23.339338
718	\N	Kesar Halwa	2025-11-14 10:53:23.344674
719	\N	Bread Butter Jam	2025-11-14 10:53:23.349263
720	\N	Bread Toast	2025-11-14 10:53:23.352525
721	\N	Chakkara Pongal	2025-11-14 11:34:12.403867
722	\N	Kesar Halwa	2025-11-14 11:34:12.412335
723	\N	Bread Butter Jam	2025-11-14 11:34:12.418365
724	\N	Bread Toast	2025-11-14 11:34:12.428139
725	\N	Chakkara Pongal	2025-11-14 11:43:08.269328
726	\N	Kesar Halwa	2025-11-14 11:43:08.279071
727	\N	Bread Butter Jam	2025-11-14 11:43:08.284795
728	\N	Bread Toast	2025-11-14 11:43:08.289968
729	\N	Puri With Alu Curry	2025-11-14 12:36:56.406406
730	\N	Sandwich	2025-11-14 12:36:56.411878
731	\N	Veg. Upma	2025-11-14 12:36:56.415762
732	\N	Chakkara Pongal	2025-11-14 15:51:02.568915
733	\N	Kesar Halwa	2025-11-14 15:51:02.574425
734	\N	Pesarattu	2025-11-14 15:51:02.576985
735	\N	Puri With Alu Curry	2025-11-14 15:51:02.57956
736	\N	Black Current Milk Shake	2025-11-14 15:51:02.582231
737	\N	Dry Fruit Milk Shake	2025-11-14 15:51:02.585044
738	\N	Fruit Punch	2025-11-14 15:51:02.587275
739	\N	Guava Delight	2025-11-14 15:51:02.590277
740	\N	Hot Badam Milk	2025-11-14 15:51:02.59343
741	\N	Kharbuja Juice	2025-11-14 15:51:02.596564
742	\N	Chakkara Pongal	2025-11-15 16:41:43.110433
743	\N	Kesar Halwa	2025-11-15 16:41:43.115012
744	\N	Pesarattu	2025-11-15 16:41:43.117889
745	\N	Puri With Alu Curry	2025-11-15 16:41:43.120204
746	\N	Black Current Milk Shake	2025-11-15 16:41:43.1224
747	\N	Dry Fruit Milk Shake	2025-11-15 16:41:43.125039
748	\N	Fruit Punch	2025-11-15 16:41:43.127451
749	\N	Guava Delight	2025-11-15 16:41:43.129968
750	\N	Hot Badam Milk	2025-11-15 16:41:43.132302
751	\N	Kharbuja Juice	2025-11-15 16:41:43.134514
752	\N	Chakkara Pongal	2025-11-17 11:40:52.666633
753	\N	Kesar Halwa	2025-11-17 11:40:52.676959
754	\N	Paramannam	2025-11-17 11:40:52.683183
755	\N	Payasam	2025-11-17 11:40:52.689636
756	\N	Pulihora	2025-11-17 11:40:52.695441
757	\N	Bread Butter Jam	2025-11-17 11:40:52.705013
758	\N	Bread Toast	2025-11-17 11:40:52.714956
759	\N	Doas Stall	2025-11-17 11:40:52.72141
760	\N	Hot Pongal	2025-11-17 11:40:52.727241
761	\N	Idly	2025-11-17 11:40:52.733498
762	\N	Mysore Bajji	2025-11-17 11:40:52.73933
763	\N	Pesarattu	2025-11-17 11:40:52.745589
764	\N	Puri With Alu Curry	2025-11-17 11:40:52.751422
765	\N	Sandwich	2025-11-17 11:40:52.757552
766	\N	Steam Idly	2025-11-17 11:40:52.763819
767	\N	Veg. Upma	2025-11-17 11:40:52.770203
768	\N	Wada	2025-11-17 11:40:52.776403
769	\N	Chakkara Pongal	2025-11-18 15:52:36.884814
770	\N	Kesar Halwa	2025-11-18 15:52:36.89341
771	\N	Paramannam	2025-11-18 15:52:36.895792
772	\N	Payasam	2025-11-18 15:52:36.898398
773	\N	Pulihora	2025-11-18 15:52:36.901726
774	\N	Bread Butter Jam	2025-11-18 15:52:36.904377
775	\N	Bread Toast	2025-11-18 15:52:36.909071
776	\N	Doas Stall	2025-11-18 15:52:36.911748
777	\N	Hot Pongal	2025-11-18 15:52:36.914132
778	\N	Idly	2025-11-18 15:52:36.917715
779	\N	Mysore Bajji	2025-11-18 15:52:36.920479
780	\N	Pesarattu	2025-11-18 15:52:36.923007
781	\N	Puri With Alu Curry	2025-11-18 15:52:36.925351
782	\N	Sandwich	2025-11-18 15:52:36.927637
783	\N	Steam Idly	2025-11-18 15:52:36.929779
784	\N	Veg. Upma	2025-11-18 15:52:36.931983
785	\N	Wada	2025-11-18 15:52:36.934457
786	\N	Chakkara Pongal	2025-11-19 11:10:58.496367
787	\N	Kesar Halwa	2025-11-19 11:10:58.501207
788	\N	Paramannam	2025-11-19 11:10:58.503523
789	21	Gulab Jamun	2025-11-19 12:38:14.337288
790	21	Fruit Salad	2025-11-19 12:38:14.337288
791	\N	Chakkara Pongal	2025-11-19 12:51:59.507515
792	\N	Kesar Halwa	2025-11-19 12:51:59.51145
793	\N	Paramannam	2025-11-19 12:51:59.513836
794	\N	Chakkara Pongal	2025-11-21 14:06:29.501479
795	\N	Kesar Halwa	2025-11-21 14:06:29.513017
796	\N	Paramannam	2025-11-21 14:06:29.523342
797	\N	Payasam	2025-11-21 14:06:29.53839
798	\N	Pulihora	2025-11-21 14:06:29.544157
799	\N	Bread Butter Jam	2025-11-21 14:06:29.550479
800	\N	Bread Toast	2025-11-21 14:06:29.558158
801	\N	Doas Stall	2025-11-21 14:06:29.564326
802	\N	Hot Pongal	2025-11-21 14:06:29.570667
803	\N	Idly	2025-11-21 14:06:29.575866
804	\N	Mysore Bajji	2025-11-21 14:06:29.581503
805	\N	Pesarattu	2025-11-21 14:06:29.587382
806	\N	Puri With Alu Curry	2025-11-21 14:06:29.592969
807	\N	Sandwich	2025-11-21 14:06:29.598711
808	\N	Alu Chenna Chat	2025-11-21 14:06:29.610471
809	\N	Boiled Sprouds Salad	2025-11-21 14:06:29.617057
810	\N	English Pepper Salad	2025-11-21 14:06:29.623403
811	\N	Green Salad	2025-11-21 14:06:29.628457
812	\N	Mexican Salad	2025-11-21 14:06:29.633739
813	\N	Pasta Salad	2025-11-21 14:06:29.638794
814	\N	Peanut Salad	2025-11-21 14:06:29.6435
815	\N	Russian Salad	2025-11-21 14:06:29.648878
816	\N	Sprout Fruit Ball	2025-11-21 14:06:29.656334
817	\N	Sprouts Salad	2025-11-21 14:06:29.662682
818	\N	Sweet Corn Salad	2025-11-21 14:06:29.667459
819	\N	Waldrof Salad	2025-11-21 14:06:29.67322
820	\N	Chakkara Pongal	2025-11-21 14:06:29.683027
821	\N	Payasam	2025-11-21 14:06:29.688235
822	\N	Pulihora	2025-11-21 14:06:29.695235
823	\N	Kesar Halwa	2025-11-21 14:06:29.700468
824	\N	Paramannam	2025-11-21 14:06:29.705057
825	\N	Alu Fry	2025-11-21 14:06:29.709998
826	\N	Alu Gobi 	2025-11-21 14:06:29.715661
827	\N	Alu Gobi Mutter	2025-11-21 14:06:29.720913
828	\N	Alu Palak	2025-11-21 14:06:29.726202
829	\N	Chakkara Pongal	2025-11-22 12:35:31.706001
830	\N	Kesar Halwa	2025-11-22 12:35:31.715779
831	\N	Paramannam	2025-11-22 12:35:31.722504
832	\N	Payasam	2025-11-22 12:35:31.731041
833	\N	Pulihora	2025-11-22 12:35:31.737027
834	\N	Bread Butter Jam	2025-11-22 12:35:31.742814
835	\N	Bread Toast	2025-11-22 12:35:31.747082
836	\N	Alu Chenna Chat	2025-11-22 12:35:31.75366
837	\N	Boiled Sprouds Salad	2025-11-22 12:35:31.756195
838	\N	English Pepper Salad	2025-11-22 12:35:31.758475
839	\N	Green Salad	2025-11-22 12:35:31.760525
840	\N	Mexican Salad	2025-11-22 12:35:31.76245
841	\N	Pasta Salad	2025-11-22 12:35:31.76462
842	\N	Peanut Salad	2025-11-22 12:35:31.76663
843	\N	Russian Salad	2025-11-22 12:35:31.768757
844	\N	Sprout Fruit Ball	2025-11-22 12:35:31.770786
845	\N	Sprouts Salad	2025-11-22 12:35:31.772791
846	\N	Sweet Corn Salad	2025-11-22 12:35:31.774714
847	\N	Waldrof Salad	2025-11-22 12:35:31.776661
848	\N	Chakkara Pongal	2025-11-22 12:35:31.781686
849	\N	Payasam	2025-11-22 12:35:31.783819
850	\N	Pulihora	2025-11-22 12:35:31.786642
851	\N	Kesar Halwa	2025-11-22 12:35:31.788505
852	\N	Paramannam	2025-11-22 12:35:31.790486
853	\N	Alu Fry	2025-11-22 12:35:31.792422
854	\N	Alu Gobi 	2025-11-22 12:35:31.79422
855	\N	Alu Gobi Mutter	2025-11-22 12:35:31.7962
856	\N	Alu Palak	2025-11-22 12:35:31.798448
857	\N	Chakkara Pongal	2025-11-22 12:35:42.532029
858	\N	Kesar Halwa	2025-11-22 12:35:42.537316
859	\N	Paramannam	2025-11-22 12:35:42.541249
860	\N	Payasam	2025-11-22 12:35:42.544615
861	\N	Pulihora	2025-11-22 12:35:42.548058
862	\N	Bread Butter Jam	2025-11-22 12:35:42.551679
863	\N	Bread Toast	2025-11-22 12:35:42.555303
864	\N	Alu Chenna Chat	2025-11-22 12:35:42.562512
865	\N	Boiled Sprouds Salad	2025-11-22 12:35:42.566196
866	\N	English Pepper Salad	2025-11-22 12:35:42.56996
867	\N	Green Salad	2025-11-22 12:35:42.572973
868	\N	Mexican Salad	2025-11-22 12:35:42.575736
869	\N	Pasta Salad	2025-11-22 12:35:42.57833
870	\N	Peanut Salad	2025-11-22 12:35:42.5807
871	\N	Russian Salad	2025-11-22 12:35:42.582717
872	\N	Sprout Fruit Ball	2025-11-22 12:35:42.584626
873	\N	Sprouts Salad	2025-11-22 12:35:42.58673
874	\N	Sweet Corn Salad	2025-11-22 12:35:42.588516
875	\N	Waldrof Salad	2025-11-22 12:35:42.590342
876	\N	Chakkara Pongal	2025-11-22 12:35:42.594173
877	\N	Payasam	2025-11-22 12:35:42.595985
878	\N	Pulihora	2025-11-22 12:35:42.597764
879	\N	Kesar Halwa	2025-11-22 12:35:42.599624
880	\N	Paramannam	2025-11-22 12:35:42.601633
881	\N	Alu Fry	2025-11-22 12:35:42.603609
882	\N	Alu Gobi 	2025-11-22 12:35:42.60568
883	\N	Alu Gobi Mutter	2025-11-22 12:35:42.607536
884	\N	Alu Palak	2025-11-22 12:35:42.6094
885	\N	Chakkara Pongal	2025-11-22 12:36:01.359767
886	\N	Kesar Halwa	2025-11-22 12:36:01.365908
887	\N	Paramannam	2025-11-22 12:36:01.369708
888	\N	Payasam	2025-11-22 12:36:01.373274
889	\N	Pulihora	2025-11-22 12:36:01.376938
890	\N	Bread Butter Jam	2025-11-22 12:36:01.380325
891	\N	Bread Toast	2025-11-22 12:36:01.384163
892	\N	Alu Chenna Chat	2025-11-22 12:36:01.39199
893	\N	Boiled Sprouds Salad	2025-11-22 12:36:01.395624
894	\N	English Pepper Salad	2025-11-22 12:36:01.399182
895	\N	Green Salad	2025-11-22 12:36:01.402808
896	\N	Mexican Salad	2025-11-22 12:36:01.406433
897	\N	Pasta Salad	2025-11-22 12:36:01.410181
898	\N	Peanut Salad	2025-11-22 12:36:01.413794
899	\N	Russian Salad	2025-11-22 12:36:01.417164
900	\N	Sprout Fruit Ball	2025-11-22 12:36:01.419701
901	\N	Sprouts Salad	2025-11-22 12:36:01.421886
902	\N	Sweet Corn Salad	2025-11-22 12:36:01.423771
903	\N	Waldrof Salad	2025-11-22 12:36:01.426193
904	\N	Chakkara Pongal	2025-11-22 12:36:01.430409
905	\N	Payasam	2025-11-22 12:36:01.432418
906	\N	Pulihora	2025-11-22 12:36:01.434751
907	\N	Kesar Halwa	2025-11-22 12:36:01.436946
908	\N	Paramannam	2025-11-22 12:36:01.439224
909	\N	Alu Fry	2025-11-22 12:36:01.441525
910	\N	Alu Gobi 	2025-11-22 12:36:01.444075
911	\N	Alu Gobi Mutter	2025-11-22 12:36:01.446564
912	\N	Alu Palak	2025-11-22 12:36:01.448684
913	\N	Chakkara Pongal	2025-11-22 12:36:18.11541
914	\N	Kesar Halwa	2025-11-22 12:36:18.119497
915	\N	Paramannam	2025-11-22 12:36:18.121931
916	\N	Payasam	2025-11-22 12:36:18.124631
917	\N	Pulihora	2025-11-22 12:36:18.127024
918	\N	Bread Butter Jam	2025-11-22 12:36:18.129301
919	\N	Bread Toast	2025-11-22 12:36:18.131705
920	\N	Alu Chenna Chat	2025-11-22 12:36:18.137516
921	\N	Boiled Sprouds Salad	2025-11-22 12:36:18.140205
922	\N	English Pepper Salad	2025-11-22 12:36:18.142625
923	\N	Green Salad	2025-11-22 12:36:18.146281
924	\N	Mexican Salad	2025-11-22 12:36:18.148634
925	\N	Pasta Salad	2025-11-22 12:36:18.15082
926	\N	Peanut Salad	2025-11-22 12:36:18.15305
927	\N	Russian Salad	2025-11-22 12:36:18.155168
928	\N	Sprout Fruit Ball	2025-11-22 12:36:18.15727
929	\N	Sprouts Salad	2025-11-22 12:36:18.159503
930	\N	Sweet Corn Salad	2025-11-22 12:36:18.161798
931	\N	Waldrof Salad	2025-11-22 12:36:18.164046
932	\N	Chakkara Pongal	2025-11-22 12:36:18.168754
933	\N	Payasam	2025-11-22 12:36:18.170956
934	\N	Pulihora	2025-11-22 12:36:18.17315
935	\N	Kesar Halwa	2025-11-22 12:36:18.17523
936	\N	Paramannam	2025-11-22 12:36:18.1774
937	\N	Alu Fry	2025-11-22 12:36:18.179491
938	\N	Alu Gobi 	2025-11-22 12:36:18.181555
939	\N	Alu Gobi Mutter	2025-11-22 12:36:18.18369
940	\N	Alu Palak	2025-11-22 12:36:18.185861
941	\N	Chakkara Pongal	2025-12-09 12:51:41.914067
942	\N	Kesar Halwa	2025-12-09 12:51:41.922135
943	\N	Paramannam	2025-12-09 12:51:41.930454
944	\N	Bread Butter Jam	2025-12-09 12:51:41.940372
945	\N	Bread Toast	2025-12-09 12:51:41.945531
946	\N	Doas Stall	2025-12-09 12:51:41.94944
947	\N	Black Current Milk Shake	2025-12-09 12:51:41.952443
948	\N	Dry Fruit Milk Shake	2025-12-09 12:51:41.956231
949	\N	Fruit Punch	2025-12-09 12:51:41.959137
950	\N	Chakkara Pongal	2025-12-12 13:36:54.586711
951	\N	Kesar Halwa	2025-12-12 13:36:54.596322
952	\N	Paramannam	2025-12-12 13:36:54.598696
953	\N	Bread Butter Jam	2025-12-12 13:36:54.600983
954	\N	Bread Toast	2025-12-12 13:36:54.603075
955	\N	Doas Stall	2025-12-12 13:36:54.605201
956	\N	Hot Pongal	2025-12-12 13:36:54.60977
957	\N	Idly	2025-12-12 13:36:54.612574
958	\N	Mysore Bajji	2025-12-12 13:36:54.615024
959	\N	Black Current Milk Shake	2025-12-12 13:36:54.617431
960	\N	Dry Fruit Milk Shake	2025-12-12 13:36:54.61973
961	\N	Fruit Punch	2025-12-12 13:36:54.622376
962	\N	Chakkara Pongal	2025-12-12 13:36:54.628004
963	\N	Kesar Halwa	2025-12-12 13:36:54.630517
964	\N	Paramannam	2025-12-12 13:36:54.633965
965	\N	Hot Pongal	2025-12-12 13:36:54.643265
966	\N	Idly	2025-12-12 13:36:54.701188
967	\N	Mysore Bajji	2025-12-12 13:36:54.887378
968	\N	Chakkara Pongal	2025-12-24 15:51:35.125176
969	\N	Bread Butter Jam	2025-12-24 15:51:35.136824
970	\N	Bread Toast	2025-12-24 15:51:35.143119
971	\N	Black Current Milk Shake	2025-12-24 15:51:35.149526
972	\N	Dry Fruit Milk Shake	2025-12-24 15:51:35.155158
973	\N	Babycorn Papad Hotgarlic Stick	2025-12-24 15:51:35.161256
974	\N	Capsicum Canopiece	2025-12-24 15:51:35.169006
975	\N	Chakkara Pongal	2025-12-24 15:51:35.180912
976	\N	Kesar Halwa	2025-12-24 15:51:35.186677
977	\N	Paramannam	2025-12-24 15:51:35.192803
978	\N	Hot Pongal	2025-12-24 15:51:35.198765
979	\N	Idly	2025-12-24 15:51:35.204089
980	\N	Guava Delight	2025-12-24 15:51:35.209884
981	\N	Veg. Manchuria	2025-12-24 15:51:35.215761
982	\N	Chakkara Pongal	2025-12-25 14:31:50.985311
983	\N	Kesar Halwa	2025-12-25 14:31:50.994986
984	\N	Paramannam	2025-12-25 14:31:50.997632
985	\N	Pulihora	2025-12-25 14:31:51.000168
986	\N	Payasam	2025-12-25 14:31:51.002489
987	\N	Bread Butter Jam	2025-12-25 14:31:51.007619
988	\N	Bread Toast	2025-12-25 14:31:51.009973
989	\N	Doas Stall	2025-12-25 14:31:51.012676
990	\N	Payasam	2025-12-25 14:40:11.108211
991	\N	Pulihora	2025-12-25 14:40:11.111548
992	\N	Chakkara Pongal	2025-12-25 14:40:11.113828
993	\N	Kesar Halwa	2025-12-25 14:40:11.116021
994	\N	Paramannam	2025-12-25 14:40:11.118136
995	\N	Hot Pongal	2025-12-25 14:40:11.120126
996	\N	Idly	2025-12-25 14:40:11.122108
997	\N	Mysore Bajji	2025-12-25 14:40:11.124015
998	\N	Pesarattu	2025-12-25 14:40:11.125878
999	\N	Puri With Alu Curry	2025-12-25 14:40:11.127763
1000	\N	Sandwich	2025-12-25 14:40:11.130058
1001	\N	Steam Idly	2025-12-25 14:40:11.13194
1002	\N	Veg. Upma	2025-12-25 14:40:11.133949
1003	\N	Black Current Milk Shake	2025-12-25 14:40:11.136023
1004	\N	Dry Fruit Milk Shake	2025-12-25 14:40:11.137968
1005	\N	Fruit Punch	2025-12-25 14:40:11.139775
1006	\N	Guava Delight	2025-12-25 14:40:11.142417
1007	\N	Hot Badam Milk	2025-12-25 14:40:11.144461
1008	\N	Kharbuja Juice	2025-12-25 14:40:11.146347
1009	\N	Litchi Coconut	2025-12-25 14:40:11.14829
1010	\N	Mango Juice	2025-12-25 14:40:11.151011
1011	\N	Payasam	2025-12-25 16:46:42.16092
1012	\N	Pulihora	2025-12-25 16:46:42.174468
1013	\N	Chakkara Pongal	2025-12-25 16:46:42.180967
1014	\N	Kesar Halwa	2025-12-25 16:46:42.187493
1015	\N	Paramannam	2025-12-25 16:46:42.193504
1016	\N	Hot Pongal	2025-12-25 16:46:42.200628
1017	\N	Idly	2025-12-25 16:46:42.207482
1018	\N	Mysore Bajji	2025-12-25 16:46:42.215049
1019	\N	Pesarattu	2025-12-25 16:46:42.221259
1020	\N	Puri With Alu Curry	2025-12-25 16:46:42.227171
1021	\N	Sandwich	2025-12-25 16:46:42.233883
1022	\N	Steam Idly	2025-12-25 16:46:42.2401
1023	\N	Veg. Upma	2025-12-25 16:46:42.246424
1024	\N	Black Current Milk Shake	2025-12-25 16:46:42.252837
1025	\N	Dry Fruit Milk Shake	2025-12-25 16:46:42.259053
1026	\N	Fruit Punch	2025-12-25 16:46:42.26595
1027	\N	Guava Delight	2025-12-25 16:46:42.272352
1028	\N	Hot Badam Milk	2025-12-25 16:46:42.278931
1029	\N	Kharbuja Juice	2025-12-25 16:46:42.285286
1030	\N	Litchi Coconut	2025-12-25 16:46:42.29218
1031	\N	Mango Juice	2025-12-25 16:46:42.300401
1032	\N	Idly	2025-12-26 17:19:53.57787
1033	\N	Wada	2025-12-26 17:19:53.582838
1034	\N	Pesarattu	2025-12-26 17:19:53.585461
1035	\N	Cobbarl Chutney	2025-12-26 17:19:53.587661
1036	\N	Allam Chutney	2025-12-26 17:19:53.58987
1037	\N	Sambar 	2025-12-26 17:19:53.592158
1038	\N	Idly Karam Podi	2025-12-26 17:19:53.594737
1039	\N	Ghee	2025-12-26 17:19:53.596706
1040	\N	Guava Delight	2025-12-26 17:19:53.601149
1041	\N	Fruit Punch	2025-12-26 17:19:53.603562
1042	\N	Babycorn Papad Hotgarlic Stick	2025-12-26 17:19:53.606107
1043	\N	Paneer Star	2025-12-26 17:19:53.608159
1044	\N	Mexican Salad	2025-12-26 17:19:53.609984
1045	\N	Green Salad	2025-12-26 17:19:53.611813
1046	\N	Baby Naan	2025-12-26 17:19:53.614107
1047	\N	Butter Naan	2025-12-26 17:19:53.616206
1048	\N	Hundi Biryani	2025-12-26 17:19:53.619015
1049	\N	Jackfruit Biryani	2025-12-26 17:19:53.621257
1050	\N	Baby Corn Do Pyaza	2025-12-26 17:19:53.623386
1051	\N	Babycorn Chat Pat	2025-12-26 17:19:53.625261
1052	\N	Alu Fry	2025-12-26 17:19:53.627063
1053	\N	Bendi Fry With Kaju	2025-12-26 17:19:53.628962
1054	\N	Dondakaya Karam	2025-12-26 17:19:53.631025
1055	\N	Capsicum Karam	2025-12-26 17:19:53.633163
1056	\N	Dosakaya Pappu	2025-12-26 17:19:53.635121
1057	\N	Mango Pappu	2025-12-26 17:19:53.636981
1058	\N	Sambar	2025-12-26 17:19:53.638848
1059	\N	Rasam	2025-12-26 17:19:53.640704
1060	\N	Dosaavakaya	2025-12-26 17:19:53.642571
1061	\N	Gongura Pickle	2025-12-26 17:19:53.644402
1062	\N	Tomato Pachadi	2025-12-26 17:19:53.646565
1063	\N	Burelu	2025-12-26 17:19:53.649057
1064	\N	Badhusha	2025-12-26 17:19:53.651267
1065	\N	Badam Chekki	2025-12-26 17:19:53.653531
1066	\N	Alu Bonda	2025-12-26 17:19:53.655544
1067	\N	Dahi Wada	2025-12-26 17:19:53.657594
1068	\N	Minapa Wada	2025-12-26 17:19:53.659565
1069	\N	Coriandal Butter Garlic Noodles	2025-12-26 17:19:53.662001
1070	\N	Dhabeli	2025-12-26 17:19:53.664264
1071	\N	Corn. Veg. Fried Rice	2025-12-26 17:19:53.66674
1072	\N	Alu Toast	2025-12-26 17:19:53.66879
1073	\N	Alu Chat	2025-12-26 17:19:53.670828
1074	\N	Chat Patak Kesar	2025-12-26 17:19:53.672889
1075	\N	Indian Fruits	2025-12-26 17:19:53.674924
1076	\N	Foreign Fruits	2025-12-26 17:19:53.676959
1077	\N	White Rice	2025-12-26 17:19:53.680209
1078	\N	Vadiyallu	2025-12-26 17:19:53.682409
1079	\N	Papad	2025-12-26 17:19:53.684545
1080	\N	Poori	2025-12-26 17:19:53.689307
1081	\N	Pulka	2025-12-26 17:19:53.69158
1082	\N	Chapathi	2025-12-26 17:19:53.693812
1083	\N	Alu Tomato Curry	2025-12-26 17:19:53.695912
1084	\N	Gutti Vankaya (White)	2025-12-26 17:19:53.698165
1085	\N	Chakkara Pongal	2025-12-29 12:19:35.151508
1086	\N	Kesar Halwa	2025-12-29 12:19:35.155882
1087	\N	Paramannam	2025-12-29 12:19:35.158316
1088	\N	Payasam	2025-12-29 12:19:35.160892
1089	\N	Pulihora	2025-12-29 12:19:35.167211
1090	\N	Bread Butter Jam	2025-12-29 12:19:35.169512
1091	\N	Bread Toast	2025-12-29 12:19:35.171946
1092	\N	Doas Stall	2025-12-29 12:19:35.174169
1093	\N	Hot Pongal	2025-12-29 12:19:35.17649
1094	\N	Idly	2025-12-29 12:19:35.178902
1095	\N	Mysore Bajji	2025-12-29 12:19:35.180965
1096	\N	Pesarattu	2025-12-29 12:19:35.182958
1097	\N	Puri With Alu Curry	2025-12-29 12:19:35.184946
1098	\N	Sandwich	2025-12-29 12:19:35.186771
1099	\N	Chakkara Pongal	2025-12-29 13:29:54.39952
1100	\N	Pulihora	2025-12-29 13:29:54.408262
1101	\N	Bagara Rice	2025-12-29 13:29:54.410351
1102	\N	Alu Palak	2025-12-29 13:29:54.412314
1103	\N	Amritsari Chole	2025-12-29 13:29:54.414231
1104	\N	Alu Curry	2025-12-29 13:29:54.416276
1105	\N	Alu Fry	2025-12-29 13:29:54.418487
1106	\N	Alu Tomato Curry	2025-12-29 13:29:54.420549
1107	\N	Dosakaya Pappu	2025-12-29 13:29:54.422773
1108	\N	Gongura Pappu	2025-12-29 13:29:54.425227
1109	\N	Allam Pachadi	2025-12-29 13:29:54.4272
1110	\N	Cobbari Pachadi	2025-12-29 13:29:54.429305
1111	\N	Bobbatlu	2025-12-29 13:29:54.431601
1112	\N	Challa Mirchi	2025-12-29 13:29:54.433878
1113	\N	Curd	2025-12-29 13:29:54.436052
1114	\N	Frimes	2025-12-29 13:29:54.438005
1115	\N	White Rice	2025-12-29 13:29:54.439851
1116	\N	Raitha	2025-12-29 13:29:54.441785
1117	\N	Paan	2025-12-29 13:29:54.443736
1118	\N	Ghee	2025-12-29 13:29:54.445696
1119	\N	Papad	2025-12-29 13:29:54.447622
1120	\N	Chakkara Pongal	2025-12-29 14:36:24.183999
1121	\N	Pulihora	2025-12-29 14:36:24.190597
1122	\N	Bagara Rice	2025-12-29 14:36:24.193409
1123	\N	Alu Palak	2025-12-29 14:36:24.195928
1124	\N	Amritsari Chole	2025-12-29 14:36:24.198692
1125	\N	Alu Curry	2025-12-29 14:36:24.20115
1126	\N	Alu Fry	2025-12-29 14:36:24.204148
1127	\N	Alu Tomato Curry	2025-12-29 14:36:24.206356
1128	\N	Dosakaya Pappu	2025-12-29 14:36:24.208465
1129	\N	Gongura Pappu	2025-12-29 14:36:24.210865
1130	\N	Allam Pachadi	2025-12-29 14:36:24.213246
1131	\N	Cobbari Pachadi	2025-12-29 14:36:24.215266
1132	\N	Bobbatlu	2025-12-29 14:36:24.217488
1133	\N	Challa Mirchi	2025-12-29 14:36:24.220353
1134	\N	Curd	2025-12-29 14:36:24.222378
1135	\N	Frimes	2025-12-29 14:36:24.224316
1136	\N	White Rice	2025-12-29 14:36:24.226403
1137	\N	Raitha	2025-12-29 14:36:24.228316
1138	\N	Paan	2025-12-29 14:36:24.230186
1139	\N	Ghee	2025-12-29 14:36:24.232882
1140	\N	Papad	2025-12-29 14:36:24.235028
1141	\N	Chakkara Pongal	2025-12-30 11:56:41.785798
1142	\N	Kesar Halwa	2025-12-30 11:56:41.803027
1143	\N	Paramannam	2025-12-30 11:56:41.806479
1144	\N	Payasam	2025-12-30 11:56:41.809277
1145	\N	Pulihora	2025-12-30 11:56:41.811717
1146	\N	Alu Fry	2025-12-30 11:59:34.865949
1147	\N	Alu Gobi Mutter	2025-12-30 11:59:34.869724
1148	\N	Alu Palak	2025-12-30 11:59:34.872838
1149	\N	Amritsari Chole	2025-12-30 11:59:34.875821
1150	\N	Baby Corn Do Pyaza	2025-12-30 11:59:34.878531
1151	\N	Babycorn Jal Frize	2025-12-30 11:59:34.881316
1152	\N	Bagara Baigan	2025-12-30 11:59:34.884396
1153	\N	Bendi Fry	2025-12-30 11:59:34.886818
1154	\N	Capsicum Masala	2025-12-30 11:59:34.889042
1155	\N	Chole Masala	2025-12-30 11:59:34.891059
1156	\N	Alu Fry	2025-12-30 12:17:27.930948
1157	\N	Alu Gobi Mutter	2025-12-30 12:17:27.934248
1158	\N	Alu Palak	2025-12-30 12:17:27.936736
1159	\N	Amritsari Chole	2025-12-30 12:17:27.938965
1160	\N	Baby Corn Do Pyaza	2025-12-30 12:17:27.941203
1161	\N	Babycorn Jal Frize	2025-12-30 12:17:27.943454
1162	\N	Bagara Baigan	2025-12-30 12:17:27.945705
1163	\N	Bendi Fry	2025-12-30 12:17:27.947881
1164	\N	Capsicum Masala	2025-12-30 12:17:27.949975
1165	\N	Chole Masala	2025-12-30 12:17:27.952042
1166	\N	Alu Fry	2025-12-30 14:49:39.655152
1167	\N	Alu Gobi Mutter	2025-12-30 14:49:39.65849
1168	\N	Alu Palak	2025-12-30 14:49:39.660707
1169	\N	Amritsari Chole	2025-12-30 14:49:39.663049
1170	\N	Baby Corn Do Pyaza	2025-12-30 14:49:39.667156
1171	\N	Babycorn Jal Frize	2025-12-30 14:49:39.669382
1172	\N	Bagara Baigan	2025-12-30 14:49:39.672031
1173	\N	Bendi Fry	2025-12-30 14:49:39.674692
1174	\N	Capsicum Masala	2025-12-30 14:49:39.677239
1175	\N	Chole Masala	2025-12-30 14:49:39.679727
1176	\N	Alu Fry	2025-12-30 15:18:35.49201
1177	\N	Alu Gobi Mutter	2025-12-30 15:18:35.502415
1178	\N	Alu Palak	2025-12-30 15:18:35.507208
1179	\N	Amritsari Chole	2025-12-30 15:18:35.510624
1180	\N	Baby Corn Do Pyaza	2025-12-30 15:18:35.51544
1181	\N	Babycorn Jal Frize	2025-12-30 15:18:35.518977
1182	\N	Bagara Baigan	2025-12-30 15:18:35.524006
1183	\N	Bendi Fry	2025-12-30 15:18:35.527574
1184	\N	Capsicum Masala	2025-12-30 15:18:35.531488
1185	\N	Chole Masala	2025-12-30 15:18:35.535808
1186	\N	Alu Fry	2025-12-30 15:27:31.940103
1187	\N	Alu Gobi Mutter	2025-12-30 15:27:31.945454
1188	\N	Alu Palak	2025-12-30 15:27:31.949068
1189	\N	Amritsari Chole	2025-12-30 15:27:31.951551
1190	\N	Baby Corn Do Pyaza	2025-12-30 15:27:31.95366
1191	\N	Babycorn Jal Frize	2025-12-30 15:27:31.95609
1192	\N	Bagara Baigan	2025-12-30 15:27:31.95874
1193	\N	Bendi Fry	2025-12-30 15:27:31.961338
1194	\N	Capsicum Masala	2025-12-30 15:27:31.963832
1195	\N	Chole Masala	2025-12-30 15:27:31.965968
1196	\N	Alu Fry	2025-12-30 16:51:58.110149
1197	\N	Alu Gobi Mutter	2025-12-30 16:51:58.114265
1198	\N	Alu Palak	2025-12-30 16:51:58.116713
1199	\N	Amritsari Chole	2025-12-30 16:51:58.118957
1200	\N	Baby Corn Do Pyaza	2025-12-30 16:51:58.121106
1201	\N	Babycorn Jal Frize	2025-12-30 16:51:58.123393
1202	\N	Bagara Baigan	2025-12-30 16:51:58.128009
1203	\N	Bendi Fry	2025-12-30 16:51:58.130262
1204	\N	Capsicum Masala	2025-12-30 16:51:58.132271
1205	\N	Alu Fry	2025-12-30 17:00:32.772862
1206	\N	Alu Gobi Mutter	2025-12-30 17:00:32.777312
1207	\N	Alu Palak	2025-12-30 17:00:32.780531
1208	\N	Amritsari Chole	2025-12-30 17:00:32.783664
1209	\N	Baby Corn Do Pyaza	2025-12-30 17:00:32.786646
1210	\N	Babycorn Jal Frize	2025-12-30 17:00:32.789859
1211	\N	Bagara Baigan	2025-12-30 17:00:32.792735
1212	\N	Bendi Fry	2025-12-30 17:00:32.795438
1213	\N	Capsicum Masala	2025-12-30 17:00:32.797773
1214	\N	Alu Fry	2025-12-30 17:01:34.142684
1215	\N	Alu Gobi Mutter	2025-12-30 17:01:34.146231
1216	\N	Alu Palak	2025-12-30 17:01:34.149597
1217	\N	Amritsari Chole	2025-12-30 17:01:34.15211
1218	\N	Baby Corn Do Pyaza	2025-12-30 17:01:34.154725
1219	\N	Babycorn Jal Frize	2025-12-30 17:01:34.156843
1220	\N	Bagara Baigan	2025-12-30 17:01:34.159245
1221	\N	Bendi Fry	2025-12-30 17:01:34.16138
1222	\N	Capsicum Masala	2025-12-30 17:01:34.163552
1223	\N	Idly	2026-01-05 16:03:18.350444
1224	\N	Bread Butter Jam	2026-01-05 16:03:18.371293
1225	\N	Bread Toast	2026-01-05 16:03:18.377687
1226	\N	Kesar Halwa	2026-01-05 16:03:18.384476
1227	\N	Coffee	2026-01-05 16:03:18.390682
1228	\N	Tea	2026-01-05 16:03:18.397596
1229	\N	White Chutney	2026-01-05 16:03:18.403581
1230	\N	Idly Karam Podi	2026-01-05 16:03:18.409205
1231	\N	Cobbarl Chutney	2026-01-05 16:03:18.41461
1232	\N	Dry Fruit Milk Shake	2026-01-05 16:03:18.427135
1233	\N	Fruit Punch	2026-01-05 16:03:18.432384
1234	\N	Cheese Balls	2026-01-05 16:03:18.437309
1235	\N	Gold Coin	2026-01-05 16:03:18.442092
1236	\N	Green Salad	2026-01-05 16:03:18.447946
1237	\N	Baby Naan	2026-01-05 16:03:18.453486
1238	\N	Chapathi	2026-01-05 16:03:18.458731
1239	\N	Veg. Palov	2026-01-05 16:03:18.463888
1240	\N	Panee Biryani	2026-01-05 16:03:18.469291
1241	\N	Kaju Palov	2026-01-05 16:03:18.474555
1242	\N	Amritsari Chole	2026-01-05 16:03:18.480218
1243	\N	Alu Palak	2026-01-05 16:03:18.485464
1244	\N	Alu Fry	2026-01-05 16:03:18.490539
1245	\N	Cabbage Beans Coconut Poriyal	2026-01-05 16:03:18.495857
1246	\N	Sambar	2026-01-05 16:03:18.501781
1247	\N	Rasam	2026-01-05 16:03:18.507232
1248	\N	Raitha	2026-01-05 16:03:18.512283
1249	\N	Mudda Pappu	2026-01-05 16:03:18.516898
1250	\N	Gongura Pickle	2026-01-05 16:03:18.522073
1251	\N	Dosakaya Pachadi	2026-01-05 16:03:18.526917
1252	\N	Burelu	2026-01-05 16:03:18.532369
1253	\N	Carrot Halwa	2026-01-05 16:03:18.538014
1254	\N	Dil Jamun	2026-01-05 16:03:18.543329
1255	\N	Alu Bajji	2026-01-05 16:03:18.549191
1256	\N	Mirchi Bajji	2026-01-05 16:03:18.554799
1257	\N	Corn Cutlet	2026-01-05 16:03:18.560603
1258	\N	Corn. Veg. Fried Rice	2026-01-05 16:03:18.565778
1259	\N	Alu Toast	2026-01-05 16:03:18.570731
1260	\N	Alu Tokiri	2026-01-05 16:03:18.575712
1261	\N	Fruit Stall	2026-01-05 16:03:18.581209
1262	\N	Sweet Pan	2026-01-05 16:03:18.5862
1263	\N	Butter Scotch	2026-01-05 16:03:18.591129
1264	\N	Pista	2026-01-05 16:03:18.596601
1265	\N	White Rice	2026-01-05 16:03:18.601905
1266	\N	Challa Mirchi	2026-01-05 16:03:18.607236
1267	\N	Kandi Podi	2026-01-05 16:03:18.612322
1268	\N	Ghee	2026-01-05 16:03:18.617099
1269	\N	Papad	2026-01-05 16:03:18.622198
1270	\N	Vadiyallu	2026-01-05 16:03:18.627035
1271	\N	Curd	2026-01-05 16:03:18.631843
1272	\N	Chakkara Pongal	2026-01-06 14:02:57.648842
1273	\N	Kesar Halwa	2026-01-06 14:02:57.660716
1274	\N	Paramannam	2026-01-06 14:02:57.666698
1275	\N	Payasam	2026-01-06 14:02:57.672762
1276	\N	Pulihora	2026-01-06 14:02:57.685472
1277	\N	Bread Butter Jam	2026-01-06 14:02:57.692316
1278	\N	Bread Toast	2026-01-06 14:02:57.70344
1279	\N	Doas Stall	2026-01-06 14:02:57.709268
1280	\N	Hot Pongal	2026-01-06 14:02:57.715255
1281	\N	Idly	2026-01-06 14:02:57.7244
1282	\N	Mysore Bajji	2026-01-06 14:02:57.730769
1283	\N	Chakkara Pongal	2026-01-06 14:02:57.744087
1284	\N	Kesar Halwa	2026-01-06 14:02:57.749969
1285	\N	Paramannam	2026-01-06 14:02:57.756222
1286	\N	Bread Butter Jam	2026-01-06 14:02:57.762551
1287	\N	Bread Toast	2026-01-06 14:02:57.768348
1288	\N	Doas Stall	2026-01-06 14:02:57.773721
1289	\N	Hot Pongal	2026-01-06 14:02:57.779507
1290	\N	Idly	2026-01-06 14:02:57.784976
1291	\N	Mysore Bajji	2026-01-06 14:02:57.790615
1292	\N	Chakkara Pongal	2026-01-06 14:21:55.385838
1293	\N	Kesar Halwa	2026-01-06 14:21:55.391078
1294	\N	Paramannam	2026-01-06 14:21:55.394031
1295	\N	Payasam	2026-01-06 14:21:55.397026
1296	\N	Pulihora	2026-01-06 14:21:55.400572
1297	\N	Bread Butter Jam	2026-01-06 14:21:55.403748
1298	\N	Bread Toast	2026-01-06 14:21:55.406778
1299	\N	Doas Stall	2026-01-06 14:21:55.409339
1300	\N	Hot Pongal	2026-01-06 14:21:55.411691
1301	\N	Idly	2026-01-06 14:21:55.414504
1302	\N	Mysore Bajji	2026-01-06 14:21:55.416523
1303	\N	Chakkara Pongal	2026-01-06 14:21:55.421012
1304	\N	Kesar Halwa	2026-01-06 14:21:55.423191
1305	\N	Paramannam	2026-01-06 14:21:55.425406
1306	\N	Bread Butter Jam	2026-01-06 14:21:55.427609
1307	\N	Bread Toast	2026-01-06 14:21:55.429618
1308	\N	Doas Stall	2026-01-06 14:21:55.431786
1309	\N	Hot Pongal	2026-01-06 14:21:55.433855
1310	\N	Idly	2026-01-06 14:21:55.436162
1311	\N	Mysore Bajji	2026-01-06 14:21:55.438722
1312	\N	Chakkara Pongal	2026-01-06 14:23:05.140726
1313	\N	Kesar Halwa	2026-01-06 14:23:05.144432
1314	\N	Paramannam	2026-01-06 14:23:05.146903
1315	\N	Payasam	2026-01-06 14:23:05.149189
1316	\N	Pulihora	2026-01-06 14:23:05.151375
1317	\N	Bread Butter Jam	2026-01-06 14:23:05.153611
1318	\N	Bread Toast	2026-01-06 14:23:05.156157
1319	\N	Doas Stall	2026-01-06 14:23:05.159332
1320	\N	Hot Pongal	2026-01-06 14:23:05.1616
1321	\N	Idly	2026-01-06 14:23:05.16408
1322	\N	Mysore Bajji	2026-01-06 14:23:05.167247
1323	\N	Chakkara Pongal	2026-01-06 14:23:05.172107
1324	\N	Kesar Halwa	2026-01-06 14:23:05.17436
1325	\N	Paramannam	2026-01-06 14:23:05.176436
1326	\N	Bread Butter Jam	2026-01-06 14:23:05.178513
1327	\N	Bread Toast	2026-01-06 14:23:05.180723
1328	\N	Doas Stall	2026-01-06 14:23:05.182986
1329	\N	Hot Pongal	2026-01-06 14:23:05.184971
1330	\N	Idly	2026-01-06 14:23:05.187431
1331	\N	Mysore Bajji	2026-01-06 14:23:05.194362
1332	22	Bread Toast	2026-01-11 16:49:04.001871
1333	22	Bread Butter Jam	2026-01-11 16:49:04.017286
1334	22	Doas Stall	2026-01-11 16:49:04.020653
1335	23	Bread Toast	2026-01-11 16:59:42.749367
1336	23	Bread Butter Jam	2026-01-11 16:59:42.754113
1337	23	Doas Stall	2026-01-11 16:59:42.756542
1338	24	Guava Delight	2026-01-11 16:59:42.76183
1339	24	Hot Badam Milk	2026-01-11 16:59:42.764716
1340	24	Kharbuja Juice	2026-01-11 16:59:42.767902
1341	24	Litchi Coconut	2026-01-11 16:59:42.771963
1342	24	Mango Juice	2026-01-11 16:59:42.778415
1343	24	Mocktail Counter	2026-01-11 16:59:42.781373
1344	24	Orange Blossom	2026-01-11 16:59:42.784264
1345	24	Pineapple Juice	2026-01-11 16:59:42.786655
1346	24	Pista Milk Shake	2026-01-11 16:59:42.789687
1347	25	Chakkara Pongal	2026-01-11 16:59:42.801721
1348	25	Kesar Halwa	2026-01-11 16:59:42.80695
1349	25	Paramannam	2026-01-11 16:59:42.811032
1350	26	Bread Butter Jam	2026-01-11 16:59:42.817661
1351	26	Doas Stall	2026-01-11 16:59:42.820506
1352	26	Hot Pongal	2026-01-11 16:59:42.823678
1353	26	Idly	2026-01-11 16:59:42.826833
1354	26	Mysore Bajji	2026-01-11 16:59:42.829991
1355	26	Bread Toast	2026-01-11 16:59:42.832986
1356	27	Litchi Coconut	2026-01-11 16:59:42.839992
1357	27	Mango Juice	2026-01-11 16:59:42.843686
1358	27	Mocktail Counter	2026-01-11 16:59:42.847522
1359	27	Orange Blossom	2026-01-11 16:59:42.850794
1360	27	Pineapple Juice	2026-01-11 16:59:42.853857
1361	27	Pista Milk Shake	2026-01-11 16:59:42.856911
1362	28	Pulka	2026-01-11 17:39:29.662277
1363	29	Pulihora	2026-01-11 17:39:29.671133
1364	30	Alu Fry	2026-01-11 17:39:29.678255
1365	30	Amritsari Chole	2026-01-11 17:39:29.680954
1366	31	Avial	2026-01-11 17:39:29.686935
1367	31	Cabbage Beans Coconut Poriyal	2026-01-11 17:39:29.689953
1368	32	Gongura Pappu	2026-01-11 17:39:29.704801
1369	32	Dosakaya Pappu	2026-01-11 17:39:29.707191
1370	32	Majjiga Pulusu	2026-01-11 17:39:29.709674
1371	33	Gongura Pickle	2026-01-11 17:39:29.715366
1372	33	Korivi Karam	2026-01-11 17:39:29.718587
1373	34	Bobbatlu	2026-01-11 17:39:29.723722
1374	35	Mirchi Bajji	2026-01-11 17:39:29.72927
1375	36	Italian Pasta With White	2026-01-11 17:39:29.735096
1376	37	Indian Fruits	2026-01-11 17:39:29.739991
1377	38	Alu Toast	2026-01-11 17:39:29.745667
1378	38	Bhel Puri	2026-01-11 17:39:29.750527
1379	39	White Rice	2026-01-11 17:39:29.756741
1380	39	Vadiyallu	2026-01-11 17:39:29.759212
1381	39	Challa Mirchi	2026-01-11 17:39:29.762615
1382	39	Kandi Podi	2026-01-11 17:39:29.765704
1383	39	Ghee	2026-01-11 17:39:29.768426
1384	39	Papad	2026-01-11 17:39:29.771389
1385	39	Curd	2026-01-11 17:39:29.774095
1386	39	Paan	2026-01-11 17:39:29.776646
1387	40	Pulka	2026-01-11 17:48:01.693288
1388	41	Pulihora	2026-01-11 17:48:01.712246
1389	42	Alu Tomato Curry	2026-01-11 17:48:01.719874
1390	42	Vankaya Karam	2026-01-11 17:48:01.723624
1391	42	Bendi Fry	2026-01-11 17:48:01.726572
1392	43	Mango Pappu	2026-01-11 17:48:01.733446
1393	43	Sambar	2026-01-11 17:48:01.736201
1394	43	Rasam	2026-01-11 17:48:01.740717
1395	44	Dosakaya Pachadi	2026-01-11 17:48:01.747985
1396	44	Gongura Pickle	2026-01-11 17:48:01.750738
1397	44	Allam Pachadi	2026-01-11 17:48:01.753777
1398	45	Burelu	2026-01-11 17:48:01.760967
1399	46	Mirchi Bajji	2026-01-11 17:48:01.768107
1400	47	White Rice	2026-01-11 17:48:01.775614
1401	47	Challa Mirchi	2026-01-11 17:48:01.778642
1402	47	Kandi Podi	2026-01-11 17:48:01.781807
1403	47	Ghee	2026-01-11 17:48:01.784157
1404	47	Vadiyallu	2026-01-11 17:48:01.787087
1405	47	Papad	2026-01-11 17:48:01.78939
1406	47	Curd	2026-01-11 17:48:01.791703
1407	47	Paan	2026-01-11 17:48:01.794761
1408	48	Chakkara Pongal	2026-01-12 11:52:05.943785
1409	48	Kesar Halwa	2026-01-12 11:52:05.959623
1410	48	Paramannam	2026-01-12 11:52:05.966874
1411	48	Payasam	2026-01-12 11:52:05.973711
1412	48	Pulihora	2026-01-12 11:52:05.980278
1413	49	Bread Butter Jam	2026-01-12 11:52:06.000221
1414	49	Bread Toast	2026-01-12 11:52:06.007732
1415	49	Doas Stall	2026-01-12 11:52:06.014465
1416	49	Hot Pongal	2026-01-12 11:52:06.021949
1417	49	Idly	2026-01-12 11:52:06.029499
1418	49	Mysore Bajji	2026-01-12 11:52:06.035431
1419	49	Pesarattu	2026-01-12 11:52:06.041535
1420	49	Puri With Alu Curry	2026-01-12 11:52:06.046813
1421	49	Sandwich	2026-01-12 11:52:06.052297
1422	49	Steam Idly	2026-01-12 11:52:06.058384
1423	49	Veg. Upma	2026-01-12 11:52:06.064889
1424	49	Wada	2026-01-12 11:52:06.070262
1425	50	Black Current Milk Shake	2026-01-12 11:52:06.082242
1426	50	Dry Fruit Milk Shake	2026-01-12 11:52:06.087826
1427	50	Fruit Punch	2026-01-12 11:52:06.093667
1428	50	Guava Delight	2026-01-12 11:52:06.099168
1429	50	Hot Badam Milk	2026-01-12 11:52:06.104831
1430	50	Kharbuja Juice	2026-01-12 11:52:06.109569
1431	50	Litchi Coconut	2026-01-12 11:52:06.1153
1432	50	Mango Juice	2026-01-12 11:52:06.121085
1433	50	Mocktail Counter	2026-01-12 11:52:06.126472
1434	51	Babycorn Papad Hotgarlic Stick	2026-01-12 11:52:06.139434
1435	51	Capsicum Canopiece	2026-01-12 11:52:06.144723
1436	51	Cheese Balls	2026-01-12 11:52:06.150752
1437	51	Dice Star Panneer	2026-01-12 11:52:06.156956
1438	51	Dragon Roll	2026-01-12 11:52:06.163172
1439	51	Gold Coin	2026-01-12 11:52:06.171657
1440	52	Chakkara Pongal	2026-01-12 11:52:06.191429
1441	52	Kesar Halwa	2026-01-12 11:52:06.197406
1442	52	Paramannam	2026-01-12 11:52:06.203242
1443	53	Bread Butter Jam	2026-01-12 11:52:06.217084
1444	53	Bread Toast	2026-01-12 11:52:06.222869
1445	53	Doas Stall	2026-01-12 11:52:06.22913
1446	53	Hot Pongal	2026-01-12 11:52:06.235608
1447	53	Idly	2026-01-12 11:52:06.242008
1448	53	Mysore Bajji	2026-01-12 11:52:06.248293
1449	54	Black Current Milk Shake	2026-01-12 11:52:06.262881
1450	54	Dry Fruit Milk Shake	2026-01-12 11:52:06.26894
1451	54	Fruit Punch	2026-01-12 11:52:06.27485
1452	54	Guava Delight	2026-01-12 11:52:06.280766
1453	54	Hot Badam Milk	2026-01-12 11:52:06.286812
1454	54	Kharbuja Juice	2026-01-12 11:52:06.292948
1455	55	Babycorn Papad Hotgarlic Stick	2026-01-12 11:52:06.307553
1456	55	Capsicum Canopiece	2026-01-12 11:52:06.313499
1457	55	Cheese Balls	2026-01-12 11:52:06.319302
1458	55	Dice Star Panneer	2026-01-12 11:52:06.325681
1459	55	Dragon Roll	2026-01-12 11:52:06.331823
1460	55	Gold Coin	2026-01-12 11:52:06.337628
1461	55	Golden Tikki	2026-01-12 11:52:06.343067
1462	55	Paneer Star	2026-01-12 11:52:06.348211
1463	55	Veg Lolly Pop	2026-01-12 11:52:06.35392
1464	55	Veg. Bullet	2026-01-12 11:52:06.359049
1465	55	Veg. Manchuria	2026-01-12 11:52:06.366536
1466	56	Chakkara Pongal	2026-01-12 11:52:06.386734
1467	56	Kesar Halwa	2026-01-12 11:52:06.391725
1468	56	Paramannam	2026-01-12 11:52:06.396901
1469	57	Bread Butter Jam	2026-01-12 11:52:06.408248
1470	57	Bread Toast	2026-01-12 11:52:06.41402
1471	57	Doas Stall	2026-01-12 11:52:06.420162
1472	57	Hot Pongal	2026-01-12 11:52:06.425595
1473	57	Idly	2026-01-12 11:52:06.430689
1474	57	Mysore Bajji	2026-01-12 11:52:06.436843
1475	57	Pesarattu	2026-01-12 11:52:06.442357
1476	57	Puri With Alu Curry	2026-01-12 11:52:06.446956
1477	58	Black Current Milk Shake	2026-01-12 11:52:06.458501
1478	58	Dry Fruit Milk Shake	2026-01-12 11:52:06.463988
1479	58	Fruit Punch	2026-01-12 11:52:06.470236
1480	58	Guava Delight	2026-01-12 11:52:06.475411
1481	58	Hot Badam Milk	2026-01-12 11:52:06.481111
1482	59	Babycorn Papad Hotgarlic Stick	2026-01-12 11:52:06.494753
1483	59	Capsicum Canopiece	2026-01-12 11:52:06.500106
1484	59	Cheese Balls	2026-01-12 11:52:06.505464
1485	60	Alu Chenna Chat	2026-01-12 11:52:06.516404
1486	60	Boiled Sprouds Salad	2026-01-12 11:52:06.521298
1487	60	English Pepper Salad	2026-01-12 11:52:06.52711
1488	60	Green Salad	2026-01-12 11:52:06.534418
1489	60	Mexican Salad	2026-01-12 11:52:06.539626
1490	61	Amritsari Naan	2026-01-12 11:52:06.554111
1491	61	Baby Naan	2026-01-12 11:52:06.559361
1492	61	Banjara Roti	2026-01-12 11:52:06.564656
1493	61	Butter Naan	2026-01-12 11:52:06.570311
1494	61	Chapathi	2026-01-12 11:52:06.576496
1495	61	Delhi Naan	2026-01-12 11:52:06.583668
\.


--
-- TOC entry 4997 (class 0 OID 24912)
-- Dependencies: 227
-- Data for Name: menus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menus (id, customer_name, contact, place, date, created_at) FROM stdin;
106	Elias K. Example	9991112220	Grand Banquet Hall	2026-03-15	2025-11-19 12:38:14.337288
108	hema	123456789	vidya	2025-11-20	2025-11-19 12:51:59.485299
110	Hema	8341350693	vidya Nagar 	2025-11-22	2025-11-22 12:35:31.642983
111	Hema	8341350699	vidya Nagar 	2025-11-22	2025-11-22 12:35:42.516209
112	Hema	2356892344	vidya Nagar 	2025-11-22	2025-11-22 12:36:01.34059
130	fewrer	9833333434434	qw32r3r	2025-12-18	2025-12-09 12:35:22.318393
132	Bhasker Garu	9676070802	Nizambad	\N	2025-12-09 12:51:41.817047
134	Ramesh	9848698668	vidya nagar	2025-12-13	2025-12-12 13:36:54.502951
135	Lokhitha	9348356789	vidya Nagar	2025-12-26	2025-12-24 15:51:35.049389
136	Ramya	9848698667	vidya Nagar	2025-12-27	2025-12-25 14:31:50.912796
137	Anusha 	9848698664	 Vidya Nagar 	2025-12-28	2025-12-25 14:40:11.065424
142	Anusha 	1234567894	 Vidya Nagar 	2025-12-28	2025-12-25 16:46:42.105659
143	Hema Sri	9989271311	Tellapur	2025-12-27	2025-12-26 17:19:53.498131
144	HELLO	9874561230	Tellapur	2025-12-30	2025-12-29 12:19:35.107775
145	HELLO	998877667	Tellapur	2025-12-29	2025-12-29 13:29:54.321382
146	HELLO	998877669	Tellapur	2025-12-29	2025-12-29 14:36:24.150963
147	Aruna	78945612	 Vidya Nagar 	2025-12-31	2025-12-30 11:56:41.746461
156	Lakshmi	1234567890	 Vidya Nagar 	2026-01-01	2025-12-30 17:01:34.129728
157	hema sri	9876543210	shivam road	2026-01-08	2026-01-05 16:03:18.199467
158	Lakshmi	9876547890	 Vidya Nagar 	2026-01-07	2026-01-06 14:02:57.561781
159	Lakshmi	9876547840	Anil	2026-01-07	2026-01-06 14:20:43.61422
163	Lakshmi	456123789	Anil	2026-01-07	2026-01-06 14:21:55.368587
164	Lakshmi	7894561230	Anil	2026-01-07	2026-01-06 14:22:38.831265
167	Lakshmi	789456130	Anil	2026-01-07	2026-01-06 14:23:05.128448
169	Hema	1234567895	Vidya Nagar	2026-01-11	2026-01-10 12:54:46.984759
172	Hema	1234567896	Vidya Nagar	2026-01-11	2026-01-10 12:56:04.28596
174	Hema	124569870	Vidya Nagar	2026-01-11	2026-01-10 15:35:46.617963
175	Hema	9876541230	Vidya Nagar	2026-01-11	2026-01-10 15:57:38.796309
177	Hema	12345678790	Vidya Nagar	2026-01-12	2026-01-11 14:48:13.02593
178	Hema	03587946510	Vidya Nagar	2026-01-23	2026-01-11 16:49:03.908383
179	Anusha	03587946515	Vidya Nagar	2026-01-23	2026-01-11 16:59:42.613562
182	 Indira 	0348657129	 tarnaka 	2026-01-17	2026-01-11 17:39:29.557286
183	naveen	0348657130	 tarnaka 	\N	2026-01-11 17:48:01.477966
184	Hema	15978456123	ChairMinar	\N	2026-01-12 11:52:05.80847
\.


--
-- TOC entry 4995 (class 0 OID 24899)
-- Dependencies: 225
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (id, category_id, product, image, created_at) FROM stdin;
\.


--
-- TOC entry 4989 (class 0 OID 16426)
-- Dependencies: 219
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (sno, image, product, category, action) FROM stdin;
192	uploads\\1758972670266-Vankaya Allam Pachi Mirchi.png	Vankaya Allam Pachhi Mirchi	South Curries	null
11	uploads\\1758790873774-Black Current Milk Shake.png	Black Current Milk Shake	Welcome Drinks	null
319	uploads\\1759044649863-Butter Spl. Pav Bhaji.png	Butter Spl. Pav Bhaji	Chat Counter	null
360	uploads\\1760007960699-Ice Cream Roller.png	Ice Cream Roller	Dessert	null
362	uploads\\1760009422968-Steam Idly.png	Steam Idly	Tiffins	null
414	uploads\\1760074263319-Chakkalu.png	Chakilalu	Sarray	null
257	uploads\\1760075110419-Dabeli.png	Dhabeli	Chinese Counter	null
2	uploads\\1760593278981-1758791255598-Hot Badam Milk.png	Hot Badam Milk	Welcome Drinks	null
101	uploads\\1758793652827-Boiled Sprouts Salad.png	Boiled Sprouds Salad	Salads	null
12	uploads\\1758790916667-Tawa Hot Badam Milk In Pots.png	Tawa Hot Badam Milk In Pots	Welcome Drinks	null
13	uploads\\1758790933859-Guava Delight.png	Guava Delight	Welcome Drinks	null
14	uploads\\1758790947883-Litchi Coconut.png	Litchi Coconut	Welcome Drinks	null
15	uploads\\1758791009822-Mocktail Counter.png	Mocktail Counter	Welcome Drinks	null
16	uploads\\1758791520530-Veg Lollipop.png	Veg Lolly Pop	Welcome Snacks	null
17	uploads\\1758791531867-Gold Coin.png	Gold Coin	Welcome Snacks	null
18	uploads\\1758791542625-Veg. Manchuria.png	Veg. Manchuria	Welcome Snacks	null
19	uploads\\1758791554520-Dragon Roll.png	Dragon Roll	Welcome Snacks	null
20	uploads\\1758791568380-Veg. Bullet.png	Veg. Bullet	Welcome Snacks	null
21	uploads\\1758791585045-Dice Star Panneer.png	Dice Star Panneer	Welcome Snacks	null
22	uploads\\1758791597453-Babycorn Papad Hotgarlic Stick.png	Babycorn Papad Hotgarlic Stick	Welcome Snacks	null
23	uploads\\1758791609577-Golden Tikki.png	Golden Tikki	Welcome Snacks	null
24	uploads\\1758791622359-Cheese Balls.png	Cheese Balls	Welcome Snacks	null
25	uploads\\1758791636738-Capsicum Canopies.png	Capsicum Canopiece	Welcome Snacks	null
26	uploads\\1758791653865-Pudina Byte.png	Pudina Byte	Welcome Snacks	null
27	uploads\\1758791667736-Pista Delight.png	Pista Delight	Welcome Snacks	null
28	uploads\\1758791744157-Orange Peta.png	Orange Peta	Welcome Snacks	null
29	uploads\\1758791763066-Paneer Star.png	Paneer Star	Welcome Snacks	null
102	uploads\\1758793673420-Peanut Salad.png	Peanut Salad	Salads	null
103	uploads\\1758793689227-English Pepper Salad.png	English Pepper Salad	Salads	null
94	uploads\\1758793404026-Sprouts Salad.png	Sprouts Salad	Salads	null
96	uploads\\1758793444393-Pasta Salad.png	Pasta Salad	Salads	null
97	uploads\\1758793546460-Sweet Corn Salad.png	Sweet Corn Salad	Salads	null
98	uploads\\1758793596445-Sprout Fruit salad.png	Sprout Fruit Ball	Salads	null
99	uploads\\1758793615861-Alu Chenna Chat salad.png	Alu Chenna Chat	Salads	null
100	uploads\\1758793630646-Waldrof Salad.png	Waldrof Salad	Salads	null
104	uploads\\1758793704488-Mexican Salad.png	Mexican Salad	Salads	null
93	uploads\\1758793795701-Green Salad.png	Green Salad	Salads	null
105	uploads\\1758869171022-Poori.png	Poori	Roti	null
106	uploads\\1758869191432-Pulka.png	Pulka	Roti	null
107	uploads\\1758869207615-Chapathi.png	Chapathi	Roti	null
108	uploads\\1758869231295-Roomali Roti.png	Roomali Roti	Roti	null
109	uploads\\1758869309250-Tandoori Roti.png	Tandoori Roti	Roti	null
110	uploads\\1758869328041-Baby Naan.png	Baby Naan	Roti	null
111	uploads\\1758869411583-Latcha Parotha.png	Latcha Parota	Roti	null
128	uploads\\1758870437141-Vangi Bath.png	Vangi Bath	Rice	null
113	uploads\\1758869451139-Butter Naan.png	Butter Naan	Roti	null
114	uploads\\1758869471907-Masala Kulcha.png	Masala Kulcha	Roti	null
115	uploads\\1758869512757-Dry Fruit Naan.png	Dry Fruit Naan	Roti	null
116	uploads\\1758869548908-Makki Ka Roti.png	Makki Ka Roti	Roti	null
117	uploads\\1758869585052-Amritsari Naan.png	Amritsari Naan	Roti	null
118	uploads\\1758869624748-Palak Roomali.png	Palak Roomali Roti	Roti	null
119	uploads\\1758869660763-Tawa Pop Parotta.png	Tawa Pop Parota	Roti	null
120	uploads\\1758869701313-Pudina Paratha.png	Pudina Parota	Roti	null
121	uploads\\1758869728834-Stuffed Panneer Kulcha.png	Stuffed Panneer Kulcha	Roti	null
122	uploads\\1758869754615-Bajra Roti.png	Banjara Roti	Roti	null
123	uploads\\1758869785561-Delhi Naan.png	Delhi Naan	Roti	null
125	uploads\\1758870351949-Zeera Rice.png	Zeera Rice	Rice	null
126	uploads\\1758870379815-Bagara Rice.png	Bagara Rice	Rice	null
127	uploads\\1758870412336-Coconut Rice.png	Coconut Rice	Rice	null
129	uploads\\1758870475981-Karivepaku Rice.png	Karvepaku Rice	Rice	null
130	uploads\\1758870793712-Gongura Rice.png	Gongura Rice	Rice	null
131	uploads\\1758870895818-Paneer Biryani.png	Panee Biryani	Rice	null
132	uploads\\1758870923974-Jackfruit Biryani.png	Jackfruit Biryani	Rice	null
133	uploads\\1758870949754-Veg. Fried Rice.png	Veg. Fried Rice	Rice	null
135	uploads\\1758871050826-Veg. Dhum Ka Biryani.png	Veg. Dhum Ka Biryani	Rice	null
124	uploads\\1758871029868-Pulihora.png	Pulihora	Rice	null
136	uploads\\1758871068770-Veg. Palov.png	Veg. Palov	Rice	null
137	uploads\\1758871112294-Curd Rice.png	Curd Rice	Rice	null
138	uploads\\1758871154159-Bisbilla Bath.png	Bisbilla Bath	Rice	null
139	uploads\\1758871174998-Daddojanam.png	Daddojanam	Rice	null
140	uploads\\1758871205636-Kaju Peas Palov.png	Kaju Peas Palov	Rice	null
141	uploads\\1758871234549-Handi Veg  Biryani.png	Hundi Biryani	Rice	null
406	uploads\\1758538926515-Paramannam.jpg	Paramannam	Prasadam	null
142	uploads\\1758871263986-Kaju Palov.png	Kaju Palov	Rice	null
230	uploads\\1758871634836-Minapa Wada.png	Minapa Wada	Hot	null
235	uploads\\1758871900999-Mirchi Bajji.png	Mirchi Bajji	Hot	null
240	uploads\\1758871968888-Capsicum Rings.png	Capsicum Rings	Hot	null
144	uploads\\1758969203415-Chole Masala.png	Chole Masala	North Curries	null
146	uploads\\1758969235610-Capsicum Masala.png	Capsicum Masala	North Curries	null
148	uploads\\1758969289643-Veg. Jalfrezi.png	Veg. Jal Frize	North Curries	null
150	uploads\\1758969325323-Alu Fry.png	Alu Fry	North Curries	null
152	uploads\\1758969388563-Donda Fry.png	Donda Fry	North Curries	null
154	uploads\\1758969451418-Baby Corn Chatpata (2).png	Babycorn Chat Pat	North Curries	null
158	uploads\\1758969567947-Paneer Chatpata.png	Panneer Chatpat	North Curries	null
161	uploads\\1758969764643-Mix Veg. Kurma.png	Mix Veg. Kurma	North Curries	null
164	uploads\\1758969916419-Kala Jamun Curry.png	Mini Jamun Curry	North Curries	null
168	uploads\\1758970000530-Sarsonki Saag.png	Sarsonki Saag	North Curries	null
172	uploads\\1758970125906-Khurchan Paneer.png	Khurchan Paneer	North Curries	null
176	uploads\\1758970317634-Baby Corn Do Pyaza.png	Baby Corn Do Pyaza	North Curries	null
180	uploads\\1758972216854-Dondakaya Karam.png	Dondakaya Karam	South Curries	null
184	uploads\\1758972314467-Avial.png	Avial	South Curries	null
190	uploads\\1758972618203-Kosambari.png	Kosambari	South Curries	null
194	uploads\\1758972721163-Alu Tomato Curry.png	Alu Tomato Curry	South Curries	null
196	uploads\\1758972756962-Alu Curry.png	Alu Curry	South Curries	null
198	uploads\\1758972805418-Gutti Vankaya.png	Gutti Vankaya	South Curries	null
202	uploads\\1758973510069-Tomato Pappu.png	Tomato Pappu	Dal & Liquids	null
206	uploads\\1758973606591-Mudda Pappu.png	Mudda Pappu	Dal & Liquids	null
210	uploads\\1758973732192-Rasam.png	Rasam	Dal & Liquids	null
297	uploads\\1759043958505-Alu Tokiri.png	Alu Tokiri	Chat Counter	null
302	uploads\\1759044151146-Karela Papidi.png	Karela Papidi	Chat Counter	null
310	uploads\\1759044367483-Hara Bara Katori.png	Hara Bara Katori	Chat Counter	null
318	uploads\\1759044629416-Chat Patak Kesar.png	Chat Patak Kesar	Chat Counter	null
326	uploads\\1759045382516-Fruit Stall.png	Fruit Stall	Fruit Stall	null
327	uploads\\1759045403588-Indian Fruits.png	Indian Fruits	Fruit Stall	null
335	uploads\\1760005531842-Fruit Salad With Custard.png	Fruit Salad	Dessert	null
344	uploads\\1760007841350-Pista With Topping.png	Pista With Topping	Dessert	null
353	uploads\\1760008047986-Dry Fruit Nuts.png	Dry Fruit Nuts	Dessert	null
363	uploads\\1760009431263-Appam.png	Appam	Tiffins	null
365	uploads\\1760009452305-Poori with alu curry.png	Poori With Alu Curry	Tiffins	null
421	uploads\\1760011973131-Papad.png	Papad	Common Items	null
430	uploads\\1760012178886-Palli Chutney.png	White Chutney	Common Items	null
417	uploads\\1760074295645-Mixture.png	Mixture	Sarray	null
419	uploads\\1760074327278-Chalimidi.png	Chalimidi	Sarray	null
245	uploads\\1760074777235-238.png	Corn. Veg. Fried Rice	Chinese Counter	null
250	uploads\\1760074894018-Hot Garlic Sauce.png	Hot Garlic Sauce	Chinese Counter	null
255	uploads\\1760075058315-Paneer Tikka.png	Panneer Tikka	Chinese Counter	null
259	uploads\\1760075160732-Mexican Roll.png	Mexican Roll	Chinese Counter	null
260	uploads\\1760075201154-Rolly Polly Roll.png	Rolly Polly Roll	Chinese Counter	null
267	uploads\\1760075374674-Paneer Sukuti.png	Paneer Sukuti	Chinese Counter	null
274	uploads\\1760075969105-Dice Star Manchuria.png	Dice Star Manchuria	Chinese Counter	null
278	uploads\\1760076070266-Hot Panneer Dil.png	Hot Panneer Dil	Chinese Counter	null
281	uploads\\1760076191393-Grill Sandwich.png	Grill Sandwich	Chinese Counter	null
289	uploads\\1760076522704-Tandoori Alu.png	Tandoori Alu	Chinese Counter	null
215	uploads\\1760076871219-Gongura Pickle.png	Gongura Pickle	Pickles & Powders	null
220	uploads\\1760076957540-Cobbari Pachadi.png	Cobbari Pachadi	Pickles & Powders	null
223	uploads\\1760077001764-Dosakaya Pachadi.png	Dosakaya Pachadi	Pickles & Powders	null
376	uploads\\1760077491226-Mixture.png	Mixture	Snacks	null
386	uploads\\1760077634218-Pav Bhaji.png	Pav Bhaji	Snacks	null
387	uploads\\1760077645906-Bhel Puri.png	Bhel Puri	Snacks	null
396	uploads\\1760079493168-Mysore Bajji.png	Mysore Bajji	Breakfast	null
191	uploads\\1758972644723-Capsicum Karam.png	Capsicum Karam	South Curries	null
193	uploads\\1758972702580-Jeera Aloo.png	Zeera Alu	South Curries	null
195	uploads\\1758972741097-Aratikaya Upma Curry.png	Aratikaya Upma Curry	South Curries	null
197	uploads\\1758972784474-Mulakkada Tomato.png	Mulakada Tomatoo	South Curries	null
200	uploads\\1758973019659-Gutti Vankaya.png	Gutti Vankaya (White)	South Curries	null
203	uploads\\1758973535837-Palakura Pappu.png	Palakura Pappu	Dal & Liquids	null
204	uploads\\1758973559398-Dosakaya Pappu.png	Dosakaya Pappu	Dal & Liquids	null
207	uploads\\1758973633086-Mukkala Pulusu.png	Mukkala Pulusu	Dal & Liquids	null
208	uploads\\1758973666691-Sambar.png	Sambar	Dal & Liquids	null
211	uploads\\1758973756639-Gongura Pappu.png	Gongura Pappu	Dal & Liquids	null
213	uploads\\1758973798739-Ulavacharu With Cream.png	Ulva Charu With Cream	Dal & Liquids	null
294	uploads\\1759043895211-Ragada Cutlet.png	Ragada Cutlet	Chat Counter	null
295	uploads\\1759043917297-Bhel Puri.png	Bhel Puri	Chat Counter	null
243	uploads\\1760074731581-Veg. Manchuria.png	Veg. Manchuria	Chinese Counter	null
246	uploads\\1760074809556-Veg. Shanghai Roll.png	Veg. Palak Sprink Roll	Chinese Counter	null
248	uploads\\1760074866806-Spanish Manchurian.png	Spanish Manchuria	Chinese Counter	null
251	uploads\\1760074916522-Veg. Shanghai Roll.png	Veg. Shangai Roll	Chinese Counter	null
253	uploads\\1760074950171-Chinese Bhel.png	Chinese Bhel	Chinese Counter	null
256	uploads\\1760075074995-Coriandal Butter Garlic Noodles.png	Coriandal Butter Garlic Noodles	Chinese Counter	null
258	uploads\\1760075125555-Pepper Manchurian.png	Pepper Manchuria	Chinese Counter	null
261	uploads\\1760075218827-Italian Pasta With White.png	Italian Pasta With White	Chinese Counter	null
264	uploads\\1760075310066-Paneer Barbeque.png	Panneer Barby Q	Chinese Counter	null
266	uploads\\1760075349931-Veg. Canopies.png	Veg. Canopies	Chinese Counter	null
254	\N	Veg. Bamboo Rice	Chinese Counter	\N
268	uploads\\1760075402466-Malaysian Peanut Cutlet.png	Malasian Peanut Cutlet	Chinese Counter	null
262	\N	Corn Saslic Rice	Chinese Counter	\N
273	\N	Seven Jewel Rice	Chinese Counter	\N
276	\N	All Veg Hoch Poch	Chinese Counter	\N
282	\N	Thai Rice With Red Curry	Chinese Counter	\N
283	\N	Italian Pasta With Red Sauce	Chinese Counter	\N
287	\N	Pudina Byte	Chinese Counter	\N
288	\N	Malai Paneer Tikka	Chinese Counter	\N
291	\N	Green Tikka	Chinese Counter	\N
292	\N	Gobi Tikka	Chinese Counter	\N
5	uploads\\1758790792406-Pista Milk Shake.png	Pista Milk Shake	Welcome Drinks	null
7	uploads\\1758790823137-Mango Juice.png	Mango Juice	Welcome Drinks	null
228	uploads\\1758871583939-Masala Wada.png	Masala Wada	Hot	null
229	uploads\\1758871613225-Dahi Wada.png	Dahi Wada	Hot	null
232	uploads\\1758871685375-Onion Pakodi.png	Onion Pakodi	Hot	null
238	uploads\\1758871832358-Mixture.png	Mixture	Hot	null
234	uploads\\1758871879233-Vankaya Pakodi.png	Vankaya Pakodi	Hot	null
239	uploads\\1758871949866-Onion Rings.png	Onion Rings	Hot	null
143	uploads\\1758969186684-Paneer Butter Masala.png	Paneer Butter Masala	North Curries	null
147	uploads\\1758969264779-Palak Paneer.png	Palak Panneer	North Curries	null
151	uploads\\1758969360305-Bhindi Fry.png	Bendi Fry	North Curries	null
155	uploads\\1758969471739-Alu Gobi Mutter.png	Alu Gobi Mutter	North Curries	null
157	uploads\\1758969524563-Veg. Kofta.png	Veg. Kofta	North Curries	null
160	uploads\\1758969740964-Veg. Jaipuri.png	Veg. Jaipuri	North Curries	null
162	uploads\\1758969789005-Mushroom Mutter.png	Mushroom Mutter	North Curries	null
165	uploads\\1758969934443-Tawa Alu Sabji.png	Tawa Sabji	North Curries	null
167	uploads\\1758969974922-Amritsari Chole.png	Amritsari Chole	North Curries	null
170	uploads\\1758970039627-Palak Babycorn Mutter.png	Palak Babycorn Mutter	North Curries	null
173	uploads\\1758970144778-Tawa Alu Sabji.png	Tawa Alu Sabji	North Curries	null
175	uploads\\1758970206147-Veg. Kolhapuri.png	Veg. Kola Puri	North Curries	null
177	uploads\\1758970366379-Kala Jamun Curry.png	Kala Jamun Curry	North Curries	null
179	uploads\\1758972041494-Vankaya Karam.png	Vankaya Karam	South Curries	null
182	uploads\\1758972268624-Kanda Bachali.png	Kanda Bachali	South Curries	null
185	uploads\\1758972336507-Veg Kootu.png	Veg Koottu	South Curries	null
186	uploads\\1758972378589-Bhindi Fry.png	Bendi Fry	South Curries	null
188	uploads\\1758972436452-Aloo Fry.png	Alu Fry	South Curries	null
270	uploads\\1760075833306-Mini Pizza.png	Mini Pizza	Chinese Counter	null
272	uploads\\1760075866538-Chilly Cheese Roll.png	Chilly Cheese Roll	Chinese Counter	null
277	uploads\\1760076050249-Panneer Finger Sizzlers.png	Panneer Finger Sizzlers	Chinese Counter	null
279	uploads\\1760076089946-Thai Chilly Beans.png	Thai Chilly Beans	Chinese Counter	null
284	uploads\\1760076350969-Corn Cutlet.png	Corn Cutlet	Chinese Counter	null
286	uploads\\1760076405777-French Fries.png	French Fries	Chinese Counter	null
290	uploads\\1760076535144-Hara Bara Tikka.png	Hara Bara Tikka	Chinese Counter	null
216	uploads\\1760076887787-Tomato Pachadi.png	Tomato Pachadi	Pickles & Powders	null
218	uploads\\1760076924404-Dosaavakaya.png	Dosaavakaya	Pickles & Powders	null
219	uploads\\1760076938659-Allam Pachadi.png	Allam Pachadi	Pickles & Powders	null
222	uploads\\1760076985587-Kandi Podi.png	Kandi Podi	Pickles & Powders	null
224	uploads\\1760077017051-Tomato Roti Pachadi.png	Tomato Roti Pachadi	Pickles & Powders	null
226	uploads\\1760077115396-Red Chilly.png	Red Chilly	Pickles & Powders	null
405	uploads\\1758538912419-Payasam.jpg	Payasam	Prasadam	null
199	uploads\\1758972829544-Mulakkada Tomato.png	Mulakkada Tomato Curry	South Curries	null
296	uploads\\1759043938564-Chena Dahi Vada.png	China Dahi Wada	Chat Counter	null
305	uploads\\1759044230211-Sev Puri.png	Sev Puri	Chat Counter	null
313	uploads\\1759044516761-Raja Rani Chat.png	Raja Rani Chat	Chat Counter	null
321	uploads\\1759044717311-Corn Bhel Puri.png	Corn Bhel Puri	Chat Counter	null
329	uploads\\1759045568362-Paan.png	Pan	Pan Counter	null
332	uploads\\1759045629714-Kesar Paan.png	Kesar Pan	Pan Counter	null
338	uploads\\1760007545681-Rasgulla ice cream.png	Rasgulla	Dessert	null
356	uploads\\1760007996073-Kulfi In Cups.png	Kulfi In Cups	Dessert	null
347	uploads\\1760008226529-Chocolates.png	Chocolate	Dessert	null
366	uploads\\1760009459382-Rasam Wada.png	Rasam Wada	Tiffins	null
423	uploads\\1760012063877-White Rice.png	White Rice	Common Items	null
426	uploads\\1760012088868-Fryums.png	Frimes	Common Items	null
433	uploads\\1760012231957-Vadiyalu.png	Vadiyallu	Common Items	null
415	uploads\\1760074275404-Murukulu.png	Murukulu	Sarray	null
442	uploads\\1760074437547-Rasam.png	Rasam 	Common Items	null
263	uploads\\1760075294139-Mini Burger.png	Mini Burger	Chinese Counter	null
280	uploads\\1760076173929-Veg. Manchow Soup.png	Manchow Soup	Chinese Counter	null
227	uploads\\1760077141426-Karivepaku Podi.png	Karvepaku Podi	Pickles & Powders	null
375	uploads\\1760077479274-Palak Pakodi.png	Palak Pakodi	Snacks	null
385	uploads\\1760077622347-Dahi Wada.png	Dahi Wada	Snacks	null
392	uploads\\1760079442719-Veg. Upma.png	Veg. Upma	Breakfast	null
395	uploads\\1760079478695-Pesarattu.png	Pesarattu	Breakfast	null
403	uploads\\1758538787894-Kesar Halwa.jpg	Kesar Halwa	Prasadam	null
201	uploads\\1758973039186-Bhindi Fry With Kaju.png	Bendi Fry With Kaju	South Curries	null
293	uploads\\1759043865529-Pani Puri.png	Pani Puri	Chat Counter	null
298	uploads\\1759043978906-Dosa Stall With Chat.png	Dosa Stall With Chat	Chat Counter	null
306	uploads\\1759044251525-Pav Bhaji.png	Pav Bhaji	Chat Counter	null
314	uploads\\1759044536741-Chines Dahi Wada.png	Chines Dahi Wada	Chat Counter	null
322	uploads\\1759044749759-Rava Pani Puri.png	Ravva Pani Puri	Chat Counter	null
330	uploads\\1759045590053-Sada Paan.png	Sada Pan	Pan Counter	null
242	uploads\\1759045822392-Veg. Noodles.png	Veg. Noodles	Chinese Counter	null
339	uploads\\1760007557850-Fruit Salad With Custard.png	Fruit Salad With Custured	Dessert	null
357	uploads\\1760007901594-Chocolate Fountain.png	Chocolate Fountain	Dessert	null
348	uploads\\1760008111944-Honey Moon Delight.png	Honey Moon Delight	Dessert	null
367	uploads\\1760009468165-Soyabean Dosa.png	Soyabean Dosa	Tiffins	null
425	uploads\\1760012078747-Raitha.png	Raitha	Common Items	null
427	uploads\\1760012101939-Challa Mirchi.png	Challa Mirchi	Common Items	null
435	uploads\\1760012254133-Coffee.png	Coffee	Common Items	null
412	uploads\\1760074228629-Badusha.png	Badhusha	Sarray	null
244	uploads\\1760074746379-Tomato Soup.png	Tomato Soup	Chinese Counter	null
265	uploads\\1760075324044-Golden Fry Babycorn.png	Golden Fry Babycorn	Chinese Counter	null
285	uploads\\1760076365145-Cheese Chilly Toast.png	Cheese Chilly Toast	Chinese Counter	null
370	uploads\\1760077414443-Alu Bonda.png	Alu Bonda	Snacks	null
374	uploads\\1760077466563-Onion Pakodi.png	Onion Pakodi	Snacks	null
384	uploads\\1760077610729-Ragada Cutlet.png	Ragada Cutlet	Snacks	null
393	uploads\\1760079455423-Puri With Alu Curry.png	Puri With Alu Curry	Breakfast	null
397	uploads\\1760079502425-Hot Pongal.png	Hot Pongal	Breakfast	null
95	\N	Russian Salad	Salads	null
299	\N	Paneer Chilwa	Chat Counter	\N
349	\N	Choco Roco	Dessert	\N
205	uploads\\1758973577531-Mango Pappu.png	Mango Pappu	Dal & Liquids	null
301	uploads\\1759044129278-Alu Toast.png	Alu Toast	Chat Counter	null
307	uploads\\1759044298678-Ragada Cutlet.png	Mewa Ragada Cutlet	Chat Counter	null
315	uploads\\1759044552417-Alu Chat.png	Alu Chat	Chat Counter	null
323	uploads\\1759044779249-Dahi Kachori.png	Dahi Kachori	Chat Counter	null
331	uploads\\1759045609938-Sweet Paan.png	Sweet Pan	Pan Counter	null
336	uploads\\1760007495164-Ice Cream (Vanilla).png	Ice Cream (Vanilla)	Dessert	null
340	uploads\\1760007569266-Vanilla.png	Vanilla	Dessert	null
358	uploads\\1760007923130-Sugar Candy.png	Sugar Candy	Dessert	null
428	uploads\\1760012119452-Kobbari Chutney.png	Cobbarl Chutney	Common Items	null
432	uploads\\1760012222883-409.png	Karam Podi	Common Items	null
408	uploads\\1760074183868-Laddu Small Size.png	Laddu Small Size	Sarray	null
418	uploads\\1760074307060-Khara Boondi.png	Khara Bhoondi	Sarray	null
247	uploads\\1760074852523-Hong Kong Noodles.png	Hong Kong Noodles	Chinese Counter	null
269	uploads\\1760075420393-Spanish Soup.png	Spanish Soup	Chinese Counter	null
214	uploads\\1760076856168-Mango Pickle.png	Mango Pickle	Pickles & Powders	null
368	uploads\\1760077384754-Pop Corn.png	Pop Corn	Snacks	null
373	uploads\\1760077452018-Mysore Bajji.png	Mysore Bajji	Snacks	null
378	uploads\\1760077521450-Aratikaya Bajji.png	Aratikaya Bajji	Snacks	null
388	uploads\\1760077658737-Sandwich.png	Sandwich	Snacks	null
398	uploads\\1760079515792-Steam Idly.png	Steam Idly	Breakfast	null
400	uploads\\1760079534975-Sandwich.png	Sandwich	Breakfast	null
343	\N	Pineapple Chikki	Dessert	\N
402	uploads\\1758538892492-Chakkara Pongal.jpg	Chakkara Pongal	Prasadam	null
209	uploads\\1758973712916-Majjiga Pulusu.png	Majjiga Pulusu	Dal & Liquids	null
300	uploads\\1759044097003-Tomato Dosa With Chat.png	Tomato Dosa With Chat	Chat Counter	null
308	uploads\\1759044321882-Dahi Gujiya.png	Dahi Gujiya	Chat Counter	null
309	uploads\\1759044340453-Pani Puri (2 Types).png	Pani Puri (2 Types)	Chat Counter	null
316	uploads\\1759044570185-Dhokla.png	Dokla	Chat Counter	null
324	uploads\\1759044806411-Zeera Alu Chat.png	Zeera Alu Chat	Chat Counter	null
333	uploads\\1759045662929-Fire Paan.png	Fire Pan	Pan Counter	null
341	uploads\\1760007580458-Butterscotch.png	Butter Scotch	Dessert	null
361	uploads\\1760007973297-Pastries.png	Pastries	Dessert	null
352	uploads\\1760008057161-Caramel Nuts.png	Caramel Nuts	Dessert	null
424	uploads\\1760012071123-Ghee.png	Ghee	Common Items	null
434	uploads\\1760012245508-409.png	Idly Karam Podi	Common Items	null
437	uploads\\1760012291156-409.png	Kandi Podi	Common Items	null
413	uploads\\1760074240901-Madatha Kaja.png	Madatha Kaja	Sarray	null
249	uploads\\1760074879707-Veg. Manchow Soup.png	Veg. Manchow Soup	Chinese Counter	null
271	uploads\\1760075854298-Mongolian Noodles.png	Mangolian Noodles	Chinese Counter	null
217	uploads\\1760076910955-Dosakaya Vankaya Pachadi.png	Dosavankaya Pachadi	Pickles & Powders	null
371	uploads\\1760077426474-Veg Bonda.png	Veg Bonda	Snacks	null
381	uploads\\1760077567434-Samosa.png	Samosa	Snacks	null
391	uploads\\1760079432063-Wada.png	Wada	Breakfast	null
379	uploads\\1760519817118-1760077537578-Punugulu.png	Punugulu	Snacks	null
303	\N	Canfi Chat	Chat Counter	\N
212	uploads\\1758973774908-Live Dal.png	Live Dal	Dal & Liquids	null
350	\N	Tooty Frooty	Dessert	\N
351	\N	Mocktail Counter	Dessert	\N
354	\N	Honey Almond	Dessert	\N
440	uploads\\1758975102150-Raitha.png	Raitha	Dal & Liquids	null
304	uploads\\1759044210324-Dahi Papdi.png	Dahi Papidi	Chat Counter	null
311	uploads\\1759044443507-Ice Cream Fry with chat.png	Ice Cream Fry	Chat Counter	null
8	uploads\\1758790833682-Kharbuja Juice.png	Kharbuja Juice	Welcome Drinks	null
317	uploads\\1759044597042-Khandvi.png	Kandvi	Chat Counter	null
320	uploads\\1759044682007-Maida Katori.png	Maida Katori	Chat Counter	null
325	uploads\\1759045303147-Tomato Dosa With Chat.png	Tomato Omlet	Chat Counter	null
328	uploads\\1759045445856-Foreign Fruits.png	Foreign Fruits	Fruit Stall	null
334	uploads\\1759045684236-Chocolate Paan.png	Chocolate Pan	Pan Counter	null
337	uploads\\1760007533531-Rasmalai ice cream.png	Rasmalai	Dessert	null
473	\N	Tawa Meetai	Sweets	\N
474	\N	Indra Puri	Sweets	\N
342	uploads\\1760007595454-Strawberry.png	Strawberry	Dessert	null
359	uploads\\1760007938250-Ice Gola.png	Ice Gola	Dessert	null
355	uploads\\1760008006258-Straw Berry Ripple.png	Straw Berry Ripple	Dessert	null
346	uploads\\1760008318353-Chocolates.png	Chocolate Ripple	Dessert	null
481	\N	Butterscotch Roll	Sweets	\N
482	\N	Rim Zim (Bengali)	Sweets	\N
483	\N	German Telox	Sweets	\N
364	uploads\\1760009442710-Dosa.png	Dosa Stall	Tiffins	null
485	\N	Kesar Indra Puri	Sweets	\N
486	\N	Khus Khus Katori	Sweets	\N
420	uploads\\1760011960571-Paan.png	Paan	Common Items	null
489	\N	Taka Tak (Hot)	Sweets	\N
490	\N	Mango Alaska	Sweets	\N
491	\N	Dry Fruit Tawa	Sweets	\N
492	\N	Fruit Jilebi	Sweets	\N
493	\N	American Dollar	Sweets	\N
494	\N	Pancha Ratan Halwa	Sweets	\N
422	uploads\\1760012053228-Curd.png	Curd	Common Items	null
429	uploads\\1760012146579-Palli Chutney.png	Palli Chutney	Common Items	null
499	\N	Ferni Ka Meeta	Sweets	\N
431	uploads\\1760012194412-Allam Chutney.png	Allam Chutney	Common Items	null
503	\N	Dry Fruit Germon Telox	Sweets	\N
407	uploads\\1760074174217-Laddu Big Size.png	Laddu Big Size	Sarray	null
436	uploads\\1760012306067-Tea.png	Tea	Common Items	null
409	uploads\\1760074196237-Sunnundalu.png	Sunnundalu	Sarray	null
404	uploads\\1758538877116-Pulihora.jpg	Pulihora	Prasadam	null
411	uploads\\1760074219772-Mysorepak.png	Mysorepak	Sarray	null
451	uploads\\1758625936315-Samiya Payasam.png	Samiya Payasam	Sweets	null
452	uploads\\1758626088591-Madatha Kaja.png	Madatha Kaja	Sweets	null
456	uploads\\1758626104774-Putharekulu.png	Putharekulu	Sweets	null
505	uploads\\1758627293519-Milky Bar.png	Milky bar	Sweets	null
458	uploads\\1758626138223-Kala Jamun.png	Kala Jamun	Sweets	null
459	uploads\\1758626150494-Double Ka Meeta.png	Double Ka Meeta	Sweets	null
460	uploads\\1758626165597-Qubani Ka Meeta.png	Qubani Ka Meeta	Sweets	null
461	uploads\\1758626175903-Jilebi.png	Jilebi	Sweets	null
462	uploads\\1758626192734-Kaddu ka Halwa.png	Kaddu Halwa	Sweets	null
463	uploads\\1758626200419-Jangri.png	Jangri	Sweets	null
464	uploads\\1758626209743-Tawa Sweet.png	Tawa Sweet	Sweets	null
466	uploads\\1758626254071-Dry Fruit Burfi.png	Dry Fruit Burfi	Sweets	null
468	uploads\\1758626305679-Milk Mysore Pak.png	Milk Mysore Pak	Sweets	null
453	uploads\\1758626350656-Carrot Halwa.png	Carrot Halwa	Sweets	null
455	uploads\\1758626377879-Kakinada Kaja.png	Kakinada Kaja	Sweets	null
444	uploads\\1758626408959-Burelu.png	Burelu	Sweets	null
472	uploads\\1758626449398-Rasgulla.png	Rasgulla	Sweets	null
476	uploads\\1758626527384-Dil Jamun.png	Dil Jamun	Sweets	null
450	uploads\\1758626554319-Laddu.png	Laddu	Sweets	null
448	uploads\\1758626701270-Fruit Kesari.png	Fruit Kesari	Sweets	null
447	uploads\\1758626731972-Chakkara Pongali.png	Chakkara Pongali	Sweets	null
443	uploads\\1758626831023-Bobbatlu.png	Bobbatlu	Sweets	null
501	uploads\\1758626891489-Tripple Pudding.png	Tripple Pudding	Sweets	null
457	uploads\\1758627206692-Badhusha.png	Badhusha	Sweets	null
495	uploads\\1758627400151-Mango Sandwich.png	Mango Sandwich	Sweets	null
500	uploads\\1758627453294-Shahi Tukda.png	Shahi Thukuda	Sweets	null
496	uploads\\1758627476049-Malai Chenna Toast.png	Malai Chenna Toast	Sweets	null
445	uploads\\1758627768622-Sojappa.png	Sojappa	Sweets	null
480	uploads\\1758627826055-Malai Sandwich.png	Malai Sandwich	Sweets	null
487	uploads\\1758627862214-Dry Fruit Chikki.png	Dry Fruit Chekki	Sweets	null
416	uploads\\1760074285868-Janthikalu.png	Janthikalu	Sarray	null
369	uploads\\1760077399731-American Sweet Corn.png	American Sweet Corn	Snacks	null
441	uploads\\1760074447075-Sambar.png	Sambar 	Common Items	null
372	uploads\\1760077439010-Alu Bajji.png	Alu Bajji	Snacks	null
377	uploads\\1760077503563-Mirchi Bajji.png	Mirchi Bajji	Snacks	null
380	uploads\\1760077553186-Assorted Baiji.png	Assorted Baiji	Snacks	null
383	uploads\\1760077597634-Pani Puri.png	Pani Puri	Snacks	null
389	uploads\\1760077672673-Grill Sandwich.png	Grill Sandwich	Snacks	null
390	uploads\\1760079414831-Idly.png	Idly	Breakfast	null
394	uploads\\1760079468400-Doas.png	Doas Stall	Breakfast	null
399	uploads\\1760079523671-Bread Toast.png	Bread Toast	Breakfast	null
401	uploads\\1760079545359-Bread Butter Jam.png	Bread Butter Jam	Breakfast	null
465	uploads\\1758626241697-Paneer Jalebi.png	Paneer Jalebi	Sweets	null
467	uploads\\1758626283464-Kaju Roll.png	Kaju Roll	Sweets	null
469	uploads\\1758626332927-Litchi Gulla.png	Litchi Gulla	Sweets	null
454	uploads\\1758626361519-Gulab Jamun.png	Gulab Jamun	Sweets	null
470	uploads\\1758626397698-Paan Petha.png	Paan Petha	Sweets	null
471	uploads\\1758626436969-Rasmalai.png	Rasmalai	Sweets	null
475	uploads\\1758626516567-Kaju Pista Roll.png	Kaju Pista Roll	Sweets	null
449	uploads\\1758626680791-Paramannam.png	Paramannam	Sweets	null
446	uploads\\1758626715702-Chiroti.png	Chiroti	Sweets	null
477	uploads\\1758626814228-Mothichur Laddu.png	Mothichur Laddu	Sweets	null
478	uploads\\1758626849511-Malpuri.png	Malpuri	Sweets	null
497	uploads\\1758626941391-Pineapple Gola.png	Pineapple Gola	Sweets	null
502	uploads\\1758627223559-Badam Chikki.png	Badam Chekki	Sweets	null
498	uploads\\1758627312519-Chocolate Laddu (Dry Fruit).png	Chocolate Laddu (Dry Fruit)	Sweets	null
504	uploads\\1758627429624-Dry Fruit Anjeer Checker.png	Dry Fruit Anjeer Chekar	Sweets	null
488	uploads\\1758627516736-Tutti Frutti.png	Tooty Frooty (Bengali)	Sweets	null
479	uploads\\1758627794547-Moong dal Halwa.png	Moong Dal Halwa	Sweets	null
484	uploads\\1758629228879-Baked Rasgulla.png	Baked Rasagulla	Sweets	null
312	uploads\\1759044481458-Butter Spl. Pav Bhaji.png	Spl. Pav Bhaji	Chat Counter	null
145	\N	Alu Gobi 	North Curries	null
3	uploads\\1758790709888-Watermelon Juice.png	Watermelon Juice	Welcome Drinks	null
4	uploads\\1758790772997-Pineapple Juice.png	Pineapple Juice	Welcome Drinks	null
6	uploads\\1758790804153-Fruit Punch.png	Fruit Punch	Welcome Drinks	null
9	uploads\\1758790847116-Dry Fruit Milk Shake.png	Dry Fruit Milk Shake	Welcome Drinks	null
10	uploads\\1758790857825-Orange Blossom.png	Orange Blossom	Welcome Drinks	null
231	uploads\\1758871657795-Aratikaya Bajji.png	Aratikaya Bajji	Hot	null
237	uploads\\1758871812257-Alu Bajji.png	Alu Bajji	Hot	null
233	uploads\\1758871856195-Cabbage Pakodi.png	Cabbage Pakodi	Hot	null
236	uploads\\1758871924433-Alu Bonda.png	Alu Bonda	Hot	null
241	uploads\\1758871990012-Tomato Rings.png	Tomato Rings	Hot	null
149	uploads\\1758969306085-Alu Palak.png	Alu Palak	North Curries	null
153	uploads\\1758969411411-Paneer Do Pyaza.png	Paneer Do Pyaza	North Curries	null
156	uploads\\1758969497035-Bagara Baingan.png	Bagara Baigan	North Curries	null
159	uploads\\1758969708115-Baby Corn Jalfrezi.png	Babycorn Jal Frize	North Curries	null
163	uploads\\1758969826683-Alu Palak.png	Palak Alu	North Curries	null
166	uploads\\1758969951762-Dal Makhani.png	Dal Makhani	North Curries	null
169	uploads\\1758970017466-Paneer Angara.png	Paneer Angara	North Curries	null
174	uploads\\1758970174314-Paneer Makhanwala.png	Panneer Makhwanwala	North Curries	null
178	uploads\\1758970395307-Ginger Aloo.png	Ginger Alu	North Curries	null
181	uploads\\1758972247666-Alu Upma Curry.png	Alu Upma Curry	South Curries	null
183	uploads\\1758972292268-Panasapottu Kura.png	Panasapottu Kura	South Curries	null
187	uploads\\1758972400205-Donda Fry.png	Donda Fry	South Curries	null
189	uploads\\1758972544869-Cabbage Beans Coconut Poriyal.png	Cabbage Beans Coconut Poriyal	South Curries	null
345	uploads\\1760007858226-Pista ice cream.png	Pista	Dessert	null
410	uploads\\1760074206068-Ariselu.png	Aresellu	Sarray	null
252	uploads\\1760074937146-Veg. Sweet Corn Soup.png	Veg. Sweet Corn Soup	Chinese Counter	null
275	uploads\\1760075990596-Panneer Tophu.png	Panneer Tophu	Chinese Counter	null
221	uploads\\1760076972244-Korivi Karam.png	Korivi Karam	Pickles & Powders	null
382	uploads\\1760077581354-Irani Samosa.png	Irani Samosa	Snacks	null
171	uploads\\1760507615901-download.jpeg	Veg. Hara Bara	North Curries	null
\.


--
-- TOC entry 5022 (class 0 OID 0)
-- Dependencies: 222
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 23, true);


--
-- TOC entry 5023 (class 0 OID 0)
-- Dependencies: 218
-- Name: categories_sno_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_sno_seq', 26, true);


--
-- TOC entry 5024 (class 0 OID 0)
-- Dependencies: 220
-- Name: category_sno_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_sno_seq', 29, true);


--
-- TOC entry 5025 (class 0 OID 0)
-- Dependencies: 216
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_id_seq', 12, true);


--
-- TOC entry 5026 (class 0 OID 0)
-- Dependencies: 234
-- Name: invoices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.invoices_id_seq', 86, true);


--
-- TOC entry 5027 (class 0 OID 0)
-- Dependencies: 230
-- Name: menu_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menu_categories_id_seq', 61, true);


--
-- TOC entry 5028 (class 0 OID 0)
-- Dependencies: 228
-- Name: menu_contexts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menu_contexts_id_seq', 155, true);


--
-- TOC entry 5029 (class 0 OID 0)
-- Dependencies: 232
-- Name: menu_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menu_items_id_seq', 1495, true);


--
-- TOC entry 5030 (class 0 OID 0)
-- Dependencies: 226
-- Name: menus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menus_id_seq', 184, true);


--
-- TOC entry 5031 (class 0 OID 0)
-- Dependencies: 224
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 1, false);


--
-- TOC entry 4815 (class 2606 OID 16433)
-- Name: products categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT categories_pkey PRIMARY KEY (sno);


--
-- TOC entry 4819 (class 2606 OID 24897)
-- Name: categories categories_pkey1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey1 PRIMARY KEY (id);


--
-- TOC entry 4817 (class 2606 OID 16442)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (sno);


--
-- TOC entry 4813 (class 2606 OID 16406)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- TOC entry 4837 (class 2606 OID 24975)
-- Name: invoices invoices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoices
    ADD CONSTRAINT invoices_pkey PRIMARY KEY (id);


--
-- TOC entry 4832 (class 2606 OID 24939)
-- Name: menu_categories menu_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_categories
    ADD CONSTRAINT menu_categories_pkey PRIMARY KEY (id);


--
-- TOC entry 4829 (class 2606 OID 24926)
-- Name: menu_contexts menu_contexts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_contexts
    ADD CONSTRAINT menu_contexts_pkey PRIMARY KEY (id);


--
-- TOC entry 4835 (class 2606 OID 24952)
-- Name: menu_items menu_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_pkey PRIMARY KEY (id);


--
-- TOC entry 4824 (class 2606 OID 24918)
-- Name: menus menus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menus
    ADD CONSTRAINT menus_pkey PRIMARY KEY (id);


--
-- TOC entry 4821 (class 2606 OID 24905)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 4826 (class 2606 OID 41278)
-- Name: menus unique_contact; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menus
    ADD CONSTRAINT unique_contact UNIQUE (contact);


--
-- TOC entry 4830 (class 1259 OID 24983)
-- Name: idx_cat_context; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cat_context ON public.menu_categories USING btree (context_id);


--
-- TOC entry 4827 (class 1259 OID 24982)
-- Name: idx_context_menu; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_context_menu ON public.menu_contexts USING btree (menu_id);


--
-- TOC entry 4833 (class 1259 OID 24984)
-- Name: idx_item_category; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_item_category ON public.menu_items USING btree (category_id);


--
-- TOC entry 4822 (class 1259 OID 24981)
-- Name: idx_menu_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_menu_date ON public.menus USING btree (date);


--
-- TOC entry 4842 (class 2606 OID 24976)
-- Name: invoices invoices_menu_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoices
    ADD CONSTRAINT invoices_menu_id_fkey FOREIGN KEY (menu_id) REFERENCES public.menus(id) ON DELETE CASCADE;


--
-- TOC entry 4840 (class 2606 OID 24940)
-- Name: menu_categories menu_categories_context_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_categories
    ADD CONSTRAINT menu_categories_context_id_fkey FOREIGN KEY (context_id) REFERENCES public.menu_contexts(id) ON DELETE CASCADE;


--
-- TOC entry 4839 (class 2606 OID 24927)
-- Name: menu_contexts menu_contexts_menu_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_contexts
    ADD CONSTRAINT menu_contexts_menu_id_fkey FOREIGN KEY (menu_id) REFERENCES public.menus(id) ON DELETE CASCADE;


--
-- TOC entry 4841 (class 2606 OID 24953)
-- Name: menu_items menu_items_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.menu_categories(id) ON DELETE CASCADE;


--
-- TOC entry 4838 (class 2606 OID 24906)
-- Name: product product_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id) ON DELETE SET NULL;


-- Completed on 2026-01-12 12:05:30

--
-- PostgreSQL database dump complete
--

\unrestrict Oce6J3UBHLltXYn7OQRtM0etdaQVlLzEsmE7ZuxJrLnVMrPJIxfJLYgoiVYDbFo

-- Completed on 2026-01-12 12:05:30

--
-- PostgreSQL database cluster dump complete
--

