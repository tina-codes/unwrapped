--
-- PostgreSQL database dump
--

-- Dumped from database version 13.8 (Ubuntu 13.8-1.pgdg20.04+1)
-- Dumped by pg_dump version 13.8 (Ubuntu 13.8-1.pgdg20.04+1)

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
-- Name: albums; Type: TABLE; Schema: public; Owner: cnicosia
--

CREATE TABLE public.albums (
    album_id character varying(22) NOT NULL,
    artist_id character varying(22) NOT NULL,
    name character varying(100) NOT NULL,
    release_year integer,
    img_url character varying
);


ALTER TABLE public.albums OWNER TO cnicosia;

--
-- Name: artists; Type: TABLE; Schema: public; Owner: cnicosia
--

CREATE TABLE public.artists (
    artist_id character varying(22) NOT NULL,
    name character varying(100) NOT NULL,
    popularity integer,
    followers integer,
    img_url character varying
);


ALTER TABLE public.artists OWNER TO cnicosia;

--
-- Name: artists_genres; Type: TABLE; Schema: public; Owner: cnicosia
--

CREATE TABLE public.artists_genres (
    id integer NOT NULL,
    artist_id character varying(22) NOT NULL,
    genre character varying(30) NOT NULL
);


ALTER TABLE public.artists_genres OWNER TO cnicosia;

--
-- Name: artists_genres_id_seq; Type: SEQUENCE; Schema: public; Owner: cnicosia
--

CREATE SEQUENCE public.artists_genres_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.artists_genres_id_seq OWNER TO cnicosia;

--
-- Name: artists_genres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cnicosia
--

ALTER SEQUENCE public.artists_genres_id_seq OWNED BY public.artists_genres.id;


--
-- Name: features; Type: TABLE; Schema: public; Owner: cnicosia
--

CREATE TABLE public.features (
    track_id character varying(22) NOT NULL,
    danceability double precision NOT NULL,
    energy double precision NOT NULL,
    key integer NOT NULL,
    loudness double precision NOT NULL,
    mode integer NOT NULL,
    speechiness double precision NOT NULL,
    acousticness double precision NOT NULL,
    instrumentalness double precision NOT NULL,
    liveness double precision NOT NULL,
    valence double precision NOT NULL,
    tempo double precision NOT NULL,
    time_signature integer NOT NULL,
    duration_ms integer NOT NULL
);


ALTER TABLE public.features OWNER TO cnicosia;

--
-- Name: genres; Type: TABLE; Schema: public; Owner: cnicosia
--

CREATE TABLE public.genres (
    genre character varying(30) NOT NULL,
    is_seed boolean NOT NULL
);


ALTER TABLE public.genres OWNER TO cnicosia;

--
-- Name: items; Type: TABLE; Schema: public; Owner: cnicosia
--

CREATE TABLE public.items (
    id integer NOT NULL,
    user_id character varying(30) NOT NULL,
    date integer NOT NULL,
    item_type character varying(10) NOT NULL,
    timespan character varying(11) NOT NULL,
    rank integer NOT NULL,
    spotify_id character varying(22) NOT NULL
);


ALTER TABLE public.items OWNER TO cnicosia;

--
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: cnicosia
--

CREATE SEQUENCE public.items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.items_id_seq OWNER TO cnicosia;

--
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cnicosia
--

ALTER SEQUENCE public.items_id_seq OWNED BY public.items.id;


--
-- Name: tracks; Type: TABLE; Schema: public; Owner: cnicosia
--

CREATE TABLE public.tracks (
    track_id character varying(22) NOT NULL,
    artist_id character varying(22) NOT NULL,
    album_id character varying(22) NOT NULL,
    name character varying(100) NOT NULL,
    popularity integer NOT NULL
);


ALTER TABLE public.tracks OWNER TO cnicosia;

--
-- Name: users; Type: TABLE; Schema: public; Owner: cnicosia
--

CREATE TABLE public.users (
    user_id character varying(30) NOT NULL,
    display_name character varying(30),
    profile_photo character varying
);


ALTER TABLE public.users OWNER TO cnicosia;

--
-- Name: artists_genres id; Type: DEFAULT; Schema: public; Owner: cnicosia
--

ALTER TABLE ONLY public.artists_genres ALTER COLUMN id SET DEFAULT nextval('public.artists_genres_id_seq'::regclass);


--
-- Name: items id; Type: DEFAULT; Schema: public; Owner: cnicosia
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- Data for Name: albums; Type: TABLE DATA; Schema: public; Owner: cnicosia
--

COPY public.albums (album_id, artist_id, name, release_year, img_url) FROM stdin;
5wnCTZtzIZxasRSHzI1JeW	0qu422H5MOoQxGjd4IzHbS	Heaven To A Tortured Mind	2020	https://i.scdn.co/image/ab67616d0000b273043864250fbec5f57c7076a7
68HLpLmCtvFKUqwQpUCqwn	65dGLGjkw3UbddUg2GKQoZ	IV	2016	https://i.scdn.co/image/ab67616d0000b273087255518781845b84bc8f92
6wYeJwJU9Y4fuLQVfGyJk9	4lujUKeO6nQAJXpq37Epn7	New Magic	2017	https://i.scdn.co/image/ab67616d0000b273c00c5819ddec8e15cb71ebb6
2oiJM8vFGpxrtGtFfJWhJv	6ltzsmQQbmdoHHbLZ4ZN25	Vide Noir	2018	https://i.scdn.co/image/ab67616d0000b2738431866429dc2ad6eed8c51e
4jQW2mhMH3TxtAOol3Djuf	0YrtvWJMgSdVrk3SfNjTbx	Transatlanticism (10th Anniversary Edition)	2003	https://i.scdn.co/image/ab67616d0000b273c306113cf2eea54867337da2
0qxsfpy2VU0i4eDR9RTaAU	0bzfPKdbXL5ezYW2z3UGQj	Love & Hate	2016	https://i.scdn.co/image/ab67616d0000b2731070095e88dce90a090171b5
6R6pjR9ocMYuqSuNx5e4mg	3M4ThdJR28z9eSMcQHAZ5G	Costello Music	2007	https://i.scdn.co/image/ab67616d0000b27390b7c466e878862b5a9cece3
2ICdqEf91Kc9FwdlLtB748	30DhU7BDmF4PH0JVhu8ZRg	About Time	2017	https://i.scdn.co/image/ab67616d0000b27376165991d7aeecce3634f554
3fUHDbd0oujqAerhHZjdsj	360IAlyVv4PCEVjgyMZrxK	Spotify Singles	2018	https://i.scdn.co/image/ab67616d0000b27353d3c8dce8f55cb13cf148ef
56dfEbntfVTMCxjrjggL1e	34jw2BbxjoYalTp8cJFCPv	Bad Animals	1987	https://i.scdn.co/image/ab67616d0000b2735fa646a4cfcd17842fdd7bbd
0NBTBo1qrg554sAj79nEqD	5Q81rlcTFh3k6DQJXPdsot	Mura Masa	2017	https://i.scdn.co/image/ab67616d0000b2736818aa231aa543cf87e1374a
3DGQ1iZ9XKUQxAUWjfC34w	2YZyLoL8N0Wb9xBt1NhZWg	good kid, m.A.A.d city (Deluxe)	2012	https://i.scdn.co/image/ab67616d0000b273d58e537cea05c2156792c53d
7vXiklrUeffx5o2F8VYwm3	4hz8tIajF2INpgM0qzPJz2	How to: Friend, Love, Freefall	2018	https://i.scdn.co/image/ab67616d0000b2739529217e48fc8bab89c8a1f9
0P3oVJBFOv3TDXlYRhGL7s	1Xyo4u8uXC1ZmMpatF05PJ	Beauty Behind The Madness	2015	https://i.scdn.co/image/ab67616d0000b2737fcead687e99583072cc217b
3vLFWR3fLqfY82WGvaLuyV	7CyeXFnOrfC1N6z4naIpgo	Be My Baby: The Very Best of The Ronettes	2011	https://i.scdn.co/image/ab67616d0000b2734694c5b97d3a88efb5fc71b5
57d5dFo7oN2yUyGfSKPrRv	55VydwMyCuGcavwPuhutPL	The Used	2002	https://i.scdn.co/image/ab67616d0000b273e0827a6cec3f1574249ec8c0
5AYmpTfdv1OoASUJ5rZB7K	08ct2eZF5lUPdJpHwNKWof	Cracked Rear View	1994	https://i.scdn.co/image/ab67616d0000b273820d2376b2fb84aa99823903
5K18gTgac0q6Jma5HkV1vA	37w38cCSGgKLdayTRjna4W	So Tonight That I Might See	1993	https://i.scdn.co/image/ab67616d0000b27389a392107ebd79818022b3ea
2HyJKdwnnaM156kvcPDwr8	4bthk9UfsYUYdcFyqxmSUU	Rule The World: The Greatest Hits	2017	https://i.scdn.co/image/ab67616d0000b273a9fac36898dc1302b5f642b3
58HZZpS0wxJKwGjoerg0mk	4pejUc4iciQfgdX6OKulQn	Songs For The Deaf	2002	https://i.scdn.co/image/ab67616d0000b2739b62c36a1f8ac00d60f460cc
0xAjncT0noqLbBH6iT4HjH	7qKoy46vPnmIxKCN6ewBG4	This Is Me...Justified and Stripped (Live)	2004	https://i.scdn.co/image/ab67616d0000b2735a802d724e98398a7fa7ceee
7cuwWzS0oiApEt2fpKafkX	1eClJfHLoDI4rZe5HxzBFv	Kick	1987	https://i.scdn.co/image/ab67616d0000b2734053ce7818f114a4e8dde08f
05kYWbiEVwGcd2Y2wolwWz	2iul6etLF5hjjpxo43rzz7	Plays Well With Others	2018	https://i.scdn.co/image/ab67616d0000b27385f03546f2dc91930b99874a
15k99o4mZJ9mfpQGIOrZ45	73sIBHcqh3Z3NyqHKZ7FOL	Summer Pack	2018	https://i.scdn.co/image/ab67616d0000b273602ca5b83fe44b68074a74b2
5zi7WsKlIiUXv09tbGLKsE	4V8LLVI7PbaPR0K2TGSxFF	IGOR	2019	https://i.scdn.co/image/ab67616d0000b2737005885df706891a3c182a57
2ninxvLuYGCb6H92qTaSFZ	3oDbviiivRWhXwIE8hxkVV	Greatest Hits	2012	https://i.scdn.co/image/ab67616d0000b27387ff937488599a929a5bfff5
1V8qUSg1WAHf3dCrVYdJ5Z	6loBF9iQdE11WSX29fNKqY	Dream Into Action	1985	https://i.scdn.co/image/ab67616d0000b2734b230178ff0f22cba27d7092
0qnHA4SDco9mPuWGzDqVDK	7guDJrEfX3qb6FEbdPA5qi	Up-Tight	1966	https://i.scdn.co/image/ab67616d0000b273c82a59431ee475300e2f618a
511e7X2zYDqPWQGADatYz2	0YHgnSkV3S5mvSSCTRWDi5	Friends With the Enemy	2011	https://i.scdn.co/image/ab67616d0000b2731706371ccf790d7ec8d0e0a4
7vNmiLEdMqJYUlPxSx2zgg	57bUPid8xztkieZfS7OlEV	I Hear A Symphony	1966	https://i.scdn.co/image/ab67616d0000b27316a6e92d6f1c8a02d68b4e44
4uiVwLbTzE6VMkXpaDAwB8	0X380XXQSNBYuleKzav5UO	The Fragile	1999	https://i.scdn.co/image/ab67616d0000b27378b860d90b266bfcd7e4c0be
1yIqauTni1V7l7djYAKSsZ	0bzfPKdbXL5ezYW2z3UGQj	KIWANUKA	2019	https://i.scdn.co/image/ab67616d0000b27360ada139840fb439d6750f27
6GphKx2QAPRoVGWE9D7ou8	3oDbviiivRWhXwIE8hxkVV	Pet Sounds (Original Mono & Stereo Mix Versions)	1966	https://i.scdn.co/image/ab67616d0000b273bde8dfd1922129f3d9e3732f
51C65YqHrDODM1hD5FEL5x	2YZyLoL8N0Wb9xBt1NhZWg	i	2014	https://i.scdn.co/image/ab67616d0000b2736d89f336fbfbdf2089701da0
7GpuEZzRrPT4IGiEuWaBzy	5eIbEEQnDM8yuDVB0bimSP	NOVA	2018	https://i.scdn.co/image/ab67616d0000b273eded2e9bae0cba9092424797
6XBKxM9rbzyOBP6gpE0qhd	3pkmfqaBNsMqnXus05PNfP	White People	2004	https://i.scdn.co/image/ab67616d0000b27381eac8fc86e62529641d803c
4uP43hIpmEEDuW7aOfiU2C	20wkVLutqVOYrc0kxFs7rA	Pilgrim's Paradise	2015	https://i.scdn.co/image/ab67616d0000b273a117ac19ee51aebdf05fe88c
1bTjSqotSDtUjcwFfukTQP	1mFX1QlezK1lNPKQJkhwWb	Heart Break	1988	https://i.scdn.co/image/ab67616d0000b273c31996a0e8cacc4c908249ca
6thSjE17RxW8tJFtLyXA3B	7guDJrEfX3qb6FEbdPA5qi	I Was Made To Love Her	1967	https://i.scdn.co/image/ab67616d0000b2733acbc801a982cbd02bc782c9
5wpZhWqsoXKBcVwvcEtCvv	0VbDAlm2KUlKI5UhXRBKWp	Electric Feel	2017	https://i.scdn.co/image/ab67616d0000b2739024f71abb56e984f5d9eb4d
4v9R5sk4HQ0X1krbEis34P	7KGqvFukcZRbQ7YFsYrgPa	Dreamin' Wild	1979	https://i.scdn.co/image/ab67616d0000b273556966ae0ac93e2aa1c3896a
0K3FiXt6ekJTWaUku3LpHL	6PEMFpe3PTOksdV4ZXUpbE	Yes Lawd!	2016	https://i.scdn.co/image/ab67616d0000b27313160a2de88c7be0adebb043
2aaWMtuGxw17AZpKhZGdXQ	4hz8tIajF2INpgM0qzPJz2	RKS	2015	https://i.scdn.co/image/ab67616d0000b2739e16f54ce1b5f9e1d8196ba3
4hruYceqit29o6m4arpAql	5wFXmYsg3KFJ8BDsQudJ4f	A Black Mile To The Surface	2017	https://i.scdn.co/image/ab67616d0000b2736827146a676dafc0357fa665
0vVekV45lOaVKs6RZQQNob	2ooIqOf4X2uz4mMptXCtie	In the Aeroplane Over the Sea	1998	https://i.scdn.co/image/ab67616d0000b273589ce9a911c6e65b1f80c558
17l7MIu0Jh0tdgK7or9ovw	1KP6TWI40m7p3QBTU6u2xo	Dopamine	2015	https://i.scdn.co/image/ab67616d0000b273cc2cf912462d8ae4ef856434
0y3tRiTDYzj5IuQb0Kk86x	1MIe1z4RdqLqHSJsb7EBMm	It’s Not All That Bad	2015	https://i.scdn.co/image/ab67616d0000b273069740bb736206138c87f7e8
15RYnRTIMHrCB6X3HjK2mC	4hz8tIajF2INpgM0qzPJz2	Mary (b-sides)	2019	https://i.scdn.co/image/ab67616d0000b273e81cd26a5fc0e1106cc5c747
4lGNpgFI67TUq5BMfnPe3Z	4hz8tIajF2INpgM0qzPJz2	Seven + Mary	2013	https://i.scdn.co/image/ab67616d0000b27317d131d429c783666c929d6b
3pWJFrSX6apPzt4inM4zXt	4l1cKWYW591xnwEGxpUg3J	iii	2016	https://i.scdn.co/image/ab67616d0000b27306eda68098c2a886a43685a8
2PIWPTOIxbaVSjTnc30vXS	0YrtvWJMgSdVrk3SfNjTbx	Asphalt Meadows	2022	https://i.scdn.co/image/ab67616d0000b273b808f709e7d5ed8e79cec246
05LEST8E8mkEIl2LRfUkcI	360IAlyVv4PCEVjgyMZrxK	War & Leisure	2017	https://i.scdn.co/image/ab67616d0000b2735e9dff10c31ac14c6c6c920d
6gtu2oXhmDQN8TAsWimZbj	1fZpYWNWdL5Z3wrDtISFUH	Tomorrow	2016	https://i.scdn.co/image/ab67616d0000b273d9e9693926785359f903acb5
493HYe7N5pleudEZRyhE7R	360IAlyVv4PCEVjgyMZrxK	All I Want Is You	2010	https://i.scdn.co/image/ab67616d0000b273d5a8395b0d80b8c48a5d851c
7kb2GfJGvn8Gr0LCGBSQjZ	0AkmSuTOzM2pNCIOSP8ziv	Volume 1	2018	https://i.scdn.co/image/ab67616d0000b273440d3f67a167757157bfb050
5CPwacWmIAaA5DLUq7EHUC	3dv4Q4q3LWOnbLJnC6GgTY	Harmless Melodies	2016	https://i.scdn.co/image/ab67616d0000b2731fffb4d9edbbc0426938bdcf
3YKQkIPHtWGuvkBeVNIMhg	60df5JBRRPcnSpsIMxxwQm	The Soul Album	1966	https://i.scdn.co/image/ab67616d0000b2734b56389fb1e78b2b3ab443d8
7ezeSBh9E63ijDAxn8Ke4P	360IAlyVv4PCEVjgyMZrxK	The Get Down: Original Soundtrack From The Netflix Original Series (Deluxe Version)	2016	https://i.scdn.co/image/ab67616d0000b273e3ece277a4777d53cc8a6046
3PsFboiPeObjAc6gbQHt54	3JaAGmSTpJK35DqWrDUzBz	Desolation Boulevard	1974	https://i.scdn.co/image/ab67616d0000b273bff2e9307284c5375b2a407a
1XoE7ZirQ3gjxq8HIzTJU9	3U3zr5PCRa9ty74uN46iBa	COWBOY BEBOP (Original Motion Picture Soundtrack)	1998	https://i.scdn.co/image/ab67616d0000b273e90a54d6e31d9ff3f1d566fa
0vuwlanMPucXrYMGnOjhYL	0EdvGhlC1FkGItLOWQzG4J	40oz. To Freedom	1992	https://i.scdn.co/image/ab67616d0000b273d77299e3d29f44495cd7fbcb
2FZNWUmgRoP8uJZBaHJdfj	7lzordPuZEXxwt9aoVZYmG	Rebel Yell	1983	https://i.scdn.co/image/ab67616d0000b273ea07dca8b4ca808c1e5b17fb
1ZH5g1RDq3GY1OvyD0w0s2	3RGLhK1IP9jnYFH4BRFJBS	Combat Rock (Remastered)	1982	https://i.scdn.co/image/ab67616d0000b27325a4df452a3c42ccc2e9288b
2jnV6ytZOmt71iEC5xHEYz	33EUXrFKGjpUSGacqEHhU4	Lust For Life	1977	https://i.scdn.co/image/ab67616d0000b2734aa5f679427e35409a06f225
02OIGj20Ltaa8rN8mKsHBT	2CVBumuL5KyztqCyo7CETY	Jet Boy	1978	https://i.scdn.co/image/ab67616d0000b27360b02c400bf170f44f8c75d9
48D1hRORqJq52qsnUYZX56	0oSGxfWSnnOXhD2fKuz2Gy	The Rise and Fall of Ziggy Stardust and the Spiders from Mars (2012 Remaster)	1972	https://i.scdn.co/image/ab67616d0000b273c41f4e1133b0e6c5fcf58680
440zYLMcBZhHc93WSGKDKo	5aBEGOeWQCJfptic9xyaAb	Everything!	1984	https://i.scdn.co/image/ab67616d0000b273768d2a36068dd1adcaa1f31b
4aW4iDepQUl5ZCHd1Gli68	0fA0VVWsXO9YnASrzqfmYu	Entergalactic	2022	https://i.scdn.co/image/ab67616d0000b27371cecf4c653a4bad539da13d
5Y0p2XCgRRIjna91aQE8q7	3yY2gUcIsjMr8hjo51PoJ8	The Queen Is Dead	1986	https://i.scdn.co/image/ab67616d0000b273ada101c2e9e97feb8fae37a9
2K2u7usRIF03pywk6qxGlM	4wYk01oPJNfaEssVFL46oQ	Going Mainstream	2021	https://i.scdn.co/image/ab67616d0000b273eda96f4688e29241aaa0e9c3
2qcwXvluk9iFwNNg4eDBXm	0Zy4ncr8h1jd7Nzr9946fD	Night Time	1985	https://i.scdn.co/image/ab67616d0000b2736a0553ce3c8ed791ef923887
0UHxylrPIp6GtS7EJlfwRU	2to6ZW4W0XOZZsztSErr0b	텔 미 썸딩 Original Motion Picture Soundtrack	2013	https://i.scdn.co/image/ab67616d0000b2731c645c5d77965301276531a7
5m1BQr6SaEOxEl7Pz6fba2	5VF0YkVLeVD4ytyiyVSIiF	The Socialites (Remixes)	2013	https://i.scdn.co/image/ab67616d0000b273313aeac150aaedbb3ed2e690
3gz1CZk5wFg2inBuUWDa8x	2ZfogSsOWP4mVfEqfpLXCt	Starfish	1988	https://i.scdn.co/image/ab67616d0000b2734b75b4c598bbf7c852d3b3fe
151w1FgRZfnKZA9FEcg9Z3	06HL4z0CvFAxyc27GXpf02	Midnights	2022	https://i.scdn.co/image/ab67616d0000b273bb54dde68cd23e2a268ae0f5
0Dt3FbpMQwjoT5KNAw0IXR	00FQb4jTyendYWaN8pK0wa	Born To Die – Paradise Edition (Special Version)	2012	https://i.scdn.co/image/ab67616d0000b273f894be72a77b1488292672c7
1D92WOHWUI2AGQCCdplcXL	00FQb4jTyendYWaN8pK0wa	Young And Beautiful	2013	https://i.scdn.co/image/ab67616d0000b273d7fb3e4c63020039d1cff6b2
5XpEKORZ4y6OrCZSKsi46A	00FQb4jTyendYWaN8pK0wa	Norman Fucking Rockwell!	2019	https://i.scdn.co/image/ab67616d0000b273879e9318cb9f4e05ee552ac9
1ORxRsK3MrSLvh7VQTF01F	00FQb4jTyendYWaN8pK0wa	Ultraviolence (Deluxe)	2014	https://i.scdn.co/image/ab67616d0000b2731624590458126fc8b8c64c2f
7g7WzMzTLLOyTSzVUnJACI	462T0buQ5ScBUQCRpodDRf	Changes	2016	https://i.scdn.co/image/ab67616d0000b273b87c50881c048df7a48f4159
6llfJp31mi9r7swqmSAwuK	462T0buQ5ScBUQCRpodDRf	No Time For Dreaming	2011	https://i.scdn.co/image/ab67616d0000b2735299f13d4459546003c9e488
3rimYQyKq7BatxuUoPIBrb	462T0buQ5ScBUQCRpodDRf	Victim of Love	2013	https://i.scdn.co/image/ab67616d0000b27300da03216eb2a67144e8837c
1YgekJJTEueWDaMr7BYqPk	0du5cEVh5yTK9QJze8zA0C	An Evening With Silk Sonic	2021	https://i.scdn.co/image/ab67616d0000b273fcf75ead8a32ac0020d2ce86
0152qvGv0mmX2vU36Rocng	5p7f24Rk5HkUZsaS3BLG5F	Coast	2022	https://i.scdn.co/image/ab67616d0000b273f5397a412658c978232a1c10
1o8zUe3QYHV42SHSsg6ffu	6PEMFpe3PTOksdV4ZXUpbE	Where I Go (feat. H.E.R.)	2022	https://i.scdn.co/image/ab67616d0000b2733b1f0c3fe1a33f9fd2d88dc5
4VZ7jhV0wHpoNPCB7Vmiml	0du5cEVh5yTK9QJze8zA0C	An Evening With Silk Sonic	2021	https://i.scdn.co/image/ab67616d0000b273d0bbd3ea2ec554f17a6603cc
4VFG1DOuTeDMBjBLZT7hCK	3jK9MiCrA42lLAdMGUZpwa	Malibu	2016	https://i.scdn.co/image/ab67616d0000b273f8e77075414234fd77fce32b
21KIagsx1ZvYcv0sVkEAWv	3qnGvpP8Yth1AqSBMqON5x	Coming Home (Deluxe)	2015	https://i.scdn.co/image/ab67616d0000b273a8df0c930a741d6f49cc3f8d
4HFO9PDRxsdbcegkcNhxgz	2mVVjNmdjXZZDvhgQWiakk	Texas Sun	2020	https://i.scdn.co/image/ab67616d0000b273ff26bd277274b27f249cc638
3tRmxSQyoyXXwcVDcUFQic	55fhWPvDiMpLnE4ZzNXZyW	July (feat. Leon Bridges)	2019	https://i.scdn.co/image/ab67616d0000b273acebb58ea70a6e5ff1c4d261
7J9fifadXb0PPSBWXctbi8	3qnGvpP8Yth1AqSBMqON5x	Good Thing	2018	https://i.scdn.co/image/ab67616d0000b273a47ee7a49c53ccdcb38dc874
2Xs9xSBhvyo8F6daRc1npu	2mVVjNmdjXZZDvhgQWiakk	Texas Moon	2022	https://i.scdn.co/image/ab67616d0000b27328e12bc569f20d9f8ebff84c
3MATDdrpHmQCmuOcozZjDa	13ubrt8QOOCPljQ2FL1Kca	TESTING	2018	https://i.scdn.co/image/ab67616d0000b2739feadc48ab0661e9b3a9170b
3AlyvIIMZyT5LjWFeK5LSl	13ubrt8QOOCPljQ2FL1Kca	Sundress	2018	https://i.scdn.co/image/ab67616d0000b2731ae967e4a02c7a39eb3c189b
3arNdjotCvtiiLFfjKngMc	13ubrt8QOOCPljQ2FL1Kca	AT.LONG.LAST.A$AP	2015	https://i.scdn.co/image/ab67616d0000b27381a6a2cafab2e7a4066b5eec
6rzMufuu8sLkIizM4q9c7J	13ubrt8QOOCPljQ2FL1Kca	LONG.LIVE.A$AP (Deluxe Version)	2013	https://i.scdn.co/image/ab67616d0000b2732ae92030b51fb8135d694af9
7IKkHmEk4It4cRdOYanyvW	50co4Is1HCEo8bhOyUWKpn	Punk	2021	https://i.scdn.co/image/ab67616d0000b273f8d415dab5ed7e3747bd38dd
02KFVEA5tnY0YnypmWY1tz	4V8LLVI7PbaPR0K2TGSxFF	Potato Salad	2018	https://i.scdn.co/image/ab67616d0000b273215cac8c30b47bb1bfb9d2d1
71udkw2yxFqNK4SNSYcCce	6pmxr66tMAePxzOLfjGNcX	The Flying Club Cup	2007	https://i.scdn.co/image/ab67616d0000b273a5818379975d1815f7f4e1b2
4yP7cyoeE3F6EyJPZ9v47V	6pmxr66tMAePxzOLfjGNcX	Gulag Orkestar	2006	https://i.scdn.co/image/ab67616d0000b2736ad0ccb944d30d7e47d26c9a
26G7PfSLTyLiIcITVl7GAK	6pmxr66tMAePxzOLfjGNcX	Artifacts	2022	https://i.scdn.co/image/ab67616d0000b273d34ab0a2566efc1bcab2d090
7HYptJX2aQJPWbxXviXLwQ	6pmxr66tMAePxzOLfjGNcX	The Rip Tide	2011	https://i.scdn.co/image/ab67616d0000b273c5949c3f16dc658aed9a2c73
6iAOkTDFRiWHVNNUjBqIxT	6pmxr66tMAePxzOLfjGNcX	No No No	2015	https://i.scdn.co/image/ab67616d0000b27362a1baec692cd616425c879e
45RV070mrplPB5gMO6Q136	6pmxr66tMAePxzOLfjGNcX	Gallipoli	2019	https://i.scdn.co/image/ab67616d0000b273af0de52ff95a42354790e21f
0hMh7RDyxuRD5AoTdh72DN	6QRlkjrHz5A62mqeNZz7t3	Floating Features	2018	https://i.scdn.co/image/ab67616d0000b27348170c8f8e5019f05f034e9a
3B2xgIcoHjm1HdHYDydoUu	6QRlkjrHz5A62mqeNZz7t3	It's Alive	2013	https://i.scdn.co/image/ab67616d0000b2735fb94199e9cef141cba5c038
1b42c8tkc0fLhiLprU1jiX	6QRlkjrHz5A62mqeNZz7t3	Weirdo Shrine	2015	https://i.scdn.co/image/ab67616d0000b273cef715f31e55c61ab008ac69
17WOu1wHd6KdSO2Z0HRz6w	6QRlkjrHz5A62mqeNZz7t3	La Luz	2021	https://i.scdn.co/image/ab67616d0000b2730267086fc351092028382016
1kSTHq1yseNNxYpM48o3ry	6QRlkjrHz5A62mqeNZz7t3	Endless Afternoon	2022	https://i.scdn.co/image/ab67616d0000b273ab6c128b34b0530a2e099f31
6k3vC8nep1BfqAIJ81L6OL	3XHO7cRUPCLOr6jwp8vsx5	An Awesome Wave	2012	https://i.scdn.co/image/ab67616d0000b273028c3bb4b81ee71dd73d1596
4oktVvRuO1In9B7Hz0xm0a	3XHO7cRUPCLOr6jwp8vsx5	This Is All Yours	2014	https://i.scdn.co/image/ab67616d0000b27311b3df35e2e46d91f585afd9
5ogYKSRRlVAgMzv09HFeIn	3XHO7cRUPCLOr6jwp8vsx5	The Dream	2022	https://i.scdn.co/image/ab67616d0000b273c44ea63878762e1f3791a551
4Tg1YeHrSMEUVsGiYfkSm3	1Tp7C6LzxZe9Mix6rn4zbI	Surefire (Gus alt-j Remix)	2022	https://i.scdn.co/image/ab67616d0000b27370fc2e1e34f45b817d351abc
7bvUQdrsKA3o6lkjV1ZRPk	5CuU6SRJjbbZL926nSGGxX	Component System with the Auto Reverse	2022	https://i.scdn.co/image/ab67616d0000b27391cd02c1fe687d860916d4f5
1VDnqZVFSg0xVF104kaIix	5CuU6SRJjbbZL926nSGGxX	Brick Body Kids Still Daydream	2017	https://i.scdn.co/image/ab67616d0000b2737092bbc13520b5e56962a059
7BlWNRjwKnLrf7yf0VdSvg	5CuU6SRJjbbZL926nSGGxX	A Special Episode - EP	2015	https://i.scdn.co/image/ab67616d0000b273ce58aacb3d91630e348ffa61
3mH6qwIy9crq0I9YQbOuDf	2h93pZq0e7k5yf4dywlkpM	Blonde	2016	https://i.scdn.co/image/ab67616d0000b273c5649add07ed3720be9d5526
392p3shh2jkxUxY2VHvlH8	2h93pZq0e7k5yf4dywlkpM	channel ORANGE	2012	https://i.scdn.co/image/ab67616d0000b2737aede4855f6d0d738012e2e5
3RYdEXhGHojkTILUdtnRVJ	2h93pZq0e7k5yf4dywlkpM	Novacane	2011	https://i.scdn.co/image/ab67616d0000b27359a428dc7ef8e0c12b0fe18a
71VX8yv9T2hNIYVZJVUWVp	2h93pZq0e7k5yf4dywlkpM	In My Room	2019	https://i.scdn.co/image/ab67616d0000b273db974f9533dd9b362891b5db
6OGzmhzHcjf0uN9j7dYvZH	2h93pZq0e7k5yf4dywlkpM	Chanel	2017	https://i.scdn.co/image/ab67616d0000b273a0b780c23fc3c19bd412b234
\.


