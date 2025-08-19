--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5 (Debian 17.5-1.pgdg130+1)
-- Dumped by pg_dump version 17.5

-- Started on 2025-08-19 20:04:57 EEST

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
-- TOC entry 3435 (class 1262 OID 16384)
-- Name: energy-brokerage; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "energy-brokerage" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE "energy-brokerage" OWNER TO postgres;

\encoding SQL_ASCII
\connect -reuse-previous=on "dbname='energy-brokerage'"

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

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 3436 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 16394)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id text NOT NULL,
    type text NOT NULL,
    delivery_time timestamp with time zone NOT NULL,
    amount bigint NOT NULL,
    price bigint NOT NULL,
    status bigint NOT NULL,
    deleted boolean NOT NULL,
    delevery_time character varying(50),
    delete boolean,
    user_id text
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16385)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id text NOT NULL,
    username text NOT NULL,
    salt text NOT NULL,
    password text NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 3429 (class 0 OID 16394)
-- Dependencies: 218
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders VALUES ('7ef0ea93-5e19-4d3c-afeb-c651f5ca7437', 'buy', '2025-01-19 22:00:00+00', 33, 30, 0, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('8825294d-a880-40d7-8298-9c79e4369f65', 'buy', '2024-11-08 22:00:00+00', 11, 1, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('559b4aa3-7f0e-4e7a-8f7a-e46f4d983760', 'sell', '2025-02-03 22:00:00+00', 20, 71, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('82e7b8e8-d6d7-425b-aa45-31991efd9a74', 'sell', '2025-05-10 21:00:00+00', 12, 31, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('938c55dc-2f44-4569-9b37-4fd8566bde3c', 'sell', '2025-07-06 21:00:00+00', 13, 51, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('4e999fdc-ec60-4b8a-9083-609fddf4d111', 'sell', '2025-02-23 22:00:00+00', 14, 6, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('abc927ee-6d16-4c4c-bab5-bfee07f9a563', 'buy', '2024-12-04 22:00:00+00', 15, 5, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('3219c4fe-cce1-45ce-b728-798b51c94180', 'sell', '2025-04-25 21:00:00+00', 16, 49, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('2ecd8940-917a-4129-9671-17f105989cca', 'sell', '2025-01-13 22:00:00+00', 17, 98, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('2f75b5de-2690-4529-a22d-51e69adc3bc3', 'sell', '2024-10-01 21:00:00+00', 18, 49, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('59d0bffb-6de2-4123-ae89-f573ab32fc11', 'sell', '2024-09-11 21:00:00+00', 19, 91, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('c11d7256-20f2-4e57-ad98-5838cd9699b2', 'sell', '2025-06-10 21:00:00+00', 21, 91, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('578237e6-94a1-4ec2-b70c-848926f616e9', 'buy', '2024-12-29 22:00:00+00', 22, 30, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('411c85d3-d72f-4c33-be83-0f6cb0809de1', 'buy', '2024-10-19 21:00:00+00', 23, 57, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('16668912-7c3a-460f-babe-1b4c4324e063', 'sell', '2024-09-11 21:00:00+00', 24, 69, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('4c346423-3fb9-4bbc-a71f-fb2b10e25b0e', 'buy', '2025-07-20 21:00:00+00', 25, 9, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('c26f3f9c-69f1-4447-8c0e-38646d17759e', 'buy', '2024-12-09 22:00:00+00', 26, 13, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('d6ab6527-e6cd-460b-a2cb-68c90baf3443', 'buy', '2025-04-10 21:00:00+00', 28, 34, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('a6c69fdd-ec2e-4936-8de9-888a3da86cc9', 'buy', '2025-02-27 22:00:00+00', 29, 99, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('62af3996-2715-4e37-a196-2178c7f1d53c', 'sell', '2024-12-08 22:00:00+00', 30, 70, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('aaa1e7ad-bd0c-4890-8c3c-dd3dbdf54aff', 'sell', '2024-10-18 21:00:00+00', 31, 76, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('3a225983-5114-4b53-985b-2820c4a222c5', 'sell', '2024-08-19 21:00:00+00', 32, 54, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('81f7cda4-74c9-4bec-a8d3-02620e8acc33', 'sell', '2024-08-26 21:00:00+00', 34, 89, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('cbfc3ea1-6548-49ae-a4ce-edd1cb3691a4', 'sell', '2025-07-27 21:00:00+00', 35, 95, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('72b8d9bf-6f16-4220-9833-cacf46dca759', 'buy', '2025-03-23 22:00:00+00', 36, 19, 0, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('38e75d2a-8903-4e58-8979-9e457a39915b', 'sell', '2024-11-01 22:00:00+00', 37, 24, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('a49b3226-841f-4126-a396-bacdc18da79e', 'buy', '2024-12-18 22:00:00+00', 38, 7, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('cb140248-e3c1-432f-83f0-73879adbaca6', 'sell', '2024-10-22 21:00:00+00', 39, 31, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('adb6456a-876b-40ea-bbc4-c7142989e600', 'buy', '2024-11-28 22:00:00+00', 40, 52, 2, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('824218e3-8bc9-4983-937f-1c201dcbebdb', 'sell', '2024-12-03 22:00:00+00', 41, 5, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('baf05039-cb5c-4081-af98-ba344898ed9e', 'buy', '2025-07-10 21:00:00+00', 42, 10, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('67301b0f-d1ac-450a-9b99-2d71305fb3e8', 'buy', '2025-08-06 21:00:00+00', 43, 57, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('8ed66667-ec52-42bf-82b1-785bcdc41486', 'sell', '2025-06-15 21:00:00+00', 44, 3, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('a52ecc18-424d-4a48-8587-e1d3c5e1b8f0', 'sell', '2025-08-06 21:00:00+00', 45, 90, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('2c526c9c-8f93-4a06-abc7-109985ad2d30', 'buy', '2024-11-19 22:00:00+00', 46, 60, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('db1cafa1-cf13-464c-b0e8-56e5095701bf', 'sell', '2025-07-21 21:00:00+00', 47, 83, 0, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('b4b9bc21-0516-4405-bdf2-375f84826ca5', 'buy', '2025-05-02 21:00:00+00', 48, 73, 1, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('cf06fa3a-c996-4ded-9a78-aaa7460600c7', 'sell', '2025-02-17 22:00:00+00', 49, 99, 0, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('6b55f9e5-fbeb-486a-9ed6-9df40eab0b49', 'buy', '2025-06-08 21:00:00+00', 50, 2, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('6bd52895-b9b5-4ea3-8342-a1ecf4c8f3ea', 'sell', '2024-11-27 22:00:00+00', 51, 31, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('a2e22a20-36e6-4967-b1e1-854c65e51b35', 'buy', '2025-03-25 22:00:00+00', 52, 49, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('c19c5c96-cdcf-4407-a4a3-5adf17f13102', 'sell', '2024-10-21 21:00:00+00', 53, 86, 2, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('fac1c16b-ea8d-463b-af7e-6a79fce9442b', 'buy', '2025-03-29 22:00:00+00', 54, 78, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('a7b46bfa-b444-48e1-8ada-3463dca764ff', 'sell', '2024-10-17 21:00:00+00', 55, 48, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('be92f009-6a7b-4e92-9944-48d34b95c10c', 'buy', '2025-04-10 21:00:00+00', 56, 62, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('be71d1d4-07c3-42a7-864b-0e273ca5bd83', 'sell', '2024-09-12 21:00:00+00', 57, 58, 2, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('e9eba263-8cad-4aea-9d1a-0ffe65bd9ca2', 'sell', '2025-03-25 22:00:00+00', 58, 29, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('bdaf7511-ebbd-4e7d-aac7-0c76d3013f8f', 'buy', '2025-01-23 22:00:00+00', 59, 59, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('4f5f1f47-d409-4e9b-9619-c11ec81984d1', 'buy', '2025-03-06 22:00:00+00', 60, 91, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('59fcea70-6859-4a2b-9fb5-0736f7872a42', 'buy', '2025-07-22 21:00:00+00', 61, 74, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('e375ca68-f965-43b5-b59c-7c7c44ffa710', 'buy', '2025-05-01 21:00:00+00', 62, 3, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('060389bb-b002-4553-b405-bb2c3eed43d6', 'sell', '2025-05-23 21:00:00+00', 63, 62, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('fcdf46e9-3002-4f31-a7bd-ebb25948dcb1', 'buy', '2025-07-27 21:00:00+00', 64, 51, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('544f42ea-052e-4a7c-afae-0b880eb29371', 'sell', '2025-04-14 21:00:00+00', 65, 64, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('63916a15-1feb-4300-b3ac-fbb125abb6f8', 'sell', '2024-12-17 22:00:00+00', 66, 13, 1, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('8ccf2a4b-280b-4330-97d3-f92f08797571', 'buy', '2025-05-15 21:00:00+00', 67, 21, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('6c1ae6b5-9428-4ab3-a6c1-05deaed34ac2', 'sell', '2024-10-29 22:00:00+00', 68, 46, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('be9e6be6-9ac2-43f4-83c8-c8d1b2c457df', 'buy', '2024-10-13 21:00:00+00', 69, 100, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('175b9b75-6051-429d-a0bc-8ed9c477dc7e', 'sell', '2024-12-11 22:00:00+00', 70, 75, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('af07f30b-9ce1-41cf-91cc-e1d7ec500508', 'buy', '2024-10-09 21:00:00+00', 71, 50, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('7791220e-67ab-46c3-b298-7ada12ba121d', 'buy', '2024-12-11 22:00:00+00', 72, 38, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('c0139c3c-7333-44d5-97eb-68c933825898', 'sell', '2025-07-15 21:00:00+00', 73, 72, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('0d6f0e5c-6697-4af3-9247-3529941871af', 'sell', '2025-04-25 21:00:00+00', 74, 77, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('647eab9e-197b-404e-827f-907aab1ff410', 'sell', '2025-07-27 21:00:00+00', 75, 96, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('32fbd0a1-6fc9-4f99-a6a6-0d3be72789a0', 'sell', '2025-06-20 21:00:00+00', 76, 44, 2, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('7fc0e2dc-d2d6-4763-8387-068ccb0e409b', 'sell', '2025-06-23 21:00:00+00', 77, 63, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('36c66ce7-1011-463d-872b-4000c4a58118', 'sell', '2025-02-09 22:00:00+00', 78, 13, 1, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('a7729ff1-b478-4971-a35b-c7d7a9f3bde5', 'buy', '2025-07-13 21:00:00+00', 79, 30, 1, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('9b8c20ce-e143-47a2-b192-aee1d2a16f99', 'sell', '2025-03-14 22:00:00+00', 80, 91, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('349cc52d-562d-43ff-87c4-c80846bfd08e', 'sell', '2025-05-15 21:00:00+00', 81, 15, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('ea278940-c902-460d-a686-2b017dfc36ca', 'buy', '2024-09-03 21:00:00+00', 82, 16, 2, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('91b4f2dc-0067-4811-beef-f8024432378b', 'buy', '2025-02-01 22:00:00+00', 83, 48, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('874c272d-5458-4052-9fc0-d3e0f3268534', 'sell', '2025-08-04 21:00:00+00', 84, 86, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('38efcb08-7eba-4845-96ff-5ae8cbbdbe46', 'buy', '2025-04-08 21:00:00+00', 85, 31, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('83b4e28b-ae35-4349-a2c6-d1f343531197', 'buy', '2025-06-01 21:00:00+00', 86, 46, 1, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('5909ea49-d0f1-4736-ac4e-4232647c2401', 'buy', '2025-02-07 22:00:00+00', 87, 23, 1, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('05da7c47-ad1a-4658-9903-e0e7e8a3e498', 'sell', '2025-03-18 22:00:00+00', 27, 47, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('127677c2-0c5c-48e5-883a-f350738d6fad', 'sell', '2024-12-16 22:00:00+00', 88, 64, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('e63d02a5-9428-43d7-8166-140312e649b8', 'buy', '2024-10-14 21:00:00+00', 89, 48, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('8c81c1b0-2d63-41d1-8335-19ee3bf3d562', 'buy', '2025-04-30 21:00:00+00', 90, 65, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('e9cacd0c-09b3-4d3a-b835-9bb06da576c5', 'buy', '2024-08-27 21:00:00+00', 91, 53, 2, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('9d9939a7-14aa-4ccd-8e99-ad8314e17587', 'sell', '2024-08-22 21:00:00+00', 92, 26, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('2b710c3f-746c-4078-b91a-fd413ad19986', 'sell', '2024-10-15 21:00:00+00', 93, 98, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('ac86a22c-17b3-4cec-9103-b46ed5a5de1a', 'sell', '2025-04-10 21:00:00+00', 94, 15, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('39604c8f-52d7-4406-a1ab-4517e8e06cbe', 'sell', '2024-11-25 22:00:00+00', 95, 38, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('d142dc74-f0c8-44ff-a036-c760ee9c944e', 'buy', '2024-12-09 22:00:00+00', 96, 68, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('b07473de-4c9a-4e3a-8017-fbb4a2e7dd06', 'buy', '2025-04-19 21:00:00+00', 97, 15, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('d9a9b60a-2332-46ba-bbb1-b601442274bd', 'sell', '2025-01-11 22:00:00+00', 98, 84, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('b4bb90f2-f860-41cf-84ae-2ea31172baf9', 'sell', '2025-04-30 21:00:00+00', 99, 61, 1, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('d90a391c-3a17-4659-9b62-e99faca64822', 'sell', '2025-03-05 22:00:00+00', 100, 17, 0, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('2c21c661-846e-401d-ba4a-10adbee6f3e9', 'buy', '2024-09-19 21:00:00+00', 101, 25, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('a8993a0a-3fdb-4c73-b727-b9e4850ed98c', 'sell', '2025-05-18 21:00:00+00', 102, 41, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('f7a91f46-6b00-41fd-913c-3de32a0a3418', 'sell', '2025-07-19 21:00:00+00', 103, 70, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('c27ed545-f727-4681-ba0a-6cb1fb2a39c4', 'sell', '2024-12-08 22:00:00+00', 104, 59, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('eb14ade5-d7ef-42d4-8879-752d305b2161', 'buy', '2025-02-25 22:00:00+00', 105, 16, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('d3bbb9ed-8f7c-45de-8ff1-736508652a7d', 'buy', '2024-10-22 21:00:00+00', 106, 27, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('f22aa6dd-b7ef-43b5-8534-ca0924cf9808', 'sell', '2024-10-01 21:00:00+00', 107, 29, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('f7c462cb-ebae-415f-bbe2-c9985863ff0c', 'buy', '2024-10-03 21:00:00+00', 108, 6, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('bf81aa11-aca7-4d9c-8196-88c02c6c6e1e', 'sell', '2025-01-29 22:00:00+00', 109, 11, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('8fcd005b-19ca-4629-906e-64a327ab18a4', 'buy', '2025-07-04 21:00:00+00', 110, 10, 1, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('f5c1381b-e302-4187-9514-2b1f618dc264', 'sell', '2024-11-29 22:00:00+00', 111, 46, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('9d73e50c-f843-427d-bf24-109cf197b301', 'sell', '2025-01-10 22:00:00+00', 112, 70, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('2d38700c-992a-40a3-9cba-4d97421be0d1', 'buy', '2025-02-07 22:00:00+00', 113, 45, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('23a95ea5-653b-4d19-a0a6-76933d6f41f3', 'buy', '2025-01-18 22:00:00+00', 114, 13, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('74a51c32-900a-44f5-b075-13e330c94eef', 'buy', '2024-12-25 22:00:00+00', 115, 32, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('59ba6ebe-749c-429e-8784-8969a0d72a33', 'buy', '2024-08-26 21:00:00+00', 116, 65, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('1b64c504-6820-4796-8bef-26d353db02b5', 'sell', '2025-03-08 22:00:00+00', 117, 30, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('e40dfc80-bd7b-4388-a873-4b9e25c545f6', 'sell', '2024-11-23 22:00:00+00', 118, 65, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('e387f0e2-3274-4deb-bd45-0a8a86e1d8b7', 'sell', '2025-07-06 21:00:00+00', 119, 12, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('89392a15-0386-4ca2-b408-f04ddb640e11', 'sell', '2024-08-30 21:00:00+00', 120, 55, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('21d1c6be-a57c-46ac-8b35-23b6016aa201', 'sell', '2024-09-02 21:00:00+00', 121, 10, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('77d18bc2-9ff9-4764-b813-cd0d6ad806b6', 'sell', '2025-07-06 21:00:00+00', 122, 62, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('c06a0429-caa5-4aa6-acfd-f96c0a5fc904', 'sell', '2025-08-12 21:00:00+00', 123, 49, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('1e265d2d-9b3b-4b04-a9d0-c12af4b3b8ed', 'buy', '2025-05-30 21:00:00+00', 124, 31, 2, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('78612558-7181-4602-9f08-2efb592315a9', 'buy', '2025-05-06 21:00:00+00', 125, 75, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('54888fc5-7eae-4b0d-a177-f8e0750f0deb', 'buy', '2024-10-11 21:00:00+00', 126, 53, 2, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('9db4af20-c124-4bbf-a93b-a4da97f0f86f', 'sell', '2025-05-12 21:00:00+00', 127, 1, 0, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('0cfbbfdb-b8ac-4759-8c1c-5151e136e1f8', 'buy', '2025-07-18 21:00:00+00', 128, 42, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('32ae4d6b-70dc-4d70-8db8-509db8504f26', 'sell', '2025-02-23 22:00:00+00', 129, 85, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('00063b74-775c-4f6a-a0a4-512e39f5df47', 'buy', '2024-10-18 21:00:00+00', 130, 27, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('2853d46f-d390-4445-acae-7e4d60371de2', 'buy', '2025-07-07 21:00:00+00', 131, 11, 2, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('f90b0dcd-cf85-4f9c-9313-6a01d6b34fd5', 'sell', '2024-10-05 21:00:00+00', 132, 78, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('7f008906-f233-4305-80ec-02e967e4b3b0', 'buy', '2024-09-16 21:00:00+00', 133, 23, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('6c7f19d4-3b95-45d2-ab85-9e8d7803ac5a', 'sell', '2025-07-18 21:00:00+00', 134, 52, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('71e3eb73-b471-4664-b266-be403e99b952', 'buy', '2024-09-08 21:00:00+00', 135, 65, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('ae82a3be-0aef-4132-bf23-9a348dcd99d4', 'sell', '2024-09-07 21:00:00+00', 136, 99, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('a0f3a4a9-b2b5-4228-985e-39d61f7e1b61', 'buy', '2024-11-17 22:00:00+00', 137, 52, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('66181d0a-e176-437b-916b-7c428c26cb76', 'buy', '2025-03-20 22:00:00+00', 138, 84, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('6803f24e-f47b-4eb5-aa4b-7bda99ab1d9b', 'sell', '2024-11-15 22:00:00+00', 139, 24, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('cde85817-d239-4690-8180-c98285682f8a', 'buy', '2024-10-16 21:00:00+00', 140, 26, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('8c391dd8-84be-4693-8696-dba1a744d0a4', 'sell', '2025-01-29 22:00:00+00', 141, 30, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('1e507650-ecb7-416a-b2e7-b10ddfb9aa34', 'sell', '2025-06-15 21:00:00+00', 142, 31, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('2cb5584a-e8fd-4234-b757-0b818de5a087', 'buy', '2025-01-01 22:00:00+00', 143, 21, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('58ed4328-8e61-4086-b47e-a8988cbfeb41', 'sell', '2025-05-23 21:00:00+00', 144, 49, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('f3d53cd0-c2e4-473f-99c0-26295f9336f8', 'sell', '2025-05-12 21:00:00+00', 145, 75, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('532efd58-ecf6-4555-9bbf-ee823a03221e', 'sell', '2025-01-09 22:00:00+00', 146, 56, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('69dcfe65-5d9c-41ac-855d-58c897c697f5', 'sell', '2025-01-08 22:00:00+00', 147, 80, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('a1ddbb2b-0f43-4d9a-b8e0-09938a40132f', 'sell', '2024-10-14 21:00:00+00', 148, 21, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('163b1809-040a-40d8-9adb-498739ff9d23', 'sell', '2025-06-03 21:00:00+00', 149, 55, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('fab49c0d-6629-4b2e-ae60-866adf780d3f', 'sell', '2025-01-19 22:00:00+00', 150, 40, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('84182912-89cc-471b-acf4-4fd2beb6e798', 'buy', '2024-10-15 21:00:00+00', 151, 98, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('a68cef48-0cf6-4fe9-8f3d-638d6a4b9a7e', 'sell', '2024-08-29 21:00:00+00', 152, 60, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('a617fa6d-a681-4631-89da-cc089f84bfc6', 'buy', '2025-03-30 21:00:00+00', 153, 72, 0, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('fad38263-eedd-44bc-8e2a-0ecdc61d9703', 'buy', '2025-01-08 22:00:00+00', 154, 69, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('56662ca6-ec52-4fda-b043-8e902374a88d', 'sell', '2025-07-21 21:00:00+00', 155, 99, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('d1113af0-086a-43ce-8f53-d3998ad753c8', 'sell', '2025-08-17 21:00:00+00', 156, 61, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('9de1d2db-70aa-40b2-af1a-fef177ab2aad', 'buy', '2025-04-29 21:00:00+00', 157, 16, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('3a79ad96-ef7e-4a40-9315-a52a3740b96d', 'sell', '2025-05-27 21:00:00+00', 158, 33, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('cc03a7cd-d1f2-43e7-9d7c-5b6c8e3ab306', 'sell', '2024-11-18 22:00:00+00', 159, 21, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('9c06b1c7-20d0-4d4a-980c-e139c61d5250', 'sell', '2025-06-28 21:00:00+00', 160, 97, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('3658232e-64de-470d-9f12-327b0941c25d', 'sell', '2025-07-04 21:00:00+00', 161, 81, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('49563a74-249f-42a1-8c52-5950c5bfd5c9', 'buy', '2024-11-06 22:00:00+00', 162, 74, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('5886a1bf-d775-48fd-bc77-820f02748ef8', 'sell', '2025-01-10 22:00:00+00', 163, 5, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('58cb4885-0a18-4691-a5b5-d67cdc3948a0', 'sell', '2024-12-25 22:00:00+00', 164, 82, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('d589e0fa-df28-4323-9684-4a79ff9d3e17', 'buy', '2024-09-25 21:00:00+00', 165, 27, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('15fcde66-a541-44fc-be09-b7de89dbb4c3', 'buy', '2025-04-09 21:00:00+00', 166, 46, 2, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('c880dc9a-1504-4ff8-9387-05eb42bef9f4', 'buy', '2024-09-23 21:00:00+00', 167, 51, 0, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('09538aa8-4a24-4376-8a5b-0bcb91ed0490', 'buy', '2024-12-10 22:00:00+00', 168, 21, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('670b677c-3ff1-490d-9857-e270e9999446', 'sell', '2024-08-19 21:00:00+00', 169, 13, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('f319318f-1936-44e2-9f36-ef4a33681291', 'sell', '2024-12-17 22:00:00+00', 170, 41, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('30926137-cfa3-4693-a8ca-ef477d6ab1d2', 'buy', '2025-07-16 21:00:00+00', 171, 62, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('11f6c160-2b10-4d4c-9d66-1d5fe65ebdf0', 'buy', '2025-03-30 21:00:00+00', 172, 64, 1, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('7e4885f9-385d-425e-8d80-3ffd55a5e624', 'sell', '2025-03-02 22:00:00+00', 173, 44, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('9482ba2f-1b60-4dec-8e7b-d12aa1eca705', 'sell', '2025-04-15 21:00:00+00', 174, 3, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('7c1aa2d7-f181-458b-b55e-caa75dde38ce', 'sell', '2024-08-26 21:00:00+00', 175, 7, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('463e8ccb-b735-4e38-a9b1-6090d0097bb7', 'buy', '2024-11-26 22:00:00+00', 176, 59, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('ee3e19c0-bd65-4271-b20a-1b915c2128f7', 'sell', '2024-10-23 21:00:00+00', 177, 18, 1, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('dadefaa5-3e48-415c-bfe8-031881465412', 'sell', '2025-03-30 21:00:00+00', 178, 23, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('e42d2f03-9776-44d4-b7ee-057a2372d065', 'sell', '2025-05-19 21:00:00+00', 179, 50, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('50050dfb-5db7-46c0-bd8f-defc840bfdcd', 'sell', '2025-07-18 21:00:00+00', 180, 34, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('ae3c98f7-b88f-465a-8a07-d053a0ed1c40', 'sell', '2025-07-14 21:00:00+00', 181, 86, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('bd0c96bc-e26f-4550-b5c8-963fab11ffd9', 'sell', '2024-10-26 21:00:00+00', 182, 88, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('01382293-a600-4f99-b82b-6c1957bfdf0a', 'buy', '2024-10-04 21:00:00+00', 183, 72, 1, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('ab8c1999-c0d7-497d-9a9c-8b064ef6eea3', 'buy', '2024-10-14 21:00:00+00', 184, 86, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('80ad910e-d4e5-4041-b222-b9f3b8ee558e', 'sell', '2025-03-11 22:00:00+00', 185, 33, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('adfb871b-73f6-46a0-890e-8744b3ea6be7', 'buy', '2025-01-16 22:00:00+00', 186, 24, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('b5086c99-106f-475d-ba11-a65941899d58', 'sell', '2024-11-05 22:00:00+00', 187, 34, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('9585e173-9b14-4366-a99c-c83164edd7e6', 'buy', '2024-08-31 21:00:00+00', 188, 30, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('d78348c9-053e-4e71-b55f-5a7ee1dd82fc', 'sell', '2024-09-23 21:00:00+00', 189, 51, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('aed2d4cf-2db3-42d6-9b0b-f310bf5dc066', 'sell', '2025-01-15 22:00:00+00', 190, 11, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('330ca67b-631f-484c-8da6-dcc20a89944d', 'sell', '2024-10-02 21:00:00+00', 191, 61, 1, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('5cd92c7b-83c3-461d-b06a-26c4b5176bf3', 'sell', '2025-08-10 21:00:00+00', 192, 38, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('ba7625e4-a3a9-4b6b-8796-bb317bb4934c', 'buy', '2024-09-11 21:00:00+00', 193, 75, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('d9e36a38-6262-47ba-952e-24a621574472', 'buy', '2024-08-26 21:00:00+00', 194, 56, 0, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('40f9fee1-d5e1-4a54-b281-7d23c88ece6c', 'buy', '2025-07-17 21:00:00+00', 195, 65, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('71289812-f1c1-4c10-ae0e-1d7f953804ee', 'buy', '2025-07-19 21:00:00+00', 196, 97, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('ff042773-4405-4ba9-9a68-0ae85fefb7fb', 'buy', '2025-02-19 22:00:00+00', 197, 34, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('cd55d9bc-9f5e-4219-8c70-bd87b75fa27a', 'buy', '2025-08-05 21:00:00+00', 198, 62, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('8328d1f0-ed49-4430-bcf4-5e28213d3598', 'sell', '2025-08-09 21:00:00+00', 199, 68, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('a91ab291-80f3-43ef-a5e7-21dcbe8f21ff', 'sell', '2025-08-06 21:00:00+00', 200, 40, 0, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('20b6fc48-d1d3-4f14-b769-8dc5461b3ce8', 'sell', '2025-03-11 22:00:00+00', 201, 14, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('5ea9bdb8-3f49-4335-af49-c8bd19ca797b', 'buy', '2025-08-06 21:00:00+00', 202, 37, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('ed2ba576-257c-4c6e-9126-a963c38f43e0', 'buy', '2024-12-25 22:00:00+00', 203, 67, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('0a2e0496-928b-445e-8edd-f9f1c71b79ae', 'buy', '2025-05-03 21:00:00+00', 204, 21, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('f4bdc49e-91fe-432d-add2-0325dd901709', 'buy', '2025-04-10 21:00:00+00', 205, 36, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('ff268f06-ba68-45e8-9007-259086ba0928', 'buy', '2025-07-26 21:00:00+00', 206, 62, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('9f15a83a-4956-4f8c-92ed-f9c108fff4ed', 'buy', '2025-02-18 22:00:00+00', 207, 5, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('6da38929-59f0-489b-b41c-b98f0ad1dcf6', 'buy', '2024-10-25 21:00:00+00', 208, 22, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('0b817c50-5244-474b-bd23-e360e9f0f149', 'buy', '2024-08-31 21:00:00+00', 209, 27, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('7c5b4b16-37b1-4eb0-bef1-c2da5fbacc0f', 'buy', '2024-10-09 21:00:00+00', 210, 33, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('8ccfdcf5-518f-4e01-acc9-6dcb3fb63358', 'sell', '2024-09-15 21:00:00+00', 211, 69, 0, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('bf6b44b0-6a09-4470-9f8a-2b2c37eb7fa9', 'buy', '2025-01-19 22:00:00+00', 212, 84, 1, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('95277983-1ace-46b8-a111-8ce5017de5d0', 'buy', '2025-07-06 21:00:00+00', 213, 82, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('e8eb68af-1e1e-420a-9868-e0aba2c03ce9', 'buy', '2024-12-27 22:00:00+00', 214, 48, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('b50fa840-1ee9-429c-8a74-bec138bd3c4c', 'sell', '2025-07-13 21:00:00+00', 215, 40, 2, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('59f53a78-c57b-4e20-add1-16829fd398ce', 'buy', '2025-03-11 22:00:00+00', 216, 6, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('bf6776b3-1bd1-4d03-8d50-f9cf2a42dc43', 'sell', '2024-10-19 21:00:00+00', 217, 72, 1, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('878a0116-344c-4f3c-8faf-fd664e9408cb', 'buy', '2024-12-24 22:00:00+00', 218, 90, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('5814798c-1328-4386-84cb-80196caf4260', 'sell', '2025-05-31 21:00:00+00', 219, 3, 1, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('2c0fd9ec-a7c9-4561-b238-751e774a464e', 'sell', '2024-09-12 21:00:00+00', 220, 43, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('f9771d65-7a29-49bc-8b5a-7bbb15677dea', 'sell', '2025-05-18 21:00:00+00', 221, 35, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('ea6e573e-6912-47ff-96dc-5ac1908088a5', 'buy', '2025-02-23 22:00:00+00', 222, 50, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('62828108-4d83-4cf0-b22f-a0baaec3ff6c', 'buy', '2024-11-23 22:00:00+00', 223, 31, 1, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('3f8f6c13-7ea9-4430-9e06-aa8dc8e2635a', 'buy', '2025-05-03 21:00:00+00', 224, 45, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('f7baec5b-3d0b-4ed0-af9c-c6f9b41bffec', 'sell', '2025-01-29 22:00:00+00', 225, 25, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('e3ca4344-4742-4cfa-aae2-04b59d70ed35', 'buy', '2025-03-08 22:00:00+00', 226, 1, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('45b3ca57-e8b8-4332-8f7a-74190e6b85fe', 'buy', '2025-03-29 22:00:00+00', 227, 1, 1, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('7c9c3431-22bf-4192-a8c0-c3cee2586a99', 'sell', '2024-12-24 22:00:00+00', 228, 57, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('e7dde57f-aac4-4e2e-bcfc-a80276a31127', 'buy', '2024-10-30 22:00:00+00', 229, 64, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('77e960df-2e96-4961-90f6-c161a4d6fc23', 'buy', '2024-10-27 22:00:00+00', 230, 78, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('70ef7c3f-5ccc-409f-9b73-3fd50fa06c40', 'sell', '2025-01-24 22:00:00+00', 231, 6, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('d0886779-240a-45c5-8e2f-8a148725e72e', 'buy', '2024-12-15 22:00:00+00', 232, 56, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('508c318b-18da-4e23-b8a6-dbb8a6f61496', 'buy', '2024-10-25 21:00:00+00', 233, 99, 1, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('085b25be-6300-4549-bea5-a428034c74c9', 'sell', '2025-02-15 22:00:00+00', 234, 94, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('03779b42-eed6-4659-bc24-ed911d92c590', 'buy', '2024-12-14 22:00:00+00', 235, 15, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('bb7aa4bf-dd79-4fd2-9f27-aa7fcb689489', 'buy', '2025-01-21 22:00:00+00', 236, 80, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('ee59ef1a-bfab-4dd1-8890-dd1cb103bfb5', 'sell', '2025-03-05 22:00:00+00', 237, 39, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('72806ae6-d13d-4428-9f32-c069f21e695c', 'sell', '2024-11-16 22:00:00+00', 238, 6, 0, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('c0e65976-ca7c-4b01-b04e-9e65c624e5bc', 'buy', '2025-02-15 22:00:00+00', 239, 81, 1, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('7c774360-d6f6-469a-8589-619a064084d7', 'buy', '2024-12-11 22:00:00+00', 240, 55, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('0b7274a8-c09b-442a-8660-1530055e036c', 'buy', '2025-02-16 22:00:00+00', 241, 24, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('838945c3-d330-4fcf-91ca-109ec6ec7b72', 'buy', '2025-01-12 22:00:00+00', 242, 50, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('2b06279c-db67-4b08-824c-c783e5e201b2', 'sell', '2024-11-09 22:00:00+00', 243, 100, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('99e82298-1ce3-4686-af05-a8c3d0a28368', 'sell', '2025-02-07 22:00:00+00', 244, 97, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('4b283f2b-cd6c-4616-b428-32e9561bece5', 'buy', '2024-11-04 22:00:00+00', 245, 90, 0, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('73241a20-418e-4345-a03a-1e611488b19f', 'sell', '2024-09-07 21:00:00+00', 246, 100, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('2c6a4e41-013d-432b-8549-0ace8ef40252', 'sell', '2025-04-10 21:00:00+00', 247, 73, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('1357b910-2bf0-410f-a5a8-56ee0bd7c26c', 'buy', '2025-03-15 22:00:00+00', 248, 83, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('a7939e9b-afd5-47fb-aa60-c726f76647c9', 'buy', '2024-08-24 21:00:00+00', 249, 32, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('9516073b-93b7-4d6c-8929-482c4d58085a', 'buy', '2024-09-28 21:00:00+00', 250, 30, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('1642e4b8-8a3a-41c0-b87b-8ea0b3e828ab', 'buy', '2024-11-02 22:00:00+00', 251, 5, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('43f844e9-1794-4fe8-8d61-8d1e84fc84f6', 'sell', '2024-09-20 21:00:00+00', 252, 87, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('5248dd51-5965-4d34-9127-01c103f51e87', 'sell', '2025-05-06 21:00:00+00', 253, 35, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('f451f2f8-2688-4278-8f3f-11d87de98b45', 'sell', '2025-02-11 22:00:00+00', 254, 31, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('d34460d6-f49f-4975-8470-eb104ac41585', 'buy', '2025-05-09 21:00:00+00', 255, 41, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('acced408-942b-4e17-8540-16b836f3cafa', 'buy', '2024-12-27 22:00:00+00', 256, 3, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('1720a987-f5a4-4d9c-bfef-c38d26fce8a3', 'sell', '2024-12-15 22:00:00+00', 257, 60, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('6f87dcfa-fff7-4f62-8f15-5e06a93524ef', 'buy', '2024-12-27 22:00:00+00', 258, 87, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('7ba0d8b0-2068-40cf-ae52-58dd7f28ce20', 'sell', '2025-06-18 21:00:00+00', 259, 14, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('fac595be-5fb2-4dd1-b494-0d32fe31eeb8', 'sell', '2025-04-18 21:00:00+00', 260, 88, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('a5d2ffda-b3d4-4162-bbef-039facfcd617', 'sell', '2025-03-04 22:00:00+00', 261, 52, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('d9d98f58-5e5b-44c2-abc2-a79e5a7564b9', 'buy', '2025-02-28 22:00:00+00', 262, 44, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('93141ce6-ff1a-4760-908e-92559d9062f6', 'buy', '2025-02-23 22:00:00+00', 263, 79, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('ffe0abb7-e337-4036-abd0-94e1b7adbc96', 'buy', '2025-03-30 21:00:00+00', 264, 100, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('cea2f3d4-1f0b-4ea2-be80-8bd230fd9b93', 'sell', '2024-12-06 22:00:00+00', 265, 29, 1, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('609384fb-6e22-4097-a576-9b35b38dbc5f', 'sell', '2024-09-18 21:00:00+00', 266, 78, 1, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('eb4c3cbf-2de3-41dd-9286-d1adf4030384', 'buy', '2024-09-22 21:00:00+00', 267, 30, 1, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('50fa658b-77e9-45dd-a044-accd35743d59', 'sell', '2025-02-13 22:00:00+00', 268, 67, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('9e5874c8-067c-4c2f-9039-f71a4de525b5', 'sell', '2025-01-25 22:00:00+00', 269, 49, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('c858ca3a-06ea-45a9-bee3-0619c1ecb2e2', 'sell', '2024-10-04 21:00:00+00', 270, 37, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('17d3d53a-8ee0-485d-9be5-53d1a0931e04', 'buy', '2025-02-14 22:00:00+00', 271, 46, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('4dc90bbc-5256-4db2-bd62-3b10392f088e', 'sell', '2024-08-27 21:00:00+00', 272, 12, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('22fac856-c328-434f-8a3d-0b296f64c966', 'sell', '2025-07-05 21:00:00+00', 273, 91, 1, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('4ebfa72f-abd6-47fa-bbd9-6865ed421af9', 'sell', '2025-07-09 21:00:00+00', 274, 37, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('d91e4274-e341-493e-97c5-83b1a21cc7d2', 'sell', '2025-04-14 21:00:00+00', 275, 66, 1, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('05c209cb-4896-4894-891a-e078234dbe59', 'sell', '2025-02-10 22:00:00+00', 276, 84, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('78dbb3a5-88b3-4ede-b6ff-053733b105d8', 'buy', '2025-02-06 22:00:00+00', 277, 71, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('62d7a7ed-c4c5-4ec4-a941-0e807c91fb4d', 'buy', '2024-12-12 22:00:00+00', 278, 77, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('65c36283-4939-4ac2-a439-03df52f2bc7c', 'sell', '2024-10-29 22:00:00+00', 279, 5, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('8dd2d5ec-55c0-4c9d-96ec-283fae501902', 'buy', '2025-04-11 21:00:00+00', 280, 67, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('d1ce4c28-7a0b-4289-951a-e209821a7a3a', 'buy', '2025-05-11 21:00:00+00', 281, 73, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('c3e2542e-dfa5-4e70-b016-ce91d956fabb', 'buy', '2024-12-02 22:00:00+00', 282, 68, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('f4a1ab17-00d6-49b2-9d86-e6b8044519b7', 'sell', '2025-04-19 21:00:00+00', 283, 15, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('f29acd50-7688-4be3-b620-a922a16bd3e9', 'buy', '2025-02-15 22:00:00+00', 284, 66, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('0ce085c4-8c17-4897-9f8c-5c4eb1492ae1', 'buy', '2024-11-01 22:00:00+00', 285, 83, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('fb32c330-1b74-4316-b522-22dd44459b08', 'buy', '2024-12-29 22:00:00+00', 286, 63, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('62d9c617-926d-407a-b71a-390c2d4690e0', 'buy', '2025-08-11 21:00:00+00', 287, 27, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('058d4fad-1605-4407-8ac0-e07ae4721f58', 'sell', '2024-12-06 22:00:00+00', 288, 44, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('468eef32-a353-4ac4-8859-c35be6e8ba0e', 'buy', '2024-12-04 22:00:00+00', 289, 18, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('a4a79018-2060-472c-8026-0a5e799e6a93', 'buy', '2025-08-17 21:00:00+00', 290, 80, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('9ac25cca-9cc5-49dc-9fa9-9a4643d07e1e', 'sell', '2025-06-16 21:00:00+00', 291, 97, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('2af21be5-022d-4fde-9d13-22047528d2e3', 'sell', '2025-07-31 21:00:00+00', 292, 10, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('cdc168c9-a484-4bb7-9f5d-937d04cf93e3', 'sell', '2025-05-29 21:00:00+00', 293, 40, 2, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('72a4b6f3-aead-466d-9580-8315422f91d0', 'sell', '2025-08-02 21:00:00+00', 294, 61, 0, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('ab69f0c9-5347-47d9-b005-31499f943b31', 'buy', '2025-03-30 21:00:00+00', 295, 100, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('999f87dd-0be5-454c-a6ff-2b67b5c696c2', 'sell', '2025-06-01 21:00:00+00', 296, 43, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('548852b9-4bd1-432b-afe5-fc9230d1498f', 'buy', '2024-10-28 22:00:00+00', 297, 32, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('d33602e9-9945-41f4-8ce4-e24f99c8d6c2', 'buy', '2025-07-27 21:00:00+00', 298, 72, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('9bece3f8-d909-4d01-9f63-168bb8b29e11', 'sell', '2025-07-31 21:00:00+00', 299, 12, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('1b24fac6-963f-4a0f-aeab-1718250b5629', 'buy', '2024-10-01 21:00:00+00', 300, 28, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('3eca2b5e-8883-429a-a342-fe412da50ef3', 'sell', '2025-03-31 21:00:00+00', 301, 2, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('c54f7be9-9ecf-4488-acd2-7857a05641d0', 'sell', '2025-03-07 22:00:00+00', 302, 88, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('30ddec51-d920-4a04-8a2e-83175c41f3ab', 'buy', '2025-03-09 22:00:00+00', 303, 97, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('afd7eea5-3b0a-4d1a-ba7a-94739219c4ec', 'buy', '2024-08-23 21:00:00+00', 304, 16, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('9e5dd81d-95be-469b-bcd0-7498866b0bf8', 'buy', '2025-02-18 22:00:00+00', 305, 2, 1, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('c55aedb9-95f5-4047-8d98-4995a84a41ea', 'buy', '2024-12-23 22:00:00+00', 306, 57, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('86fc7111-1d4c-426c-9510-bb018b6edbe3', 'buy', '2025-03-23 22:00:00+00', 307, 89, 2, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('c2058bd3-13f7-4407-91c0-4317beaf00a6', 'buy', '2025-04-09 21:00:00+00', 308, 62, 0, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('e5a1aaf7-f564-468c-a574-e293ad35c21c', 'sell', '2025-05-11 21:00:00+00', 309, 24, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('83e81d0e-0007-4b9b-b795-4eb0bcd84056', 'buy', '2025-04-17 21:00:00+00', 310, 89, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('1f87401b-7db2-4998-8aaa-56c075fd66a3', 'sell', '2024-12-01 22:00:00+00', 311, 69, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('ca9a4b34-b367-4eec-be29-918075ad5617', 'sell', '2024-08-21 21:00:00+00', 312, 9, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('db30712b-ca53-44ab-93d0-365fad91b5ad', 'sell', '2024-11-05 22:00:00+00', 313, 15, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('a4786fb6-f120-4eb1-8d63-d2a58316fa39', 'buy', '2024-09-19 21:00:00+00', 314, 93, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('f3357f0c-c57e-432f-8369-1104f774af16', 'buy', '2024-12-01 22:00:00+00', 315, 63, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('b0260db4-a75a-4aac-a283-48e21b871739', 'sell', '2025-01-17 22:00:00+00', 316, 45, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('9a04a425-4c6a-4776-89dd-80d6ecd44cc2', 'buy', '2024-12-03 22:00:00+00', 317, 10, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('b1d0ea55-ab4f-47f3-8ead-9cc3fc529510', 'buy', '2025-07-11 21:00:00+00', 318, 70, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('9c9a8808-d6a5-4332-aaf7-98badb0bb62c', 'sell', '2025-06-15 21:00:00+00', 319, 94, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('58115668-3257-49c5-acb1-2530a844fc42', 'sell', '2025-01-19 22:00:00+00', 320, 36, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('55aefc2a-ab7e-42f7-b63c-bb0b829ee3e9', 'buy', '2025-07-03 21:00:00+00', 321, 83, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('0641fba4-17b0-40c1-a0e5-6cb5a42e8681', 'buy', '2025-03-13 22:00:00+00', 322, 49, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('88d2d202-3ffc-460b-8bf5-e2098fe4264a', 'buy', '2025-05-19 21:00:00+00', 323, 43, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('f4a2b7b9-7998-4570-8b1b-e00a663a9b53', 'buy', '2025-03-12 22:00:00+00', 324, 60, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('498911ac-9cb5-42bd-a2f3-9f38fe49d4ce', 'sell', '2025-01-08 22:00:00+00', 325, 10, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('5b6c4729-90cf-40f8-991c-6295301776c9', 'buy', '2025-07-17 21:00:00+00', 326, 48, 2, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('635c678f-c8a8-46a2-ad6b-1cd51bd76bfb', 'sell', '2024-12-28 22:00:00+00', 327, 43, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('c73ee3c7-fd81-4820-80bb-235862c7f69d', 'buy', '2024-12-23 22:00:00+00', 328, 1, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('c26b9ae1-c266-49ed-9478-47a3aca9c881', 'sell', '2025-06-04 21:00:00+00', 329, 2, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('b0dad192-7f4e-4b8e-9eed-b0c519bf55a5', 'buy', '2024-11-11 22:00:00+00', 330, 22, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('0da2ae54-2a72-4b65-9b9d-7fcd394d5c2d', 'buy', '2025-04-24 21:00:00+00', 331, 18, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('c315e972-c3d5-4a75-97db-b8335bf02e93', 'buy', '2025-07-26 21:00:00+00', 332, 92, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('033a4fd2-14ce-42ff-9cfb-f48528a38cbb', 'sell', '2025-07-03 21:00:00+00', 333, 10, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('cc879636-ea4c-4fb9-83b9-906680cc22b7', 'sell', '2025-08-08 21:00:00+00', 334, 52, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('e012cbac-bd6a-47b7-9dee-ab073ddd51cb', 'buy', '2025-01-07 22:00:00+00', 335, 83, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('f34f35f4-65a9-4ea9-a23b-81fb3dcfff92', 'buy', '2025-04-08 21:00:00+00', 336, 82, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('53afc914-623f-4550-8e3a-63d5620c5dce', 'sell', '2025-03-03 22:00:00+00', 337, 95, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('7111457c-aaff-44dc-b6f0-9bff02a09297', 'sell', '2025-01-11 22:00:00+00', 338, 75, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('64881927-dda9-4968-914a-603f3bab31ab', 'sell', '2024-09-07 21:00:00+00', 339, 17, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('04c557e2-dabc-44c0-afd6-41fd6e131fd7', 'buy', '2024-08-26 21:00:00+00', 340, 18, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('282630c9-8a48-49cf-a649-733d1fd30eaa', 'buy', '2024-11-25 22:00:00+00', 341, 99, 2, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('decf3c79-992b-4da7-b697-3b12ad8bc4ab', 'sell', '2025-01-02 22:00:00+00', 342, 85, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('ac5338fe-10b5-45bb-bcf8-df5a273a1e33', 'buy', '2024-10-14 21:00:00+00', 343, 77, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('2945e995-3bf8-4924-b35a-4d89729a86e4', 'sell', '2025-02-13 22:00:00+00', 344, 30, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('1dc50d34-6522-4b30-92c6-35fa3455b38d', 'sell', '2025-04-15 21:00:00+00', 345, 13, 1, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('cbb15871-2a83-4ede-923e-f16076453014', 'sell', '2024-11-19 22:00:00+00', 346, 25, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('267eecc7-6abe-4fa5-a84b-85b1199d5015', 'sell', '2024-08-24 21:00:00+00', 347, 78, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('25ea9cba-34b9-4cc5-bf18-90ea41b5ae4e', 'buy', '2024-08-24 21:00:00+00', 348, 98, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('8ee179c7-7652-4e2c-a008-128582fb89eb', 'buy', '2025-01-24 22:00:00+00', 349, 58, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('ad6d0cc5-2367-47f1-b088-c323bf34b72b', 'buy', '2025-04-09 21:00:00+00', 350, 98, 1, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('474bb627-5ddd-4e72-9835-2e89dec6086e', 'buy', '2025-01-31 22:00:00+00', 351, 29, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('01cbb534-dfb8-486a-94ed-12d6bc3135f9', 'sell', '2024-09-24 21:00:00+00', 352, 45, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('bb657495-110d-4048-a677-46bbca96218f', 'buy', '2024-09-18 21:00:00+00', 353, 90, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('509f094a-6909-4153-9136-13f6ef570f37', 'sell', '2024-11-04 22:00:00+00', 354, 5, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('97e5b91c-17d1-43f8-aa8d-7ade6ccc4a89', 'buy', '2024-10-28 22:00:00+00', 355, 73, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('22ddf04d-ca86-473a-9cd8-7355ceddbaf9', 'buy', '2024-08-26 21:00:00+00', 356, 92, 0, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('8b3d62fa-4dbf-41be-99df-a122cc427616', 'sell', '2024-09-21 21:00:00+00', 357, 81, 1, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('a5d07a54-f06b-430b-97b9-9f6f51f556b6', 'sell', '2025-07-27 21:00:00+00', 358, 10, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('75b33084-67da-4ed2-8245-01b1d3cb5fd1', 'sell', '2024-10-04 21:00:00+00', 359, 94, 1, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('7d0b1d10-6845-4ae1-8d94-4fc7c7cab0a7', 'buy', '2024-12-20 22:00:00+00', 360, 57, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('beeeb1da-c86c-4eab-bf0a-fb42cb8af743', 'sell', '2025-06-10 21:00:00+00', 361, 45, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('3d235a80-75a3-43e4-a0c2-e265369d9b9d', 'buy', '2025-04-26 21:00:00+00', 362, 32, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('011e05b5-48c4-457c-9507-f94c82375f47', 'sell', '2024-10-25 21:00:00+00', 363, 45, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('372b51e1-cceb-443c-8b39-34150748d42d', 'sell', '2025-03-17 22:00:00+00', 364, 39, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('2788ecd7-fe27-451f-a94b-15353bca0b54', 'sell', '2025-04-28 21:00:00+00', 365, 7, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('ce5110b6-4541-44a1-aa0a-ead4157937a1', 'buy', '2025-08-13 21:00:00+00', 366, 48, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('7e74da78-d0c5-4bcc-8b9a-ec88550bd8ed', 'buy', '2025-01-18 22:00:00+00', 367, 82, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('7644c4d4-2a32-423e-9869-83d691684f09', 'sell', '2025-04-10 21:00:00+00', 368, 14, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('7db2027f-23ca-4d96-8d4b-d65ae282c563', 'sell', '2025-04-28 21:00:00+00', 369, 16, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('8f72041f-2575-4654-bccd-562f6302d532', 'buy', '2025-04-29 21:00:00+00', 370, 70, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('1aeca8e2-0286-403d-bd41-d5dfe2e58ffd', 'sell', '2025-03-20 22:00:00+00', 371, 64, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('a8b8eaf4-1162-4075-868b-57faa67a2aad', 'buy', '2025-07-10 21:00:00+00', 372, 35, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('a1373166-29c7-42bb-9988-95a2cd8c3a8b', 'sell', '2024-11-12 22:00:00+00', 373, 100, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('6b3bce72-1871-430c-827b-0e1fd9e8f122', 'buy', '2024-11-22 22:00:00+00', 374, 67, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('d3a07f81-0b28-4736-8af1-5a21e3ae6c10', 'sell', '2025-05-15 21:00:00+00', 375, 69, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('30ca2cfe-16d4-4342-8c29-2ca76259db55', 'buy', '2025-06-01 21:00:00+00', 376, 72, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('ee100f5c-9166-45e5-8c83-1c02f71eac2c', 'buy', '2024-10-29 22:00:00+00', 377, 76, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('a126b21e-bd53-4be0-ba06-954f57e342c6', 'sell', '2025-04-07 21:00:00+00', 378, 23, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('f7b8185a-78d8-4e0d-ac43-c11c567afb77', 'buy', '2024-12-24 22:00:00+00', 379, 93, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('c1fc19d8-8657-47b9-9972-59c36af5e8a9', 'sell', '2025-01-27 22:00:00+00', 380, 7, 0, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('0ad405fd-2f55-415c-9970-ab51f31bda70', 'buy', '2025-03-14 22:00:00+00', 381, 80, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('423549de-7409-4af5-8ac8-7c991ddc60ad', 'buy', '2024-11-27 22:00:00+00', 382, 92, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('a8fdf59f-a4a0-4d50-9060-53c57a502e04', 'buy', '2025-05-27 21:00:00+00', 383, 34, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('964cf69b-5886-4345-aa15-f0e9fbecf833', 'buy', '2025-02-04 22:00:00+00', 384, 91, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('e92103e9-f7c0-4e92-81ae-8a70f4e13172', 'buy', '2025-08-11 21:00:00+00', 385, 20, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('90f5a0a6-56ba-4565-8819-6b9a7fd9bcec', 'buy', '2024-10-07 21:00:00+00', 386, 45, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('d13e8de1-b6e6-4244-8445-a6de5f1db1d0', 'sell', '2025-05-12 21:00:00+00', 387, 77, 1, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('42ef5601-44b5-4134-8c5e-b75db43d6925', 'sell', '2024-10-30 22:00:00+00', 388, 78, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('94808557-3428-43db-9de4-855a6545ee7e', 'sell', '2024-08-19 21:00:00+00', 389, 19, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('faf04f00-d25b-4df6-97c2-3a3ea974390c', 'sell', '2025-06-30 21:00:00+00', 390, 44, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('3a1a3cba-038f-4f18-a6d6-afa36b4c8ed7', 'buy', '2025-05-05 21:00:00+00', 391, 11, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('f4e6e943-c320-4da1-b331-b16c2c1582a5', 'buy', '2024-09-17 21:00:00+00', 392, 77, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('3c73fa8c-e840-4b2b-be00-9feda0caef87', 'buy', '2025-01-09 22:00:00+00', 393, 50, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('299fb20e-4336-40ae-825c-42922763a6de', 'buy', '2025-03-05 22:00:00+00', 394, 6, 1, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('f37363c4-a14e-413a-9192-c82355c01f45', 'buy', '2025-07-24 21:00:00+00', 395, 13, 1, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('8eef0930-5c1d-4f30-9dc0-ca5c6fea6f3e', 'buy', '2024-10-18 21:00:00+00', 396, 29, 0, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('27bfd390-7b92-4478-987f-11daaeefcf1f', 'buy', '2025-03-18 22:00:00+00', 397, 34, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('1c16a3e7-a966-4153-bae8-a01afd4520ef', 'sell', '2025-02-22 22:00:00+00', 398, 84, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('9ea6410c-0cd4-42d3-a45d-d88edc7db3fd', 'sell', '2025-05-04 21:00:00+00', 399, 63, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('571f47ee-5d5b-4036-81fd-342aad6f2b01', 'sell', '2024-09-05 21:00:00+00', 400, 14, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('50063d1a-1103-49a0-b9da-5ae4fb36975e', 'sell', '2025-03-15 22:00:00+00', 401, 22, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('5904dc61-4bd5-42ec-b900-2d3775a7e09b', 'sell', '2024-10-23 21:00:00+00', 402, 46, 1, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('68cda973-e63d-4cd7-907a-d6a3555b7eef', 'sell', '2024-09-26 21:00:00+00', 403, 65, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('41a36535-5602-4297-83c9-03287af27458', 'buy', '2024-10-05 21:00:00+00', 404, 94, 2, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('a062e736-70fc-455b-a861-9597b05eba6b', 'sell', '2025-02-25 22:00:00+00', 405, 78, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('e46c7f16-a819-45b7-a5ff-2104d3b934d0', 'sell', '2024-09-08 21:00:00+00', 406, 50, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('1df9e0ef-51dd-421e-ac20-1aab22d4b5c8', 'buy', '2025-07-09 21:00:00+00', 407, 61, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('9f79143a-a114-4dbb-a870-11033c9284e9', 'sell', '2025-07-20 21:00:00+00', 408, 36, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('c4339fdc-9844-4158-9a61-96c88099171b', 'buy', '2025-03-14 22:00:00+00', 409, 7, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('512fee6c-0c3b-41b7-b7ff-ae82e0a229d4', 'sell', '2024-09-18 21:00:00+00', 410, 1, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('cf7005bb-94e6-4655-b52d-600da7a46bbc', 'sell', '2025-08-02 21:00:00+00', 411, 96, 0, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('103a0d36-30d0-419a-828a-d78ee1217431', 'buy', '2025-05-31 21:00:00+00', 412, 27, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('f539dbbe-3b1d-42db-806c-967de0661eed', 'sell', '2025-06-20 21:00:00+00', 413, 31, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('499c8790-8d9f-4d3e-a050-6ec055da14e2', 'sell', '2025-07-01 21:00:00+00', 414, 100, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('269e265a-0b74-4849-935c-7ee86dbbe79b', 'sell', '2025-07-15 21:00:00+00', 415, 18, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('ff637206-18a1-447a-b6db-39960fdb3b5c', 'sell', '2025-07-16 21:00:00+00', 416, 40, 0, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('afea6894-9b59-45d9-b4ae-2da8dda7c3c5', 'buy', '2025-05-23 21:00:00+00', 417, 52, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('337f8304-d5f9-4b41-980e-24dc2877a544', 'buy', '2025-04-22 21:00:00+00', 418, 43, 0, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('029907df-ca06-4329-af3d-bcaf420791a6', 'buy', '2025-03-12 22:00:00+00', 419, 67, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('df5e2282-cb7f-46e3-a458-df6e4c1df2f0', 'sell', '2025-07-03 21:00:00+00', 420, 53, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('fbc5b184-eacc-402d-a82e-38b38827ea99', 'sell', '2025-04-12 21:00:00+00', 421, 67, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('67cbb370-349b-4662-a5c0-08a95f0ef2b5', 'buy', '2025-04-19 21:00:00+00', 422, 38, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('ad0f97a7-7be9-48b1-9d27-97ccff5bb1a2', 'sell', '2025-01-01 22:00:00+00', 423, 90, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('412635fd-0efa-4d0e-8cd8-9724c6c307d8', 'buy', '2024-11-07 22:00:00+00', 424, 46, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('0230f82d-6863-4fb6-91d2-49b8138c1b54', 'sell', '2025-08-02 21:00:00+00', 425, 12, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('99ce6981-1afc-486a-93b5-f8ff2246aa66', 'sell', '2024-11-04 22:00:00+00', 426, 92, 0, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('64ac7d1c-42ca-4dbb-b0bd-ce5d142f95cf', 'buy', '2025-06-23 21:00:00+00', 427, 18, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('efcabe14-09c3-4a78-a53d-734a8b3e6b0a', 'buy', '2025-08-07 21:00:00+00', 428, 82, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('6ad1e1dd-d0ca-45b6-97cd-0151c521fe84', 'buy', '2025-06-19 21:00:00+00', 429, 39, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('36a5bc8b-2117-475e-8e73-79d5a6ae434d', 'buy', '2024-12-15 22:00:00+00', 430, 59, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('42bd9268-bda4-46d1-8b29-4236de45262b', 'sell', '2025-08-05 21:00:00+00', 431, 49, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('364dfb1f-a140-487c-8d12-885a3a7e9af7', 'sell', '2024-10-15 21:00:00+00', 432, 39, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('bfbcab62-a48b-463b-ac4d-a3ba4c2f0425', 'buy', '2025-03-01 22:00:00+00', 433, 73, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('e8b96c69-c1d7-41de-ba61-e1371fad69d0', 'sell', '2025-01-27 22:00:00+00', 434, 94, 2, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('6aa132ad-d4a6-42de-bb13-7e9588fab9da', 'buy', '2025-08-13 21:00:00+00', 435, 28, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('067c1e10-7dbb-4bea-a9c7-f9029db7c51d', 'buy', '2024-12-24 22:00:00+00', 436, 86, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('52850960-71b9-4003-9018-4930be276d75', 'buy', '2025-01-07 22:00:00+00', 437, 16, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('54f38b9a-a1db-436f-adad-b38ef450f9d6', 'sell', '2025-04-28 21:00:00+00', 438, 96, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('7b61b4b1-89a8-4ae3-b6c0-cb2ff7f95826', 'buy', '2024-08-20 21:00:00+00', 439, 40, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('8e1b4563-a9c6-42ab-971e-875c9d2ddb58', 'buy', '2025-05-02 21:00:00+00', 440, 19, 1, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('be1c58f0-3747-42c2-bb59-ffbf9f824c08', 'buy', '2025-07-16 21:00:00+00', 441, 18, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('9996067a-7cd3-496d-90af-81069caa4e21', 'buy', '2025-05-06 21:00:00+00', 442, 94, 0, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('c842dd2f-5370-4d84-ba71-98fdb4dbc83c', 'sell', '2025-06-01 21:00:00+00', 443, 75, 1, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('27182ae9-58cd-4e44-8ba0-89616ef7ced0', 'sell', '2024-12-03 22:00:00+00', 444, 45, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('0f5fb0b2-6c6d-47e7-8650-7fd26fa85561', 'buy', '2024-11-10 22:00:00+00', 445, 52, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('c5a0e63d-6dd9-4f9e-b410-9aed5fcc888f', 'buy', '2025-01-01 22:00:00+00', 446, 32, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('d3e593ca-c535-485c-8525-03e7ba0ed591', 'sell', '2024-09-15 21:00:00+00', 447, 100, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('97941a27-4c2d-4aa7-bb51-98d1c96bd1f7', 'sell', '2024-12-15 22:00:00+00', 448, 24, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('23416ca7-a854-41fd-a6fe-2f1ed7201f89', 'buy', '2025-02-14 22:00:00+00', 449, 72, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('6c73b266-b9fd-44f9-b66c-6f59568d082f', 'sell', '2025-03-25 22:00:00+00', 450, 69, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('8df9e0d0-fb39-4960-b1e5-971ad1bdc2f0', 'sell', '2025-07-31 21:00:00+00', 451, 28, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('769f467e-66ba-4d86-b034-1ea96f9fe7ed', 'buy', '2025-06-22 21:00:00+00', 452, 31, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('13762363-70ff-4c95-890b-4f4a6eac8a0c', 'buy', '2024-09-27 21:00:00+00', 453, 73, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('0f109a3c-0dc4-43a9-b799-9e162b3ce865', 'sell', '2025-06-08 21:00:00+00', 454, 51, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('34e901f2-94e9-4192-abaf-2245d4587d52', 'buy', '2025-02-16 22:00:00+00', 455, 18, 1, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('e011e347-1094-4705-8119-8de3bfb94e21', 'sell', '2025-07-21 21:00:00+00', 456, 24, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('031a5b02-220e-4c4e-8c7f-286c6a5fa52b', 'buy', '2025-02-15 22:00:00+00', 457, 66, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('7f2f1f33-edad-40e9-bf9f-98d494215d37', 'sell', '2025-05-19 21:00:00+00', 458, 74, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('afbb28ed-57bb-430d-aebf-2cf758bfeb1b', 'sell', '2024-12-03 22:00:00+00', 459, 82, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('5a97d863-4543-4d1c-a782-784a08f64d47', 'sell', '2025-01-28 22:00:00+00', 460, 45, 2, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('76eb85da-eb83-4384-a596-133125d430f6', 'sell', '2025-04-05 21:00:00+00', 461, 4, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('0c7c11f8-1658-43aa-8a65-7fe841607f6d', 'sell', '2025-06-01 21:00:00+00', 462, 12, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('4954acd0-cc43-4132-83cd-9553a75e0389', 'buy', '2025-06-05 21:00:00+00', 463, 55, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('61a0f8a6-61fa-4e5d-a7ef-594af6dfd9c3', 'buy', '2024-11-08 22:00:00+00', 464, 17, 2, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('ca162a5a-bdeb-409e-baa1-f586b5a0161c', 'buy', '2025-01-03 22:00:00+00', 465, 84, 0, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('3dfe2e0d-26ab-4e00-b39c-47c4d7c44cb0', 'buy', '2025-07-20 21:00:00+00', 466, 46, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('df066c29-207c-4da3-b81a-8fe907336ea9', 'sell', '2024-09-01 21:00:00+00', 467, 79, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('5c518c17-7f1c-4f6a-85ad-123525bc3ec6', 'buy', '2024-10-05 21:00:00+00', 468, 20, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('bd0c95a4-326d-4e18-8518-9be010fe80f1', 'buy', '2024-12-10 22:00:00+00', 469, 98, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('b3e95827-6ea3-4974-bf3f-d1518a7cd9e2', 'buy', '2025-03-31 21:00:00+00', 470, 98, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('ec03a904-0694-4ac8-a4aa-476a374b507c', 'sell', '2025-03-13 22:00:00+00', 471, 17, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('32047e39-b221-4edc-be73-cb99867be009', 'buy', '2024-09-28 21:00:00+00', 472, 30, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('ab82e8ec-4f54-4716-97e2-e3e66484a5e9', 'buy', '2025-01-13 22:00:00+00', 473, 21, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('92451e8b-21c6-45d8-920d-d5127e053a5a', 'buy', '2025-04-19 21:00:00+00', 474, 68, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('67aee55b-b99e-419c-90f3-e9ee8dfd5556', 'buy', '2025-08-17 21:00:00+00', 475, 66, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('dabb4b57-570f-488a-9b98-4df0820c891a', 'sell', '2025-07-30 21:00:00+00', 476, 71, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('59b7bd05-1fd9-423e-bc38-d819df54c6e7', 'sell', '2025-07-03 21:00:00+00', 477, 39, 1, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('c70b5a76-556c-42f4-9ba9-3c0e379d9e32', 'buy', '2025-04-23 21:00:00+00', 478, 27, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('c75e3111-6f24-4811-b8a2-ecd76eb0376e', 'sell', '2025-04-03 21:00:00+00', 479, 19, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('4cb0aff0-43d5-42da-b662-9dd8e78ee532', 'buy', '2025-02-04 22:00:00+00', 480, 79, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('f0505795-34e9-4440-90f1-b1c4b3f1c90f', 'sell', '2025-01-02 22:00:00+00', 481, 30, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('90bba984-0ecf-4326-bc54-421f9b40a38a', 'sell', '2025-05-19 21:00:00+00', 482, 5, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('4db93e4f-8be2-4ef0-acf1-a4571acbf4af', 'buy', '2025-01-16 22:00:00+00', 483, 85, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('5a4df84d-e1d0-4e84-b3e1-23a2fcb62363', 'buy', '2025-04-15 21:00:00+00', 484, 82, 1, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('6666f110-e3e5-4368-9655-c02b576babd7', 'buy', '2024-08-29 21:00:00+00', 485, 25, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('703e144a-f375-47e2-92a4-b2fd212a8024', 'sell', '2024-10-21 21:00:00+00', 486, 100, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('0448de66-bb61-4bce-94e5-e88ced271151', 'buy', '2024-12-17 22:00:00+00', 487, 90, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('db317ea0-836c-4c1b-912d-60eda8527159', 'buy', '2025-03-26 22:00:00+00', 488, 4, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('e8ed67d7-3903-4bc7-9b47-a32c5e19436c', 'buy', '2025-08-09 21:00:00+00', 489, 9, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('98aec04d-338d-418f-b726-e78764357d77', 'sell', '2025-02-15 22:00:00+00', 490, 96, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('d3dc6ceb-9032-4b3c-a425-5f18c7efc818', 'buy', '2025-07-14 21:00:00+00', 491, 34, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('e47603f9-040f-4655-984b-eadaa987bd47', 'sell', '2025-03-17 22:00:00+00', 492, 8, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('74f7e599-31a3-4b9c-a4f6-c21287d07cb4', 'buy', '2025-04-20 21:00:00+00', 493, 24, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('95724e30-64e4-4421-8938-5a7280951f86', 'sell', '2025-03-21 22:00:00+00', 494, 66, 2, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('da950182-256a-44dd-ab7d-fe91c6220248', 'sell', '2025-06-13 21:00:00+00', 495, 22, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('6765b419-c408-44a7-ad31-85edb362b884', 'buy', '2025-01-18 22:00:00+00', 496, 64, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('34fdc76d-161b-4fc3-8a90-2d3cf9c60aa4', 'buy', '2025-01-26 22:00:00+00', 497, 72, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('ec3fac83-fbac-43c7-9214-b04b0de7fc29', 'buy', '2024-09-20 21:00:00+00', 498, 22, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('99be6884-fb31-4482-88a2-52233547bc3f', 'sell', '2024-11-07 22:00:00+00', 499, 3, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('176b3601-f745-4a46-bb85-76fdef7b1829', 'buy', '2024-09-26 21:00:00+00', 500, 77, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('1c2c2088-4ed6-4ef3-bc4e-eb67d880b8b9', 'buy', '2025-08-05 21:00:00+00', 501, 98, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('56d23fd0-1c8b-4914-a7fa-85517e60c732', 'buy', '2024-09-06 21:00:00+00', 502, 51, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('c68d0180-55cd-466e-ab10-c90958dcba54', 'sell', '2025-04-02 21:00:00+00', 503, 56, 1, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('12d85066-867a-4d73-a23f-3f454821bf3c', 'sell', '2024-10-17 21:00:00+00', 504, 17, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('c9444317-2812-45ac-a982-3749451e05b9', 'buy', '2025-06-23 21:00:00+00', 505, 16, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('78f076db-8781-4507-a627-09b882e906b0', 'buy', '2024-11-20 22:00:00+00', 506, 76, 1, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('a8bd5d9a-3444-4d43-ad45-7ce8dfb8ebf2', 'buy', '2025-05-06 21:00:00+00', 507, 7, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('302cf860-b387-42d7-a210-eb39c93b3fbf', 'sell', '2025-01-26 22:00:00+00', 508, 9, 2, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('f6b89561-7e86-4dbd-8b0a-213107e5e960', 'buy', '2025-05-16 21:00:00+00', 509, 1, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('8002d13d-0434-4f31-9cfd-93f5b8ff1093', 'sell', '2024-09-11 21:00:00+00', 510, 79, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('dacf9127-88fc-49ea-95d6-e70b8de9923a', 'sell', '2025-08-10 21:00:00+00', 511, 72, 1, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('e749729c-97a1-43f9-9f05-deccdfd20f6f', 'sell', '2025-04-08 21:00:00+00', 512, 9, 0, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('601473d1-7382-45cb-93fa-ca9e6bd08a09', 'sell', '2024-12-18 22:00:00+00', 513, 28, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('0fd5f362-3954-43a5-a335-2d07121d9f48', 'buy', '2025-01-21 22:00:00+00', 514, 3, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('7cb4d3d2-cebe-4f15-bdb6-d200ff603909', 'sell', '2025-06-27 21:00:00+00', 515, 71, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('5ef5d531-85b8-4bbc-b16d-cb46c345c983', 'sell', '2025-03-16 22:00:00+00', 516, 27, 0, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('89033c20-2de1-48ad-b56b-c70832d44d07', 'buy', '2025-02-08 22:00:00+00', 517, 38, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('a03c9d99-7d56-4836-8e6d-b7625d1fc2a6', 'buy', '2024-12-19 22:00:00+00', 518, 90, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('63386e58-dbc8-44b0-9afc-52160f59f851', 'buy', '2025-02-11 22:00:00+00', 519, 63, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('410c6212-80ee-4d7f-b7d9-d7cc397f6d02', 'sell', '2025-04-27 21:00:00+00', 520, 43, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('ffc53707-3316-4fbd-b88d-9dbdcd79039d', 'sell', '2025-08-08 21:00:00+00', 521, 85, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('a5f6c1a5-5235-4110-b1a9-1d8320106a0c', 'sell', '2025-06-15 21:00:00+00', 522, 29, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('98a58ae3-e725-4f17-860d-0e29c2540024', 'buy', '2025-02-05 22:00:00+00', 523, 51, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('0987ed0b-ae36-43ce-b1ca-2b75c7cb3a13', 'buy', '2024-08-22 21:00:00+00', 524, 31, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('adb2a86f-8374-4935-af43-0216555cdf7d', 'sell', '2025-04-05 21:00:00+00', 525, 56, 0, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('37adb345-b920-40f9-9d92-eeedec347f4e', 'buy', '2025-07-24 21:00:00+00', 526, 88, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('c8533164-5249-41ab-b31d-50611e378bfd', 'sell', '2024-10-01 21:00:00+00', 527, 48, 1, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('054d124a-329d-41be-ac1a-00bac4ab6614', 'sell', '2024-10-29 22:00:00+00', 528, 51, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('1198811e-9631-4e91-837a-7fff500c5b90', 'buy', '2025-01-01 22:00:00+00', 529, 6, 1, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('bd98e33a-19e5-4a6b-b61b-507dbcfbac04', 'sell', '2025-05-15 21:00:00+00', 530, 69, 1, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('c7a0a9f4-0946-4868-8d4a-616ed8403c3c', 'sell', '2025-01-27 22:00:00+00', 531, 62, 2, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('cb7b4a50-c11b-441c-be7a-1af2e47af7a3', 'buy', '2024-12-04 22:00:00+00', 532, 71, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('d566847a-c650-4c16-b9e0-91f21bfd31ae', 'buy', '2025-04-27 21:00:00+00', 533, 52, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('6893ecc1-50b8-41b4-9ba4-aba57b441641', 'buy', '2025-08-05 21:00:00+00', 534, 10, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('35e91c32-083e-4b5d-a6c7-269e70c4cff2', 'buy', '2024-09-25 21:00:00+00', 535, 11, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('4be8d82f-f657-4953-b857-5b7ac214da7d', 'sell', '2024-09-09 21:00:00+00', 536, 100, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('3437a2a0-5139-4ed5-be9a-48d8c38279e6', 'buy', '2025-03-06 22:00:00+00', 537, 2, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('fe5078cb-8fda-4205-ad36-08970f42eaa9', 'buy', '2025-01-11 22:00:00+00', 538, 54, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('baf0679b-6210-4df1-9076-10110b62202d', 'buy', '2024-11-29 22:00:00+00', 539, 95, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('4fdd3ded-ff8d-4782-a412-fd40aa668183', 'sell', '2025-03-28 22:00:00+00', 540, 45, 2, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('d7640443-c685-4cac-be40-72e4ebb19b5e', 'buy', '2025-07-19 21:00:00+00', 541, 17, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('1f5b68c9-00ad-4229-a2aa-a16350a17530', 'sell', '2025-08-01 21:00:00+00', 542, 20, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('fa2b9c9f-3ebf-430a-8671-73fab67ffba6', 'sell', '2025-08-04 21:00:00+00', 543, 41, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('6e0db5d4-5785-412a-beb0-27d14bba4d63', 'buy', '2025-02-10 22:00:00+00', 544, 89, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('bf9b12ec-d8f7-44e0-92ce-180945bbb283', 'buy', '2024-11-06 22:00:00+00', 545, 93, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('615ef2d3-6e9d-42cb-a296-308ad4ad10d6', 'sell', '2025-05-16 21:00:00+00', 546, 34, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('91dc0cce-42a5-4d25-8615-469c1b922b23', 'buy', '2025-02-05 22:00:00+00', 547, 60, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('7d92919e-a5c1-49da-aeb7-49541fa9f7c1', 'sell', '2025-06-07 21:00:00+00', 548, 24, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('c16dd882-cc82-450b-8510-5c39e1fe03b9', 'sell', '2025-01-05 22:00:00+00', 549, 14, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('ceec465b-b926-49e3-a0bc-af40002647fd', 'buy', '2024-12-11 22:00:00+00', 550, 76, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('722d9116-23ae-4126-9613-401fd4a54681', 'buy', '2025-03-05 22:00:00+00', 551, 27, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('66eeb887-02b7-4d97-96d2-5368fd497e9c', 'buy', '2024-11-27 22:00:00+00', 552, 50, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('8d2640d6-e613-4d7e-878a-f0168f16c980', 'buy', '2024-11-02 22:00:00+00', 553, 35, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('852f6f32-7832-4d48-b4f1-5a981278400e', 'sell', '2024-10-19 21:00:00+00', 554, 54, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('d8a86d3c-71b3-48f0-aa59-52a3416ac060', 'sell', '2024-09-22 21:00:00+00', 555, 49, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('c8812944-a31a-4c5c-b93c-92b6a7b04668', 'sell', '2025-07-29 21:00:00+00', 556, 100, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('20d62f9f-c1c2-451c-b413-aa0f6e81f1e5', 'sell', '2025-05-01 21:00:00+00', 557, 97, 0, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('778bab5b-238d-4851-85f9-15474f7e1503', 'buy', '2024-08-21 21:00:00+00', 558, 53, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('5d280800-c6bb-451b-b756-ecd14c3fa018', 'sell', '2025-02-17 22:00:00+00', 559, 59, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('2787d17e-9c56-42de-b004-00a2f77a0645', 'buy', '2025-02-21 22:00:00+00', 560, 27, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('85153795-3c89-4a48-86ae-084476535c0a', 'buy', '2024-09-13 21:00:00+00', 561, 57, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('3d151833-47dd-447e-bd6a-e671ee143033', 'buy', '2025-06-01 21:00:00+00', 562, 88, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('373e7d4c-5dd3-4661-8d16-d80483412341', 'sell', '2024-12-30 22:00:00+00', 563, 52, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('ce3d12b0-f3ba-4bed-9366-70f665b0f14c', 'buy', '2025-06-25 21:00:00+00', 564, 67, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('b7d599cf-797f-4550-b00f-5a93963deff9', 'sell', '2025-06-16 21:00:00+00', 565, 94, 1, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('93c3b9ca-9776-4712-a306-8ab7fdca7009', 'sell', '2025-01-26 22:00:00+00', 566, 57, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('9b1ec70d-3e47-498e-87cf-a4b2f6b5f350', 'buy', '2024-09-07 21:00:00+00', 567, 31, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('b478d727-14b1-4b77-994b-0fbd6dde5607', 'buy', '2025-01-01 22:00:00+00', 568, 99, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('c253c18d-e6b9-443a-be90-8a458f32157c', 'buy', '2025-03-22 22:00:00+00', 569, 35, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('5009f766-b98d-4df5-91b8-dcca3f8d534c', 'buy', '2025-01-22 22:00:00+00', 570, 73, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('59783111-3845-4ab3-ad51-924cb4326cdc', 'sell', '2024-09-17 21:00:00+00', 571, 63, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('dedbc810-8f98-4cc8-96ff-a3576ebb5527', 'buy', '2025-02-05 22:00:00+00', 572, 50, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('67fa8ef7-cb43-49e6-b7fc-aacb4b01a4c5', 'buy', '2024-10-25 21:00:00+00', 573, 73, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('f2ffe06f-5243-4a6d-bd23-ef97890eb683', 'buy', '2024-11-07 22:00:00+00', 574, 60, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('cd12e0e8-cf30-4083-838b-608cbc0e34f3', 'buy', '2025-06-03 21:00:00+00', 575, 87, 2, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('b66b431d-9041-4893-95cb-2c13497d0173', 'buy', '2025-07-02 21:00:00+00', 576, 33, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('5fe4dc63-ba50-474f-b5e8-4ef43c415fc9', 'sell', '2024-12-19 22:00:00+00', 577, 27, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('e122be7b-5e05-475e-a2d0-3f948d0ac366', 'buy', '2024-10-04 21:00:00+00', 578, 84, 2, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('e360603f-5662-4270-a6ea-d856ab30b6e0', 'buy', '2025-07-17 21:00:00+00', 579, 95, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('7e8e03f7-dd72-4b27-bc06-3e621522c0d1', 'sell', '2025-04-23 21:00:00+00', 580, 65, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('18a8f322-e94c-4a59-880c-04e0dd4c866c', 'buy', '2024-08-31 21:00:00+00', 581, 95, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('0e9a355a-14dc-4c8d-b8e2-6e5f2d7bc389', 'buy', '2024-09-03 21:00:00+00', 582, 78, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('46becb9d-d128-4d47-bef7-090c18fa92e5', 'buy', '2025-05-29 21:00:00+00', 583, 38, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('1f692dfa-77c1-4a1b-985e-76bfbec057ac', 'buy', '2024-10-29 22:00:00+00', 584, 44, 1, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('77439edc-371d-4a79-b695-eaa9fb4aeb19', 'buy', '2024-09-26 21:00:00+00', 585, 26, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('68f5dd05-ca8f-444d-8d96-0eea7177a493', 'sell', '2025-02-07 22:00:00+00', 586, 59, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('5197bd03-3073-467c-aa6c-68bcaa582513', 'buy', '2024-09-30 21:00:00+00', 587, 12, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('aae07c4c-895b-4787-8d55-e48ece7f1d4e', 'buy', '2025-03-31 21:00:00+00', 588, 33, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('25dcc67b-6fbb-4575-abc9-9023cf7c396a', 'buy', '2025-03-28 22:00:00+00', 589, 32, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('57bcd3e9-c69f-40d7-8099-2f527f75b30e', 'buy', '2025-06-04 21:00:00+00', 590, 59, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('3abd55ce-81f3-4593-9d50-2196bc8ede81', 'buy', '2024-11-01 22:00:00+00', 591, 8, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('585ee006-8c49-44ba-a82a-885cd2f445ef', 'buy', '2025-03-18 22:00:00+00', 592, 20, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('91ced1f7-e517-4d6f-b780-850c2de733f4', 'sell', '2025-03-22 22:00:00+00', 593, 80, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('b02de0d8-bc1b-4a05-a53b-4f52bed502b2', 'sell', '2025-07-22 21:00:00+00', 594, 91, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('5e61f27b-b907-4279-bb2d-57f9ca2176c9', 'buy', '2024-09-13 21:00:00+00', 595, 84, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('8852ac13-6eaf-4230-bda6-42bf872eeb7f', 'buy', '2024-09-06 21:00:00+00', 596, 55, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('8d0d33be-b193-47cd-a85b-d58e671b25a4', 'buy', '2024-09-07 21:00:00+00', 597, 31, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('d15d39db-49d2-481c-9a42-97620f4d4053', 'buy', '2024-09-30 21:00:00+00', 598, 84, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('265a5b51-8cf8-473f-9a76-5f0ad9e6ccac', 'buy', '2025-08-16 21:00:00+00', 599, 62, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('286106b0-179f-442a-b5fd-3ffc6a53d4ab', 'sell', '2024-08-31 21:00:00+00', 600, 16, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('cbbb46ff-6773-4cd7-a657-2fad362a9a84', 'buy', '2025-07-18 21:00:00+00', 601, 52, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('0c0c89aa-9fbc-47bc-87f5-f1045ca6e7b0', 'sell', '2025-08-02 21:00:00+00', 602, 100, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('54ebb8f9-3ca2-46c3-9c2d-e237e2776d54', 'buy', '2025-04-28 21:00:00+00', 603, 50, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('1a6327cc-656c-4279-8ad4-1bd8f83854d1', 'buy', '2025-07-05 21:00:00+00', 604, 100, 1, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('26bc84b9-5908-4083-b38d-129f9ca5a0d7', 'buy', '2024-12-14 22:00:00+00', 605, 98, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('7645e450-edc6-4f80-95d7-db2c99aaa126', 'sell', '2025-02-15 22:00:00+00', 606, 17, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('3cc61f6e-7775-406d-9b00-4fe15c105988', 'sell', '2025-06-02 21:00:00+00', 607, 90, 1, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('a18c5759-f494-4586-bcd7-a418df3ca752', 'buy', '2024-11-06 22:00:00+00', 608, 13, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('5739c38a-7485-42a9-9df0-4023be399706', 'sell', '2024-11-30 22:00:00+00', 609, 37, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('7ed7be0a-99d4-4506-bbd7-b06fdbc9cb82', 'sell', '2024-08-18 21:00:00+00', 610, 16, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('a00b72d7-db0b-40ec-9d8f-ba2a05a2f0a7', 'sell', '2025-04-13 21:00:00+00', 611, 68, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('e9a1ed32-f285-4e28-b7e7-8fbe7d87980c', 'sell', '2024-11-13 22:00:00+00', 612, 6, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('c9cdbf5e-4050-417a-a718-a35674924af8', 'sell', '2025-07-09 21:00:00+00', 613, 48, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('da100f24-74d5-4f5c-bbf9-6c77e0219317', 'sell', '2025-05-03 21:00:00+00', 614, 70, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('a58d82c7-0499-4960-a67e-b14c536d9e30', 'sell', '2024-12-04 22:00:00+00', 615, 96, 2, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('4e8c23a1-872a-4113-8b5a-5283ee447019', 'sell', '2024-12-28 22:00:00+00', 616, 24, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('4d0220d1-a288-4737-afd8-38c4ff3e52a0', 'buy', '2025-06-08 21:00:00+00', 617, 55, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('57202f61-12b9-4303-bdf9-50d0c01bd22f', 'buy', '2025-06-22 21:00:00+00', 618, 43, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('86a57fa0-7be4-403a-9e22-814ae8da09a8', 'buy', '2025-05-21 21:00:00+00', 619, 2, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('c968432b-45e5-4847-bf80-791fd38f7399', 'sell', '2025-01-21 22:00:00+00', 620, 28, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('8888d0de-4712-4a74-b01f-7e8ef4dbd244', 'buy', '2025-07-18 21:00:00+00', 621, 44, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('e1f090a9-286e-46af-9ed4-32d62a8f4fb4', 'buy', '2025-05-09 21:00:00+00', 622, 32, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('505f0338-ca53-4bda-bee4-b44c99a77aa3', 'buy', '2025-04-21 21:00:00+00', 623, 19, 1, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('37d24e38-4e14-41dc-b006-48f053d4284a', 'sell', '2025-07-03 21:00:00+00', 624, 62, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('f27feb8f-4393-4421-a0d7-9368d6aca31f', 'buy', '2025-05-09 21:00:00+00', 625, 13, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('11794942-2490-4416-9188-5f9f5afad5cb', 'sell', '2024-12-13 22:00:00+00', 626, 59, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('2708dcee-2acc-4fbd-b76c-72bbdd822ec0', 'buy', '2024-12-06 22:00:00+00', 627, 62, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('09ce6803-04fa-43f4-a462-e5413a226023', 'sell', '2025-01-10 22:00:00+00', 628, 68, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('20313e03-c179-4ee9-bf38-b1a7a675e1b6', 'buy', '2025-07-10 21:00:00+00', 629, 58, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('7e8bfc43-4358-4146-b747-f085ac5294dc', 'sell', '2025-06-05 21:00:00+00', 630, 83, 2, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('51268623-8132-4a60-be72-1f77a9743727', 'sell', '2025-08-10 21:00:00+00', 631, 55, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('ddbb4361-6c8a-4f90-8d8d-e66c1f62eef1', 'buy', '2024-09-01 21:00:00+00', 632, 78, 0, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('53b10287-d686-4eb2-bbbd-1b715d01b6b9', 'sell', '2025-02-19 22:00:00+00', 633, 2, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('1ec9ec68-aa51-42bc-b8c5-fe04e8cf6c1a', 'buy', '2025-01-01 22:00:00+00', 634, 93, 1, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('710ec269-51c2-4da2-8db1-91cc5b33fef3', 'buy', '2025-07-28 21:00:00+00', 635, 57, 0, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('e1f41849-1087-445d-9815-905e3d8e9ab2', 'sell', '2024-09-25 21:00:00+00', 636, 62, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('74f6839a-bcd6-4fad-8746-a0b936a06c8d', 'sell', '2025-06-16 21:00:00+00', 637, 100, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('7747e3cb-f9bf-49f6-85a9-4469faa71b89', 'sell', '2025-01-26 22:00:00+00', 638, 46, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('8231d769-ba19-47d8-ab30-ece8c3adfe8f', 'buy', '2025-06-12 21:00:00+00', 639, 86, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('df3fab30-1d43-491b-9427-285fd89c9bf8', 'buy', '2025-03-01 22:00:00+00', 640, 50, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('003b1974-ed06-4dae-87bb-6bd1d94cb933', 'sell', '2024-11-23 22:00:00+00', 641, 39, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('e0d122f2-6bac-4e10-80d0-673416787bda', 'buy', '2025-01-22 22:00:00+00', 642, 29, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('4cab2bb6-4669-4d25-9c64-10af74efa95a', 'buy', '2025-03-29 22:00:00+00', 643, 68, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('cd247a04-5c14-4144-a943-9aa80651638a', 'sell', '2024-09-01 21:00:00+00', 644, 92, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('9691b1a0-dfb2-4b18-a990-093c2a288c06', 'buy', '2024-10-21 21:00:00+00', 645, 55, 0, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('0d766da3-4c09-45be-8e7c-a1540bb28e47', 'sell', '2025-01-15 22:00:00+00', 646, 88, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('e6005f98-51d9-430f-8e49-1ad2a23e4697', 'sell', '2025-05-13 21:00:00+00', 647, 63, 0, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('f1ed54f4-2532-409d-bb06-4767be5362f2', 'buy', '2024-11-25 22:00:00+00', 648, 74, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('b7a6436b-3ef2-40d6-84a7-0857d9d35fa4', 'sell', '2025-03-17 22:00:00+00', 649, 7, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('f7f5df95-37ba-41c6-80c1-12651f62adb4', 'sell', '2025-05-24 21:00:00+00', 650, 53, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('96c2dba0-e0ea-41dd-8129-f6aada8af492', 'sell', '2025-01-18 22:00:00+00', 651, 39, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('6b7a9b7c-762b-4966-a2ae-79c4f86fec02', 'sell', '2025-01-13 22:00:00+00', 652, 39, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('bbb01d50-4dba-435d-9f52-618a8f2c24c5', 'buy', '2025-01-10 22:00:00+00', 653, 28, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('ef790ee0-7791-4519-8ade-6556fa21c2a0', 'sell', '2024-08-27 21:00:00+00', 654, 16, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('df9357ac-197c-40b6-ae54-68a1043478e7', 'sell', '2025-04-05 21:00:00+00', 655, 45, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('3d2ac717-c63b-4996-b029-094a289ca32e', 'buy', '2025-01-24 22:00:00+00', 656, 77, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('a0ea8ffb-d058-4e7a-ac8c-314f996e3fae', 'sell', '2025-03-20 22:00:00+00', 657, 67, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('a280f1cf-5019-4fa7-8362-7a0ef64a9f53', 'buy', '2025-03-30 21:00:00+00', 658, 79, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('fb8e87e5-511c-4fbd-b066-030c40d24346', 'buy', '2024-12-12 22:00:00+00', 659, 8, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('18f85252-0785-4ed5-a192-745f86453dfc', 'buy', '2025-08-03 21:00:00+00', 660, 30, 1, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('7e48a589-b22d-4a44-9545-fc5ff68eae90', 'sell', '2024-11-08 22:00:00+00', 661, 47, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('5a89d493-7b8b-4934-b616-625ce2fd95ae', 'sell', '2025-01-10 22:00:00+00', 662, 48, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('a8a86a16-887d-467e-831a-6dcb1460c942', 'sell', '2024-09-18 21:00:00+00', 663, 28, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('36f1e8d1-03a9-4d1c-87cd-82c98238b444', 'buy', '2024-10-05 21:00:00+00', 664, 23, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('970b2418-6449-4e6a-9e1b-9cc45f7bdc25', 'buy', '2025-03-15 22:00:00+00', 665, 23, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('cccd204b-e15e-4579-9bb6-376f70bdc004', 'sell', '2025-02-27 22:00:00+00', 666, 25, 1, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('2a2c2fb1-bfd8-4c5a-b835-f47cc5d2b347', 'sell', '2025-03-07 22:00:00+00', 667, 67, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('8dcaea16-b9f1-4231-bb2b-01c6a6997f8c', 'sell', '2025-07-20 21:00:00+00', 668, 17, 1, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('780bc68c-989e-49aa-bb92-1ca9d063193e', 'buy', '2025-02-01 22:00:00+00', 669, 67, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('a5af41b6-5239-4b71-9f88-168910c84752', 'sell', '2025-07-21 21:00:00+00', 670, 32, 1, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('8dcd978f-c6fc-4813-b48e-8aea7173c585', 'sell', '2025-07-17 21:00:00+00', 671, 49, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('e5ffd3f2-dc36-4b92-ae05-7a8e4039c6e7', 'buy', '2025-08-11 21:00:00+00', 672, 46, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('fe4b5d2e-8ed9-462e-bf2c-841fcc130e86', 'buy', '2025-01-03 22:00:00+00', 673, 21, 0, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('4e7105d8-1a8a-4696-8794-0c4fa506480b', 'sell', '2024-11-23 22:00:00+00', 674, 61, 1, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('59a940cd-0158-4c79-8c77-d049abed3fe6', 'buy', '2025-04-01 21:00:00+00', 675, 88, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('ea067db3-462a-4e04-b7cc-72b4ed8c4cbb', 'buy', '2025-02-17 22:00:00+00', 676, 61, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('65800c7d-18d6-4a7b-ac3b-4bd014dae26b', 'sell', '2025-02-03 22:00:00+00', 677, 51, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('c3bd6ac1-f1f1-4f80-9778-c238ee699b9b', 'sell', '2024-10-16 21:00:00+00', 678, 50, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('f2e608f7-b1ec-4805-bf7a-5d65710c556d', 'buy', '2025-06-20 21:00:00+00', 679, 85, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('faed73b2-7db4-4b98-ab60-ce252f7d341f', 'buy', '2025-03-15 22:00:00+00', 680, 23, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('77be5cd2-7b06-4811-af04-36b7a1210b45', 'buy', '2024-09-12 21:00:00+00', 681, 50, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('bf35d526-7496-44a7-9559-c8ddadbf1337', 'sell', '2025-05-20 21:00:00+00', 682, 57, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('36049cf2-e594-4fa7-bbd3-90186763bd5f', 'buy', '2024-12-19 22:00:00+00', 683, 78, 1, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('09e79bf0-782a-4c8f-adda-6dae27e217da', 'sell', '2024-11-20 22:00:00+00', 684, 91, 1, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('c324137e-6efb-46a5-bd8b-275b3ab74d9c', 'sell', '2024-12-09 22:00:00+00', 685, 77, 0, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('7970faa1-efdd-4184-808b-86e6b2b4dbfd', 'sell', '2025-05-12 21:00:00+00', 686, 18, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('dd4ed34c-d93f-4794-9693-4a595b578f03', 'sell', '2025-03-15 22:00:00+00', 687, 46, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('8c944f47-886e-4ba3-ae74-3c073f935acf', 'sell', '2025-04-22 21:00:00+00', 688, 96, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('d9d514ea-d206-44d3-9a8e-fb2a46757e8c', 'sell', '2025-06-03 21:00:00+00', 689, 25, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('afb867d4-5992-48e8-8e43-474ebd094fe0', 'sell', '2025-02-06 22:00:00+00', 690, 74, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('3b5085e6-fb44-4fc3-b328-885a93a1a5e2', 'buy', '2025-02-15 22:00:00+00', 691, 80, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('84d00802-f1e6-4417-8f83-06754564da21', 'buy', '2025-03-25 22:00:00+00', 692, 12, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('8f23b846-09ba-438a-b9c8-093176983900', 'buy', '2025-01-26 22:00:00+00', 693, 47, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('d95fb68f-dd8e-4168-b39e-a43002e378a3', 'sell', '2025-08-11 21:00:00+00', 694, 94, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('2210a7f7-5c46-41bb-bc22-bd8fa68278c7', 'sell', '2025-07-15 21:00:00+00', 695, 82, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('86ce561e-5dbc-4306-a47e-a77fa12255ad', 'buy', '2025-04-19 21:00:00+00', 696, 48, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('3af6b1c2-5988-4bcc-be84-f098e74358e8', 'buy', '2024-11-21 22:00:00+00', 697, 30, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('563e29c5-ac46-4a63-baf0-7e90eff055e1', 'sell', '2025-04-04 21:00:00+00', 698, 25, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('b3570b4b-c892-48ec-ab6a-6ae914eb1b6a', 'sell', '2024-12-26 22:00:00+00', 699, 69, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('2ac2e63a-4995-4be2-80b7-663b64147af3', 'sell', '2025-05-18 21:00:00+00', 700, 89, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('e3398f81-9bb9-4454-b889-197655fae562', 'sell', '2025-07-05 21:00:00+00', 701, 88, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('ca570d23-9489-46e6-a54a-4983068a3a38', 'buy', '2024-12-27 22:00:00+00', 702, 61, 0, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('27b0a37a-74f1-4a45-a381-883bbe8a6eed', 'buy', '2024-11-15 22:00:00+00', 703, 54, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('7dc29024-3780-47f9-928f-e2853a5e86ca', 'sell', '2025-02-14 22:00:00+00', 704, 31, 0, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('4eae3059-e046-4a8b-b376-3f3e9d3191ee', 'sell', '2024-12-10 22:00:00+00', 705, 3, 1, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('e65c0a33-586b-4ec0-a29f-99cda3826d1a', 'sell', '2024-10-08 21:00:00+00', 706, 79, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('2e59a8cb-2f50-46ae-875b-7ef21365858d', 'sell', '2024-09-11 21:00:00+00', 707, 10, 1, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('209a05ca-01e9-4d6a-ad9e-6638bb08ed8f', 'buy', '2024-12-17 22:00:00+00', 708, 52, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('2bb484cb-8db5-4aea-a319-8da8b34d645c', 'buy', '2025-03-14 22:00:00+00', 709, 6, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('670e36aa-bdd0-432d-8be9-fe57ea3768af', 'buy', '2024-10-30 22:00:00+00', 710, 28, 2, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('10ef998b-1874-4f4a-ab7f-3c62b00d93b4', 'buy', '2025-07-12 21:00:00+00', 711, 77, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('791b9f4a-da22-4e2a-80e2-2edd3ca00b13', 'sell', '2024-10-18 21:00:00+00', 712, 62, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('8c01bffd-5074-48c1-8c7e-b819daca4dd3', 'buy', '2025-05-25 21:00:00+00', 713, 63, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('489d7d4e-b473-4c64-a075-f6eb580d3554', 'sell', '2024-09-11 21:00:00+00', 714, 84, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('c860b607-cc2b-4333-ad5a-71c514215e68', 'sell', '2025-03-21 22:00:00+00', 715, 57, 0, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('5bfbb57e-07e4-42ac-9eb4-3897cd74c83c', 'buy', '2025-02-13 22:00:00+00', 716, 96, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('1b116828-bbc0-4b14-9904-cb47c9b565f5', 'buy', '2025-06-05 21:00:00+00', 717, 9, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('11b89ad4-52aa-4a68-bac8-da1819d7849b', 'sell', '2025-07-18 21:00:00+00', 718, 77, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('f89b0e50-4b87-4903-9aa5-09109b8092f3', 'buy', '2024-12-27 22:00:00+00', 719, 20, 1, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('09791873-5978-4243-abea-5635ab25c136', 'sell', '2024-09-29 21:00:00+00', 720, 73, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('5ea20452-b86d-477c-a154-e69b19fe6b90', 'sell', '2025-05-03 21:00:00+00', 721, 5, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('33bc144b-1b45-4b8f-b656-52d5abcb5674', 'buy', '2025-07-06 21:00:00+00', 722, 70, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('37029307-1959-4bd5-8b1c-84ba2836128f', 'buy', '2024-12-11 22:00:00+00', 723, 5, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('2b25f5db-9faa-4372-88c6-3f26373937e7', 'buy', '2024-09-13 21:00:00+00', 724, 66, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('e763d483-6a45-4859-955d-51dafc20e8e4', 'buy', '2024-10-20 21:00:00+00', 725, 47, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('779f896e-b60a-436d-b252-340071c3467c', 'sell', '2025-06-15 21:00:00+00', 726, 61, 0, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('98be688d-5224-4fc2-a9fb-13b13ee43421', 'buy', '2024-10-17 21:00:00+00', 727, 11, 2, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('888d6936-5d49-411d-b4b5-e12bbe413781', 'sell', '2025-03-17 22:00:00+00', 728, 47, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('6b480eb7-46d3-45e1-bd5c-1d8ba670d5f2', 'buy', '2025-07-19 21:00:00+00', 729, 57, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('7b088314-00ad-4c9a-a95f-db5dcdf61292', 'buy', '2025-01-05 22:00:00+00', 730, 50, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('53910567-e661-4e77-9527-23ab1917d226', 'sell', '2025-04-23 21:00:00+00', 731, 97, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('13b5d082-f906-4ff0-9ef1-3b790f6e3c56', 'buy', '2025-02-23 22:00:00+00', 732, 96, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('943f0c87-6b67-462d-91d4-5c96d0dc3e3b', 'buy', '2025-07-19 21:00:00+00', 733, 59, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('b3eae2d6-687e-4ed6-8ff8-0be520dc3578', 'buy', '2024-12-24 22:00:00+00', 734, 42, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('07238a07-a263-4ffd-b279-2c1566b8a291', 'sell', '2025-05-01 21:00:00+00', 735, 66, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('09b9172c-5d3b-4d0d-a5b3-c61505a04447', 'sell', '2024-08-24 21:00:00+00', 736, 87, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('f38f54cb-9d32-4d89-841a-c6f17a67f22f', 'sell', '2025-06-01 21:00:00+00', 737, 43, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('7db15cb5-30e8-4b1d-a119-24b1055eadcb', 'buy', '2024-08-26 21:00:00+00', 738, 56, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('46094718-36dc-462d-8250-cdfbce8dc431', 'sell', '2024-11-06 22:00:00+00', 739, 18, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('48641939-c662-4ac8-b34b-e32e07f92e6c', 'sell', '2025-05-29 21:00:00+00', 740, 17, 2, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('5f752653-b162-4b39-a0b3-b4a13af1e078', 'buy', '2024-08-27 21:00:00+00', 741, 9, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('18977e84-d6ba-4f8e-b0a1-c597c7eba5d2', 'buy', '2024-10-05 21:00:00+00', 742, 91, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('22818e81-b4e8-4ed1-9f08-aae19a5c3dd4', 'sell', '2024-09-15 21:00:00+00', 743, 99, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('4970a55d-b062-46be-a8b6-01687000480a', 'sell', '2025-05-27 21:00:00+00', 744, 55, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('e382f56f-57e4-4b0d-9533-f499d8469bc4', 'buy', '2025-07-21 21:00:00+00', 745, 81, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('48be1439-e311-4b5b-b06d-c48ff58d3fe3', 'buy', '2025-03-21 22:00:00+00', 746, 20, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('150de1d9-cbfe-4bbc-a3c9-31ebc2439f64', 'sell', '2025-08-06 21:00:00+00', 747, 37, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('fd841050-d8be-4ad0-968b-b201de3ac805', 'buy', '2024-12-28 22:00:00+00', 748, 88, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('114f8779-497e-48ae-a43b-33de62395eca', 'buy', '2025-07-21 21:00:00+00', 749, 85, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('5b031154-1795-40d2-9171-ec8a270a922e', 'buy', '2024-08-23 21:00:00+00', 750, 40, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('bf0ac16b-9edf-4902-aecb-ba4f8c6bc699', 'sell', '2025-01-23 22:00:00+00', 751, 9, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('5b1c10a6-7884-46a5-b766-b65c04f1f8fa', 'sell', '2025-07-05 21:00:00+00', 752, 22, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('15b5d799-d90e-4df9-9e37-e2a011c2ef1f', 'sell', '2025-05-25 21:00:00+00', 753, 57, 2, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('35ea4d17-cf63-4d62-8286-8bc510d95dbc', 'sell', '2025-06-27 21:00:00+00', 754, 43, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('ef0bb6be-505e-4a8c-9133-7a76e1193334', 'buy', '2024-10-05 21:00:00+00', 755, 16, 2, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('2bf97943-4851-4ebc-aaa6-fabdb46a7c2e', 'sell', '2024-12-31 22:00:00+00', 756, 16, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('aa090568-0234-4e52-a34f-1e7d2951f8ec', 'sell', '2025-06-27 21:00:00+00', 757, 26, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('220ca959-3833-4b60-82bd-200796261ebd', 'buy', '2025-05-02 21:00:00+00', 758, 29, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('40240e91-84b0-4b30-b6e7-60bf64a193ba', 'sell', '2024-09-12 21:00:00+00', 759, 96, 1, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('8ba3231f-fdf1-4a6d-aefd-4241bced9f79', 'sell', '2025-03-17 22:00:00+00', 760, 56, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('ab489bd4-fbe9-4417-9252-068f79ddcd64', 'sell', '2025-01-05 22:00:00+00', 761, 89, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('6966e29c-1b70-4447-ae1a-8bb713ea0a88', 'buy', '2025-01-09 22:00:00+00', 762, 80, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('86b2ad4f-b1b9-4937-ab2f-ea9fcc310d14', 'sell', '2025-02-11 22:00:00+00', 763, 40, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('3e0e013a-b7c3-467f-a8de-34d30026dec1', 'sell', '2024-11-09 22:00:00+00', 764, 80, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('feaa327a-b9ff-4df2-9013-b168e31b5c5d', 'buy', '2024-12-30 22:00:00+00', 765, 90, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('9b8dfde9-96c2-46b0-ae19-4b71f9fc5698', 'sell', '2024-11-26 22:00:00+00', 766, 6, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('85970d3c-88b2-422c-9625-5537d9953796', 'buy', '2024-10-13 21:00:00+00', 767, 12, 2, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('cd5cea59-ac95-4755-9a21-6ae1d3c1b5e7', 'sell', '2024-09-02 21:00:00+00', 768, 39, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('be99d34e-03bf-4f57-8742-c63dcbd1a7ba', 'sell', '2024-12-27 22:00:00+00', 769, 80, 1, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('437d4936-73de-4bd1-9761-3523af7991b9', 'buy', '2025-05-01 21:00:00+00', 770, 38, 0, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('ba951a6e-e945-499d-8308-e838def8c7c5', 'sell', '2024-11-12 22:00:00+00', 771, 29, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('65f7baa9-f444-445e-b279-be4ab06e8051', 'buy', '2025-04-27 21:00:00+00', 772, 81, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('554c26c8-1f2e-4425-9da5-c8c8f8d57568', 'sell', '2025-07-14 21:00:00+00', 773, 77, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('01a8d4ad-3f37-4d60-9200-efc4df8cec9c', 'buy', '2025-07-20 21:00:00+00', 774, 15, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('3a26ebb7-2671-43c6-a35d-2c349f9c37f7', 'buy', '2024-12-30 22:00:00+00', 775, 21, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('cdf8806d-d82b-4653-8cac-e45bf52cfa57', 'buy', '2024-11-27 22:00:00+00', 776, 32, 0, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('51075d6b-2478-4ae7-b211-2c011bb9bafb', 'buy', '2025-07-15 21:00:00+00', 777, 57, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('b2286d55-3fac-4f90-be05-6f103158d762', 'buy', '2025-04-29 21:00:00+00', 778, 53, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('3f6a3128-7cf8-4818-8579-833bb42763c1', 'buy', '2025-03-16 22:00:00+00', 779, 18, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('3e5a94ac-fb40-4161-bfe0-dfd3ba4cd284', 'sell', '2025-02-21 22:00:00+00', 780, 96, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('8cce25f5-53f5-4200-a497-1e1622e8fc66', 'buy', '2024-10-01 21:00:00+00', 781, 41, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('c0857b0a-e15c-404f-b6a2-f8206a17bb0d', 'sell', '2025-03-31 21:00:00+00', 782, 81, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('7e10a793-465f-41f7-bf01-315053efcaa3', 'buy', '2025-08-01 21:00:00+00', 783, 14, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('0a293be9-c68c-4ba3-8bd0-704cb25d3ee4', 'sell', '2024-12-06 22:00:00+00', 784, 2, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('3d10afde-ae56-463f-8d43-6cbc67fd7afa', 'sell', '2025-01-08 22:00:00+00', 785, 71, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('31d8b219-bba8-48d5-b3ea-370c23b2a443', 'buy', '2024-09-27 21:00:00+00', 786, 56, 0, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('3004e27d-504c-4ad5-8256-e1d631264197', 'buy', '2024-11-10 22:00:00+00', 787, 61, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('0fe13f6f-5ba1-40ba-afa9-e7b303c80810', 'sell', '2024-10-22 21:00:00+00', 788, 15, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('bdb45565-4b91-4ce9-8ec2-3303ace0cea7', 'buy', '2025-05-02 21:00:00+00', 789, 100, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('5734e4f0-aa9d-41b5-a0d3-ce9d7a64a164', 'buy', '2024-12-07 22:00:00+00', 790, 66, 0, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('ad59c5a8-88a2-42aa-b54e-ba61c923fe14', 'buy', '2024-12-29 22:00:00+00', 791, 2, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('e64af980-581e-4981-b86c-970ff0971f5f', 'buy', '2025-02-26 22:00:00+00', 792, 67, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('cbe22ccf-3b8a-43f7-bd3c-89b403089365', 'buy', '2024-10-10 21:00:00+00', 793, 62, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('4804d34a-7b6a-4e4b-8fa1-e2f72c6046f9', 'buy', '2025-04-03 21:00:00+00', 794, 100, 2, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('5ee1a86b-9dbd-4b32-869e-bd690a214e22', 'sell', '2024-09-25 21:00:00+00', 795, 39, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('6d85f65f-f6c7-4d28-a8c1-0c83df3f4037', 'sell', '2025-03-26 22:00:00+00', 796, 28, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('a0ce33ed-fb03-425e-9b02-7553ddbc2d79', 'buy', '2025-01-26 22:00:00+00', 797, 84, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('e2d5be01-6179-4602-9754-a7d35f3bcedf', 'buy', '2025-05-22 21:00:00+00', 798, 43, 1, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('ab29eb6e-8653-440c-9573-caeb5e1b4fdd', 'sell', '2025-07-25 21:00:00+00', 799, 38, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('67046436-216e-46d3-8410-104fe78b9b3e', 'sell', '2025-01-04 22:00:00+00', 800, 85, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('5f29136e-58ce-41a7-9ed9-ce46efaaad5f', 'sell', '2025-05-10 21:00:00+00', 801, 94, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('182e24d2-ae45-469a-ab04-fecfb51aab5f', 'sell', '2024-10-14 21:00:00+00', 802, 36, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('e1c6ed15-4f58-4711-846c-c78faf9228f1', 'sell', '2025-07-30 21:00:00+00', 803, 68, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('c4595d06-dca0-42a9-8a29-7087a5b1bd45', 'sell', '2025-02-18 22:00:00+00', 804, 61, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('daecb4dd-8cf5-4175-a619-763b75ad3a70', 'buy', '2024-08-27 21:00:00+00', 805, 73, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('6478d726-b5aa-412e-93fd-1f1d8ea7ad77', 'buy', '2024-11-09 22:00:00+00', 806, 49, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('0bcad56c-589f-4276-8d4b-6f8d318f1924', 'sell', '2025-05-18 21:00:00+00', 807, 57, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('685112d5-b042-4fb3-91ad-1b0b47d0056b', 'buy', '2025-02-23 22:00:00+00', 808, 35, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('fa8b53ca-14cc-440b-8c7c-31625df6ba61', 'sell', '2025-04-19 21:00:00+00', 809, 43, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('869752f7-9d24-43cb-93c0-1b64db9d872b', 'sell', '2025-04-19 21:00:00+00', 810, 63, 0, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('5cbf3a93-72d7-4135-8e6f-1cd8ec72d1fb', 'sell', '2025-01-17 22:00:00+00', 811, 11, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('836abbd8-8400-47a8-baad-0ddc27cf5d48', 'buy', '2025-03-17 22:00:00+00', 812, 43, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('395c72c0-4121-4878-8fff-b9516473cbfa', 'sell', '2025-06-22 21:00:00+00', 813, 8, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('a350642d-74b1-41d9-b6d5-0f68e8f7f3b8', 'buy', '2024-11-27 22:00:00+00', 814, 23, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('67b587dd-3995-405b-a3d8-22ddded347ab', 'buy', '2025-07-28 21:00:00+00', 815, 31, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('6317dcb7-6e1b-485d-bfc2-2b616c1e0dfb', 'sell', '2024-10-17 21:00:00+00', 816, 96, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('a947da30-9b26-4613-9707-157b9ff751dd', 'buy', '2024-08-27 21:00:00+00', 817, 47, 0, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('28729e1d-b2dc-4264-b7c8-4bb8eeb4b0fc', 'buy', '2025-07-26 21:00:00+00', 818, 42, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('1a7fac74-9f1d-4b0b-a8ea-2d3edd6a0f2e', 'buy', '2025-05-23 21:00:00+00', 819, 49, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('951f8e2e-7318-453a-9f5e-9d999636f6ba', 'sell', '2025-05-24 21:00:00+00', 820, 51, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('21903330-0819-4e46-9307-27d30d3a9ee3', 'sell', '2024-10-12 21:00:00+00', 821, 47, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('3f3058f4-cc95-4e47-9e2c-fe9f1943eeae', 'sell', '2024-11-16 22:00:00+00', 822, 76, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('2f4b0d65-5dfd-43b4-b0ea-b7c108df7ddc', 'sell', '2024-09-09 21:00:00+00', 823, 72, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('59d93b2a-9dca-4b21-b47b-f78f454027cc', 'buy', '2025-02-24 22:00:00+00', 824, 29, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('3dddf18f-eb1d-43d1-a2b1-799fc50fa6c9', 'sell', '2025-01-10 22:00:00+00', 825, 35, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('701725d9-3080-4b7d-ba25-e00bb02918e1', 'buy', '2024-09-10 21:00:00+00', 826, 76, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('15270b65-90ca-46c2-b53e-c657ebf0b9f4', 'buy', '2024-09-19 21:00:00+00', 827, 11, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('7f23ac4d-7f9f-4c6b-800d-ed35e7dc70f3', 'sell', '2024-11-06 22:00:00+00', 828, 97, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('0b849301-3f39-45df-959f-4a6df6857cc9', 'buy', '2025-02-01 22:00:00+00', 829, 45, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('d3f9e2d7-3efb-45b6-9da3-7c87c775fdf7', 'sell', '2024-11-21 22:00:00+00', 830, 97, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('268ec910-ab11-4122-9ea5-e4b1d4753065', 'sell', '2025-06-12 21:00:00+00', 831, 57, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('fd554b4a-eb1b-4d02-ae1e-0b7a59150d2a', 'sell', '2025-03-27 22:00:00+00', 832, 51, 2, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('787313dd-49af-40b4-ae9d-3c3faa5f41d8', 'sell', '2025-05-24 21:00:00+00', 833, 87, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('3c1b2a10-694d-461a-83db-1a42829beec0', 'sell', '2024-10-20 21:00:00+00', 834, 79, 0, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('94674e7d-4e26-426b-9d48-5209579e99fa', 'buy', '2024-09-23 21:00:00+00', 835, 26, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('1d5437f6-e65a-44b6-84c9-1760a0523957', 'buy', '2024-09-22 21:00:00+00', 836, 23, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('242311e0-2292-4da2-b9a2-a32644968285', 'buy', '2025-07-28 21:00:00+00', 837, 5, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('0753b7cb-f6e9-4a90-8f66-8fee1d2e2594', 'buy', '2024-10-24 21:00:00+00', 838, 70, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('3b182c3e-61e4-4eed-b07f-8d56603f9ba7', 'sell', '2024-12-22 22:00:00+00', 839, 31, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('f4b82db0-52a6-431b-9de5-39fe3c0db581', 'buy', '2025-04-10 21:00:00+00', 840, 67, 0, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('c3c935ac-57cb-4eec-b665-e6453c6100f4', 'buy', '2025-04-28 21:00:00+00', 841, 71, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('597d311b-e55a-4f6a-9457-54dcafd25ed6', 'buy', '2025-02-05 22:00:00+00', 842, 62, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('f79223e3-80ea-4b28-88dc-cdf144f1275c', 'sell', '2024-10-09 21:00:00+00', 843, 86, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('3f11dc24-e65a-4799-b96f-7bdd8102fadc', 'sell', '2025-04-28 21:00:00+00', 844, 81, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('ea0e01cc-cb4a-4fc5-8b97-b2094a73e91b', 'sell', '2025-08-08 21:00:00+00', 845, 49, 0, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('6200ea32-f3ab-4264-9069-3d9cef95c15b', 'buy', '2024-12-17 22:00:00+00', 846, 62, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('6595c42b-d7db-40a1-8639-130aecc0a0d1', 'buy', '2025-07-22 21:00:00+00', 847, 71, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('7a1415bf-b21b-4a56-abcd-dff1b1b7f659', 'sell', '2025-07-17 21:00:00+00', 848, 84, 2, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('be0f62ec-d380-48e2-a73c-a85db7e25c91', 'buy', '2025-07-12 21:00:00+00', 849, 91, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('5b2359ae-627a-4f6f-8dac-f8174c3e5f2b', 'sell', '2024-10-02 21:00:00+00', 850, 33, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('c49f0da9-09fd-40fd-99ea-27b995decfaa', 'sell', '2025-01-09 22:00:00+00', 851, 33, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('1fdc67f1-3aff-4e09-8ee6-c546ed67bd03', 'buy', '2025-03-23 22:00:00+00', 852, 85, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('cd347861-e2a1-481c-9cd4-a97781e66f13', 'buy', '2024-11-04 22:00:00+00', 853, 62, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('ab0574e9-ea8a-4ed6-a0f6-727c08b62580', 'sell', '2025-04-11 21:00:00+00', 854, 81, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('92ea299e-c488-4ea4-bb43-657441bf8206', 'buy', '2025-07-17 21:00:00+00', 855, 82, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('7fd94dc0-6422-48cb-ad86-afe97af4ff07', 'buy', '2024-10-05 21:00:00+00', 856, 4, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('300de0ad-e16e-42f6-9411-ac217f026e68', 'sell', '2025-03-31 21:00:00+00', 857, 95, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('b4358ff0-0f64-4dd4-a725-23415a79f70f', 'buy', '2025-01-22 22:00:00+00', 858, 31, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('83048cf3-b269-46db-989d-64d0ca10fa06', 'sell', '2024-10-28 22:00:00+00', 859, 25, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('34c075ec-13a9-4182-9d3e-dd7f555e8868', 'buy', '2025-04-16 21:00:00+00', 860, 35, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('3c223179-211b-4c8f-952e-347487994bce', 'sell', '2024-11-07 22:00:00+00', 861, 2, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('02feefe8-c3a0-41d1-8988-519821d56642', 'buy', '2025-01-24 22:00:00+00', 862, 100, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('b0baa5ed-348c-4856-b62e-3162e64382fd', 'sell', '2025-05-18 21:00:00+00', 863, 48, 1, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('7f0a1c03-5099-496c-a940-a49b8bc9c10a', 'sell', '2024-12-21 22:00:00+00', 864, 22, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('86eda5c6-b902-4cfc-9e93-d45c187515c4', 'sell', '2024-10-02 21:00:00+00', 865, 99, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('168d935b-b650-4825-9492-7e65af897cf8', 'buy', '2025-03-11 22:00:00+00', 866, 57, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('2683348d-ed86-4bfc-a578-87d38b887d05', 'buy', '2025-02-28 22:00:00+00', 867, 41, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('63d86c8f-c5af-4429-bf62-294eb7a5569b', 'buy', '2024-12-21 22:00:00+00', 868, 92, 0, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('f14878e4-6cec-45ee-b933-49ba68a3db0e', 'buy', '2025-08-05 21:00:00+00', 869, 7, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('1837e00b-f6dd-4abd-ae14-f1202c4a42e5', 'buy', '2024-09-17 21:00:00+00', 870, 38, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('0710b97d-b75c-445f-8fab-ab391f5c6d66', 'sell', '2024-09-03 21:00:00+00', 871, 96, 0, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('4a399660-2470-4b6b-bd99-4281f9182b94', 'buy', '2025-06-26 21:00:00+00', 872, 95, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('64a0f364-488f-417c-9617-aa1bdb9c3909', 'buy', '2025-03-27 22:00:00+00', 873, 58, 1, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('dde5cfff-e73c-493d-b7c4-68982ce0623e', 'buy', '2025-02-07 22:00:00+00', 874, 37, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('389415f6-bb98-492c-bfe6-d598f6c0547a', 'buy', '2024-08-28 21:00:00+00', 875, 100, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('fdf4aeec-7d88-40f8-b8dd-e1971235414c', 'buy', '2025-02-28 22:00:00+00', 876, 57, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('ec2622b3-1141-4bde-af5a-0be61e7802c0', 'buy', '2025-02-28 22:00:00+00', 877, 37, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('ae19a496-62a0-44ab-8ac7-9cd022139f91', 'buy', '2024-09-15 21:00:00+00', 878, 64, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('5fe6fdf7-d02d-472e-a107-0b052f9ec0d9', 'sell', '2024-10-24 21:00:00+00', 879, 16, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('53f1e4b9-f77c-46e7-9f74-caa9043f2cca', 'buy', '2025-05-26 21:00:00+00', 880, 57, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('57603447-e766-46e0-babc-35220376c08f', 'buy', '2025-03-14 22:00:00+00', 881, 49, 2, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('9a49f2f3-6103-4774-9882-f73748ea37ba', 'sell', '2024-12-12 22:00:00+00', 882, 98, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('7c5cd821-f93e-4738-869e-533dbef68404', 'buy', '2024-08-28 21:00:00+00', 883, 26, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('d2d6d065-2535-40a4-bf34-5e719ffe2a4d', 'buy', '2025-02-05 22:00:00+00', 884, 64, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('ba81ccb9-16e5-4de1-9606-0cab20633fe4', 'sell', '2025-05-25 21:00:00+00', 885, 37, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('862f5b6a-4b17-4b8e-9329-3e0b46d4642e', 'buy', '2025-02-25 22:00:00+00', 886, 66, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('3f1b59e4-f838-4cfd-af5c-8866a53bfe8e', 'buy', '2025-07-20 21:00:00+00', 887, 61, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('dfff5d2d-7baf-4f6a-acf2-722514d4c320', 'buy', '2024-09-04 21:00:00+00', 888, 12, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('6bcc1e75-6995-4a15-99b6-fb877c3512af', 'sell', '2025-08-04 21:00:00+00', 889, 47, 0, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('0985b34f-e7f4-4cc2-aa24-bd8f0397f091', 'sell', '2025-05-22 21:00:00+00', 890, 1, 1, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('706d551e-aa95-4f7f-8329-e70cafcd2538', 'sell', '2024-11-24 22:00:00+00', 891, 71, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('afb6a825-f1a6-4bfd-b29a-520ebec31ab6', 'sell', '2025-03-24 22:00:00+00', 892, 98, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('aa651169-77cb-430b-8002-c63a4899a58d', 'buy', '2025-02-10 22:00:00+00', 893, 45, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('ebe4b3d9-2693-4274-a9cf-600e90218281', 'buy', '2025-03-30 21:00:00+00', 894, 98, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('a0f1d065-f00a-4503-be73-105a9557c668', 'sell', '2025-02-11 22:00:00+00', 895, 53, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('9b77aa7a-78ad-4ba1-93a1-fd044a40dce8', 'sell', '2025-03-14 22:00:00+00', 896, 32, 2, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('698fb3e8-6c14-47b1-8d84-a57e5ac7994a', 'sell', '2025-04-05 21:00:00+00', 897, 35, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('50aad50e-6873-4293-8104-1714b5d334fe', 'buy', '2025-03-25 22:00:00+00', 898, 26, 1, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('fb4bfd02-42a1-40f2-b5b1-7320a272f8f4', 'sell', '2025-08-11 21:00:00+00', 899, 58, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('afb4d003-0311-4e45-92f9-cfa9641fc4e3', 'buy', '2024-09-26 21:00:00+00', 900, 67, 1, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('07b379ea-fad5-4ab8-9bf6-06772ae2a794', 'buy', '2025-01-03 22:00:00+00', 901, 82, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('1e6376e9-2786-43fd-960a-e0cad4296fe6', 'sell', '2025-07-20 21:00:00+00', 902, 29, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('7c69dccd-dc89-44cc-90f0-aad8425989c5', 'sell', '2025-02-26 22:00:00+00', 903, 13, 2, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('7819cb4f-beb8-48e3-953c-306547f9297a', 'buy', '2024-10-28 22:00:00+00', 904, 86, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('184c164a-880b-4cfd-a5cb-f00461c3bc4d', 'buy', '2025-01-07 22:00:00+00', 905, 39, 2, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('9bbeb77c-caa5-4226-a661-0715ea56c578', 'buy', '2025-01-28 22:00:00+00', 906, 38, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('d5d5c3f4-cd17-4bc0-875b-d3c501a76f93', 'buy', '2025-04-02 21:00:00+00', 907, 2, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('ce7671e9-8587-488a-9332-8079f807df07', 'buy', '2024-12-09 22:00:00+00', 908, 8, 1, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('b78e7934-0370-4ef2-8826-3e2c686b67fe', 'sell', '2025-07-15 21:00:00+00', 909, 24, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('bd3a8dcb-a033-48d8-9390-6cf86bdd8311', 'buy', '2025-08-07 21:00:00+00', 910, 83, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('d27f1b7e-c327-4c62-a6ba-c7a88a639a27', 'buy', '2024-10-16 21:00:00+00', 911, 43, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('562399af-efe6-48fe-b4f9-60ac7a057de8', 'buy', '2025-02-16 22:00:00+00', 912, 50, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('e7daadf9-c0ed-4cda-a7d5-53aedffeb790', 'buy', '2025-08-16 21:00:00+00', 913, 91, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('774495c0-9487-41f1-8957-04cff5c848cd', 'buy', '2024-10-24 21:00:00+00', 914, 89, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('f850ae8a-3325-4711-b5da-77ec96174069', 'sell', '2024-08-19 21:00:00+00', 915, 100, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('5b025194-6af0-4cc7-9d49-cab419f8ccd4', 'buy', '2025-08-03 21:00:00+00', 916, 14, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('22b49885-0a5f-40fa-95d7-7e510876fabc', 'buy', '2025-05-22 21:00:00+00', 917, 38, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('db6129e4-876f-4ccc-9564-9cef0d05ce3a', 'buy', '2025-03-07 22:00:00+00', 918, 82, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('41d93517-b0b6-4841-b9ba-392b0f6f5991', 'buy', '2025-05-06 21:00:00+00', 919, 4, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('2f99eedc-77bf-4c39-a895-45abff99fbad', 'buy', '2025-02-22 22:00:00+00', 920, 76, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('3e8d791c-55a8-4fb2-ab41-a39ad68bb6d7', 'sell', '2024-12-08 22:00:00+00', 921, 21, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('8367f17a-91d1-433f-b27f-d25afdd880e7', 'buy', '2024-12-13 22:00:00+00', 922, 69, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('5aebbf38-a98a-450f-82e0-476984c09eb9', 'sell', '2024-09-29 21:00:00+00', 923, 20, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('9a8b1f28-37c5-48d3-8f56-1f8fd2b9a8a2', 'buy', '2025-03-03 22:00:00+00', 924, 41, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('5093db5a-9997-4cad-a8ec-09812a55a28f', 'sell', '2025-03-07 22:00:00+00', 925, 52, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('f7d4e9ba-8c9b-4dd1-8071-242455b4a302', 'sell', '2025-02-24 22:00:00+00', 926, 12, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('68c8e8fa-e6dc-45cc-af6b-54cda5becd78', 'sell', '2025-07-06 21:00:00+00', 927, 21, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('22cfa907-37e6-4b25-800f-7c30b19d19f5', 'buy', '2025-03-25 22:00:00+00', 928, 69, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('5a9bd465-f435-4cba-813b-7c7145ca4008', 'sell', '2025-07-26 21:00:00+00', 929, 56, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('9e499057-288e-4517-a33d-d718544b9cef', 'buy', '2025-06-13 21:00:00+00', 930, 72, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('f769023b-36b1-4b27-bae2-668bad279a14', 'buy', '2025-05-29 21:00:00+00', 931, 73, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('3608a897-4b6b-4a2a-b59a-9d6a75e556cd', 'sell', '2024-09-20 21:00:00+00', 932, 77, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('8d7107df-4748-4df2-a564-37ec0580f8a8', 'buy', '2025-06-24 21:00:00+00', 933, 89, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('4d29cb0f-3a26-4602-9ea2-729b4d0f35a9', 'sell', '2025-02-19 22:00:00+00', 934, 35, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('fdefc8f3-a2c8-480a-8046-29e448ec1a3f', 'buy', '2025-04-26 21:00:00+00', 935, 61, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('fc6ee6b0-5b9e-47fd-b7c1-36dace367375', 'sell', '2025-01-05 22:00:00+00', 936, 24, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('b2c7e37a-3985-43f0-8504-4ee70dc5c6b6', 'buy', '2024-09-28 21:00:00+00', 937, 69, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('eece262d-3d73-458d-a00e-576e12a3de5e', 'sell', '2025-05-27 21:00:00+00', 938, 47, 1, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('569e1866-8350-4335-ac49-3e1d01206d01', 'sell', '2025-01-10 22:00:00+00', 939, 7, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('e674b069-7c54-4194-9814-59bfc2c1629f', 'sell', '2025-07-02 21:00:00+00', 940, 29, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('4332e07a-950f-4020-a0f0-df892c2da678', 'buy', '2024-12-25 22:00:00+00', 941, 82, 1, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('e793a8bd-1748-410f-a93a-caeefb4bff38', 'buy', '2024-10-09 21:00:00+00', 942, 3, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('2f63a2c7-2223-4375-afdd-7d6da9229c4d', 'buy', '2024-11-03 22:00:00+00', 943, 68, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('56233f8c-7bf5-405a-9dbb-44e56eb28b8a', 'sell', '2025-06-07 21:00:00+00', 944, 9, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('bfe1a523-2ec3-4ba6-b300-895165ab9f90', 'sell', '2025-01-22 22:00:00+00', 945, 5, 1, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('fccb0c4c-5c8f-455d-808a-16ecde9be629', 'sell', '2025-04-29 21:00:00+00', 946, 23, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('95e2e429-7c72-4134-af10-b13b5c6bfeea', 'buy', '2024-08-22 21:00:00+00', 947, 73, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('547c4aac-22b4-458e-89e8-655ebc0ee9ee', 'sell', '2025-08-08 21:00:00+00', 948, 51, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('3bc1737b-5655-42ac-9c06-8716428ba067', 'buy', '2025-03-12 22:00:00+00', 949, 36, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('120f50b1-b919-4569-bd66-64b18137f9fa', 'sell', '2024-09-14 21:00:00+00', 950, 63, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('321b16b7-f3c0-416e-bc0b-211c071fdf5f', 'buy', '2025-01-09 22:00:00+00', 951, 73, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('da039e39-331f-48d3-aea0-28db77345337', 'sell', '2025-07-14 21:00:00+00', 952, 83, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('e572dfcc-0898-4617-9a4d-9ee7aafd734e', 'sell', '2024-11-15 22:00:00+00', 953, 10, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('19a214a5-bd8f-42c0-aafc-089005d36072', 'buy', '2025-01-14 22:00:00+00', 954, 22, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('54b78a43-35cf-432e-b8c9-e06771e0cf8d', 'buy', '2025-03-05 22:00:00+00', 955, 12, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('0cdb439a-e8fd-4d43-a341-78e6409a3549', 'sell', '2025-01-06 22:00:00+00', 956, 83, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('851f0f0c-3f6d-4219-8e6c-08b1b70579c3', 'buy', '2024-08-19 21:00:00+00', 957, 62, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('df57e3e4-4168-465c-b3d1-078d21e11054', 'buy', '2025-05-05 21:00:00+00', 958, 56, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('69dcea25-a43e-4a6a-98cc-0aaf153e1674', 'sell', '2025-04-01 21:00:00+00', 959, 89, 2, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('62701842-796a-4755-9732-d9937c5b94d3', 'sell', '2024-12-17 22:00:00+00', 960, 58, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('fa4271d3-dd68-4228-975e-14cba48ec76d', 'sell', '2025-04-08 21:00:00+00', 961, 11, 2, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('48ccfc50-4070-49ec-b030-09c3a03db4a7', 'buy', '2025-02-14 22:00:00+00', 962, 25, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('8e896f43-0f4a-4443-b300-967bd7d8b0da', 'sell', '2025-06-05 21:00:00+00', 963, 19, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('014c41f2-aa6a-4cca-897d-48a1390af8fd', 'buy', '2025-01-10 22:00:00+00', 964, 79, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('0b281534-c4f6-46da-b0d1-ff9a089e9580', 'buy', '2025-03-26 22:00:00+00', 965, 14, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('6a22e3cf-100a-407d-a8d8-a9231aa00e47', 'sell', '2025-01-12 22:00:00+00', 966, 3, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('356a9c53-92ec-4f9b-8861-7dca0b8238df', 'sell', '2025-01-10 22:00:00+00', 967, 94, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('b5a14529-39c0-496f-a827-8d7f3c07d062', 'sell', '2025-07-02 21:00:00+00', 968, 53, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('a4e2905a-7ec0-486c-825a-14302f3e1a74', 'buy', '2024-10-21 21:00:00+00', 969, 63, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('a2099875-cb80-48e3-aafd-f65352e7bb72', 'buy', '2025-01-01 22:00:00+00', 970, 74, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('6f9a297f-1143-49f2-bb57-59a25dda771f', 'buy', '2024-12-27 22:00:00+00', 971, 47, 2, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('240bf5d8-376f-41d8-a63e-8c63ad6811ca', 'sell', '2024-11-09 22:00:00+00', 972, 50, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('bebaa17e-5d3e-40bb-87b1-bc937035a58d', 'buy', '2025-02-01 22:00:00+00', 973, 63, 0, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('9aac06ea-5c60-49fd-a5b6-b6a5fc3a1819', 'buy', '2024-10-11 21:00:00+00', 974, 78, 0, true, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('6443732a-b503-41d9-8a70-92703abd3cfe', 'sell', '2025-06-10 21:00:00+00', 975, 16, 1, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('6a3fc29a-fefc-4e9e-b051-27fc9f9e74b7', 'buy', '2024-12-20 22:00:00+00', 976, 80, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('27d0663f-1a31-4bb0-85a8-272903380ebf', 'buy', '2024-08-27 21:00:00+00', 977, 96, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('e24b3da3-19a1-4e7e-bf63-9372c460b741', 'sell', '2025-08-07 21:00:00+00', 978, 42, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('4bc0d22a-40f6-4a76-ba79-c10923e5d029', 'buy', '2024-11-30 22:00:00+00', 979, 90, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('7d107265-b8e1-45e5-8561-0c748c523831', 'sell', '2024-12-08 22:00:00+00', 980, 69, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('55a5371c-b6d4-426f-a9c0-73e91b665cca', 'sell', '2025-05-01 21:00:00+00', 981, 82, 1, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('9c9bc5e5-fb72-4842-b51f-efd81242979f', 'sell', '2025-04-18 21:00:00+00', 982, 53, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('b2417e3e-b0f1-4f25-a826-d4cc18f300c4', 'buy', '2024-12-24 22:00:00+00', 983, 18, 2, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('d6d5fd70-35cd-45c0-8640-d5c6fc4c80f8', 'buy', '2025-05-07 21:00:00+00', 984, 13, 0, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('50e254fd-70bd-4cde-a0e3-a7d7116a4f60', 'buy', '2025-01-16 22:00:00+00', 985, 62, 2, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('cd86f804-81ed-4bb6-9391-9e774c1bc8b5', 'sell', '2024-09-06 21:00:00+00', 986, 82, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('48154395-e83d-4d4a-a5f1-a00aa9080aa5', 'sell', '2025-04-06 21:00:00+00', 987, 18, 1, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('483e88bd-7a7b-4685-b7ec-cbc7e0c7c207', 'buy', '2025-08-15 21:00:00+00', 988, 31, 0, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('e12b449d-4619-4f92-b943-c2d1147b7fe0', 'buy', '2024-11-08 22:00:00+00', 989, 49, 1, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('a7fe5059-4e6c-44ca-b021-b5dbe91795de', 'buy', '2025-07-07 21:00:00+00', 990, 1, 1, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('7b5b575c-b8fb-4fc7-8dbe-b4af259495b7', 'sell', '2025-01-03 22:00:00+00', 991, 33, 2, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('78541fe0-9caa-4561-a7cd-b62f6c2caff6', 'buy', '2025-04-05 21:00:00+00', 992, 90, 2, true, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('68fa4db7-2445-435b-b208-bc90edbcb8d0', 'buy', '2024-10-20 21:00:00+00', 993, 36, 2, false, NULL, NULL, 'mitko1');
INSERT INTO public.orders VALUES ('095bf418-41af-4032-a492-658903522b5e', 'buy', '2025-06-27 21:00:00+00', 994, 82, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('d3b76c16-66cc-4b19-8345-e4a54536f1fe', 'buy', '2025-05-27 21:00:00+00', 995, 48, 0, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('d6ac837a-e157-4048-8465-ac10f7e71f71', 'sell', '2025-01-26 22:00:00+00', 996, 74, 1, false, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('9af68d4d-9a0f-4eff-a9f7-bbcd2a89daa1', 'sell', '2024-12-10 22:00:00+00', 997, 58, 1, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('6dbaa969-9e2b-4cca-b3e6-f6e82a0cf683', 'sell', '2025-02-20 22:00:00+00', 998, 23, 1, false, NULL, NULL, 'another2');
INSERT INTO public.orders VALUES ('b2905446-ec2f-4e20-9664-48231cd03b2d', 'buy', '2025-06-09 21:00:00+00', 999, 15, 0, true, NULL, NULL, 'another');
INSERT INTO public.orders VALUES ('809dfe39-e91a-4492-820a-110d7787a66e', 'buy', '2025-01-06 22:00:00+00', 1000, 79, 1, true, NULL, NULL, 'another');


--
-- TOC entry 3428 (class 0 OID 16385)
-- Dependencies: 217
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users VALUES ('0da5fb05-1445-4b1b-a41e-9d5f9a7cdac2', 'mitko1', 'kwUqvNgXNqZfnRSfgQL+fw==', '$2a$10$6P40F5UWPnV4.YggB8DLNOM7.LlJl41D6OQxqyTCvKYNtYD6/0GK2');


--
-- TOC entry 3282 (class 2606 OID 16400)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3278 (class 2606 OID 16393)
-- Name: users uni_users_username; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uni_users_username UNIQUE (username);


--
-- TOC entry 3280 (class 2606 OID 16391)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


-- Completed on 2025-08-19 20:04:58 EEST

--
-- PostgreSQL database dump complete
--

