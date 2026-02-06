--
-- PostgreSQL database cluster dump
--

-- Started on 2026-02-06 15:54:11

\restrict TaYg2vBdIxyfDUjfElvhydl4rUSScYocq15ejeMDi3XYWNirFoGrneMPKkoXIlG

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








\unrestrict TaYg2vBdIxyfDUjfElvhydl4rUSScYocq15ejeMDi3XYWNirFoGrneMPKkoXIlG

-- Completed on 2026-02-06 15:54:12

--
-- PostgreSQL database cluster dump complete
--