--
-- Data for Name: artists; Type: TABLE DATA; Schema: public; Owner: cnicosia
--

COPY public.artists (artist_id, name, popularity, followers, img_url) FROM stdin;
0qu422H5MOoQxGjd4IzHbS	Yves Tumor	56	256312	https://i.scdn.co/image/ab6761610000e5eb1812767b709d74a801c0e487
65dGLGjkw3UbddUg2GKQoZ	BADBADNOTGOOD	62	633586	https://i.scdn.co/image/ab6761610000e5eb61d28b161209f1ee239fdafa
4lujUKeO6nQAJXpq37Epn7	Son Little	53	136096	https://i.scdn.co/image/ab6761610000e5eb7321188756fe1f5d4b554797
6ltzsmQQbmdoHHbLZ4ZN25	Lord Huron	71	1136630	https://i.scdn.co/image/ab6761610000e5eb1d4e4e7e3c5d8fa494fc5f10
0YrtvWJMgSdVrk3SfNjTbx	Death Cab for Cutie	64	1410747	https://i.scdn.co/image/ab6761610000e5eb378adae733fc578108e3f534
0bzfPKdbXL5ezYW2z3UGQj	Michael Kiwanuka	63	1242419	https://i.scdn.co/image/ab6761610000e5eb413f9f82bd7d821ae0195d67
3M4ThdJR28z9eSMcQHAZ5G	The Fratellis	60	767701	https://i.scdn.co/image/ab6761610000e5ebd693efe23dcda7b9595e77ec
30DhU7BDmF4PH0JVhu8ZRg	Sabrina Claudio	62	1442495	https://i.scdn.co/image/ab6761610000e5eb4ed63962edc0f1817bc349fb
360IAlyVv4PCEVjgyMZrxK	Miguel	76	4254287	https://i.scdn.co/image/ab6761610000e5eb02eeb5305fa7bdd9ddca42fc
34jw2BbxjoYalTp8cJFCPv	Heart	65	2100185	https://i.scdn.co/image/1c145626e516a6817c43e7eab2b1cc3a5a9562a8
5Q81rlcTFh3k6DQJXPdsot	Mura Masa	63	625158	https://i.scdn.co/image/ab6761610000e5eb506f6e096e31255e20668074
2YZyLoL8N0Wb9xBt1NhZWg	Kendrick Lamar	87	21848878	https://i.scdn.co/image/ab6761610000e5eb437b9e2a82505b3d93ff1022
4hz8tIajF2INpgM0qzPJz2	Rainbow Kitten Surprise	67	805287	https://i.scdn.co/image/ab6761610000e5eb1b8f08f741213f04e4c3a25a
1Xyo4u8uXC1ZmMpatF05PJ	The Weeknd	93	51865906	https://i.scdn.co/image/ab6761610000e5ebb5f9e28219c169fd4b9e8379
7CyeXFnOrfC1N6z4naIpgo	The Ronettes	59	220375	https://i.scdn.co/image/ab6761610000e5ebc47897b69089f59e31817f26
55VydwMyCuGcavwPuhutPL	The Used	62	1037056	https://i.scdn.co/image/ab6761610000e5eb779c0b2354fc5392c1378290
08ct2eZF5lUPdJpHwNKWof	Hootie & The Blowfish	58	963879	https://i.scdn.co/image/ab6761610000e5eb783a64d2e0fbfdaed9114594
37w38cCSGgKLdayTRjna4W	Mazzy Star	64	795025	https://i.scdn.co/image/d14e353d562d68036916c64a13912772cf7df91c
4bthk9UfsYUYdcFyqxmSUU	Tears For Fears	72	2580891	https://i.scdn.co/image/ab6761610000e5eb42ed2cb48c231f545a5a3dad
4pejUc4iciQfgdX6OKulQn	Queens of the Stone Age	68	3082644	https://i.scdn.co/image/ab6761610000e5ebc194721f2ca5433bc78b0e74
7qKoy46vPnmIxKCN6ewBG4	Butch Walker	38	43700	https://i.scdn.co/image/ab6761610000e5eb0dc5c48012477ce1d87953c4
1eClJfHLoDI4rZe5HxzBFv	INXS	68	2201645	https://i.scdn.co/image/ab6761610000e5eb9bfd44c9bd2aae22edfd99bf
2iul6etLF5hjjpxo43rzz7	Lera Lynn	42	82789	https://i.scdn.co/image/ab6761610000e5ebde10fb8cd40da4e0af316b77
73sIBHcqh3Z3NyqHKZ7FOL	Childish Gambino	77	9948760	https://i.scdn.co/image/ab6761610000e5eb3ef779aa0d271adb2b6a3ded
4V8LLVI7PbaPR0K2TGSxFF	Tyler, The Creator	83	9814283	https://i.scdn.co/image/ab6761610000e5eb8278b782cbb5a3963db88ada
3oDbviiivRWhXwIE8hxkVV	The Beach Boys	70	3858884	https://i.scdn.co/image/ab6761610000e5eb92602f233ce2295748f44603
5wFXmYsg3KFJ8BDsQudJ4f	Manchester Orchestra	60	471334	https://i.scdn.co/image/ab6761610000e5eb642fbb74e3e7507c12d8b8fd
2ooIqOf4X2uz4mMptXCtie	Neutral Milk Hotel	55	604349	https://i.scdn.co/image/731f5f71de27c36300d2cf71a7f9cd7f389d0bf7
1KP6TWI40m7p3QBTU6u2xo	BØRNS	66	1101535	https://i.scdn.co/image/ab6761610000e5eb6308e79c621076395807b455
1MIe1z4RdqLqHSJsb7EBMm	The Greeting Committee	51	106438	https://i.scdn.co/image/ab6761610000e5eb7f25f8a78585d6b5cda70a3f
4l1cKWYW591xnwEGxpUg3J	Miike Snow	54	614778	https://i.scdn.co/image/b3944378d08ba28b16c494cc7f63703175169251
1fZpYWNWdL5Z3wrDtISFUH	Shakey Graves	58	461921	https://i.scdn.co/image/ab6761610000e5ebe4368448c8f76d21de6a5c1d
0AkmSuTOzM2pNCIOSP8ziv	Amigo the Devil	50	108974	https://i.scdn.co/image/ab6761610000e5eb757280ee844ac5714b919648
3dv4Q4q3LWOnbLJnC6GgTY	Yellow Days	52	443137	https://i.scdn.co/image/ab6761610000e5eb3a007701f172556b9e917b1e
60df5JBRRPcnSpsIMxxwQm	Otis Redding	67	1999513	https://i.scdn.co/image/4ad89c805aff0fb76b01b6b62b39e21fcd8943c3
3JaAGmSTpJK35DqWrDUzBz	Sweet	57	385899	https://i.scdn.co/image/ab6761610000e5eb29a247c0aac9cbe94bc47865
3U3zr5PCRa9ty74uN46iBa	SEATBELTS	53	83527	https://i.scdn.co/image/ab67616d0000b273e90a54d6e31d9ff3f1d566fa
0EdvGhlC1FkGItLOWQzG4J	Sublime	68	2357803	https://i.scdn.co/image/ab6761610000e5ebe726280500259dbdb97a8be4
7lzordPuZEXxwt9aoVZYmG	Billy Idol	67	1525485	https://i.scdn.co/image/ab6761610000e5ebd42c6334786bfdea92beeb5d
3RGLhK1IP9jnYFH4BRFJBS	The Clash	69	2410319	https://i.scdn.co/image/ab470b275daa38351810a1eb91d107ebdb821302
33EUXrFKGjpUSGacqEHhU4	Iggy Pop	62	1379211	https://i.scdn.co/image/ab6761610000e5eb21e6d14c3d8aab9887380d00
2CVBumuL5KyztqCyo7CETY	Elton Motello	20	2477	https://i.scdn.co/image/c6cd62c680a2993e07f4cd430140be441af6572e
0oSGxfWSnnOXhD2fKuz2Gy	David Bowie	76	8653194	https://i.scdn.co/image/ab6761610000e5ebb78f77c5583ae99472dd4a49
5aBEGOeWQCJfptic9xyaAb	Tones On Tail	35	58734	https://i.scdn.co/image/ab67616d0000b273768d2a36068dd1adcaa1f31b
0fA0VVWsXO9YnASrzqfmYu	Kid Cudi	81	6113252	https://i.scdn.co/image/ab6761610000e5eb876faa285687786c3d314ae0
3yY2gUcIsjMr8hjo51PoJ8	The Smiths	74	3617311	https://i.scdn.co/image/481b980af463122013e4578c08fb8c5cbfaed1e9
4wYk01oPJNfaEssVFL46oQ	Coast Modern	48	172189	https://i.scdn.co/image/ab6761610000e5eb0ea1b10e5b675d3f364927f4
0Zy4ncr8h1jd7Nzr9946fD	Killing Joke	49	268095	https://i.scdn.co/image/ab6761610000e5ebb27c2f14d0deaac56f64c1f4
2mVVjNmdjXZZDvhgQWiakk	Khruangbin	\N	\N	\N
55fhWPvDiMpLnE4ZzNXZyW	Noah Cyrus	\N	\N	\N
6loBF9iQdE11WSX29fNKqY	Howard Jones	49	360041	https://i.scdn.co/image/ab6761610000e5eb93e7c004e39b91f88d1088af
7guDJrEfX3qb6FEbdPA5qi	Stevie Wonder	74	5847634	https://i.scdn.co/image/c59faacbed7aa770266bad048660810eca204108
0YHgnSkV3S5mvSSCTRWDi5	Poor Mans Poison	62	153844	https://i.scdn.co/image/ab6761610000e5eb7e8b8316444011b2555929f0
57bUPid8xztkieZfS7OlEV	The Supremes	61	1494042	https://i.scdn.co/image/5c5dc3f7b4569a7727a63a44513c7a602b72da44
0X380XXQSNBYuleKzav5UO	Nine Inch Nails	65	2161412	https://i.scdn.co/image/ab6761610000e5eb047095c90419cf2a97266f77
5eIbEEQnDM8yuDVB0bimSP	RL Grime	59	394306	https://i.scdn.co/image/ab6761610000e5eb8839d67ee5f8963a1ba5458f
3pkmfqaBNsMqnXus05PNfP	Handsome Boy Modeling School	44	127323	https://i.scdn.co/image/ab6761610000e5ebeb049e8fe237761c3ca58fcf
20wkVLutqVOYrc0kxFs7rA	Daniel Caesar	76	3551511	https://i.scdn.co/image/ab6761610000e5ebbd09edfd2babfc9fd2ba748e
1mFX1QlezK1lNPKQJkhwWb	New Edition	56	1390593	https://i.scdn.co/image/44e1b32aa085bd943fabd36678804d3fd3b8fb67
0VbDAlm2KUlKI5UhXRBKWp	Henry Green	50	59451	https://i.scdn.co/image/ab6761610000e5eb6dabc1aa79f0541b26cd1835
7KGqvFukcZRbQ7YFsYrgPa	Donnie & Joe Emerson	42	24620	https://i.scdn.co/image/ab6761610000e5eb1d8289c5a98c178330f4fc32
6PEMFpe3PTOksdV4ZXUpbE	NxWorries	57	223274	https://i.scdn.co/image/ab6761610000e5eb89fa062521347470d69ba4c2
2to6ZW4W0XOZZsztSErr0b	The Bad Seeds	28	1182	https://i.scdn.co/image/ab67616d0000b273815d428841386dcb20fb6840
5VF0YkVLeVD4ytyiyVSIiF	Dirty Projectors	42	245420	https://i.scdn.co/image/ab6761610000e5ebef25da450464164f5cd5158b
2ZfogSsOWP4mVfEqfpLXCt	The Church	49	193822	https://i.scdn.co/image/ab6761610000e5ebf87738dae4fe74422080fa5c
00FQb4jTyendYWaN8pK0wa	Lana Del Rey	88	18506639	https://i.scdn.co/image/ab6761610000e5ebc5903678d3db18e271e42be0
462T0buQ5ScBUQCRpodDRf	Charles Bradley	56	434193	https://i.scdn.co/image/ab6761610000e5eb5b855b0ad3f90d4addabf7f2
3jK9MiCrA42lLAdMGUZpwa	Anderson .Paak	77	2247168	https://i.scdn.co/image/ab6761610000e5eb96287bd47570ff13f0c01496
3qnGvpP8Yth1AqSBMqON5x	Leon Bridges	70	1459044	https://i.scdn.co/image/ab6761610000e5ebc1493f8c442935b396753e21
13ubrt8QOOCPljQ2FL1Kca	A$AP Rocky	80	11459713	https://i.scdn.co/image/ab6761610000e5ebee452efcf24aa4124fb28d94
6QRlkjrHz5A62mqeNZz7t3	La Luz	41	68272	https://i.scdn.co/image/ab6761610000e5eb3622bf879af58458f4172ba9
5CuU6SRJjbbZL926nSGGxX	Open Mike Eagle	45	110993	https://i.scdn.co/image/ab6761610000e5eb07e639e91b9008358ff864ec
6pmxr66tMAePxzOLfjGNcX	Beirut	56	936880	https://i.scdn.co/image/ab6761610000e5eb2d8bf7cc9fdf477efeede65f
3XHO7cRUPCLOr6jwp8vsx5	alt-J	68	3068900	https://i.scdn.co/image/ab6761610000e5eb3fb5214e667e278a20878a6b
2h93pZq0e7k5yf4dywlkpM	Frank Ocean	82	10157249	https://i.scdn.co/image/ab6761610000e5ebfbc3faec4a370d8393bee7f1
6eU0jV2eEZ8XTM7EmlguK6	Black Pumas	58	746157	https://i.scdn.co/image/ab6761610000e5eb026d3ed0a2800958c1d59f4f
1zXCFUgH6FWS0iCiCKsH55	Kai Straw	48	36834	https://i.scdn.co/image/ab6761610000e5eb14e7649374fe27bf1c5a72c0
3z6Gk257P9jNcZbBXJNX5i	Regina Spektor	61	1301985	https://i.scdn.co/image/ab6761610000e5eba36a9f95d59ab791d5e897e9
74oJ4qxwOZvX6oSsu1DGnw	Cream	61	2028524	https://i.scdn.co/image/aab6a0a0e9ca2ab17460b0451e59ba507cc5802a
0XSqX2PB3C5dTMv7SZaxSm	Wolf Parade	40	150731	https://i.scdn.co/image/ab6761610000e5ebe0ee9d6c0075af4fabb763bb
08GQAI4eElDnROBrJRGE0X	Fleetwood Mac	78	8896977	https://i.scdn.co/image/ab6761610000e5eb249d55f2d68a44637905c57e
6l3HvQ5sa6mXTsMTB19rO5	J. Cole	84	18236814	https://i.scdn.co/image/ab6761610000e5ebadd503b411a712e277895c8a
6RZUqkomCmb8zCRqc9eznB	Placebo	65	1672372	https://i.scdn.co/image/ab6761610000e5ebc8b42133fea50275b77f45e2
6ZK2nrW8aCTg8Bid7I7N10	Chelsea Wolfe	49	246334	https://i.scdn.co/image/ab6761610000e5ebb4de2ca8852a45b57575bde8
6TVVIyd0fsRDGg6WzHKyTP	Durand Jones & The Indications	57	256870	https://i.scdn.co/image/ab6761610000e5ebe8611a96977e7c7a04a1fbdf
6tkrcmVfWoHC4WOhE7IDyq	Lost Dog Street Band	45	94174	https://i.scdn.co/image/ab6761610000e5eb115afe5becc81bbc6dd33d69
600GgDUq9kzGJgNIrVsWfz	Habibi	33	32461	https://i.scdn.co/image/ab6761610000e5eba5eb7686c107776ebd315b45
2jgPkn6LuUazBoBk6vvjh5	The Zombies	58	822486	https://i.scdn.co/image/ab6761610000e5eb4bbeb54a562d3de858825979
6v8FB84lnmJs434UJf2Mrm	Neil Young	60	2639715	https://i.scdn.co/image/ab6772690000c46c49b91a07c864561ba7c78ba7
3QTDHixorJelOLxoxcjqGx	SiR	63	743481	https://i.scdn.co/image/ab6761610000e5eb972a4e990fb36451db2f40f2
3ycxRkcZ67ALN3GQJ57Vig	Masego	67	1055714	https://i.scdn.co/image/ab6761610000e5eb161fef4ab6a8ff32c699d6fa
77SW9BnxLY8rJ0RciFqkHh	The Neighbourhood	83	10546129	https://i.scdn.co/image/ab6761610000e5ebdf0b5ac84376a0a4b2166816
5NYEE4kgrEZPlM3DxUsTyc	Twin Temple	43	78580	https://i.scdn.co/image/ab6761610000e5eb4cdf29c756e7fe8eb08851a2
2pAajGWerK3ghwToNWFENS	Puscifer	54	559630	https://i.scdn.co/image/ab6761610000e5ebcba11fb640f2298fe3bd72de
75dQReiBOHN37fQgWQrIAJ	Local Natives	58	614733	https://i.scdn.co/image/ab6761610000e5ebf32fbcfa726d3c7e9a8b0c74
22bE4uQ6baNwSHPVcDxLCe	The Rolling Stones	76	12273396	https://i.scdn.co/image/ab6761610000e5ebd3cb15a8570cce5a63af63d8
5a2EaR3hamoenG9rDuVn8j	Prince	69	6387810	https://i.scdn.co/image/ab6761610000e5ebeaca358712b3fe4ed9814640
6Ghvu1VvMGScGpOUJBAHNH	Deftones	75	3129301	https://i.scdn.co/image/ab6761610000e5eb4b2da0b72cab26ac518f1f0d
4n0gvapwYbRpzU5Ov68B6P	The King Khan & BBQ Show	41	74098	https://i.scdn.co/image/c52c95c28cbf57a5b9b775789799bacadb915292
4uSftVc3FPWe6RJuMZNEe9	Andrew Bird	57	532340	https://i.scdn.co/image/ab6761610000e5eb4bb6b07ebb49a29e623961f4
6AWdGez5g1jxpfl9XD4wI3	Amir Obe	48	130461	https://i.scdn.co/image/ab6761610000e5ebf2bbfca5666eb8c35f438a1f
7HeVXdOdMhLslVputGTZFQ	Timber Timbre	45	186705	https://i.scdn.co/image/ab6761610000e5eb5fc147cc9258d4f029930596
0V7uVrIYr4FwFvUN9S4kYr	Nick Waterhouse	48	89470	https://i.scdn.co/image/ab6761610000e5ebe0108d02daadb928bfbbd68e
6hnWRPzGGKiapVX1UCdEAC	Sam Cooke	65	1408841	https://i.scdn.co/image/ab6761610000e5eb41aaa3a05d2ddba59454273e
2FRXiAz5Uz78LLLSwEUhLt	Miracle Musical	55	235963	https://i.scdn.co/image/ab6761610000e5eb904bf7e11545f9cb5feaf1b2
06HL4z0CvFAxyc27GXpf02	Taylor Swift	\N	\N	\N
7ITd48RbLVpUfheE7B86o2	The Decemberists	53	568514	https://i.scdn.co/image/ab6761610000e5ebad12e7af41c3a1903d1273b8
1yAwtBaoHLEDWAnWR87hBT	Modest Mouse	62	1321018	https://i.scdn.co/image/ab6761610000e5eb3ff03c042ca55bcc7e7f490e
6LufpoVlIYKQCu9Gjpk8B7	Sharon Jones & The Dap-Kings	60	252793	https://i.scdn.co/image/cd0f5585d478bbb91cff3e0b723ed91c6d2046d7
2kGBy2WHvF0VdZyqiVCkDT	Father John Misty	60	707514	https://i.scdn.co/image/ab6761610000e5ebdadc30179c554ac7912f8477
68kEuyFKyqrdQQLLsmiatm	Vince Staples	67	1657925	https://i.scdn.co/image/ab6761610000e5eb53054f8bc7e0153daefe12cc
1hzfo8twXdOegF3xireCYs	Milky Chance	72	1697947	https://i.scdn.co/image/ab6761610000e5eb272b8122de18063dd387a155
251UrhgNbMr15NLzQ2KyKq	Rayland Baxter	54	145330	https://i.scdn.co/image/ab6761610000e5eb3e4fddfb76e55084bdd1479c
4DFhHyjvGYa9wxdHUjtDkc	A Perfect Circle	60	1604351	https://i.scdn.co/image/ab6761610000e5eb41472573351dfea479a4ffba
5IcR3N7QB1j6KBL8eImZ8m	ScHoolboy Q	71	4294224	https://i.scdn.co/image/ab6761610000e5ebe697a7ddf7af3a306428fa73
3tJ9PkBOrG7hFkHeNM2tbw	Olodum	45	179847	https://i.scdn.co/image/c3ef77c1c27ec33d3356ca7665b09aaf2bfe1c23
3D4qYDvoPn5cQxtBm4oseo	mewithoutYou	43	130091	https://i.scdn.co/image/ab6761610000e5ebe03d502190e35ac58c18d339
2ApaG60P4r0yhBoDCGD8YG	Elliott Smith	63	835087	https://i.scdn.co/image/ab6761610000e5eb079739b801ab3f105866b76f
6GEykX11lQqp92UVOQQCC7	DJ Premier	59	224650	https://i.scdn.co/image/ab6761610000e5eb7bbda26434643249f6228ea1
1anAI9P9iSzc9qzLv6AtHZ	Sure Sure	55	107672	https://i.scdn.co/image/ab6761610000e5eb3a2c4b388f7ababb018e4afa
2auiVi8sUZo17dLy1HwrTU	Solange	60	1842622	https://i.scdn.co/image/ab6761610000e5eb631cf0aa859e5a20e836f14f
3kjuyTCjPG1WMFCiyc5IuB	Arcade Fire	65	2136668	https://i.scdn.co/image/ab6761610000e5eba044e15eee771205956dcbf8
1PryMSya1JnSAlcwYawCxp	Menahan Street Band	59	133158	https://i.scdn.co/image/ab6761610000e5eb46dc0fd03399b8a9dfed982d
6zvul52xwTWzilBZl6BUbT	Pixies	70	2327758	https://i.scdn.co/image/ab6761610000e5ebd0456128dd330d18e18b4715
2bToe6WyGvADJftreuXh2K	Lee Fields & The Expressions	49	139674	https://i.scdn.co/image/ab6761610000e5eb2ab0f0d7e19354bbe50c3546
432R46LaYsJZV2Gmc4jUV5	Joy Division	62	1979456	https://i.scdn.co/image/5eeddd733170399db794d2c430a8d2cde7ae1425
7FKTg75ADVMZgY3P9ZMRtH	flipturn	54	78918	https://i.scdn.co/image/ab6761610000e5ebfc6b3360ae52cbc1768296d6
7bu3H8JO7d0UbMoVzbo70s	The Cure	74	4028737	https://i.scdn.co/image/7ca743e822b80133971ccf5c70fcbd77a4f4f508
1nGqKVGfPPiVgxMdx8hYOI	Ezra Bell	44	19008	https://i.scdn.co/image/ab6761610000e5eb597927b89a95412d987c9286
1SQRv42e4PjEYfPhS0Tk9E	The Kinks	64	2247536	https://i.scdn.co/image/ab6761610000e5eb8f8013de1cd216cfdd7a4848
0yNLKJebCb8Aueb54LYya3	New Order	64	1793184	https://i.scdn.co/image/ab6761610000e5eba080a8e96758f416301578f9
2oqwwcM17wrP9hBD25zKSR	Lewis Del Mar	48	177468	https://i.scdn.co/image/ab6761610000e5ebb171e75745d404f23b5734c1
4BFMTELQyWJU1SwqcXMBm3	The Stooges	51	534214	https://i.scdn.co/image/1d9f0cf8e6d8d51f28369eccd78dca2882fb0d83
0oL26Dn9y761yfJgNb3vfu	Michigander	50	30099	https://i.scdn.co/image/ab6761610000e5eb5f78a32b18ce30b84b370e39
0rpMdBzQXf7aYRnu5fDBJy	Violent Femmes	56	600556	https://i.scdn.co/image/ab6761610000e5ebf7100a1b5ae490f13b6b8078
2x9SpqnPi8rlE9pjHBwmSC	Talking Heads	68	1981540	https://i.scdn.co/image/e4c5b04fce8706c87663357b1f78522a3a5c641b
26T3LtbuGT1Fu9m0eRq5X3	Cage The Elephant	72	3026898	https://i.scdn.co/image/ab6761610000e5eb7d994f7e137c10249de19455
2FXC3k01G6Gw61bmprjgqS	Hozier	76	5267666	https://i.scdn.co/image/ab6761610000e5eb9ba4d95b74bacff4d5747f61
6Xa4nbrSTfbioA4lLShbjh	Grizfolk	51	134793	https://i.scdn.co/image/ab6761610000e5ebe7d47c8222b428e1ae85852f
6m4tJuf67jwVSvMP34hrck	Saun & Starr	42	8649	https://i.scdn.co/image/c0b1f5eb4a0890883235e7791561bc398af8f1a7
1nJvji2KIlWSseXRSlNYsC	The Velvet Underground	62	1608108	https://i.scdn.co/image/d69c2cf10323bf08443c7d122f3a1824a760ab57
32Ko3nL0210QAt14S3Rs4Y	Sjowgren	54	63824	https://i.scdn.co/image/ab6761610000e5eb32d5f17f02a8fb2d170c0e79
48vDIufGC8ujPuBiTxY8dm	Palace	58	208344	https://i.scdn.co/image/ab6761610000e5ebe18e02fa35631c00252a5204
4zsrUnozu6zRlVELQezaBn	Naomi Shelton	29	1370	https://i.scdn.co/image/350edc3da212585098d60384bde750f274912183
00tVTdpEhQQw1bqdu8RCx2	Blue Öyster Cult	63	1317938	https://i.scdn.co/image/ab6761610000e5eba50ccc99f741a7899654bc16
1Tp7C6LzxZe9Mix6rn4zbI	Wilderado	55	77482	https://i.scdn.co/image/ab6761610000e5eba7eb714346f5bd4e73a671b7
1ikg4sypcURm8Vy5GP68xb	Magic City Hippies	54	123292	https://i.scdn.co/image/ab6761610000e5eb6a73d931c5f35f92b6b844a5
2g3PKH7Z1Ofn5oGR6oDjLy	The Sonics	43	115740	https://i.scdn.co/image/268e0f329a377e4b8a9a639ba00e1d30cf555604
39vA9YljbnOApXKniLWBZv	Sylvan Esso	57	513315	https://i.scdn.co/image/ab6761610000e5ebb85da2d1f33da01653deca08
3RcaUsjj5gt1x2QK3TSNS2	Atta Boy	41	28962	https://i.scdn.co/image/ab6761610000e5eb9ebc15a07cf5054a1c6f96b3
0du5cEVh5yTK9QJze8zA0C	Bruno Mars	\N	\N	\N
5p7f24Rk5HkUZsaS3BLG5F	Hailee Steinfeld	\N	\N	\N
50co4Is1HCEo8bhOyUWKpn	Young Thug	\N	\N	\N
\.


--
-- Data for Name: artists_genres; Type: TABLE DATA; Schema: public; Owner: cnicosia
--

COPY public.artists_genres (id, artist_id, genre) FROM stdin;
1	0qu422H5MOoQxGjd4IzHbS	alternative r&b
2	0qu422H5MOoQxGjd4IzHbS	art pop
3	0qu422H5MOoQxGjd4IzHbS	escape room
4	0qu422H5MOoQxGjd4IzHbS	experimental r&b
5	65dGLGjkw3UbddUg2GKQoZ	alternative hip hop
6	65dGLGjkw3UbddUg2GKQoZ	canadian modern jazz
7	65dGLGjkw3UbddUg2GKQoZ	escape room
8	65dGLGjkw3UbddUg2GKQoZ	indie soul
9	4lujUKeO6nQAJXpq37Epn7	funk
10	4lujUKeO6nQAJXpq37Epn7	indie soul
11	4lujUKeO6nQAJXpq37Epn7	soul
12	6ltzsmQQbmdoHHbLZ4ZN25	indie folk
13	6ltzsmQQbmdoHHbLZ4ZN25	stomp and holler
14	0YrtvWJMgSdVrk3SfNjTbx	indie pop
15	0YrtvWJMgSdVrk3SfNjTbx	indie rock
16	0YrtvWJMgSdVrk3SfNjTbx	modern rock
17	0YrtvWJMgSdVrk3SfNjTbx	washington indie
18	0bzfPKdbXL5ezYW2z3UGQj	british soul
19	0bzfPKdbXL5ezYW2z3UGQj	neo soul
20	0bzfPKdbXL5ezYW2z3UGQj	psychedelic soul
21	0bzfPKdbXL5ezYW2z3UGQj	soul
22	3M4ThdJR28z9eSMcQHAZ5G	alternative rock
23	3M4ThdJR28z9eSMcQHAZ5G	garage rock
24	3M4ThdJR28z9eSMcQHAZ5G	modern rock
25	3M4ThdJR28z9eSMcQHAZ5G	rock
26	3M4ThdJR28z9eSMcQHAZ5G	scottish rock
27	30DhU7BDmF4PH0JVhu8ZRg	pop
28	30DhU7BDmF4PH0JVhu8ZRg	r&b
29	360IAlyVv4PCEVjgyMZrxK	dance pop
30	360IAlyVv4PCEVjgyMZrxK	hip hop
31	360IAlyVv4PCEVjgyMZrxK	pop
32	360IAlyVv4PCEVjgyMZrxK	r&b
33	360IAlyVv4PCEVjgyMZrxK	urban contemporary
34	34jw2BbxjoYalTp8cJFCPv	album rock
35	34jw2BbxjoYalTp8cJFCPv	classic rock
36	34jw2BbxjoYalTp8cJFCPv	hard rock
37	34jw2BbxjoYalTp8cJFCPv	heartland rock
38	34jw2BbxjoYalTp8cJFCPv	mellow gold
39	34jw2BbxjoYalTp8cJFCPv	new wave pop
40	34jw2BbxjoYalTp8cJFCPv	rock
41	34jw2BbxjoYalTp8cJFCPv	soft rock
42	5Q81rlcTFh3k6DQJXPdsot	channel islands indie
43	5Q81rlcTFh3k6DQJXPdsot	hyperpop
44	5Q81rlcTFh3k6DQJXPdsot	vapor soul
45	2YZyLoL8N0Wb9xBt1NhZWg	conscious hip hop
46	2YZyLoL8N0Wb9xBt1NhZWg	hip hop
47	2YZyLoL8N0Wb9xBt1NhZWg	rap
48	2YZyLoL8N0Wb9xBt1NhZWg	west coast rap
49	4hz8tIajF2INpgM0qzPJz2	modern rock
50	1Xyo4u8uXC1ZmMpatF05PJ	canadian contemporary r&b
51	1Xyo4u8uXC1ZmMpatF05PJ	canadian pop
52	1Xyo4u8uXC1ZmMpatF05PJ	pop
53	7CyeXFnOrfC1N6z4naIpgo	brill building pop
54	7CyeXFnOrfC1N6z4naIpgo	classic girl group
55	7CyeXFnOrfC1N6z4naIpgo	soul
56	55VydwMyCuGcavwPuhutPL	post-hardcore
57	55VydwMyCuGcavwPuhutPL	screamo
58	08ct2eZF5lUPdJpHwNKWof	mellow gold
59	08ct2eZF5lUPdJpHwNKWof	neo mellow
60	08ct2eZF5lUPdJpHwNKWof	pop rock
61	08ct2eZF5lUPdJpHwNKWof	rock
62	08ct2eZF5lUPdJpHwNKWof	singer-songwriter
63	37w38cCSGgKLdayTRjna4W	alternative rock
64	37w38cCSGgKLdayTRjna4W	art pop
65	37w38cCSGgKLdayTRjna4W	dream pop
66	37w38cCSGgKLdayTRjna4W	melancholia
67	37w38cCSGgKLdayTRjna4W	rock
68	37w38cCSGgKLdayTRjna4W	shoegaze
69	37w38cCSGgKLdayTRjna4W	slowcore
70	4bthk9UfsYUYdcFyqxmSUU	new romantic
71	4bthk9UfsYUYdcFyqxmSUU	new wave
72	4bthk9UfsYUYdcFyqxmSUU	new wave pop
73	4bthk9UfsYUYdcFyqxmSUU	permanent wave
74	4bthk9UfsYUYdcFyqxmSUU	rock
75	4bthk9UfsYUYdcFyqxmSUU	sophisti-pop
76	4bthk9UfsYUYdcFyqxmSUU	synthpop
77	4pejUc4iciQfgdX6OKulQn	alternative metal
78	4pejUc4iciQfgdX6OKulQn	alternative rock
79	4pejUc4iciQfgdX6OKulQn	blues rock
80	4pejUc4iciQfgdX6OKulQn	modern rock
81	4pejUc4iciQfgdX6OKulQn	nu metal
82	4pejUc4iciQfgdX6OKulQn	palm desert scene
83	4pejUc4iciQfgdX6OKulQn	rock
84	4pejUc4iciQfgdX6OKulQn	stoner metal
85	4pejUc4iciQfgdX6OKulQn	stoner rock
86	1eClJfHLoDI4rZe5HxzBFv	australian rock
87	1eClJfHLoDI4rZe5HxzBFv	classic rock
88	1eClJfHLoDI4rZe5HxzBFv	dance rock
89	1eClJfHLoDI4rZe5HxzBFv	funk rock
90	1eClJfHLoDI4rZe5HxzBFv	mellow gold
91	1eClJfHLoDI4rZe5HxzBFv	new romantic
92	1eClJfHLoDI4rZe5HxzBFv	new wave
93	1eClJfHLoDI4rZe5HxzBFv	new wave pop
94	1eClJfHLoDI4rZe5HxzBFv	pop rock
95	1eClJfHLoDI4rZe5HxzBFv	rock
96	1eClJfHLoDI4rZe5HxzBFv	soft rock
97	2iul6etLF5hjjpxo43rzz7	alternative country
98	2iul6etLF5hjjpxo43rzz7	new americana
99	73sIBHcqh3Z3NyqHKZ7FOL	atl hip hop
100	73sIBHcqh3Z3NyqHKZ7FOL	hip hop
101	73sIBHcqh3Z3NyqHKZ7FOL	pop
102	73sIBHcqh3Z3NyqHKZ7FOL	rap
103	4V8LLVI7PbaPR0K2TGSxFF	hip hop
104	4V8LLVI7PbaPR0K2TGSxFF	rap
105	3oDbviiivRWhXwIE8hxkVV	baroque pop
106	3oDbviiivRWhXwIE8hxkVV	brill building pop
107	3oDbviiivRWhXwIE8hxkVV	classic rock
108	3oDbviiivRWhXwIE8hxkVV	psychedelic rock
109	3oDbviiivRWhXwIE8hxkVV	rock
110	3oDbviiivRWhXwIE8hxkVV	sunshine pop
111	6loBF9iQdE11WSX29fNKqY	mellow gold
112	6loBF9iQdE11WSX29fNKqY	new romantic
113	6loBF9iQdE11WSX29fNKqY	new wave
114	6loBF9iQdE11WSX29fNKqY	new wave pop
115	6loBF9iQdE11WSX29fNKqY	soft rock
116	6loBF9iQdE11WSX29fNKqY	synthpop
117	7guDJrEfX3qb6FEbdPA5qi	funk
118	7guDJrEfX3qb6FEbdPA5qi	indie r&b
119	7guDJrEfX3qb6FEbdPA5qi	motown
120	7guDJrEfX3qb6FEbdPA5qi	quiet storm
121	7guDJrEfX3qb6FEbdPA5qi	soul
122	0YHgnSkV3S5mvSSCTRWDi5	deathgrass
123	57bUPid8xztkieZfS7OlEV	brill building pop
124	57bUPid8xztkieZfS7OlEV	classic girl group
125	57bUPid8xztkieZfS7OlEV	disco
126	57bUPid8xztkieZfS7OlEV	funk
127	57bUPid8xztkieZfS7OlEV	motown
128	57bUPid8xztkieZfS7OlEV	quiet storm
129	57bUPid8xztkieZfS7OlEV	soul
130	0X380XXQSNBYuleKzav5UO	alternative metal
131	0X380XXQSNBYuleKzav5UO	alternative rock
132	0X380XXQSNBYuleKzav5UO	cyberpunk
133	0X380XXQSNBYuleKzav5UO	electronic rock
134	0X380XXQSNBYuleKzav5UO	industrial
135	0X380XXQSNBYuleKzav5UO	industrial metal
136	0X380XXQSNBYuleKzav5UO	industrial rock
137	0X380XXQSNBYuleKzav5UO	nu metal
138	0X380XXQSNBYuleKzav5UO	rock
139	5eIbEEQnDM8yuDVB0bimSP	bass trap
140	5eIbEEQnDM8yuDVB0bimSP	edm
141	5eIbEEQnDM8yuDVB0bimSP	electro house
142	5eIbEEQnDM8yuDVB0bimSP	electronic trap
143	5eIbEEQnDM8yuDVB0bimSP	electropop
144	5eIbEEQnDM8yuDVB0bimSP	pop dance
145	5eIbEEQnDM8yuDVB0bimSP	vapor twitch
146	3pkmfqaBNsMqnXus05PNfP	alternative hip hop
147	3pkmfqaBNsMqnXus05PNfP	hip hop
148	3pkmfqaBNsMqnXus05PNfP	turntablism
149	20wkVLutqVOYrc0kxFs7rA	canadian contemporary r&b
150	20wkVLutqVOYrc0kxFs7rA	pop
151	20wkVLutqVOYrc0kxFs7rA	r&b
152	1mFX1QlezK1lNPKQJkhwWb	boy band
153	1mFX1QlezK1lNPKQJkhwWb	contemporary r&b
154	1mFX1QlezK1lNPKQJkhwWb	new jack swing
155	1mFX1QlezK1lNPKQJkhwWb	quiet storm
156	1mFX1QlezK1lNPKQJkhwWb	r&b
157	1mFX1QlezK1lNPKQJkhwWb	urban contemporary
158	0VbDAlm2KUlKI5UhXRBKWp	indie soul
159	0VbDAlm2KUlKI5UhXRBKWp	vapor soul
160	7KGqvFukcZRbQ7YFsYrgPa	soft rock
161	6PEMFpe3PTOksdV4ZXUpbE	hip hop
162	6PEMFpe3PTOksdV4ZXUpbE	indie soul
163	6PEMFpe3PTOksdV4ZXUpbE	neo soul
164	6PEMFpe3PTOksdV4ZXUpbE	underground hip hop
\.


--
-- Data for Name: features; Type: TABLE DATA; Schema: public; Owner: cnicosia
--

COPY public.features (track_id, danceability, energy, key, loudness, mode, speechiness, acousticness, instrumentalness, liveness, valence, tempo, time_signature, duration_ms) FROM stdin;
1Kjw0LwdniCWran4PxJqPQ	0.506	0.746	7	-7.385	0	0.0307	0.00183	0	0.109	0.299	130.996	4	305507
1I40L32fTSSkBkPeArX9Ul	0.619	0.381	11	-10.691	0	0.0523	0.471	0.0318	0.101	0.312	139.929	4	273864
5fBjPtOxhgdpU6LNWLyVHv	0.599	0.377	7	-9.829	1	0.105	0.441	0.00813	0.105	0.543	74.314	4	213137
4FE9SgxcOoCNuGnaaU8TXz	0.686	0.413	6	-6.332	0	0.0263	0.103	0.115	0.122	0.595	95.989	3	311227
4FF4q2qyOsFhRavZ0bdVXT	0.597	0.0958	2	-17.319	1	0.0329	0.775	0.0188	0.11	0.0961	77.681	3	221693
0qprlw0jfsW4H9cG0FFE0Z	0.489	0.404	8	-7.815	1	0.0261	0.487	0.0485	0.14	0.153	108.01	4	597600
3jp7Ryj1sX3riA7NQaVlLd	0.599	0.691	4	-4.571	1	0.0301	0.0489	0	0.0835	0.729	131.578	4	215853
2I88NEWpKrAPZuapXNV5G6	0.605	0.553	10	-10.845	0	0.101	0.274	0.0152	0.184	0.62	152.076	4	185617
6YZQx90VEuzf0lRY9TYh7j	0.673	0.596	11	-6.489	0	0.0438	0.316	1.88e-05	0.107	0.22	75.022	4	226720
54b8qPFqYqIndfdxiLApea	0.418	0.452	1	-13.099	1	0.0356	0.638	0.00026	0.0959	0.168	175.088	4	218733
3sTN90bIP2cJ1783ctHykO	0.625	0.763	8	-4.997	0	0.129	0.147	0.0106	0.214	0.721	88.753	4	192160
2P3SLxeQHPqh8qKB6gtJY2	0.779	0.572	6	-9.985	0	0.378	0.157	0	0.246	0.647	135.956	4	300160
474uVhyGgK5MtY9gMcDgGl	0.744	0.516	2	-6.365	1	0.0513	0.632	0	0.605	0.281	97.944	4	152293
16ro1is6DmDKkarlJMBbzV	0.727	0.48	5	-9.278	0	0.0987	0.444	0	0.118	0.369	120.025	4	269053
4frLb7nWtsz2ymBE6k2GRP	0.659	0.291	2	-8.275	0	0.0348	0.405	0	0.0771	0.406	119.829	3	277680
2G2YzndIA6jeWFPBXhUjh5	0.511	0.769	4	-7.032	1	0.042	0.181	0	0.0921	0.818	129.657	4	160907
5jZ1Z2GFTf2gwmFc3qiUxs	0.541	0.904	7	-3.001	1	0.0435	0.00143	0	0.193	0.541	98.122	4	208693
5vyt44455ipNNVSYq8fYY7	0.789	0.593	5	-7.877	0	0.0582	0.383	1.29e-06	0.191	0.293	109.952	4	163747
1OFKUn2VLafrHj7ybnap0Q	0.49	0.873	6	-5.861	1	0.0355	0.107	5.19e-06	0.118	0.513	103.272	4	229587
21oJ1K99GBJrE2GVQGVjA0	0.486	0.419	5	-6.415	1	0.0563	0.741	6.59e-05	0.096	0.227	119.065	3	244910
1LzNfuep1bnAUR9skqdHCK	0.42	0.33	9	-13.925	1	0.0275	0.245	0.000679	0.0677	0.175	157.143	3	295600
748yv6bb3l3CcKS45a6SZ8	0.602	0.839	4	-4.251	0	0.0255	0.502	0.00128	0.095	0.653	95.159	4	256147
6NvRxjfYkkT2SpirAlmsjH	0.507	0.588	0	-4.881	1	0.0641	0.0359	0.000129	0.373	0.637	170.889	4	278707
0hJS3EHWC4uL9sJ52ErpoN	0.799	0.497	4	-6.57	1	0.141	0.0745	1.28e-05	0.174	0.488	115.157	4	192013
1ZaNp6b4cY3zcrciagi7td	0.376	0.537	9	-8.492	1	0.0801	0.89	0	0.905	0.256	75.496	4	355733
1qQSRy9DjrGh3jtsSCU6B1	0.665	0.686	0	-5.849	1	0.0268	0.0518	0.000176	0.174	0.275	96.848	3	185694
3s8MBOMdUi5Vol77qq8KJJ	0.351	0.467	9	-10.196	0	0.0568	0.69	8.75e-06	0.0904	0.184	158.203	4	245013
4j3GWI86JvSaF0BLdmgcfF	0.76	0.579	0	-7.374	1	0.0567	0.0127	0.00344	0.106	0.129	100.011	4	213600
4f8Mh5wuWHOsfXtzjrJB3t	0.826	0.579	8	-8.241	0	0.0801	0.00881	0	0.129	0.431	121.075	4	212013
6VojZJpMyuKClbwyilWlQj	0.385	0.657	5	-6.975	1	0.0342	0.724	0	0.105	0.672	124.895	4	153867
1TDdYSYLIXMJ4EiKO6ZCYk	0.691	0.482	7	-10.954	1	0.201	0.623	0.00671	0.208	0.433	160.072	4	154213
1RbOObDFn7GOseR1w529Zj	0.752	0.743	7	-6.083	1	0.0331	0.0314	0.000117	0.128	0.832	108.254	4	235827
0Hw6SCrtU9pFCjgAONpnGZ	0.593	0.642	5	-9.894	0	0.0304	0.186	0	0.129	0.919	133.281	4	174400
0S29RwGLJutn4qnFJQL13n	0.48	0.621	10	-6.938	1	0.0345	0.345	0.014	0.255	0.633	175.954	4	204323
5SCB7L1alKg7ZEeSw7Sq9f	0.521	0.606	10	-7.817	0	0.0277	0.322	0.000257	0.0888	0.433	70.38	4	162533
3aN2V18W3EiW7eg5tHALpF	0.551	0.683	0	-7.308	1	0.0345	0.000297	0.305	0.105	0.179	100.03	4	436000
5hVghJ4KaYES3BFUATCYn0	0.554	0.498	9	-8.866	1	0.0685	0.23	5.98e-06	0.795	0.413	79.635	4	190067
6fc51JZVE0Yijdi6RuoLFv	0.754	0.405	7	-11.547	1	0.0378	0.466	0.00179	0.1	0.0843	114.938	4	213973
3zJ5RDG0bLQAV2rntFgUtb	0.643	0.773	1	-7.998	1	0.0414	0.188	0.000412	0.0986	0.653	124.538	4	249333
6iGU74CwXuT4XVepjc9Emf	0.521	0.487	6	-7.525	0	0.0299	0.253	0	0.0579	0.483	117.072	4	173040
7wdzLe2Gsx1RGqbvYZHASz	0.755	0.884	10	-5.296	0	0.0638	0.0208	2.97e-06	0.248	0.897	121.927	4	231933
3imS277wRbz1CFoDySgTff	0.49	0.629	2	-4.072	0	0.0399	0.0732	0	0.0957	0.3	74.967	4	201600
3mT1AONeTJDi1k8vH8pA2L	0.705	0.479	5	-9.217	0	0.0767	0.499	0.000425	0.114	0.431	80.009	4	324067
7Cu2COdH93MnuireuKNiS3	0.41	0.298	3	-11.796	1	0.0473	0.721	0	0.158	0.142	109.651	3	246972
7JmPqImeW3kLoYVNBA9v11	0.588	0.856	5	-12.418	0	0.0378	0.0915	2.62e-05	0.365	0.781	97.968	4	309840
2aCKBrLn7rbhStk5k4FwnF	0.371	0.613	7	-6.685	0	0.0452	0.0589	0	0.0479	0.873	203.732	4	156440
0vJvCnuxXL2BCSRa1ZoeNl	0.399	0.163	3	-16.436	0	0.0382	0.963	0.00132	0.0885	0.242	94.011	3	199654
1zkkvSLk5Nh4uoyKWwuie9	0.564	0.294	7	-8.885	0	0.0349	0.636	0	0.0982	0.213	149.98	4	174387
62wdQ5CInFr7cjISqrr46f	0.508	0.325	2	-11.627	1	0.037	0.96	0.00259	0.188	0.274	92.187	4	250533
3iVp14VoAsAZkIdgQoRRAb	0.353	0.748	0	-5.984	1	0.246	0.565	7.86e-06	0.551	0.287	137.856	3	165627
04M3DsiMNyn8s5XQJrW5sL	0.631	0.277	5	-10.985	1	0.0537	0.772	0	0.114	0.214	114.765	4	237493
63k361zOGEhmvgzBdzzSGP	0.512	0.614	6	-14.368	1	0.0292	0.104	0.738	0.252	0.965	168.071	4	117173
5zzWx7oJ9zBmv76uFaFeYR	0.763	0.599	9	-8.285	0	0.0417	0.0856	0.00678	0.113	0.306	110.098	4	229653
5rfT032kGmLvbxZzfHlu5D	0.271	0.714	7	-5.124	1	0.0329	0.392	0	0.115	0.239	94.158	3	202347
2pA4ip3VIEVcIa3qE02oAX	0.568	0.578	6	-5.589	1	0.0404	0.00694	0.000353	0.099	0.555	139.951	4	174693
1k7aPYyAnNTjVbjw1YDNp1	0.621	0.427	11	-11.464	0	0.0733	0.79	0	0.189	0.275	150.037	4	196573
41xaZ4WLlKD95U5PknoJrV	0.678	0.81	7	-5.665	1	0.279	0.0635	3.8e-06	0.0343	0.804	74.964	4	172467
33vFhGNZa44VJ0I21AOGYe	0.758	0.551	0	-8.879	1	0.0732	0.604	0.000663	0.104	0.365	114.892	4	109227
03v70ZBxmcPX3RWAZMzqaW	0.644	0.478	11	-6.469	1	0.0529	0.194	0.00376	0.106	0.496	159.898	4	190253
1RzgWAFlI6KOenjOxJYcH0	0.501	0.477	6	-9.507	1	0.217	0.987	0.803	0.154	0.0897	106.595	3	127640
2OeL43EXwaC205Xr1da1qJ	0.411	0.096	10	-17.007	1	0.0588	0.863	0.000245	0.117	0.198	91.91	4	242227
5CU1bbfY1wUPm7fU255Dhf	0.407	0.519	5	-6.47	1	0.0336	0.11	0.889	0.409	0.342	94.001	4	120427
0dqJjKKxuKD5Dt3QH2n4CG	0.426	0.634	4	-7.116	1	0.0341	0.404	0.00356	0.222	0.284	98.925	4	257693
5C90m8eM6GJR2SACiLAWHo	0.786	0.607	2	-7.992	0	0.0517	0.114	0.372	0.104	0.56	125.811	4	197773
4Fc62OkXYtEOjMmaSyJoQY	0.544	0.625	10	-6.797	0	0.0342	0.00384	0.00657	0.0889	0.43	75.243	4	210080
5L7IgwUPhir2FJftGNXJDW	0.632	0.556	1	-8.851	1	0.12	0.721	0	0.0995	0.385	78.603	4	219696
35mL8keNDi2VLHrFXZCgJR	0.699	0.458	0	-12.357	1	0.106	0.372	1.33e-06	0.111	0.269	129.991	4	221546
50bmpfgcV29ouRVDfr5wOc	0.466	0.302	9	-10.334	0	0.0509	0.388	0	0.262	0.298	131.951	4	215427
5IRdIQNIZzVqE4XyBylkvd	0.595	0.537	9	-7.666	1	0.0325	0.108	0.00511	0.11	0.217	129.764	4	249147
244QS6446wyO1UfVTWlOlR	0.266	0.426	9	-9.114	1	0.0364	0.0911	0.16	0.181	0.236	101.249	4	178307
5do7Ql6G8N03fY6G9Y08Ec	0.725	0.362	7	-12.424	1	0.0643	0.84	0.181	0.106	0.249	119.938	4	231907
0ZAbupc7jAQpG9IxojQ3s3	0.822	0.362	2	-7.462	1	0.0411	0.16	0	0.313	0.159	119.903	4	229667
6MDijuuArPJv1vbp7K1x3f	0.688	0.847	10	-3.238	0	0.0508	0.04	2.81e-06	0.598	0.453	93.979	4	212147
0b2vqB7QNT4z8nnaYqbuel	0.692	0.391	9	-9.073	1	0.0338	0.00563	0.000397	0.0983	0.387	95.022	4	220453
3LcjZGk0GBlPRe5XhYVGgM	0.624	0.726	2	-4.585	1	0.052	0.0298	0	0.301	0.83	99.996	4	213720
47KDDZgFiX1w6RFOuLXsSn	0.564	0.354	7	-10.85	1	0.0334	0.73	3.43e-06	0.208	0.423	98.075	3	240587
0JXXNGljqupsJaZsgSbMZV	0.684	0.607	11	-8.127	0	0.1	0.0267	0.000307	0.191	0.498	81.001	4	195373
3banchOoe2giyRK0jaO1c7	0.718	0.327	9	-7.602	0	0.0292	0.776	2.05e-05	0.088	0.507	82.582	4	201000
37ZvpHeZKazqOnLfAGm9nb	0.624	0.476	4	-10.993	1	0.0416	0.0238	0.141	0.0997	0.184	119.968	4	206627
7l5j3FapCyr6HxUgoAynM2	0.576	0.535	9	-8.392	1	0.041	0.588	0.0106	0.31	0.196	139.939	4	280074
27AG99NmWMFLRoyZMMPNW2	0.342	0.613	7	-4.084	1	0.0311	0.705	0	0.14	0.267	145.84	4	266107
7trx783SvnHhKkmgSSTIFJ	0.554	0.337	1	-10.189	1	0.0351	0.581	0	0.0871	0.216	89.961	4	343485
5VA4Ispp52EA1sOqzMz3Av	0.776	0.603	5	-5.696	1	0.0343	0.0728	6.25e-05	0.111	0.921	96.888	4	295920
4hv7GT5g9qNnrxlocsOSYt	0.554	0.56	4	-4.824	0	0.0415	0.142	0	0.104	0.0786	131.206	4	233707
7qHoVZ6076OGx18G6W5vQ9	0.753	0.18	7	-13.618	1	0.0566	0.975	0.00266	0.111	0.187	114.891	4	196453
4PFiLGx8jAzcAJxwPLUeZ9	0.483	0.275	0	-13.609	1	0.0418	0.232	0	0.125	0.31	138.063	3	240800
1ULovMYbbglXIn9TQzMsKz	0.219	0.827	5	-5.395	1	0.123	0.0477	0	0.135	0.121	131.7	4	186280
4isk4UYRcmslphcTq61xUg	0.372	0.641	9	-4.819	0	0.149	0.216	0	0.114	0.647	67.82	4	226360
5WoaF1B5XIEnWfmb5NZikf	0.674	0.506	6	-10.532	1	0.0434	0.173	0	0.0866	0.183	145.965	4	259333
7sf0tmuGZlHXUWpi9dQqcw	0.67	0.735	0	-6.712	1	0.0645	0.108	0.00042	0.251	0.498	112.52	4	315933
5p0bEz7DNsULez2X9yrNGa	0.79	0.737	8	-7.92	1	0.0284	0.0236	0.0149	0.114	0.693	119.001	4	168187
1dxXQuExRVu77xF1r5YtRF	0.518	0.757	6	-8.584	0	0.0555	0.000777	0.00931	0.115	0.189	129.901	4	130107
3Pu3IChaAoa5EjgUBv5F6x	0.644	0.799	4	-10.856	0	0.0598	0.0821	0.00154	0.055	0.889	108.381	4	246573
0wejso6CHHEEqvTD3f3gBz	0.544	0.369	10	-9.617	1	0.0319	0.527	0.000189	0.101	0.105	144.073	4	246080
23od4rorIdhvYeLL7YqP9n	0.641	0.507	9	-11.326	1	0.027	0.167	0.424	0.095	0.312	114.99	3	315427
2I3ZdIFXnRn1PSAdMC4w71	0.553	0.526	2	-11.51	1	0.0257	0.368	9.81e-05	0.288	0.582	83.99	4	218947
7Cva2EgJougx6O6M5xgWAq	0.62	0.773	2	-8.324	1	0.0382	0.0741	0.000606	0.158	0.934	157.991	4	226320
7KR5uycb8gfQYRl1MTL8aB	0.47	0.696	2	-8.996	0	0.0347	0.00128	0.000168	0.098	0.263	156.916	4	264960
7xjbn0bhs7zx7E1s0lCqT3	0.619	0.578	7	-8.829	1	0.0738	0.0185	3.11e-05	0.139	0.556	144.986	5	245427
1AR58rtcLziNnRHTCmCywd	0.537	0.784	9	-7.78	1	0.0425	0.00694	6.99e-05	0.298	0.395	78.053	4	211680
2Wi5ubKr8zSk8L3CLemyS4	0.401	0.902	0	-6.814	1	0.154	0.0296	0.918	0.614	0.58	137.363	4	210333
3Cx9j78Z0NE6jYwBWvvV3P	0.925	0.229	4	-9.68	1	0.445	0.579	0.00578	0.116	0.168	104.273	4	140227
4J6JARDGkdc1fqLEflP94Z	0.303	0.344	6	-11.919	0	0.0327	0.817	0.0512	0.118	0.164	154.572	3	278200
5eKfpH2dQ7FltCqb7LWEGJ	0.464	0.334	6	-12.916	1	0.0313	0.307	0.247	0.11	0.326	165.278	4	328933
4TIJ7zSBNejpoIPaWpWRKc	0.53	0.864	4	-4.948	0	0.061	0.000753	0.000459	0.354	0.484	166.312	4	288533
56KqaFSGTb7ifpt16t5Y1N	0.797	0.872	9	-6.727	0	0.0575	0.291	0	0.284	0.866	129.885	4	222427
72dIN8F7D5ydB3auSqNi84	0.449	0.357	1	-8.48	1	0.0266	0.0605	0.483	0.105	0.178	66.979	4	419093
21YxK0klhpfLW8budkJaMF	0.383	0.97	9	-5.638	1	0.0435	0.0276	0	0.0942	0.62	101.603	4	313926
29iwiYD3KVWBKxe31nGjEL	0.56	0.941	10	-6.173	1	0.0849	0.255	0.0019	0.153	0.822	165.058	4	190693
3YZa4IzxK2UtEKTvdTgsi8	0.455	0.883	2	-9.159	1	0.0384	0.368	0	0.277	0.782	142.638	4	208413
5El6bpLd8nYPsvWgZLdHio	0.562	0.809	0	-6.791	1	0.0385	0.0276	0.23	0.11	0.451	174.527	4	268773
7xENAAODeE2hKzdWFI6YaB	0.269	0.387	6	-13.482	0	0.0382	0.44	0.895	0.126	0.0494	84.823	4	90480
4oB0d8H93GtllDkoHNuLIN	0.361	0.454	0	-8.494	1	0.0305	0.0931	0.00146	0.0737	0.298	124.899	4	234933
0WQiDwKJclirSYG9v5tayI	0.523	0.769	4	-5.855	1	0.0269	0.04	0	0.136	0.876	136.162	4	244587
0ncGfTV06HogJIgn2Ujjgb	0.549	0.657	3	-7.924	1	0.0264	0.0502	1.67e-05	0.35	0.641	82.033	4	212867
0vF9RAGwgYtfO1Aajwb7et	0.505	0.879	1	-6.078	1	0.0354	0.00011	0.49	0.579	0.338	112.021	3	275973
10fiZCExnOMqElSX952WZI	0.42	0.582	8	-7.53	1	0.0383	0.00112	0.117	0.0866	0.248	127.272	4	293920
14z3RzUHeZQgtpOlSYvmZD	0.471	0.758	7	-8.308	0	0.0401	0.0317	0.514	0.199	0.558	125.791	4	408827
1e5XqFTNIrlgpXGjwPSykv	0.723	0.376	4	-13.622	1	0.0466	0.073	0.303	0.181	0.446	115.67	4	285545
1wgU78h61rVCbOsFAHv2Hw	0.726	0.466	8	-13.775	0	0.0954	0.345	0.0331	0.0849	0.33	90.491	4	263920
29Znt9AbEH9FSsw86zPAYT	0.433	0.67	7	-13.126	0	0.0396	0.0206	0.0096	0.208	0.497	156.99	4	295973
1wtOxkiel43cVs0Yux5Q4h	0.663	0.319	9	-13.481	1	0.0375	0.69	0.000993	0.117	0.193	109.957	4	256124
1Ist6PR2BZR3n2z2Y5R6S1	0.566	0.647	1	-6.815	0	0.0335	0.0477	0	0.121	0.22	111.96	4	264773
2nMeu6UenVvwUktBCpLMK9	0.324	0.416	11	-8.92	0	0.0368	0.262	3.69e-05	0.11	0.151	113.986	4	236053
0Oqc0kKFsQ6MhFOLBNZIGX	0.641	0.559	7	-11.132	0	0.0355	0.404	0.00402	0.0937	0.523	144.982	4	202193
1NZs6n6hl8UuMaX0UC0YTz	0.404	0.664	1	-6.698	1	0.0407	0.542	0.00402	0.11	0.0949	107.747	4	351640
5Y6nVaayzitvsD5F7nr3DV	0.527	0.591	6	-7.664	0	0.0396	0.194	0.0194	0.0907	0.461	123.167	4	256760
3lG6OtGDsYAOALxEmubQQm	0.467	0.119	2	-10.99	1	0.0401	0.969	1.4e-06	0.0973	0.156	70.499	4	272485
2mdEsXPu8ZmkHRRtAdC09e	0.294	0.337	6	-10.614	0	0.036	0.814	0.414	0.14	0.135	91.781	5	300683
1KuVEZR4xuQVNr1KkanAV4	0.255	0.468	7	-6.43	0	0.0317	0.822	0.248	0.339	0.175	111.67	4	181960
3RIgHHpnFKj5Rni1shokDj	0.215	0.203	5	-12.65	1	0.0346	0.968	0.0585	0.0923	0.143	78.287	1	248934
1fOc4Kf82a6J1C9gS5sE0d	0.373	0.469	0	-7.282	1	0.0415	0.00591	0.00887	0.0656	0.22	150.74	3	360829
0PbOwOT7vjiO0NiI8D31XH	0.749	0.659	4	-7.617	0	0.0278	0.139	0.000447	0.0716	0.93	91.199	4	183440
7a5xvCgoD8qFEQmO8Jjvtf	0.715	0.6	5	-7.728	0	0.0264	0.0714	0.00165	0.0876	0.77	86.989	4	202492
0LHm5xYhzH6ZfmTVJ6LWpR	0.72	0.759	0	-7.774	1	0.0804	0.0371	0.0228	0.101	0.61	101.317	4	172559
4ml0940tmn92PzmkSb2lwU	0.769	0.71	9	-5.223	0	0.0745	0.0884	0.0561	0.0678	0.64	88.788	4	191553
6ZWDOwh9OO57DaO0ROHIHO	0.716	0.545	8	-8.444	0	0.0515	0.0675	0.17	0.0671	0.552	96.47	4	181362
2aWr9QRr0pSmYFH04zngiP	0.631	0.726	5	-6.079	1	0.0296	0.16	9.6e-05	0.11	0.623	87.067	4	222371
2dDR1wNf50GYrWohFnS3Pv	0.535	0.566	3	-7.02	1	0.0375	0.355	0.000545	0.0999	0.508	84.218	3	234799
3F4WWA3JqsX2VmvqHywxEA	0.338	0.777	2	-8.936	0	0.0946	0.0324	0.00374	0.193	0.514	77.567	1	191338
5nMZwcaQcQCONoiHmov5YT	0.557	0.496	7	-6.335	1	0.0314	0.529	2.18e-05	0.306	0.522	78.37	4	237918
02VBYrHfVwfEWXk5DXyf0T	0.586	0.616	5	-7.964	1	0.0324	0.182	0	0.0927	0.719	148.088	4	242096
3xVZYkcuWalGudeKl861wb	0.627	0.618	2	-8.529	1	0.0437	0.0558	0	0.351	0.848	82.03	4	197443
1l4iQsOZ5sOXZPMQLvouaB	0.701	0.875	11	-4.1	1	0.0757	0.0262	7.32e-06	0.137	0.84	111.976	4	166720
7jvCeWOSnJs2N3spqobWnO	0.708	0.598	5	-8.365	1	0.0291	0.037	0	0.17	0.698	112.027	4	203123
3MlQPB0wJuopo3NTZGlMpI	0.62	0.396	1	-15.498	0	0.206	0.735	0.000985	0.0976	0.774	87.865	4	201027
3jiKUMXqwEodB7gVv1RMZU	0.651	0.703	0	-8.958	0	0.0816	0.0297	0	0.0608	0.647	140.051	4	249444
3a6FcTyvSf0ED3VXeH3PJ5	0.783	0.627	2	-8.521	1	0.102	0.00756	0	0.0606	0.48	100.025	4	219389
2JUQ7mV1AHk2owXLydmN4Z	0.711	0.605	6	-9.801	0	0.031	0.0396	2.29e-05	0.104	0.807	140.981	4	307014
2K6vUau7bnZUamjbRSOOvJ	0.836	0.622	1	-11.003	1	0.0946	0.00269	0.000566	0.335	0.892	102.015	4	165001
276zciJ7Fg7Jk6Ta6QuLkp	0.841	0.898	8	-7.135	1	0.104	0.271	0.0151	0.304	0.931	98.401	4	169727
3hhbDnFUb2bicI2df6VurK	0.635	0.184	8	-10.785	1	0.0456	0.665	0	0.146	0.177	128.424	4	240200
24ntSW3QVJzR79lHAAOTaY	0.636	0.634	7	-10.01	1	0.0342	0.0364	0.147	0.0998	0.599	111.563	4	252812
3V0nnQhqvbE3JmiDdnzQFQ	0.708	0.211	9	-9.603	0	0.0424	0.853	0	0.131	0.362	72.5	4	152280
1Omt5bfz1tZUCqd26HxbS0	0.581	0.687	6	-5.4	1	0.105	0.229	0	0.109	0.187	76.014	4	240600
65GbQI9VDTs7vo6MJL2iJA	0.424	0.465	6	-6.595	1	0.0297	0.461	5.52e-05	0.154	0.462	112.418	3	206387
3dvXRk7TZ929m21p49RR5P	0.593	0.576	2	-10.331	1	0.032	0.526	0.718	0.0827	0.559	109.935	4	310554
2DccHqTquzubziHAPZRdct	0.732	0.734	7	-10.574	1	0.0541	0.0777	0.172	0.327	0.687	104.764	4	274391
1EUOby36hEzSkTVVKRAWQP	0.675	0.28	3	-11.854	1	0.0632	0.594	0.00916	0.109	0.218	129.942	4	190433
7FxzgizJRGTQ3fxUqfvljg	0.783	0.629	5	-6.152	0	0.0607	0.231	0.000536	0.0881	0.7	111.978	4	207307
7pnVHbcqbmP7LA1ey3ydvu	0.667	0.556	5	-8.921	0	0.0306	0.0591	0.0108	0.0972	0.692	132.83	4	314684
7ycWLEP1GsNjVvcjawXz3z	0.854	0.569	5	-8.151	0	0.106	0.0609	0.0816	0.1	0.294	80.015	4	205040
2aPTvyE09vUCRwVvj0I8WK	0.721	0.707	6	-6.364	1	0.0595	0.181	3.68e-06	0.143	0.743	125.005	4	158206
2N3U8uTYhjX2KwGT0pf5x0	0.394	0.661	4	-8.684	1	0.192	0.00996	0	0.343	0.335	149.818	4	260987
4X5f3vT8MRuXF68pfjNte5	0.853	0.693	1	-6.87	1	0.275	0.0239	0	0.11	0.662	95.967	4	233787
7zjEyeBsaw9gV0jofJLfOM	0.767	0.313	7	-12.059	1	0.0798	0.838	0	0.105	0.765	82.582	4	210907
4S7YHmlWwfwArgd8LfSPud	0.598	0.252	2	-15.086	1	0.0644	0.194	0.133	0.0992	0.0352	120.064	4	238307
1jzIJcHCXneHw7ojC6LXiF	0.538	0.612	2	-6.02	1	0.424	0.308	0	0.213	0.684	168.197	4	182493
2gAGWaK4wvt2xrFUlR4mK8	0.284	0.803	2	-5.293	0	0.173	0.302	0	0.242	0.553	67.536	4	323960
1j6kDJttn6wbVyMaM42Nxm	0.485	0.72	6	-5.991	1	0.127	0.0123	0	0.0546	0.0471	207.982	4	126960
1AqemxWsT0iGg5Lvkm16Bt	0.798	0.412	2	-9.305	1	0.36	0.443	7.43e-05	0.219	0.304	135.959	4	192973
1WBSFlSLyOZnSa8fj7a5yC	0.434	0.531	1	-9.553	1	0.0425	0.781	0.0134	0.135	0.641	131.199	4	230200
7H0UxIN751StFi2tznmHlg	0.621	0.569	2	-7.318	0	0.0297	0.928	0.0361	0.115	0.402	110.022	4	257480
5loVmc3MmtYGsTw12eDgcU	0.211	0.708	8	-6.008	1	0.0507	0.798	0.00402	0.0742	0.476	179.794	3	345093
2bxQP85JNU11CQV4KXCnau	0.728	0.679	11	-6.764	1	0.0271	0.296	0.00733	0.11	0.953	131.715	4	254387
1dD6UAnqCJotTyU1bhCnDQ	0.619	0.874	0	-7.014	1	0.0353	0.391	0.363	0.466	0.961	89.582	4	170640
1xRzpBiy7nmgP0oVmnseNF	0.697	0.729	11	-6.402	1	0.0675	0.488	0.637	0.0673	0.81	94.044	4	217400
3XHtGQBlfMHfKcXdTX7Mt0	0.561	0.739	7	-7.752	1	0.028	0.0846	0.422	0.1	0.146	123.983	4	164773
56llQt0PCV67SUpmOTBLDs	0.749	0.292	1	-8.988	0	0.0356	0.714	0.0476	0.118	0.483	109.795	4	221720
13NiyfKg0aELrTWvgVL7eH	0.572	0.557	9	-6.249	0	0.0397	0.034	0.686	0.1	0.837	90.006	4	166973
3rWZv4pUVvPkQLYm3ItGDv	0.504	0.607	10	-8.1	1	0.0323	0.456	0.573	0.0765	0.337	133.393	3	246643
0P2vjYoUjjHBeYArlQtRmf	0.244	0.719	5	-5.675	1	0.031	0.000826	0.855	0.186	0.441	99.61	4	133703
60JTA6msKu6uFlpvK8Tynn	0.282	0.942	11	-3.058	1	0.0696	0.00136	0.00057	0.453	0.687	92.318	4	143253
1ZUTRq6PQhYfHJk3qeP7FR	0.476	0.564	9	-9.559	1	0.0282	0.296	0.00424	0.129	0.178	95.833	4	183427
3Gb1M4i5UlDauEnaLJF2HT	0.57	0.667	0	-8.108	1	0.0294	0.259	0.79	0.158	0.683	125.658	4	208907
3AIt9LB3C7Jz99OnvVjbyv	0.327	0.5	0	-9.585	1	0.0789	0.926	0.657	0.113	0.302	168.963	3	275781
20OiuevLsmNprmh6wZKljU	0.43	0.678	10	-7.776	1	0.037	0.127	0.147	0.464	0.559	143.41	4	165067
4viHP6kRmImqmVGQjE8sks	0.216	0.744	6	-4.232	0	0.0318	0.00676	0.126	0.186	0.56	153.195	4	156183
2kkJY0ENKaDX5Np8fjyYLM	0.282	0.856	9	-5.19	1	0.0375	8.3e-05	0.44	0.056	0.858	170.607	4	167892
0J0UZpA2Ivp4qaXe3QzCrT	0.319	0.61	5	-6.863	1	0.0314	0.195	0.0222	0.38	0.352	139.99	4	200825
1uSkFxzLIEtObyJtROqbnl	0.506	0.779	0	-4.634	1	0.0365	0.0227	0.0134	0.183	0.384	97.531	4	199493
3n69hLUdIsSa1WlRmjMZlW	0.615	0.658	5	-7.299	1	0.0343	0.096	0.000911	0.205	0.293	150.093	4	227080
4iEOVEULZRvmzYSZY2ViKN	0.697	0.877	3	-4.465	1	0.0462	0.462	0.00943	0.083	0.802	101.99	4	173631
4tmwiN9YU7xMjh2hoqcVuI	0.359	0.48	5	-10.634	1	0.0349	0.779	0.00328	0.0784	0.283	171.75	4	305981
7DdXf9x75iEVCHWfoRwRuR	0.584	0.594	9	-6.935	1	0.0487	0.142	0.00117	0.105	0.36	143.935	4	219400
3xqxETvPg43KWP0HOGiOmu	0.682	0.581	7	-10.339	1	0.0295	0.714	0.323	0.0802	0.539	108.98	4	217320
3aA5fk4c6a7e5HM4rJqkSF	0.578	0.675	2	-9.208	1	0.03	0.787	0.403	0.116	0.281	147.947	4	228707
1o22EcqsCANhwYdaNOSdwS	0.702	0.607	2	-6.509	1	0.0405	0.364	0.0271	0.123	0.436	116.969	4	181400
3i4ColsuZEvjeLz63m0jPt	0.587	0.722	7	-8.332	1	0.0574	0.133	0.00322	0.133	0.294	81.973	4	198840
6neF3KiuooS7xcTtj18PRL	0.507	0.977	8	-2.845	0	0.134	0.015	0	0.13	0.34	126.011	4	233620
0pCTr2E9CtulIwNprituKi	0.609	0.413	5	-11.407	1	0.0351	0.876	0.0239	0.0799	0.0697	130.969	4	238747
0xFiDbmCNEcs8TE9hToHpa	0.715	0.858	6	-8.785	0	0.887	0.934	0.000582	0.164	0.698	80.534	4	122857
0V6QNE31BWyMuiKlvDRnE9	0.623	0.819	7	-6.377	1	0.222	0.121	0.141	0.118	0.705	79.435	4	254049
41t7RkFBjaEFoGvr29QhYL	0.593	0.565	1	-9.441	1	0.335	0.355	0.0122	0.229	0.368	87.994	4	242067
7fjLBPTsQrbkV2WRedi2bw	0.683	0.86	7	-7.317	1	0.31	0.0117	0.000379	0.356	0.298	143.311	4	175357
1pHKJodnA1bOXyWj981Tmx	0.717	0.821	1	-7.183	0	0.195	0.00478	0.625	0.0801	0.54	96.984	4	163058
08rUqqyHYLORJvK6pqiUOM	0.461	0.736	0	-5.934	1	0.197	0.00203	8.3e-06	0.0804	0.313	179.373	4	215265
36iXvmiL3tsJX0QfhVZkhb	0.453	0.552	1	-7.519	1	0.219	0.146	0	0.683	0.807	168.576	4	133170
4eJpFVLqB3SVzciiTdK82L	0.434	0.736	2	-6.709	1	0.281	0.414	0	0.863	0.388	142.061	4	184032
46lQe6895zxB3HRP6YPbnl	0.66	0.666	7	-7.897	1	0.455	0.384	1.37e-06	0.163	0.601	85.567	4	185493
7EGZTx7rDYoSzUtqsETyxz	0.627	0.478	2	-11.803	0	0.344	0.768	0.00262	0.0754	0.353	164.035	1	43803
\.


--
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: cnicosia
--

COPY public.genres (genre, is_seed) FROM stdin;
alternative r&b	f
art pop	f
escape room	f
experimental r&b	f
alternative hip hop	f
canadian modern jazz	f
indie soul	f
funk	f
soul	f
indie folk	f
stomp and holler	f
indie pop	f
indie rock	f
modern rock	f
washington indie	f
british soul	f
neo soul	f
psychedelic soul	f
alternative rock	f
garage rock	f
rock	f
scottish rock	f
pop	f
r&b	f
dance pop	f
hip hop	f
urban contemporary	f
album rock	f
classic rock	f
hard rock	f
heartland rock	f
mellow gold	f
new wave pop	f
soft rock	f
channel islands indie	f
hyperpop	f
vapor soul	f
conscious hip hop	f
rap	f
west coast rap	f
canadian contemporary r&b	f
canadian pop	f
brill building pop	f
classic girl group	f
post-hardcore	f
screamo	f
neo mellow	f
pop rock	f
singer-songwriter	f
dream pop	f
melancholia	f
shoegaze	f
slowcore	f
new romantic	f
new wave	f
permanent wave	f
sophisti-pop	f
synthpop	f
alternative metal	f
blues rock	f
nu metal	f
palm desert scene	f
stoner metal	f
stoner rock	f
australian rock	f
dance rock	f
funk rock	f
alternative country	f
new americana	f
atl hip hop	f
baroque pop	f
psychedelic rock	f
sunshine pop	f
indie r&b	f
motown	f
quiet storm	f
deathgrass	f
disco	f
cyberpunk	f
electronic rock	f
industrial	f
industrial metal	f
industrial rock	f
bass trap	f
edm	f
electro house	f
electronic trap	f
electropop	f
pop dance	f
vapor twitch	f
turntablism	f
boy band	f
contemporary r&b	f
new jack swing	f
underground hip hop	f
anti-folk	f
chamber pop	f
elephant 6	f
lo-fi	f
kc indie	f
alternative dance	f
indietronica	f
new rave	f
swedish electropop	f
swedish indie pop	f
swedish synthpop	f
austin americana	f
austindie	f
country rap	f
bedroom pop	f
classic soul	f
memphis soul	f
soul blues	f
southern soul	f
classic uk pop	f
glam rock	f
reggae fusion	f
ska mexicano	f
ska punk	f
punk	f
post-punk	f
protopunk	f
art rock	f
dark wave	f
gothic rock	f
uk post-punk	f
ohio hip hop	f
madchester	f
indie poptimism	f
modern alternative rock	f
brooklyn indie	f
experimental pop	f
modern blues	f
east coast hip hop	f
indie surf	f
neo-psychedelic	f
abstract hip hop	f
albuquerque indie	f
lgbtq+ hip hop	f
retro soul	f
lilith	f
piano rock	f
folk rock	f
roots rock	f
supergroup	f
canadian indie	f
quebec indie	f
yacht rock	f
north carolina hip hop	f
britpop	f
dark pop	f
doomgaze	f
gaian doom	f
sacramento indie	f
roots americana	f
british invasion	f
bubblegum pop	f
canadian singer-songwriter	f
classic canadian rock	f
la pop	f
shimmer pop	f
la indie	f
minneapolis sound	f
synth funk	f
rap metal	f
garage pop	f
indie garage rock	f
punk blues	f
chicago indie	f
trap soul	f
new weird america	f
toronto indie	f
modern folk rock	f
double drumming	f
black americana	f
german pop	f
deep new americana	f
rap rock	f
gangster rap	f
pop rap	f
southern hip hop	f
trap	f
axe	f
brazilian percussion	f
mpb	f
pagode	f
samba	f
samba reggae	f
dreamo	f
emo	f
philly indie	f
boom bap	f
hardcore hip hop	f
jazz boom bap	f
afrofuturism	f
hip pop	f
afrobeat	f
brass band	f
instrumental funk	f
boston rock	f
jacksonville indie	f
portland indie	f
nyc pop	f
detroit rock	f
michigan indie	f
acoustic punk	f
art punk	f
zolo	f
irish singer-songwriter	f
swedish alternative rock	f
english indie rock	f
metal	f
miami indie	f
classic garage rock	f
freakbeat	f
etherpop	f
\.


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: cnicosia
--

COPY public.items (id, user_id, date, item_type, timespan, rank, spotify_id) FROM stdin;
1	12163992542	1667859029	track	long_term	1	1Kjw0LwdniCWran4PxJqPQ
2	12163992542	1667859029	track	long_term	2	1I40L32fTSSkBkPeArX9Ul
3	12163992542	1667859029	track	long_term	3	5fBjPtOxhgdpU6LNWLyVHv
4	12163992542	1667859029	track	long_term	4	4FE9SgxcOoCNuGnaaU8TXz
5	12163992542	1667859029	track	long_term	5	4FF4q2qyOsFhRavZ0bdVXT
6	12163992542	1667859029	track	long_term	6	0qprlw0jfsW4H9cG0FFE0Z
7	12163992542	1667859029	track	long_term	7	3jp7Ryj1sX3riA7NQaVlLd
8	12163992542	1667859029	track	long_term	8	2I88NEWpKrAPZuapXNV5G6
9	12163992542	1667859029	track	long_term	9	6YZQx90VEuzf0lRY9TYh7j
10	12163992542	1667859029	track	long_term	10	54b8qPFqYqIndfdxiLApea
11	12163992542	1667859029	track	long_term	11	3sTN90bIP2cJ1783ctHykO
12	12163992542	1667859029	track	long_term	12	2P3SLxeQHPqh8qKB6gtJY2
13	12163992542	1667859029	track	long_term	13	474uVhyGgK5MtY9gMcDgGl
14	12163992542	1667859029	track	long_term	14	16ro1is6DmDKkarlJMBbzV
15	12163992542	1667859029	track	long_term	15	4frLb7nWtsz2ymBE6k2GRP
16	12163992542	1667859029	track	long_term	16	2G2YzndIA6jeWFPBXhUjh5
17	12163992542	1667859029	track	long_term	17	5jZ1Z2GFTf2gwmFc3qiUxs
18	12163992542	1667859029	track	long_term	18	5vyt44455ipNNVSYq8fYY7
19	12163992542	1667859029	track	long_term	19	1OFKUn2VLafrHj7ybnap0Q
20	12163992542	1667859029	track	long_term	20	21oJ1K99GBJrE2GVQGVjA0
21	12163992542	1667859029	track	long_term	21	1LzNfuep1bnAUR9skqdHCK
22	12163992542	1667859029	track	long_term	22	748yv6bb3l3CcKS45a6SZ8
23	12163992542	1667859029	track	long_term	23	6NvRxjfYkkT2SpirAlmsjH
24	12163992542	1667859029	track	long_term	24	0hJS3EHWC4uL9sJ52ErpoN
25	12163992542	1667859029	track	long_term	25	1ZaNp6b4cY3zcrciagi7td
26	12163992542	1667859029	track	long_term	26	1qQSRy9DjrGh3jtsSCU6B1
27	12163992542	1667859029	track	long_term	27	3s8MBOMdUi5Vol77qq8KJJ
28	12163992542	1667859029	track	long_term	28	4j3GWI86JvSaF0BLdmgcfF
29	12163992542	1667859029	track	long_term	29	4f8Mh5wuWHOsfXtzjrJB3t
30	12163992542	1667859029	track	long_term	30	6VojZJpMyuKClbwyilWlQj
31	12163992542	1667859029	track	long_term	31	1TDdYSYLIXMJ4EiKO6ZCYk
32	12163992542	1667859029	track	long_term	32	1RbOObDFn7GOseR1w529Zj
33	12163992542	1667859029	track	long_term	33	0Hw6SCrtU9pFCjgAONpnGZ
34	12163992542	1667859029	track	long_term	34	0S29RwGLJutn4qnFJQL13n
35	12163992542	1667859029	track	long_term	35	5SCB7L1alKg7ZEeSw7Sq9f
36	12163992542	1667859029	track	long_term	36	3aN2V18W3EiW7eg5tHALpF
37	12163992542	1667859029	track	long_term	37	5hVghJ4KaYES3BFUATCYn0
38	12163992542	1667859029	track	long_term	38	6fc51JZVE0Yijdi6RuoLFv
39	12163992542	1667859029	track	long_term	39	3zJ5RDG0bLQAV2rntFgUtb
40	12163992542	1667859029	track	long_term	40	6iGU74CwXuT4XVepjc9Emf
41	12163992542	1667859029	track	long_term	41	7wdzLe2Gsx1RGqbvYZHASz
42	12163992542	1667859029	track	long_term	42	3imS277wRbz1CFoDySgTff
43	12163992542	1667859029	track	long_term	43	3mT1AONeTJDi1k8vH8pA2L
44	12163992542	1667859029	track	long_term	44	7Cu2COdH93MnuireuKNiS3
45	12163992542	1667859029	track	long_term	45	7JmPqImeW3kLoYVNBA9v11
46	12163992542	1667859029	track	long_term	46	2aCKBrLn7rbhStk5k4FwnF
47	12163992542	1667859029	track	long_term	47	0vJvCnuxXL2BCSRa1ZoeNl
48	12163992542	1667859029	track	long_term	48	1zkkvSLk5Nh4uoyKWwuie9
49	12163992542	1667859029	track	long_term	49	62wdQ5CInFr7cjISqrr46f
50	12163992542	1667859029	track	long_term	50	3iVp14VoAsAZkIdgQoRRAb
51	12163992542	1667859029	track	medium_term	1	16ro1is6DmDKkarlJMBbzV
52	12163992542	1667859029	track	medium_term	2	0hJS3EHWC4uL9sJ52ErpoN
53	12163992542	1667859029	track	medium_term	3	5vyt44455ipNNVSYq8fYY7
54	12163992542	1667859029	track	medium_term	4	474uVhyGgK5MtY9gMcDgGl
55	12163992542	1667859029	track	medium_term	5	1TDdYSYLIXMJ4EiKO6ZCYk
56	12163992542	1667859029	track	medium_term	6	04M3DsiMNyn8s5XQJrW5sL
57	12163992542	1667859029	track	medium_term	7	63k361zOGEhmvgzBdzzSGP
58	12163992542	1667859029	track	medium_term	8	6fc51JZVE0Yijdi6RuoLFv
59	12163992542	1667859029	track	medium_term	9	5zzWx7oJ9zBmv76uFaFeYR
60	12163992542	1667859029	track	medium_term	10	5rfT032kGmLvbxZzfHlu5D
61	12163992542	1667859029	track	medium_term	11	2pA4ip3VIEVcIa3qE02oAX
62	12163992542	1667859029	track	medium_term	12	1k7aPYyAnNTjVbjw1YDNp1
63	12163992542	1667859029	track	medium_term	13	41xaZ4WLlKD95U5PknoJrV
64	12163992542	1667859029	track	medium_term	14	1zkkvSLk5Nh4uoyKWwuie9
65	12163992542	1667859029	track	medium_term	15	33vFhGNZa44VJ0I21AOGYe
66	12163992542	1667859029	track	medium_term	16	03v70ZBxmcPX3RWAZMzqaW
67	12163992542	1667859029	track	medium_term	17	1RzgWAFlI6KOenjOxJYcH0
68	12163992542	1667859029	track	medium_term	18	2OeL43EXwaC205Xr1da1qJ
69	12163992542	1667859029	track	medium_term	19	5CU1bbfY1wUPm7fU255Dhf
70	12163992542	1667859029	track	medium_term	20	0dqJjKKxuKD5Dt3QH2n4CG
71	12163992542	1667859029	track	medium_term	21	5C90m8eM6GJR2SACiLAWHo
72	12163992542	1667859029	track	medium_term	22	4Fc62OkXYtEOjMmaSyJoQY
73	12163992542	1667859029	track	medium_term	23	5L7IgwUPhir2FJftGNXJDW
74	12163992542	1667859029	track	medium_term	24	35mL8keNDi2VLHrFXZCgJR
75	12163992542	1667859029	track	medium_term	25	3aN2V18W3EiW7eg5tHALpF
76	12163992542	1667859029	track	medium_term	26	50bmpfgcV29ouRVDfr5wOc
77	12163992542	1667859029	track	medium_term	27	5IRdIQNIZzVqE4XyBylkvd
78	12163992542	1667859029	track	medium_term	28	4FF4q2qyOsFhRavZ0bdVXT
79	12163992542	1667859029	track	medium_term	29	244QS6446wyO1UfVTWlOlR
80	12163992542	1667859029	track	medium_term	30	5do7Ql6G8N03fY6G9Y08Ec
81	12163992542	1667859029	track	medium_term	31	6YZQx90VEuzf0lRY9TYh7j
82	12163992542	1667859029	track	medium_term	32	0ZAbupc7jAQpG9IxojQ3s3
83	12163992542	1667859029	track	medium_term	33	6MDijuuArPJv1vbp7K1x3f
84	12163992542	1667859029	track	medium_term	34	0b2vqB7QNT4z8nnaYqbuel
85	12163992542	1667859029	track	medium_term	35	3LcjZGk0GBlPRe5XhYVGgM
86	12163992542	1667859029	track	medium_term	36	47KDDZgFiX1w6RFOuLXsSn
87	12163992542	1667859029	track	medium_term	37	0JXXNGljqupsJaZsgSbMZV
88	12163992542	1667859029	track	medium_term	38	3banchOoe2giyRK0jaO1c7
89	12163992542	1667859029	track	medium_term	39	37ZvpHeZKazqOnLfAGm9nb
90	12163992542	1667859029	track	medium_term	40	7l5j3FapCyr6HxUgoAynM2
91	12163992542	1667859029	track	medium_term	41	27AG99NmWMFLRoyZMMPNW2
92	12163992542	1667859029	track	medium_term	42	7trx783SvnHhKkmgSSTIFJ
93	12163992542	1667859029	track	medium_term	43	5VA4Ispp52EA1sOqzMz3Av
94	12163992542	1667859029	track	medium_term	44	4hv7GT5g9qNnrxlocsOSYt
95	12163992542	1667859029	track	medium_term	45	7qHoVZ6076OGx18G6W5vQ9
96	12163992542	1667859029	track	medium_term	46	4PFiLGx8jAzcAJxwPLUeZ9
97	12163992542	1667859029	track	medium_term	47	1ULovMYbbglXIn9TQzMsKz
98	12163992542	1667859029	track	medium_term	48	4isk4UYRcmslphcTq61xUg
99	12163992542	1667859029	track	medium_term	49	5WoaF1B5XIEnWfmb5NZikf
100	12163992542	1667859029	track	medium_term	50	7sf0tmuGZlHXUWpi9dQqcw
101	12163992542	1667859029	track	short_term	1	0b2vqB7QNT4z8nnaYqbuel
102	12163992542	1667859029	track	short_term	2	474uVhyGgK5MtY9gMcDgGl
103	12163992542	1667859029	track	short_term	3	16ro1is6DmDKkarlJMBbzV
104	12163992542	1667859029	track	short_term	4	5vyt44455ipNNVSYq8fYY7
105	12163992542	1667859029	track	short_term	5	1TDdYSYLIXMJ4EiKO6ZCYk
106	12163992542	1667859029	track	short_term	6	0hJS3EHWC4uL9sJ52ErpoN
107	12163992542	1667859029	track	short_term	7	5p0bEz7DNsULez2X9yrNGa
108	12163992542	1667859029	track	short_term	8	1k7aPYyAnNTjVbjw1YDNp1
109	12163992542	1667859029	track	short_term	9	6fc51JZVE0Yijdi6RuoLFv
110	12163992542	1667859029	track	short_term	10	1dxXQuExRVu77xF1r5YtRF
111	12163992542	1667859029	track	short_term	11	3Pu3IChaAoa5EjgUBv5F6x
112	12163992542	1667859029	track	short_term	12	0wejso6CHHEEqvTD3f3gBz
113	12163992542	1667859029	track	short_term	13	23od4rorIdhvYeLL7YqP9n
114	12163992542	1667859029	track	short_term	14	2I3ZdIFXnRn1PSAdMC4w71
115	12163992542	1667859029	track	short_term	15	7Cva2EgJougx6O6M5xgWAq
116	12163992542	1667859029	track	short_term	16	7KR5uycb8gfQYRl1MTL8aB
117	12163992542	1667859029	track	short_term	17	7xjbn0bhs7zx7E1s0lCqT3
118	12163992542	1667859029	track	short_term	18	63k361zOGEhmvgzBdzzSGP
119	12163992542	1667859029	track	short_term	19	1zkkvSLk5Nh4uoyKWwuie9
120	12163992542	1667859029	track	short_term	20	2OeL43EXwaC205Xr1da1qJ
121	12163992542	1667859029	track	short_term	21	4Fc62OkXYtEOjMmaSyJoQY
122	12163992542	1667859029	track	short_term	22	33vFhGNZa44VJ0I21AOGYe
123	12163992542	1667859029	track	short_term	23	1RzgWAFlI6KOenjOxJYcH0
124	12163992542	1667859029	track	short_term	24	41xaZ4WLlKD95U5PknoJrV
125	12163992542	1667859029	track	short_term	25	244QS6446wyO1UfVTWlOlR
126	12163992542	1667859029	track	short_term	26	1AR58rtcLziNnRHTCmCywd
127	12163992542	1667859029	track	short_term	27	2Wi5ubKr8zSk8L3CLemyS4
128	12163992542	1667859029	track	short_term	28	3Cx9j78Z0NE6jYwBWvvV3P
129	12163992542	1667859029	track	short_term	29	4J6JARDGkdc1fqLEflP94Z
130	12163992542	1667859029	track	short_term	30	5eKfpH2dQ7FltCqb7LWEGJ
131	12163992542	1667859029	track	short_term	31	4TIJ7zSBNejpoIPaWpWRKc
132	12163992542	1667859029	track	short_term	32	56KqaFSGTb7ifpt16t5Y1N
133	12163992542	1667859029	track	short_term	33	72dIN8F7D5ydB3auSqNi84
134	12163992542	1667859029	track	short_term	34	21YxK0klhpfLW8budkJaMF
135	12163992542	1667859029	track	short_term	35	29iwiYD3KVWBKxe31nGjEL
136	12163992542	1667859029	track	short_term	36	3YZa4IzxK2UtEKTvdTgsi8
137	12163992542	1667859029	track	short_term	37	5El6bpLd8nYPsvWgZLdHio
138	12163992542	1667859029	track	short_term	38	7xENAAODeE2hKzdWFI6YaB
139	12163992542	1667859029	track	short_term	39	50bmpfgcV29ouRVDfr5wOc
140	12163992542	1667859029	track	short_term	40	04M3DsiMNyn8s5XQJrW5sL
141	12163992542	1667859029	track	short_term	41	0dqJjKKxuKD5Dt3QH2n4CG
142	12163992542	1667859029	track	short_term	42	4oB0d8H93GtllDkoHNuLIN
143	12163992542	1667859029	track	short_term	43	0WQiDwKJclirSYG9v5tayI
144	12163992542	1667859029	track	short_term	44	0ncGfTV06HogJIgn2Ujjgb
145	12163992542	1667859029	track	short_term	45	0vF9RAGwgYtfO1Aajwb7et
146	12163992542	1667859029	track	short_term	46	10fiZCExnOMqElSX952WZI
147	12163992542	1667859029	track	short_term	47	14z3RzUHeZQgtpOlSYvmZD
148	12163992542	1667859029	track	short_term	48	1e5XqFTNIrlgpXGjwPSykv
149	12163992542	1667859029	track	short_term	49	1wgU78h61rVCbOsFAHv2Hw
150	12163992542	1667859029	track	short_term	50	29Znt9AbEH9FSsw86zPAYT
151	12163992542	1667859032	artist	long_term	1	1Xyo4u8uXC1ZmMpatF05PJ
152	12163992542	1667859032	artist	long_term	2	00FQb4jTyendYWaN8pK0wa
153	12163992542	1667859032	artist	long_term	3	360IAlyVv4PCEVjgyMZrxK
154	12163992542	1667859032	artist	long_term	4	4hz8tIajF2INpgM0qzPJz2
155	12163992542	1667859032	artist	long_term	5	4V8LLVI7PbaPR0K2TGSxFF
156	12163992542	1667859032	artist	long_term	6	4lujUKeO6nQAJXpq37Epn7
157	12163992542	1667859032	artist	long_term	7	0bzfPKdbXL5ezYW2z3UGQj
158	12163992542	1667859032	artist	long_term	8	5wFXmYsg3KFJ8BDsQudJ4f
159	12163992542	1667859032	artist	long_term	9	462T0buQ5ScBUQCRpodDRf
160	12163992542	1667859032	artist	long_term	10	0YrtvWJMgSdVrk3SfNjTbx
161	12163992542	1667859032	artist	long_term	11	6ltzsmQQbmdoHHbLZ4ZN25
162	12163992542	1667859032	artist	long_term	12	3jK9MiCrA42lLAdMGUZpwa
163	12163992542	1667859032	artist	long_term	13	3qnGvpP8Yth1AqSBMqON5x
164	12163992542	1667859032	artist	long_term	14	60df5JBRRPcnSpsIMxxwQm
165	12163992542	1667859032	artist	long_term	15	13ubrt8QOOCPljQ2FL1Kca
166	12163992542	1667859032	artist	long_term	16	2YZyLoL8N0Wb9xBt1NhZWg
167	12163992542	1667859032	artist	long_term	17	6QRlkjrHz5A62mqeNZz7t3
168	12163992542	1667859032	artist	long_term	18	5CuU6SRJjbbZL926nSGGxX
169	12163992542	1667859032	artist	long_term	19	6pmxr66tMAePxzOLfjGNcX
170	12163992542	1667859032	artist	long_term	20	3XHO7cRUPCLOr6jwp8vsx5
171	12163992542	1667859032	artist	long_term	21	20wkVLutqVOYrc0kxFs7rA
172	12163992542	1667859032	artist	long_term	22	2h93pZq0e7k5yf4dywlkpM
173	12163992542	1667859032	artist	long_term	23	6eU0jV2eEZ8XTM7EmlguK6
174	12163992542	1667859032	artist	long_term	24	1zXCFUgH6FWS0iCiCKsH55
175	12163992542	1667859032	artist	long_term	25	6PEMFpe3PTOksdV4ZXUpbE
176	12163992542	1667859032	artist	long_term	26	3z6Gk257P9jNcZbBXJNX5i
177	12163992542	1667859032	artist	long_term	27	74oJ4qxwOZvX6oSsu1DGnw
178	12163992542	1667859032	artist	long_term	28	0XSqX2PB3C5dTMv7SZaxSm
179	12163992542	1667859032	artist	long_term	29	08GQAI4eElDnROBrJRGE0X
180	12163992542	1667859032	artist	long_term	30	6l3HvQ5sa6mXTsMTB19rO5
181	12163992542	1667859032	artist	long_term	31	6RZUqkomCmb8zCRqc9eznB
182	12163992542	1667859032	artist	long_term	32	0fA0VVWsXO9YnASrzqfmYu
183	12163992542	1667859032	artist	long_term	33	6ZK2nrW8aCTg8Bid7I7N10
184	12163992542	1667859032	artist	long_term	34	6TVVIyd0fsRDGg6WzHKyTP
185	12163992542	1667859032	artist	long_term	35	6tkrcmVfWoHC4WOhE7IDyq
186	12163992542	1667859032	artist	long_term	36	600GgDUq9kzGJgNIrVsWfz
187	12163992542	1667859032	artist	long_term	37	2jgPkn6LuUazBoBk6vvjh5
188	12163992542	1667859032	artist	long_term	38	6v8FB84lnmJs434UJf2Mrm
189	12163992542	1667859032	artist	long_term	39	3QTDHixorJelOLxoxcjqGx
190	12163992542	1667859032	artist	long_term	40	0qu422H5MOoQxGjd4IzHbS
191	12163992542	1667859032	artist	long_term	41	3ycxRkcZ67ALN3GQJ57Vig
192	12163992542	1667859032	artist	long_term	42	2ooIqOf4X2uz4mMptXCtie
193	12163992542	1667859032	artist	long_term	43	77SW9BnxLY8rJ0RciFqkHh
194	12163992542	1667859032	artist	long_term	44	5NYEE4kgrEZPlM3DxUsTyc
195	12163992542	1667859032	artist	long_term	45	2pAajGWerK3ghwToNWFENS
196	12163992542	1667859032	artist	long_term	46	75dQReiBOHN37fQgWQrIAJ
197	12163992542	1667859032	artist	long_term	47	22bE4uQ6baNwSHPVcDxLCe
198	12163992542	1667859032	artist	long_term	48	5a2EaR3hamoenG9rDuVn8j
199	12163992542	1667859032	artist	long_term	49	6Ghvu1VvMGScGpOUJBAHNH
200	12163992542	1667859032	artist	long_term	50	1KP6TWI40m7p3QBTU6u2xo
201	12163992542	1667859032	artist	medium_term	1	4hz8tIajF2INpgM0qzPJz2
202	12163992542	1667859032	artist	medium_term	2	360IAlyVv4PCEVjgyMZrxK
203	12163992542	1667859032	artist	medium_term	3	0fA0VVWsXO9YnASrzqfmYu
204	12163992542	1667859032	artist	medium_term	4	2ooIqOf4X2uz4mMptXCtie
205	12163992542	1667859032	artist	medium_term	5	0YrtvWJMgSdVrk3SfNjTbx
206	12163992542	1667859032	artist	medium_term	6	4n0gvapwYbRpzU5Ov68B6P
207	12163992542	1667859032	artist	medium_term	7	5wFXmYsg3KFJ8BDsQudJ4f
208	12163992542	1667859032	artist	medium_term	8	1KP6TWI40m7p3QBTU6u2xo
209	12163992542	1667859032	artist	medium_term	9	3jK9MiCrA42lLAdMGUZpwa
210	12163992542	1667859032	artist	medium_term	10	0XSqX2PB3C5dTMv7SZaxSm
211	12163992542	1667859032	artist	medium_term	11	4lujUKeO6nQAJXpq37Epn7
212	12163992542	1667859032	artist	medium_term	12	1zXCFUgH6FWS0iCiCKsH55
213	12163992542	1667859032	artist	medium_term	13	3XHO7cRUPCLOr6jwp8vsx5
214	12163992542	1667859032	artist	medium_term	14	4uSftVc3FPWe6RJuMZNEe9
215	12163992542	1667859032	artist	medium_term	15	6AWdGez5g1jxpfl9XD4wI3
216	12163992542	1667859032	artist	medium_term	16	462T0buQ5ScBUQCRpodDRf
217	12163992542	1667859032	artist	medium_term	17	7HeVXdOdMhLslVputGTZFQ
218	12163992542	1667859032	artist	medium_term	18	0V7uVrIYr4FwFvUN9S4kYr
219	12163992542	1667859032	artist	medium_term	19	6ltzsmQQbmdoHHbLZ4ZN25
220	12163992542	1667859032	artist	medium_term	20	6hnWRPzGGKiapVX1UCdEAC
221	12163992542	1667859032	artist	medium_term	21	2FRXiAz5Uz78LLLSwEUhLt
222	12163992542	1667859032	artist	medium_term	22	2pAajGWerK3ghwToNWFENS
223	12163992542	1667859032	artist	medium_term	23	1Xyo4u8uXC1ZmMpatF05PJ
224	12163992542	1667859032	artist	medium_term	24	7ITd48RbLVpUfheE7B86o2
225	12163992542	1667859032	artist	medium_term	25	0EdvGhlC1FkGItLOWQzG4J
226	12163992542	1667859032	artist	medium_term	26	1fZpYWNWdL5Z3wrDtISFUH
227	12163992542	1667859032	artist	medium_term	27	1yAwtBaoHLEDWAnWR87hBT
228	12163992542	1667859032	artist	medium_term	28	6LufpoVlIYKQCu9Gjpk8B7
229	12163992542	1667859032	artist	medium_term	29	6TVVIyd0fsRDGg6WzHKyTP
230	12163992542	1667859032	artist	medium_term	30	2kGBy2WHvF0VdZyqiVCkDT
231	12163992542	1667859032	artist	medium_term	31	00FQb4jTyendYWaN8pK0wa
232	12163992542	1667859032	artist	medium_term	32	0oSGxfWSnnOXhD2fKuz2Gy
233	12163992542	1667859032	artist	medium_term	33	60df5JBRRPcnSpsIMxxwQm
234	12163992542	1667859032	artist	medium_term	34	68kEuyFKyqrdQQLLsmiatm
235	12163992542	1667859032	artist	medium_term	35	1hzfo8twXdOegF3xireCYs
236	12163992542	1667859032	artist	medium_term	36	251UrhgNbMr15NLzQ2KyKq
237	12163992542	1667859032	artist	medium_term	37	4DFhHyjvGYa9wxdHUjtDkc
238	12163992542	1667859032	artist	medium_term	38	5IcR3N7QB1j6KBL8eImZ8m
239	12163992542	1667859032	artist	medium_term	39	3tJ9PkBOrG7hFkHeNM2tbw
240	12163992542	1667859032	artist	medium_term	40	3D4qYDvoPn5cQxtBm4oseo
241	12163992542	1667859032	artist	medium_term	41	0bzfPKdbXL5ezYW2z3UGQj
242	12163992542	1667859032	artist	medium_term	42	2ApaG60P4r0yhBoDCGD8YG
243	12163992542	1667859032	artist	medium_term	43	6RZUqkomCmb8zCRqc9eznB
244	12163992542	1667859032	artist	medium_term	44	6GEykX11lQqp92UVOQQCC7
245	12163992542	1667859032	artist	medium_term	45	1anAI9P9iSzc9qzLv6AtHZ
246	12163992542	1667859032	artist	medium_term	46	3qnGvpP8Yth1AqSBMqON5x
247	12163992542	1667859032	artist	medium_term	47	2auiVi8sUZo17dLy1HwrTU
248	12163992542	1667859032	artist	medium_term	48	75dQReiBOHN37fQgWQrIAJ
249	12163992542	1667859032	artist	medium_term	49	77SW9BnxLY8rJ0RciFqkHh
250	12163992542	1667859032	artist	medium_term	50	3kjuyTCjPG1WMFCiyc5IuB
251	12163992542	1667859032	artist	short_term	1	4hz8tIajF2INpgM0qzPJz2
252	12163992542	1667859032	artist	short_term	2	0YrtvWJMgSdVrk3SfNjTbx
253	12163992542	1667859032	artist	short_term	3	5wFXmYsg3KFJ8BDsQudJ4f
254	12163992542	1667859032	artist	short_term	4	4lujUKeO6nQAJXpq37Epn7
255	12163992542	1667859032	artist	short_term	5	0fA0VVWsXO9YnASrzqfmYu
256	12163992542	1667859032	artist	short_term	6	462T0buQ5ScBUQCRpodDRf
257	12163992542	1667859032	artist	short_term	7	0EdvGhlC1FkGItLOWQzG4J
258	12163992542	1667859032	artist	short_term	8	6TVVIyd0fsRDGg6WzHKyTP
259	12163992542	1667859032	artist	short_term	9	0oSGxfWSnnOXhD2fKuz2Gy
260	12163992542	1667859032	artist	short_term	10	6LufpoVlIYKQCu9Gjpk8B7
261	12163992542	1667859032	artist	short_term	11	75dQReiBOHN37fQgWQrIAJ
262	12163992542	1667859032	artist	short_term	12	3yY2gUcIsjMr8hjo51PoJ8
263	12163992542	1667859032	artist	short_term	13	0V7uVrIYr4FwFvUN9S4kYr
264	12163992542	1667859032	artist	short_term	14	1PryMSya1JnSAlcwYawCxp
265	12163992542	1667859032	artist	short_term	15	6ltzsmQQbmdoHHbLZ4ZN25
266	12163992542	1667859032	artist	short_term	16	6zvul52xwTWzilBZl6BUbT
267	12163992542	1667859032	artist	short_term	17	1anAI9P9iSzc9qzLv6AtHZ
268	12163992542	1667859032	artist	short_term	18	2bToe6WyGvADJftreuXh2K
269	12163992542	1667859032	artist	short_term	19	3RGLhK1IP9jnYFH4BRFJBS
270	12163992542	1667859032	artist	short_term	20	1fZpYWNWdL5Z3wrDtISFUH
271	12163992542	1667859032	artist	short_term	21	432R46LaYsJZV2Gmc4jUV5
272	12163992542	1667859032	artist	short_term	22	7FKTg75ADVMZgY3P9ZMRtH
273	12163992542	1667859032	artist	short_term	23	7bu3H8JO7d0UbMoVzbo70s
274	12163992542	1667859032	artist	short_term	24	1nGqKVGfPPiVgxMdx8hYOI
275	12163992542	1667859032	artist	short_term	25	1SQRv42e4PjEYfPhS0Tk9E
276	12163992542	1667859032	artist	short_term	26	60df5JBRRPcnSpsIMxxwQm
277	12163992542	1667859032	artist	short_term	27	0yNLKJebCb8Aueb54LYya3
278	12163992542	1667859032	artist	short_term	28	2oqwwcM17wrP9hBD25zKSR
279	12163992542	1667859032	artist	short_term	29	2ooIqOf4X2uz4mMptXCtie
280	12163992542	1667859032	artist	short_term	30	4BFMTELQyWJU1SwqcXMBm3
281	12163992542	1667859032	artist	short_term	31	0oL26Dn9y761yfJgNb3vfu
282	12163992542	1667859032	artist	short_term	32	0rpMdBzQXf7aYRnu5fDBJy
283	12163992542	1667859032	artist	short_term	33	2x9SpqnPi8rlE9pjHBwmSC
284	12163992542	1667859032	artist	short_term	34	1KP6TWI40m7p3QBTU6u2xo
285	12163992542	1667859032	artist	short_term	35	26T3LtbuGT1Fu9m0eRq5X3
286	12163992542	1667859032	artist	short_term	36	2FXC3k01G6Gw61bmprjgqS
287	12163992542	1667859032	artist	short_term	37	6Xa4nbrSTfbioA4lLShbjh
288	12163992542	1667859032	artist	short_term	38	6m4tJuf67jwVSvMP34hrck
289	12163992542	1667859032	artist	short_term	39	1nJvji2KIlWSseXRSlNYsC
290	12163992542	1667859032	artist	short_term	40	1zXCFUgH6FWS0iCiCKsH55
291	12163992542	1667859032	artist	short_term	41	32Ko3nL0210QAt14S3Rs4Y
292	12163992542	1667859032	artist	short_term	42	48vDIufGC8ujPuBiTxY8dm
293	12163992542	1667859032	artist	short_term	43	4zsrUnozu6zRlVELQezaBn
294	12163992542	1667859032	artist	short_term	44	00tVTdpEhQQw1bqdu8RCx2
295	12163992542	1667859032	artist	short_term	45	1Tp7C6LzxZe9Mix6rn4zbI
296	12163992542	1667859032	artist	short_term	46	1ikg4sypcURm8Vy5GP68xb
297	12163992542	1667859032	artist	short_term	47	22bE4uQ6baNwSHPVcDxLCe
298	12163992542	1667859032	artist	short_term	48	2g3PKH7Z1Ofn5oGR6oDjLy
299	12163992542	1667859032	artist	short_term	49	39vA9YljbnOApXKniLWBZv
300	12163992542	1667859032	artist	short_term	50	3RcaUsjj5gt1x2QK3TSNS2
\.


--
-- Data for Name: tracks; Type: TABLE DATA; Schema: public; Owner: cnicosia
--

COPY public.tracks (track_id, artist_id, album_id, name, popularity) FROM stdin;
1Kjw0LwdniCWran4PxJqPQ	0qu422H5MOoQxGjd4IzHbS	5wnCTZtzIZxasRSHzI1JeW	Kerosene!	56
1I40L32fTSSkBkPeArX9Ul	65dGLGjkw3UbddUg2GKQoZ	68HLpLmCtvFKUqwQpUCqwn	Time Moves Slow	1
5fBjPtOxhgdpU6LNWLyVHv	4lujUKeO6nQAJXpq37Epn7	6wYeJwJU9Y4fuLQVfGyJk9	Mad About You	59
4FE9SgxcOoCNuGnaaU8TXz	6ltzsmQQbmdoHHbLZ4ZN25	2oiJM8vFGpxrtGtFfJWhJv	When the Night is Over	59
4FF4q2qyOsFhRavZ0bdVXT	0YrtvWJMgSdVrk3SfNjTbx	4jQW2mhMH3TxtAOol3Djuf	Passenger Seat	49
0qprlw0jfsW4H9cG0FFE0Z	0bzfPKdbXL5ezYW2z3UGQj	0qxsfpy2VU0i4eDR9RTaAU	Cold Little Heart	64
3jp7Ryj1sX3riA7NQaVlLd	3M4ThdJR28z9eSMcQHAZ5G	6R6pjR9ocMYuqSuNx5e4mg	Whistle For The Choir	50
2I88NEWpKrAPZuapXNV5G6	30DhU7BDmF4PH0JVhu8ZRg	2ICdqEf91Kc9FwdlLtB748	Belong to You (feat. 6LACK)	62
6YZQx90VEuzf0lRY9TYh7j	360IAlyVv4PCEVjgyMZrxK	3fUHDbd0oujqAerhHZjdsj	Get You - Recorded at Spotify Studios NYC	46
54b8qPFqYqIndfdxiLApea	34jw2BbxjoYalTp8cJFCPv	56dfEbntfVTMCxjrjggL1e	Alone	74
3sTN90bIP2cJ1783ctHykO	5Q81rlcTFh3k6DQJXPdsot	0NBTBo1qrg554sAj79nEqD	Love$ick (feat. A$AP Rocky)	73
2P3SLxeQHPqh8qKB6gtJY2	2YZyLoL8N0Wb9xBt1NhZWg	3DGQ1iZ9XKUQxAUWjfC34w	Poetic Justice	72
474uVhyGgK5MtY9gMcDgGl	4hz8tIajF2INpgM0qzPJz2	7vXiklrUeffx5o2F8VYwm3	It's Called: Freefall	75
16ro1is6DmDKkarlJMBbzV	4hz8tIajF2INpgM0qzPJz2	7vXiklrUeffx5o2F8VYwm3	When It Lands	60
4frLb7nWtsz2ymBE6k2GRP	1Xyo4u8uXC1ZmMpatF05PJ	0P3oVJBFOv3TDXlYRhGL7s	Earned It (Fifty Shades Of Grey)	74
2G2YzndIA6jeWFPBXhUjh5	7CyeXFnOrfC1N6z4naIpgo	3vLFWR3fLqfY82WGvaLuyV	Be My Baby	67
5jZ1Z2GFTf2gwmFc3qiUxs	55VydwMyCuGcavwPuhutPL	57d5dFo7oN2yUyGfSKPrRv	The Taste of Ink	66
5vyt44455ipNNVSYq8fYY7	4hz8tIajF2INpgM0qzPJz2	7vXiklrUeffx5o2F8VYwm3	Fever Pitch	55
1OFKUn2VLafrHj7ybnap0Q	08ct2eZF5lUPdJpHwNKWof	5AYmpTfdv1OoASUJ5rZB7K	Only Wanna Be with You	69
21oJ1K99GBJrE2GVQGVjA0	30DhU7BDmF4PH0JVhu8ZRg	2ICdqEf91Kc9FwdlLtB748	Frozen	61
1LzNfuep1bnAUR9skqdHCK	37w38cCSGgKLdayTRjna4W	5K18gTgac0q6Jma5HkV1vA	Fade Into You	78
748yv6bb3l3CcKS45a6SZ8	4bthk9UfsYUYdcFyqxmSUU	2HyJKdwnnaM156kvcPDwr8	Head Over Heels	68
6NvRxjfYkkT2SpirAlmsjH	4pejUc4iciQfgdX6OKulQn	58HZZpS0wxJKwGjoerg0mk	No One Knows	66
0hJS3EHWC4uL9sJ52ErpoN	4hz8tIajF2INpgM0qzPJz2	7vXiklrUeffx5o2F8VYwm3	Hide	57
1ZaNp6b4cY3zcrciagi7td	7qKoy46vPnmIxKCN6ewBG4	0xAjncT0noqLbBH6iT4HjH	Cigarette Lighter Love Song - Live	14
1qQSRy9DjrGh3jtsSCU6B1	1eClJfHLoDI4rZe5HxzBFv	7cuwWzS0oiApEt2fpKafkX	Never Tear Us Apart	63
3s8MBOMdUi5Vol77qq8KJJ	2iul6etLF5hjjpxo43rzz7	05kYWbiEVwGcd2Y2wolwWz	Wolf Like Me ft. Shovels & Rope	0
4j3GWI86JvSaF0BLdmgcfF	73sIBHcqh3Z3NyqHKZ7FOL	15k99o4mZJ9mfpQGIOrZ45	Summertime Magic	62
4f8Mh5wuWHOsfXtzjrJB3t	4V8LLVI7PbaPR0K2TGSxFF	5zi7WsKlIiUXv09tbGLKsE	I THINK	72
6VojZJpMyuKClbwyilWlQj	3oDbviiivRWhXwIE8hxkVV	2ninxvLuYGCb6H92qTaSFZ	Wouldn't It Be Nice	58
1TDdYSYLIXMJ4EiKO6ZCYk	4hz8tIajF2INpgM0qzPJz2	7vXiklrUeffx5o2F8VYwm3	Mission to Mars	58
1RbOObDFn7GOseR1w529Zj	6loBF9iQdE11WSX29fNKqY	1V8qUSg1WAHf3dCrVYdJ5Z	Things Can Only Get Better	56
0Hw6SCrtU9pFCjgAONpnGZ	7guDJrEfX3qb6FEbdPA5qi	0qnHA4SDco9mPuWGzDqVDK	Uptight (Everything's Alright)	58
0S29RwGLJutn4qnFJQL13n	0YHgnSkV3S5mvSSCTRWDi5	511e7X2zYDqPWQGADatYz2	Georgia Law Man	44
5SCB7L1alKg7ZEeSw7Sq9f	57bUPid8xztkieZfS7OlEV	7vNmiLEdMqJYUlPxSx2zgg	I Hear A Symphony	49
3aN2V18W3EiW7eg5tHALpF	0X380XXQSNBYuleKzav5UO	4uiVwLbTzE6VMkXpaDAwB8	We're In This Together	56
5hVghJ4KaYES3BFUATCYn0	4V8LLVI7PbaPR0K2TGSxFF	5zi7WsKlIiUXv09tbGLKsE	EARFQUAKE	80
6fc51JZVE0Yijdi6RuoLFv	4hz8tIajF2INpgM0qzPJz2	7vXiklrUeffx5o2F8VYwm3	Painkillers	65
3zJ5RDG0bLQAV2rntFgUtb	0bzfPKdbXL5ezYW2z3UGQj	1yIqauTni1V7l7djYAKSsZ	You Ain't The Problem	53
6iGU74CwXuT4XVepjc9Emf	3oDbviiivRWhXwIE8hxkVV	6GphKx2QAPRoVGWE9D7ou8	God Only Knows - Mono / 1997 Remastered	67
7wdzLe2Gsx1RGqbvYZHASz	2YZyLoL8N0Wb9xBt1NhZWg	51C65YqHrDODM1hD5FEL5x	i	64
3imS277wRbz1CFoDySgTff	5eIbEEQnDM8yuDVB0bimSP	7GpuEZzRrPT4IGiEuWaBzy	Light Me Up	46
3mT1AONeTJDi1k8vH8pA2L	3pkmfqaBNsMqnXus05PNfP	6XBKxM9rbzyOBP6gpE0qhd	I've Been Thinking	0
7Cu2COdH93MnuireuKNiS3	20wkVLutqVOYrc0kxFs7rA	4uP43hIpmEEDuW7aOfiU2C	Streetcar	67
7JmPqImeW3kLoYVNBA9v11	1mFX1QlezK1lNPKQJkhwWb	1bTjSqotSDtUjcwFfukTQP	If It Isn't Love	58
2aCKBrLn7rbhStk5k4FwnF	7guDJrEfX3qb6FEbdPA5qi	6thSjE17RxW8tJFtLyXA3B	I Was Made To Love Her	54
0vJvCnuxXL2BCSRa1ZoeNl	0VbDAlm2KUlKI5UhXRBKWp	5wpZhWqsoXKBcVwvcEtCvv	Electric Feel	0
1zkkvSLk5Nh4uoyKWwuie9	4hz8tIajF2INpgM0qzPJz2	7vXiklrUeffx5o2F8VYwm3	Holy War	51
62wdQ5CInFr7cjISqrr46f	7KGqvFukcZRbQ7YFsYrgPa	4v9R5sk4HQ0X1krbEis34P	Baby	54
3iVp14VoAsAZkIdgQoRRAb	6PEMFpe3PTOksdV4ZXUpbE	0K3FiXt6ekJTWaUku3LpHL	Livvin	0
04M3DsiMNyn8s5XQJrW5sL	4hz8tIajF2INpgM0qzPJz2	2aaWMtuGxw17AZpKhZGdXQ	Cold Love	55
63k361zOGEhmvgzBdzzSGP	5wFXmYsg3KFJ8BDsQudJ4f	4hruYceqit29o6m4arpAql	The Sunshine	61
5zzWx7oJ9zBmv76uFaFeYR	4hz8tIajF2INpgM0qzPJz2	2aaWMtuGxw17AZpKhZGdXQ	Counting Cards	47
5rfT032kGmLvbxZzfHlu5D	2ooIqOf4X2uz4mMptXCtie	0vVekV45lOaVKs6RZQQNob	In the Aeroplane Over the Sea	65
2pA4ip3VIEVcIa3qE02oAX	1KP6TWI40m7p3QBTU6u2xo	17l7MIu0Jh0tdgK7or9ovw	10,000 Emerald Pools	62
1k7aPYyAnNTjVbjw1YDNp1	4hz8tIajF2INpgM0qzPJz2	7vXiklrUeffx5o2F8VYwm3	Moody Orange	49
41xaZ4WLlKD95U5PknoJrV	4hz8tIajF2INpgM0qzPJz2	7vXiklrUeffx5o2F8VYwm3	Matchbox	49
33vFhGNZa44VJ0I21AOGYe	4hz8tIajF2INpgM0qzPJz2	7vXiklrUeffx5o2F8VYwm3	Recktify	45
03v70ZBxmcPX3RWAZMzqaW	1KP6TWI40m7p3QBTU6u2xo	17l7MIu0Jh0tdgK7or9ovw	Clouds	61
1RzgWAFlI6KOenjOxJYcH0	4hz8tIajF2INpgM0qzPJz2	7vXiklrUeffx5o2F8VYwm3	Possum Queen	46
2OeL43EXwaC205Xr1da1qJ	4hz8tIajF2INpgM0qzPJz2	7vXiklrUeffx5o2F8VYwm3	Polite Company	49
5CU1bbfY1wUPm7fU255Dhf	2ooIqOf4X2uz4mMptXCtie	0vVekV45lOaVKs6RZQQNob	King of Carrot Flowers Pt. 1	60
0dqJjKKxuKD5Dt3QH2n4CG	1MIe1z4RdqLqHSJsb7EBMm	0y3tRiTDYzj5IuQb0Kk86x	Hands Down	55
5C90m8eM6GJR2SACiLAWHo	4hz8tIajF2INpgM0qzPJz2	2aaWMtuGxw17AZpKhZGdXQ	Wasted	57
4Fc62OkXYtEOjMmaSyJoQY	4hz8tIajF2INpgM0qzPJz2	2aaWMtuGxw17AZpKhZGdXQ	Run	46
5L7IgwUPhir2FJftGNXJDW	4hz8tIajF2INpgM0qzPJz2	15RYnRTIMHrCB6X3HjK2mC	Heart	60
35mL8keNDi2VLHrFXZCgJR	4hz8tIajF2INpgM0qzPJz2	4lGNpgFI67TUq5BMfnPe3Z	Shameful Company	48
50bmpfgcV29ouRVDfr5wOc	4hz8tIajF2INpgM0qzPJz2	2aaWMtuGxw17AZpKhZGdXQ	Lady Lie	59
5IRdIQNIZzVqE4XyBylkvd	4hz8tIajF2INpgM0qzPJz2	2aaWMtuGxw17AZpKhZGdXQ	American Shoes	45
244QS6446wyO1UfVTWlOlR	5wFXmYsg3KFJ8BDsQudJ4f	4hruYceqit29o6m4arpAql	The Maze	48
5do7Ql6G8N03fY6G9Y08Ec	4hz8tIajF2INpgM0qzPJz2	2aaWMtuGxw17AZpKhZGdXQ	Goodnight Chicago	57
0ZAbupc7jAQpG9IxojQ3s3	4hz8tIajF2INpgM0qzPJz2	2aaWMtuGxw17AZpKhZGdXQ	Cocaine Jesus	71
6MDijuuArPJv1vbp7K1x3f	4l1cKWYW591xnwEGxpUg3J	3pWJFrSX6apPzt4inM4zXt	Genghis Khan	60
0b2vqB7QNT4z8nnaYqbuel	0YrtvWJMgSdVrk3SfNjTbx	2PIWPTOIxbaVSjTnc30vXS	I Don’t Know How I Survive	54
3LcjZGk0GBlPRe5XhYVGgM	360IAlyVv4PCEVjgyMZrxK	05LEST8E8mkEIl2LRfUkcI	Caramelo Duro (feat. Kali Uchis)	51
47KDDZgFiX1w6RFOuLXsSn	1fZpYWNWdL5Z3wrDtISFUH	6gtu2oXhmDQN8TAsWimZbj	Tomorrow	67
0JXXNGljqupsJaZsgSbMZV	360IAlyVv4PCEVjgyMZrxK	493HYe7N5pleudEZRyhE7R	Sure Thing	80
3banchOoe2giyRK0jaO1c7	0AkmSuTOzM2pNCIOSP8ziv	7kb2GfJGvn8Gr0LCGBSQjZ	Hell and You	57
37ZvpHeZKazqOnLfAGm9nb	4hz8tIajF2INpgM0qzPJz2	2aaWMtuGxw17AZpKhZGdXQ	All's Well That Ends	61
7l5j3FapCyr6HxUgoAynM2	3dv4Q4q3LWOnbLJnC6GgTY	5CPwacWmIAaA5DLUq7EHUC	Gap in the Clouds	56
27AG99NmWMFLRoyZMMPNW2	2ooIqOf4X2uz4mMptXCtie	0vVekV45lOaVKs6RZQQNob	Two-Headed Boy	53
7trx783SvnHhKkmgSSTIFJ	4hz8tIajF2INpgM0qzPJz2	4lGNpgFI67TUq5BMfnPe3Z	First Class	64
5VA4Ispp52EA1sOqzMz3Av	360IAlyVv4PCEVjgyMZrxK	493HYe7N5pleudEZRyhE7R	All I Want Is You (feat. J. Cole)	73
4hv7GT5g9qNnrxlocsOSYt	360IAlyVv4PCEVjgyMZrxK	05LEST8E8mkEIl2LRfUkcI	Anointed	40
7qHoVZ6076OGx18G6W5vQ9	4hz8tIajF2INpgM0qzPJz2	2aaWMtuGxw17AZpKhZGdXQ	Bare Bones	48
4PFiLGx8jAzcAJxwPLUeZ9	60df5JBRRPcnSpsIMxxwQm	3YKQkIPHtWGuvkBeVNIMhg	Cigarettes and Coffee	59
1ULovMYbbglXIn9TQzMsKz	2ooIqOf4X2uz4mMptXCtie	0vVekV45lOaVKs6RZQQNob	King of Carrot Flowers Pts. 2 & 3	50
4isk4UYRcmslphcTq61xUg	360IAlyVv4PCEVjgyMZrxK	493HYe7N5pleudEZRyhE7R	Quickie	54
5WoaF1B5XIEnWfmb5NZikf	360IAlyVv4PCEVjgyMZrxK	05LEST8E8mkEIl2LRfUkcI	Sky Walker (feat. Travis Scott)	73
7sf0tmuGZlHXUWpi9dQqcw	360IAlyVv4PCEVjgyMZrxK	7ezeSBh9E63ijDAxn8Ke4P	Cadillac	33
5p0bEz7DNsULez2X9yrNGa	0YrtvWJMgSdVrk3SfNjTbx	2PIWPTOIxbaVSjTnc30vXS	Pepper	52
1dxXQuExRVu77xF1r5YtRF	0YrtvWJMgSdVrk3SfNjTbx	2PIWPTOIxbaVSjTnc30vXS	Roman Candles	53
3Pu3IChaAoa5EjgUBv5F6x	3JaAGmSTpJK35DqWrDUzBz	3PsFboiPeObjAc6gbQHt54	Ballroom Blitz	65
0wejso6CHHEEqvTD3f3gBz	0YrtvWJMgSdVrk3SfNjTbx	2PIWPTOIxbaVSjTnc30vXS	Rand McNally	51
23od4rorIdhvYeLL7YqP9n	0YrtvWJMgSdVrk3SfNjTbx	2PIWPTOIxbaVSjTnc30vXS	Foxglove Through The Clearcut	51
2I3ZdIFXnRn1PSAdMC4w71	0YrtvWJMgSdVrk3SfNjTbx	2PIWPTOIxbaVSjTnc30vXS	Wheat Like Waves	48
7Cva2EgJougx6O6M5xgWAq	0YrtvWJMgSdVrk3SfNjTbx	2PIWPTOIxbaVSjTnc30vXS	Here to Forever	61
7KR5uycb8gfQYRl1MTL8aB	0YrtvWJMgSdVrk3SfNjTbx	2PIWPTOIxbaVSjTnc30vXS	I Miss Strangers	49
7xjbn0bhs7zx7E1s0lCqT3	0YrtvWJMgSdVrk3SfNjTbx	2PIWPTOIxbaVSjTnc30vXS	Asphalt Meadows	56
1AR58rtcLziNnRHTCmCywd	0YrtvWJMgSdVrk3SfNjTbx	2PIWPTOIxbaVSjTnc30vXS	I’ll Never Give Up On You	48
2Wi5ubKr8zSk8L3CLemyS4	3U3zr5PCRa9ty74uN46iBa	1XoE7ZirQ3gjxq8HIzTJU9	Tank!	61
3Cx9j78Z0NE6jYwBWvvV3P	0EdvGhlC1FkGItLOWQzG4J	0vuwlanMPucXrYMGnOjhYL	Waiting For My Ruca	54
4J6JARDGkdc1fqLEflP94Z	0YrtvWJMgSdVrk3SfNjTbx	2PIWPTOIxbaVSjTnc30vXS	Fragments From the Decade	47
5eKfpH2dQ7FltCqb7LWEGJ	5wFXmYsg3KFJ8BDsQudJ4f	4hruYceqit29o6m4arpAql	The Alien	45
4TIJ7zSBNejpoIPaWpWRKc	7lzordPuZEXxwt9aoVZYmG	2FZNWUmgRoP8uJZBaHJdfj	Rebel Yell	73
56KqaFSGTb7ifpt16t5Y1N	3RGLhK1IP9jnYFH4BRFJBS	1ZH5g1RDq3GY1OvyD0w0s2	Rock the Casbah - Remastered	71
72dIN8F7D5ydB3auSqNi84	5wFXmYsg3KFJ8BDsQudJ4f	4hruYceqit29o6m4arpAql	The Silence	59
21YxK0klhpfLW8budkJaMF	33EUXrFKGjpUSGacqEHhU4	2jnV6ytZOmt71iEC5xHEYz	Lust For Life	65
29iwiYD3KVWBKxe31nGjEL	2CVBumuL5KyztqCyo7CETY	02OIGj20Ltaa8rN8mKsHBT	Jet Boy Jet Girl	37
3YZa4IzxK2UtEKTvdTgsi8	0oSGxfWSnnOXhD2fKuz2Gy	48D1hRORqJq52qsnUYZX56	Suffragette City - 2012 Remaster	61
5El6bpLd8nYPsvWgZLdHio	5aBEGOeWQCJfptic9xyaAb	440zYLMcBZhHc93WSGKDKo	Go! - Club Mix	41
7xENAAODeE2hKzdWFI6YaB	0fA0VVWsXO9YnASrzqfmYu	4aW4iDepQUl5ZCHd1Gli68	Entergalactic Theme	64
4oB0d8H93GtllDkoHNuLIN	5wFXmYsg3KFJ8BDsQudJ4f	4hruYceqit29o6m4arpAql	The Mistake	40
0WQiDwKJclirSYG9v5tayI	3yY2gUcIsjMr8hjo51PoJ8	5Y0p2XCgRRIjna91aQE8q7	There Is a Light That Never Goes Out - 2011 Remaster	79
0ncGfTV06HogJIgn2Ujjgb	4wYk01oPJNfaEssVFL46oQ	2K2u7usRIF03pywk6qxGlM	Waterfalls	40
0vF9RAGwgYtfO1Aajwb7et	5wFXmYsg3KFJ8BDsQudJ4f	4hruYceqit29o6m4arpAql	The Moth	44
10fiZCExnOMqElSX952WZI	5wFXmYsg3KFJ8BDsQudJ4f	4hruYceqit29o6m4arpAql	Lead, SD	38
14z3RzUHeZQgtpOlSYvmZD	0Zy4ncr8h1jd7Nzr9946fD	2qcwXvluk9iFwNNg4eDBXm	Love Like Blood	48
1e5XqFTNIrlgpXGjwPSykv	2to6ZW4W0XOZZsztSErr0b	0UHxylrPIp6GtS7EJlfwRU	Red Right Hand	47
1wgU78h61rVCbOsFAHv2Hw	5VF0YkVLeVD4ytyiyVSIiF	5m1BQr6SaEOxEl7Pz6fba2	The Socialites - AlunaGeorge Remix	16
29Znt9AbEH9FSsw86zPAYT	2ZfogSsOWP4mVfEqfpLXCt	3gz1CZk5wFg2inBuUWDa8x	Reptile	50
1wtOxkiel43cVs0Yux5Q4h	06HL4z0CvFAxyc27GXpf02	151w1FgRZfnKZA9FEcg9Z3	Snow On The Beach (feat. Lana Del Rey)	91
1Ist6PR2BZR3n2z2Y5R6S1	00FQb4jTyendYWaN8pK0wa	0Dt3FbpMQwjoT5KNAw0IXR	Summertime Sadness	74
2nMeu6UenVvwUktBCpLMK9	00FQb4jTyendYWaN8pK0wa	1D92WOHWUI2AGQCCdplcXL	Young And Beautiful	82
0Oqc0kKFsQ6MhFOLBNZIGX	00FQb4jTyendYWaN8pK0wa	5XpEKORZ4y6OrCZSKsi46A	Doin' Time	81
1NZs6n6hl8UuMaX0UC0YTz	00FQb4jTyendYWaN8pK0wa	1ORxRsK3MrSLvh7VQTF01F	Brooklyn Baby	81
5Y6nVaayzitvsD5F7nr3DV	00FQb4jTyendYWaN8pK0wa	1ORxRsK3MrSLvh7VQTF01F	West Coast	80
3lG6OtGDsYAOALxEmubQQm	00FQb4jTyendYWaN8pK0wa	5XpEKORZ4y6OrCZSKsi46A	Happiness is a butterfly	77
2mdEsXPu8ZmkHRRtAdC09e	00FQb4jTyendYWaN8pK0wa	5XpEKORZ4y6OrCZSKsi46A	Cinnamon Girl	76
1KuVEZR4xuQVNr1KkanAV4	00FQb4jTyendYWaN8pK0wa	1ORxRsK3MrSLvh7VQTF01F	The Other Woman	76
3RIgHHpnFKj5Rni1shokDj	00FQb4jTyendYWaN8pK0wa	5XpEKORZ4y6OrCZSKsi46A	Norman fucking Rockwell	76
1fOc4Kf82a6J1C9gS5sE0d	462T0buQ5ScBUQCRpodDRf	7g7WzMzTLLOyTSzVUnJACI	Changes	60
0PbOwOT7vjiO0NiI8D31XH	462T0buQ5ScBUQCRpodDRf	6llfJp31mi9r7swqmSAwuK	Heart of Gold	60
7a5xvCgoD8qFEQmO8Jjvtf	462T0buQ5ScBUQCRpodDRf	6llfJp31mi9r7swqmSAwuK	The World (Is Going Up in Flames)	60
0LHm5xYhzH6ZfmTVJ6LWpR	462T0buQ5ScBUQCRpodDRf	6llfJp31mi9r7swqmSAwuK	No Time for Dreaming	57
4ml0940tmn92PzmkSb2lwU	462T0buQ5ScBUQCRpodDRf	6llfJp31mi9r7swqmSAwuK	Stay Away	56
6ZWDOwh9OO57DaO0ROHIHO	462T0buQ5ScBUQCRpodDRf	7g7WzMzTLLOyTSzVUnJACI	Good to Be Back Home	53
2aWr9QRr0pSmYFH04zngiP	462T0buQ5ScBUQCRpodDRf	3rimYQyKq7BatxuUoPIBrb	Strictly Reserved for You	50
2dDR1wNf50GYrWohFnS3Pv	462T0buQ5ScBUQCRpodDRf	6llfJp31mi9r7swqmSAwuK	How Long	50
3F4WWA3JqsX2VmvqHywxEA	462T0buQ5ScBUQCRpodDRf	3rimYQyKq7BatxuUoPIBrb	Where Do We Go From Here	50
5nMZwcaQcQCONoiHmov5YT	462T0buQ5ScBUQCRpodDRf	7g7WzMzTLLOyTSzVUnJACI	Nobody But You	48
02VBYrHfVwfEWXk5DXyf0T	0du5cEVh5yTK9QJze8zA0C	1YgekJJTEueWDaMr7BYqPk	Leave The Door Open	83
3xVZYkcuWalGudeKl861wb	0du5cEVh5yTK9QJze8zA0C	1YgekJJTEueWDaMr7BYqPk	Smokin Out The Window	78
1l4iQsOZ5sOXZPMQLvouaB	5p7f24Rk5HkUZsaS3BLG5F	0152qvGv0mmX2vU36Rocng	Coast (feat. Anderson .Paak)	77
7jvCeWOSnJs2N3spqobWnO	0du5cEVh5yTK9QJze8zA0C	1YgekJJTEueWDaMr7BYqPk	Skate	72
3MlQPB0wJuopo3NTZGlMpI	6PEMFpe3PTOksdV4ZXUpbE	1o8zUe3QYHV42SHSsg6ffu	Where I Go (feat. H.E.R.)	71
3jiKUMXqwEodB7gVv1RMZU	0du5cEVh5yTK9QJze8zA0C	1YgekJJTEueWDaMr7BYqPk	After Last Night (with Thundercat & Bootsy Collins)	68
3a6FcTyvSf0ED3VXeH3PJ5	0du5cEVh5yTK9QJze8zA0C	1YgekJJTEueWDaMr7BYqPk	Fly As Me	65
2JUQ7mV1AHk2owXLydmN4Z	0du5cEVh5yTK9QJze8zA0C	1YgekJJTEueWDaMr7BYqPk	Love's Train	60
2K6vUau7bnZUamjbRSOOvJ	0du5cEVh5yTK9QJze8zA0C	4VZ7jhV0wHpoNPCB7Vmiml	777	65
276zciJ7Fg7Jk6Ta6QuLkp	3jK9MiCrA42lLAdMGUZpwa	4VFG1DOuTeDMBjBLZT7hCK	Come Down	64
7ycWLEP1GsNjVvcjawXz3z	13ubrt8QOOCPljQ2FL1Kca	3MATDdrpHmQCmuOcozZjDa	Praise The Lord (Da Shine) (feat. Skepta)	81
2aPTvyE09vUCRwVvj0I8WK	13ubrt8QOOCPljQ2FL1Kca	3AlyvIIMZyT5LjWFeK5LSl	Sundress	77
2N3U8uTYhjX2KwGT0pf5x0	13ubrt8QOOCPljQ2FL1Kca	3arNdjotCvtiiLFfjKngMc	Everyday (feat. Rod Stewart, Miguel & Mark Ronson)	76
4X5f3vT8MRuXF68pfjNte5	13ubrt8QOOCPljQ2FL1Kca	6rzMufuu8sLkIizM4q9c7J	F**kin' Problems (feat. Drake, 2 Chainz & Kendrick Lamar)	75
7zjEyeBsaw9gV0jofJLfOM	50co4Is1HCEo8bhOyUWKpn	7IKkHmEk4It4cRdOYanyvW	Livin It Up (with Post Malone & A$AP Rocky)	73
4S7YHmlWwfwArgd8LfSPud	13ubrt8QOOCPljQ2FL1Kca	3arNdjotCvtiiLFfjKngMc	L$D	73
1jzIJcHCXneHw7ojC6LXiF	4V8LLVI7PbaPR0K2TGSxFF	02KFVEA5tnY0YnypmWY1tz	Potato Salad	71
2gAGWaK4wvt2xrFUlR4mK8	13ubrt8QOOCPljQ2FL1Kca	3arNdjotCvtiiLFfjKngMc	Jukebox Joints (feat. Joe Fox & Kanye West)	71
1j6kDJttn6wbVyMaM42Nxm	13ubrt8QOOCPljQ2FL1Kca	3arNdjotCvtiiLFfjKngMc	Lord Pretty Flacko Jodye 2 (LPFJ2)	70
1AqemxWsT0iGg5Lvkm16Bt	13ubrt8QOOCPljQ2FL1Kca	3MATDdrpHmQCmuOcozZjDa	Fukk Sleep (feat. FKA twigs)	68
0P2vjYoUjjHBeYArlQtRmf	6QRlkjrHz5A62mqeNZz7t3	0hMh7RDyxuRD5AoTdh72DN	Floating Features	51
60JTA6msKu6uFlpvK8Tynn	6QRlkjrHz5A62mqeNZz7t3	3B2xgIcoHjm1HdHYDydoUu	Sure As Spring	44
1ZUTRq6PQhYfHJk3qeP7FR	6QRlkjrHz5A62mqeNZz7t3	1b42c8tkc0fLhiLprU1jiX	I Can't Speak	39
3Gb1M4i5UlDauEnaLJF2HT	6QRlkjrHz5A62mqeNZz7t3	17WOu1wHd6KdSO2Z0HRz6w	Watching Cartoons	37
3AIt9LB3C7Jz99OnvVjbyv	6QRlkjrHz5A62mqeNZz7t3	1kSTHq1yseNNxYpM48o3ry	Endless Afternoon	35
20OiuevLsmNprmh6wZKljU	6QRlkjrHz5A62mqeNZz7t3	17WOu1wHd6KdSO2Z0HRz6w	The Pines	35
4viHP6kRmImqmVGQjE8sks	6QRlkjrHz5A62mqeNZz7t3	0hMh7RDyxuRD5AoTdh72DN	Don't Leave Me on the Earth	35
2kkJY0ENKaDX5Np8fjyYLM	6QRlkjrHz5A62mqeNZz7t3	0hMh7RDyxuRD5AoTdh72DN	Loose Teeth	35
0J0UZpA2Ivp4qaXe3QzCrT	6QRlkjrHz5A62mqeNZz7t3	17WOu1wHd6KdSO2Z0HRz6w	In the Country	34
1uSkFxzLIEtObyJtROqbnl	6QRlkjrHz5A62mqeNZz7t3	3B2xgIcoHjm1HdHYDydoUu	Call Me in the Day	34
1WBSFlSLyOZnSa8fj7a5yC	6pmxr66tMAePxzOLfjGNcX	71udkw2yxFqNK4SNSYcCce	Nantes	61
7H0UxIN751StFi2tznmHlg	6pmxr66tMAePxzOLfjGNcX	4yP7cyoeE3F6EyJPZ9v47V	Postcards from Italy	57
5loVmc3MmtYGsTw12eDgcU	6pmxr66tMAePxzOLfjGNcX	26G7PfSLTyLiIcITVl7GAK	Elephant Gun	56
2bxQP85JNU11CQV4KXCnau	6pmxr66tMAePxzOLfjGNcX	7HYptJX2aQJPWbxXviXLwQ	Santa Fe	55
1dD6UAnqCJotTyU1bhCnDQ	6pmxr66tMAePxzOLfjGNcX	6iAOkTDFRiWHVNNUjBqIxT	No No No	53
1xRzpBiy7nmgP0oVmnseNF	6pmxr66tMAePxzOLfjGNcX	6iAOkTDFRiWHVNNUjBqIxT	Perth	51
3XHtGQBlfMHfKcXdTX7Mt0	6pmxr66tMAePxzOLfjGNcX	26G7PfSLTyLiIcITVl7GAK	Fisher Island Sound	49
56llQt0PCV67SUpmOTBLDs	6pmxr66tMAePxzOLfjGNcX	6iAOkTDFRiWHVNNUjBqIxT	Gibraltar	49
13NiyfKg0aELrTWvgVL7eH	6pmxr66tMAePxzOLfjGNcX	26G7PfSLTyLiIcITVl7GAK	Fyodor Dormant	43
3rWZv4pUVvPkQLYm3ItGDv	6pmxr66tMAePxzOLfjGNcX	45RV070mrplPB5gMO6Q136	Gallipoli	47
3n69hLUdIsSa1WlRmjMZlW	3XHO7cRUPCLOr6jwp8vsx5	6k3vC8nep1BfqAIJ81L6OL	Breezeblocks	71
4iEOVEULZRvmzYSZY2ViKN	3XHO7cRUPCLOr6jwp8vsx5	4oktVvRuO1In9B7Hz0xm0a	Left Hand Free	66
4tmwiN9YU7xMjh2hoqcVuI	3XHO7cRUPCLOr6jwp8vsx5	6k3vC8nep1BfqAIJ81L6OL	Taro	54
7DdXf9x75iEVCHWfoRwRuR	3XHO7cRUPCLOr6jwp8vsx5	6k3vC8nep1BfqAIJ81L6OL	Fitzpleasure	58
3xqxETvPg43KWP0HOGiOmu	3XHO7cRUPCLOr6jwp8vsx5	6k3vC8nep1BfqAIJ81L6OL	Something Good	55
3aA5fk4c6a7e5HM4rJqkSF	3XHO7cRUPCLOr6jwp8vsx5	6k3vC8nep1BfqAIJ81L6OL	Matilda	51
1o22EcqsCANhwYdaNOSdwS	3XHO7cRUPCLOr6jwp8vsx5	6k3vC8nep1BfqAIJ81L6OL	Tessellate	56
3i4ColsuZEvjeLz63m0jPt	3XHO7cRUPCLOr6jwp8vsx5	5ogYKSRRlVAgMzv09HFeIn	U&ME	54
6neF3KiuooS7xcTtj18PRL	1Tp7C6LzxZe9Mix6rn4zbI	4Tg1YeHrSMEUVsGiYfkSm3	Surefire - Gus alt-j Remix	56
0pCTr2E9CtulIwNprituKi	3XHO7cRUPCLOr6jwp8vsx5	6k3vC8nep1BfqAIJ81L6OL	Ms	55
3hhbDnFUb2bicI2df6VurK	3qnGvpP8Yth1AqSBMqON5x	21KIagsx1ZvYcv0sVkEAWv	River	73
24ntSW3QVJzR79lHAAOTaY	2mVVjNmdjXZZDvhgQWiakk	4HFO9PDRxsdbcegkcNhxgz	Texas Sun	72
3V0nnQhqvbE3JmiDdnzQFQ	55fhWPvDiMpLnE4ZzNXZyW	3tRmxSQyoyXXwcVDcUFQic	July (feat. Leon Bridges)	72
1Omt5bfz1tZUCqd26HxbS0	3qnGvpP8Yth1AqSBMqON5x	7J9fifadXb0PPSBWXctbi8	Beyond	72
65GbQI9VDTs7vo6MJL2iJA	3qnGvpP8Yth1AqSBMqON5x	21KIagsx1ZvYcv0sVkEAWv	Coming Home	68
3dvXRk7TZ929m21p49RR5P	2mVVjNmdjXZZDvhgQWiakk	2Xs9xSBhvyo8F6daRc1npu	Mariella	66
2DccHqTquzubziHAPZRdct	2mVVjNmdjXZZDvhgQWiakk	2Xs9xSBhvyo8F6daRc1npu	B-Side	65
1EUOby36hEzSkTVVKRAWQP	2mVVjNmdjXZZDvhgQWiakk	2Xs9xSBhvyo8F6daRc1npu	Chocolate Hills	62
7FxzgizJRGTQ3fxUqfvljg	3qnGvpP8Yth1AqSBMqON5x	7J9fifadXb0PPSBWXctbi8	Bad Bad News	62
7pnVHbcqbmP7LA1ey3ydvu	2mVVjNmdjXZZDvhgQWiakk	4HFO9PDRxsdbcegkcNhxgz	Midnight	62
0xFiDbmCNEcs8TE9hToHpa	5CuU6SRJjbbZL926nSGGxX	7bvUQdrsKA3o6lkjV1ZRPk	For DOOM	44
0V6QNE31BWyMuiKlvDRnE9	5CuU6SRJjbbZL926nSGGxX	1VDnqZVFSg0xVF104kaIix	(How Could Anybody) Feel at Home	43
41t7RkFBjaEFoGvr29QhYL	5CuU6SRJjbbZL926nSGGxX	7bvUQdrsKA3o6lkjV1ZRPk	79th and Stony Island	42
7fjLBPTsQrbkV2WRedi2bw	5CuU6SRJjbbZL926nSGGxX	7BlWNRjwKnLrf7yf0VdSvg	Ziggy Starfish (Anxiety Raps) [feat. Gold Panda]	41
1pHKJodnA1bOXyWj981Tmx	5CuU6SRJjbbZL926nSGGxX	7bvUQdrsKA3o6lkjV1ZRPk	I'll Fight You	38
08rUqqyHYLORJvK6pqiUOM	5CuU6SRJjbbZL926nSGGxX	7bvUQdrsKA3o6lkjV1ZRPk	CD Only Bonus Track	37
36iXvmiL3tsJX0QfhVZkhb	5CuU6SRJjbbZL926nSGGxX	7bvUQdrsKA3o6lkjV1ZRPk	The Song with the Secret Name	36
4eJpFVLqB3SVzciiTdK82L	5CuU6SRJjbbZL926nSGGxX	7bvUQdrsKA3o6lkjV1ZRPk	Circuit City	36
46lQe6895zxB3HRP6YPbnl	5CuU6SRJjbbZL926nSGGxX	7bvUQdrsKA3o6lkjV1ZRPk	Multi-Game Arcade Cabinet	36
7EGZTx7rDYoSzUtqsETyxz	5CuU6SRJjbbZL926nSGGxX	7bvUQdrsKA3o6lkjV1ZRPk	Tdk Scribbled Intro	35
3xKsf9qdS1CyvXSMEid6g8	2h93pZq0e7k5yf4dywlkpM	3mH6qwIy9crq0I9YQbOuDf	Pink + White	84
3GZD6HmiNUhxXYf8Gch723	2h93pZq0e7k5yf4dywlkpM	392p3shh2jkxUxY2VHvlH8	Lost	84
4osgfFTICMkcGbbigdsa53	2h93pZq0e7k5yf4dywlkpM	3RYdEXhGHojkTILUdtnRVJ	Novacane	80
2ZWlPOoWh0626oTaHrnl2a	2h93pZq0e7k5yf4dywlkpM	3mH6qwIy9crq0I9YQbOuDf	Ivy	80
7eqoqGkKwgOaWNNHx90uEZ	2h93pZq0e7k5yf4dywlkpM	3mH6qwIy9crq0I9YQbOuDf	Nights	78
4S4Mfvv03M1cHgIOJcbUCL	2h93pZq0e7k5yf4dywlkpM	71VX8yv9T2hNIYVZJVUWVp	In My Room	78
6Nle9hKrkL1wQpwNfEkxjh	2h93pZq0e7k5yf4dywlkpM	6OGzmhzHcjf0uN9j7dYvZH	Chanel	78
2LMkwUfqC6S6s6qDVlEuzV	2h93pZq0e7k5yf4dywlkpM	3mH6qwIy9crq0I9YQbOuDf	White Ferrari	77
7DfFc7a6Rwfi3YQMRbDMau	2h93pZq0e7k5yf4dywlkpM	392p3shh2jkxUxY2VHvlH8	Thinkin Bout You	77
5GUYJTQap5F3RDQiCOJhrS	2h93pZq0e7k5yf4dywlkpM	3mH6qwIy9crq0I9YQbOuDf	Self Control	75
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: cnicosia
--

COPY public.users (user_id, display_name, profile_photo) FROM stdin;
12163992542	Batty Brulée	https://scontent-ord5-1.xx.fbcdn.net/v/t1.18169-1/16831043_1799099963690897_4632021165186679885_n.jpg?stp=dst-jpg_p320x320&_nc_cat=100&ccb=1-7&_nc_sid=0c64ff&_nc_ohc=y6sXfkLc5hkAX-fSL1f&_nc_ht=scontent-ord5-1.xx&edm=AP4hL3IEAAAA&oh=00_AfBSiwSMa-77ktScCbTW_h7qFWAu8RTOe9PsSUdWYswMiA&oe=6390AF14
\.


--
-- Name: artists_genres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cnicosia
--

SELECT pg_catalog.setval('public.artists_genres_id_seq', 164, true);


--
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cnicosia
--

SELECT pg_catalog.setval('public.items_id_seq', 300, true);


--
-- Name: albums albums_pkey; Type: CONSTRAINT; Schema: public; Owner: cnicosia
--

ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_pkey PRIMARY KEY (album_id);


--
-- Name: artists_genres artists_genres_pkey; Type: CONSTRAINT; Schema: public; Owner: cnicosia
--

ALTER TABLE ONLY public.artists_genres
    ADD CONSTRAINT artists_genres_pkey PRIMARY KEY (id);


--
-- Name: artists artists_pkey; Type: CONSTRAINT; Schema: public; Owner: cnicosia
--

ALTER TABLE ONLY public.artists
    ADD CONSTRAINT artists_pkey PRIMARY KEY (artist_id);


--
-- Name: features features_pkey; Type: CONSTRAINT; Schema: public; Owner: cnicosia
--

ALTER TABLE ONLY public.features
    ADD CONSTRAINT features_pkey PRIMARY KEY (track_id);


--
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: cnicosia
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (genre);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: cnicosia
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: tracks tracks_pkey; Type: CONSTRAINT; Schema: public; Owner: cnicosia
--

ALTER TABLE ONLY public.tracks
    ADD CONSTRAINT tracks_pkey PRIMARY KEY (track_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: cnicosia
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: albums albums_artist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cnicosia
--

ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_artist_id_fkey FOREIGN KEY (artist_id) REFERENCES public.artists(artist_id);


--
-- Name: artists_genres artists_genres_artist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cnicosia
--

ALTER TABLE ONLY public.artists_genres
    ADD CONSTRAINT artists_genres_artist_id_fkey FOREIGN KEY (artist_id) REFERENCES public.artists(artist_id);


--
-- Name: artists_genres artists_genres_genre_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cnicosia
--

ALTER TABLE ONLY public.artists_genres
    ADD CONSTRAINT artists_genres_genre_fkey FOREIGN KEY (genre) REFERENCES public.genres(genre);


--
-- Name: features features_track_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cnicosia
--

ALTER TABLE ONLY public.features
    ADD CONSTRAINT features_track_id_fkey FOREIGN KEY (track_id) REFERENCES public.tracks(track_id);


--
-- Name: items items_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cnicosia
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: tracks tracks_album_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cnicosia
--

ALTER TABLE ONLY public.tracks
    ADD CONSTRAINT tracks_album_id_fkey FOREIGN KEY (album_id) REFERENCES public.albums(album_id);


--
-- Name: tracks tracks_artist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cnicosia
--

ALTER TABLE ONLY public.tracks
    ADD CONSTRAINT tracks_artist_id_fkey FOREIGN KEY (artist_id) REFERENCES public.artists(artist_id);


--
-- PostgreSQL database dump complete
--

