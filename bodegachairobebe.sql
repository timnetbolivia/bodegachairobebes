--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.2
-- Dumped by pg_dump version 9.5.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: paracelso; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA paracelso;


ALTER SCHEMA paracelso OWNER TO postgres;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = paracelso, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: alergias; Type: TABLE; Schema: paracelso; Owner: paracelso
--

CREATE TABLE alergias (
    id_alergia integer NOT NULL,
    id_historia bigint,
    id_bitacora bigint,
    tipo_alergia character varying(4),
    nota character varying(255),
    estado character varying(3)
);


ALTER TABLE alergias OWNER TO paracelso;

--
-- Name: alergias_id_alergia_seq; Type: SEQUENCE; Schema: paracelso; Owner: paracelso
--

CREATE SEQUENCE alergias_id_alergia_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alergias_id_alergia_seq OWNER TO paracelso;

--
-- Name: alergias_id_alergia_seq; Type: SEQUENCE OWNED BY; Schema: paracelso; Owner: paracelso
--

ALTER SEQUENCE alergias_id_alergia_seq OWNED BY alergias.id_alergia;


--
-- Name: anamnesis; Type: TABLE; Schema: paracelso; Owner: paracelso
--

CREATE TABLE anamnesis (
    id_anamnesis integer NOT NULL,
    id_historia bigint,
    id_bitacora bigint,
    tipo character varying(6),
    descripcion character varying(500),
    estado character varying(3)
);


ALTER TABLE anamnesis OWNER TO paracelso;

--
-- Name: anamnesis_id_anamnesis_seq; Type: SEQUENCE; Schema: paracelso; Owner: paracelso
--

CREATE SEQUENCE anamnesis_id_anamnesis_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE anamnesis_id_anamnesis_seq OWNER TO paracelso;

--
-- Name: anamnesis_id_anamnesis_seq; Type: SEQUENCE OWNED BY; Schema: paracelso; Owner: paracelso
--

ALTER SEQUENCE anamnesis_id_anamnesis_seq OWNED BY anamnesis.id_anamnesis;


--
-- Name: bitacoras; Type: TABLE; Schema: paracelso; Owner: paracelso
--

CREATE TABLE bitacoras (
    id_bitacora integer NOT NULL,
    codigo_transaccion character varying(10) NOT NULL,
    id_usuario bigint,
    fecha timestamp without time zone NOT NULL,
    estado character varying(2) NOT NULL
);


ALTER TABLE bitacoras OWNER TO paracelso;

--
-- Name: bitacoras_id_bitacora_seq; Type: SEQUENCE; Schema: paracelso; Owner: paracelso
--

CREATE SEQUENCE bitacoras_id_bitacora_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bitacoras_id_bitacora_seq OWNER TO paracelso;

--
-- Name: bitacoras_id_bitacora_seq; Type: SEQUENCE OWNED BY; Schema: paracelso; Owner: paracelso
--

ALTER SEQUENCE bitacoras_id_bitacora_seq OWNED BY bitacoras.id_bitacora;


--
-- Name: consultas; Type: TABLE; Schema: paracelso; Owner: paracelso
--

CREATE TABLE consultas (
    id_consulta integer NOT NULL,
    id_bitacora bigint NOT NULL,
    id_persona bigint,
    id_medico bigint,
    id_receptor bigint,
    id_consultorio bigint,
    codigo_institucion character varying(6),
    tipo_consulta character varying(4),
    motivo character varying(50),
    historia character varying(250),
    fecha date,
    hora time without time zone,
    fecha_inicio date,
    hora_inicio time without time zone,
    hora_fin time without time zone,
    estado character varying(3)
);


ALTER TABLE consultas OWNER TO paracelso;

--
-- Name: consultas_id_consulta_seq; Type: SEQUENCE; Schema: paracelso; Owner: paracelso
--

CREATE SEQUENCE consultas_id_consulta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE consultas_id_consulta_seq OWNER TO paracelso;

--
-- Name: consultas_id_consulta_seq; Type: SEQUENCE OWNED BY; Schema: paracelso; Owner: paracelso
--

ALTER SEQUENCE consultas_id_consulta_seq OWNED BY consultas.id_consulta;


--
-- Name: deudas_consultas; Type: TABLE; Schema: paracelso; Owner: paracelso
--

CREATE TABLE deudas_consultas (
    id_deuda integer NOT NULL,
    id_persona integer,
    id_consulta integer,
    codigo_institucion character varying(6),
    fecha_generacion date,
    monto numeric(6,2),
    concepto character varying(100),
    estado character varying(3)
);


ALTER TABLE deudas_consultas OWNER TO paracelso;

--
-- Name: deudas_consultas_id_deuda_seq; Type: SEQUENCE; Schema: paracelso; Owner: paracelso
--

CREATE SEQUENCE deudas_consultas_id_deuda_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE deudas_consultas_id_deuda_seq OWNER TO paracelso;

--
-- Name: deudas_consultas_id_deuda_seq; Type: SEQUENCE OWNED BY; Schema: paracelso; Owner: paracelso
--

ALTER SEQUENCE deudas_consultas_id_deuda_seq OWNED BY deudas_consultas.id_deuda;


--
-- Name: diagnosticos; Type: TABLE; Schema: paracelso; Owner: paracelso
--

CREATE TABLE diagnosticos (
    id_diagnostico integer NOT NULL,
    id_evaluacion bigint,
    id_bitacora integer,
    tipo_diagnostico character varying(6),
    codigo_cie character varying(10),
    descripcion character varying(300),
    estado character varying(2)
);


ALTER TABLE diagnosticos OWNER TO paracelso;

--
-- Name: diagnosticos_id_diagnostico_seq; Type: SEQUENCE; Schema: paracelso; Owner: paracelso
--

CREATE SEQUENCE diagnosticos_id_diagnostico_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE diagnosticos_id_diagnostico_seq OWNER TO paracelso;

--
-- Name: diagnosticos_id_diagnostico_seq; Type: SEQUENCE OWNED BY; Schema: paracelso; Owner: paracelso
--

ALTER SEQUENCE diagnosticos_id_diagnostico_seq OWNED BY diagnosticos.id_diagnostico;


--
-- Name: evaluaciones; Type: TABLE; Schema: paracelso; Owner: paracelso
--

CREATE TABLE evaluaciones (
    id_evaluacion integer NOT NULL,
    id_consulta bigint NOT NULL,
    id_bitacora bigint NOT NULL,
    laboratorio character varying(300),
    gabinete character varying(300),
    estado character varying(3) NOT NULL
);


ALTER TABLE evaluaciones OWNER TO paracelso;

--
-- Name: evaluaciones_id_evaluacion_seq; Type: SEQUENCE; Schema: paracelso; Owner: paracelso
--

CREATE SEQUENCE evaluaciones_id_evaluacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE evaluaciones_id_evaluacion_seq OWNER TO paracelso;

--
-- Name: evaluaciones_id_evaluacion_seq; Type: SEQUENCE OWNED BY; Schema: paracelso; Owner: paracelso
--

ALTER SEQUENCE evaluaciones_id_evaluacion_seq OWNED BY evaluaciones.id_evaluacion;


--
-- Name: historias_clinicas; Type: TABLE; Schema: paracelso; Owner: paracelso
--

CREATE TABLE historias_clinicas (
    id_historia integer NOT NULL,
    id_medico bigint,
    id_bitacora bigint,
    id_persona bigint,
    codigo_institucion character varying(6),
    fecha date,
    hora timestamp without time zone,
    nota character varying(500),
    estado character varying(3)
);


ALTER TABLE historias_clinicas OWNER TO paracelso;

--
-- Name: historias_clinicas_id_historia_seq; Type: SEQUENCE; Schema: paracelso; Owner: paracelso
--

CREATE SEQUENCE historias_clinicas_id_historia_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE historias_clinicas_id_historia_seq OWNER TO paracelso;

--
-- Name: historias_clinicas_id_historia_seq; Type: SEQUENCE OWNED BY; Schema: paracelso; Owner: paracelso
--

ALTER SEQUENCE historias_clinicas_id_historia_seq OWNED BY historias_clinicas.id_historia;


--
-- Name: imagenes_gabinetes; Type: TABLE; Schema: paracelso; Owner: paracelso
--

CREATE TABLE imagenes_gabinetes (
    id_resultado_gabinete integer NOT NULL,
    imagen bytea,
    estado character varying(3)
);


ALTER TABLE imagenes_gabinetes OWNER TO paracelso;

--
-- Name: imagenes_gabinetes_id_resultado_gabinete_seq; Type: SEQUENCE; Schema: paracelso; Owner: paracelso
--

CREATE SEQUENCE imagenes_gabinetes_id_resultado_gabinete_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE imagenes_gabinetes_id_resultado_gabinete_seq OWNER TO paracelso;

--
-- Name: imagenes_gabinetes_id_resultado_gabinete_seq; Type: SEQUENCE OWNED BY; Schema: paracelso; Owner: paracelso
--

ALTER SEQUENCE imagenes_gabinetes_id_resultado_gabinete_seq OWNED BY imagenes_gabinetes.id_resultado_gabinete;


--
-- Name: medicos; Type: TABLE; Schema: paracelso; Owner: paracelso
--

CREATE TABLE medicos (
    id_medico integer NOT NULL,
    id_persona integer NOT NULL,
    codigo_especialidad character varying(4),
    matricula_min_salud character varying(20),
    matricula_col_medico character varying(20),
    ranking smallint,
    alma_mater character varying(100),
    estado character varying(3)
);


ALTER TABLE medicos OWNER TO paracelso;

--
-- Name: medicos_id_medico_seq; Type: SEQUENCE; Schema: paracelso; Owner: paracelso
--

CREATE SEQUENCE medicos_id_medico_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE medicos_id_medico_seq OWNER TO paracelso;

--
-- Name: medicos_id_medico_seq; Type: SEQUENCE OWNED BY; Schema: paracelso; Owner: paracelso
--

ALTER SEQUENCE medicos_id_medico_seq OWNED BY medicos.id_medico;


--
-- Name: migrations; Type: TABLE; Schema: paracelso; Owner: postgres
--

CREATE TABLE migrations (
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE migrations OWNER TO postgres;

--
-- Name: no_patologicos; Type: TABLE; Schema: paracelso; Owner: paracelso
--

CREATE TABLE no_patologicos (
    id_no_patologico integer NOT NULL,
    id_historia bigint NOT NULL,
    id_bitacora bigint NOT NULL,
    grupo_sanguineo character varying(6),
    tipo_habito character varying(4),
    descripcion character varying(100),
    estado character varying(3)
);


ALTER TABLE no_patologicos OWNER TO paracelso;

--
-- Name: COLUMN no_patologicos.grupo_sanguineo; Type: COMMENT; Schema: paracelso; Owner: paracelso
--

COMMENT ON COLUMN no_patologicos.grupo_sanguineo IS 'A B AB O - + EN ESTA TABLA NO SERIA UN CAMPO ADECUADO YA QUE SE REPETIRIA VARIAS VECES';


--
-- Name: COLUMN no_patologicos.tipo_habito; Type: COMMENT; Schema: paracelso; Owner: paracelso
--

COMMENT ON COLUMN no_patologicos.tipo_habito IS 'tabaquismo alcoholismo adicciones';


--
-- Name: no_patologicos_id_no_patologico_seq; Type: SEQUENCE; Schema: paracelso; Owner: paracelso
--

CREATE SEQUENCE no_patologicos_id_no_patologico_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE no_patologicos_id_no_patologico_seq OWNER TO paracelso;

--
-- Name: no_patologicos_id_no_patologico_seq; Type: SEQUENCE OWNED BY; Schema: paracelso; Owner: paracelso
--

ALTER SEQUENCE no_patologicos_id_no_patologico_seq OWNED BY no_patologicos.id_no_patologico;


--
-- Name: obstetricias; Type: TABLE; Schema: paracelso; Owner: paracelso
--

CREATE TABLE obstetricias (
    id_obstetricia integer NOT NULL,
    id_historia bigint,
    id_bitacora bigint,
    fecha_menarca date,
    ritmo character varying(10),
    fum character varying(10),
    metodo_anticonceptivo character varying(10),
    fup character varying(10),
    no_embarazos smallint,
    no_partos smallint,
    no_cesareas smallint,
    no_abortos smallint,
    observaciones character varying(500),
    estado character varying(3)
);


ALTER TABLE obstetricias OWNER TO paracelso;

--
-- Name: obstetricias_id_obstetricia_seq; Type: SEQUENCE; Schema: paracelso; Owner: paracelso
--

CREATE SEQUENCE obstetricias_id_obstetricia_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE obstetricias_id_obstetricia_seq OWNER TO paracelso;

--
-- Name: obstetricias_id_obstetricia_seq; Type: SEQUENCE OWNED BY; Schema: paracelso; Owner: paracelso
--

ALTER SEQUENCE obstetricias_id_obstetricia_seq OWNED BY obstetricias.id_obstetricia;


--
-- Name: opciones; Type: TABLE; Schema: paracelso; Owner: paracelso
--

CREATE TABLE opciones (
    id_opcion integer NOT NULL,
    descripcion character varying(40) NOT NULL,
    url character varying(150),
    fecha_registro date NOT NULL,
    nsec_opcion bigint,
    prioridad smallint,
    estado character varying(2) NOT NULL
);


ALTER TABLE opciones OWNER TO paracelso;

--
-- Name: opciones_id_opcion_seq; Type: SEQUENCE; Schema: paracelso; Owner: paracelso
--

CREATE SEQUENCE opciones_id_opcion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE opciones_id_opcion_seq OWNER TO paracelso;

--
-- Name: opciones_id_opcion_seq; Type: SEQUENCE OWNED BY; Schema: paracelso; Owner: paracelso
--

ALTER SEQUENCE opciones_id_opcion_seq OWNED BY opciones.id_opcion;


--
-- Name: opciones_roles; Type: TABLE; Schema: paracelso; Owner: paracelso
--

CREATE TABLE opciones_roles (
    id_opcion bigint,
    id_rol bigint,
    estado character varying(2) NOT NULL
);


ALTER TABLE opciones_roles OWNER TO paracelso;

--
-- Name: ordenes_gabinetes; Type: TABLE; Schema: paracelso; Owner: paracelso
--

CREATE TABLE ordenes_gabinetes (
    id_orden_gabinete bigint NOT NULL,
    id_consulta bigint NOT NULL,
    id_bitacora bigint NOT NULL,
    tipo_gabinete character varying(4),
    orden character varying(500) NOT NULL,
    fecha date NOT NULL,
    estado character varying(3) NOT NULL
);


ALTER TABLE ordenes_gabinetes OWNER TO paracelso;

--
-- Name: ordenes_laboratorios; Type: TABLE; Schema: paracelso; Owner: paracelso
--

CREATE TABLE ordenes_laboratorios (
    id_orden_laboratorio integer NOT NULL,
    id_consulta bigint NOT NULL,
    id_bitacora bigint NOT NULL,
    tipo_laboratorio character varying(4),
    orden character varying(500) NOT NULL,
    fecha date NOT NULL,
    estado character varying(2) NOT NULL
);


ALTER TABLE ordenes_laboratorios OWNER TO paracelso;

--
-- Name: ordenes_laboratorios_id_orden_laboratorio_seq; Type: SEQUENCE; Schema: paracelso; Owner: paracelso
--

CREATE SEQUENCE ordenes_laboratorios_id_orden_laboratorio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ordenes_laboratorios_id_orden_laboratorio_seq OWNER TO paracelso;

--
-- Name: ordenes_laboratorios_id_orden_laboratorio_seq; Type: SEQUENCE OWNED BY; Schema: paracelso; Owner: paracelso
--

ALTER SEQUENCE ordenes_laboratorios_id_orden_laboratorio_seq OWNED BY ordenes_laboratorios.id_orden_laboratorio;


--
-- Name: pa_cie10; Type: TABLE; Schema: paracelso; Owner: paracelso
--

CREATE TABLE pa_cie10 (
    codigo_cie character varying(10) NOT NULL,
    descripcion character varying(255),
    grupo character varying(5),
    estado character varying(3)
);


ALTER TABLE pa_cie10 OWNER TO paracelso;

--
-- Name: pa_comisiones; Type: TABLE; Schema: paracelso; Owner: paracelso
--

CREATE TABLE pa_comisiones (
    id_comision integer NOT NULL,
    id_institucion smallint NOT NULL,
    fecha character varying(100),
    comision numeric,
    estado character varying(2) NOT NULL
);


ALTER TABLE pa_comisiones OWNER TO paracelso;

--
-- Name: pa_comisiones_id_comision_seq; Type: SEQUENCE; Schema: paracelso; Owner: paracelso
--

CREATE SEQUENCE pa_comisiones_id_comision_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pa_comisiones_id_comision_seq OWNER TO paracelso;

--
-- Name: pa_comisiones_id_comision_seq; Type: SEQUENCE OWNED BY; Schema: paracelso; Owner: paracelso
--

ALTER SEQUENCE pa_comisiones_id_comision_seq OWNED BY pa_comisiones.id_comision;


--
-- Name: pa_diagnosticos; Type: TABLE; Schema: paracelso; Owner: paracelso
--

CREATE TABLE pa_diagnosticos (
    codigo_diagnostico character varying(10) NOT NULL,
    codigo_cie character varying(6),
    nombre character varying(30) NOT NULL,
    descripcion character varying(500),
    tratamiento character varying(500),
    estado character varying(2) NOT NULL
);


ALTER TABLE pa_diagnosticos OWNER TO paracelso;

--
-- Name: TABLE pa_diagnosticos; Type: COMMENT; Schema: paracelso; Owner: paracelso
--

COMMENT ON TABLE pa_diagnosticos IS 'eliminar tratamiento agregar tipo (quirurgico, medico)';


--
-- Name: pa_dominios; Type: TABLE; Schema: paracelso; Owner: paracelso
--

CREATE TABLE pa_dominios (
    codigo_dominio character varying(6) NOT NULL,
    nombre character varying(255),
    descripcion character varying(500),
    estado character varying(2)
);


ALTER TABLE pa_dominios OWNER TO paracelso;

--
-- Name: pa_instituciones; Type: TABLE; Schema: paracelso; Owner: paracelso
--

CREATE TABLE pa_instituciones (
    id_institucion integer NOT NULL,
    codigo_institucion character varying(6),
    tipo_institucion character varying(12),
    nombre character varying(50) NOT NULL,
    descripcion character varying(100),
    direccion character varying(100),
    estado character varying(3) NOT NULL
);


ALTER TABLE pa_instituciones OWNER TO paracelso;

--
-- Name: pa_instituciones_id_institucion_seq; Type: SEQUENCE; Schema: paracelso; Owner: paracelso
--

CREATE SEQUENCE pa_instituciones_id_institucion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pa_instituciones_id_institucion_seq OWNER TO paracelso;

--
-- Name: pa_instituciones_id_institucion_seq; Type: SEQUENCE OWNED BY; Schema: paracelso; Owner: paracelso
--

ALTER SEQUENCE pa_instituciones_id_institucion_seq OWNED BY pa_instituciones.id_institucion;


--
-- Name: pa_medicamentos; Type: TABLE; Schema: paracelso; Owner: paracelso
--

CREATE TABLE pa_medicamentos (
    codigo_medicamento character varying(6) NOT NULL,
    nombre_comercial character varying(30) NOT NULL,
    nombre_medico character varying(30),
    codigo_marca character varying(4),
    posologia integer NOT NULL,
    presentacion character varying(10),
    estado character varying(2) NOT NULL
);


ALTER TABLE pa_medicamentos OWNER TO paracelso;

--
-- Name: pa_transacciones; Type: TABLE; Schema: paracelso; Owner: paracelso
--

CREATE TABLE pa_transacciones (
    codigo_transaccion character varying(10) NOT NULL,
    descripcion character varying(100) NOT NULL,
    abreviacion character varying(2),
    fecha timestamp without time zone NOT NULL,
    estado character varying(2) NOT NULL
);


ALTER TABLE pa_transacciones OWNER TO paracelso;

--
-- Name: pacientes; Type: TABLE; Schema: paracelso; Owner: paracelso
--

CREATE TABLE pacientes (
    id_paciente integer NOT NULL,
    id_persona integer NOT NULL,
    codigo_institucion character varying(4) NOT NULL,
    codigo_seguro character varying(20),
    matricula_seguro character varying(20),
    religion character varying(20),
    observaciones character varying(200),
    estado character varying(3)
);


ALTER TABLE pacientes OWNER TO paracelso;

--
-- Name: pacientes_id_paciente_seq; Type: SEQUENCE; Schema: paracelso; Owner: paracelso
--

CREATE SEQUENCE pacientes_id_paciente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pacientes_id_paciente_seq OWNER TO paracelso;

--
-- Name: pacientes_id_paciente_seq; Type: SEQUENCE OWNED BY; Schema: paracelso; Owner: paracelso
--

ALTER SEQUENCE pacientes_id_paciente_seq OWNED BY pacientes.id_paciente;


--
-- Name: pagos_consultas; Type: TABLE; Schema: paracelso; Owner: paracelso
--

CREATE TABLE pagos_consultas (
    id_pago bigint NOT NULL,
    id_deuda integer,
    codigo_institucion character varying(6),
    forma_pago character varying(6),
    fecha date,
    monto numeric,
    comision numeric,
    estado character varying(3)
);


ALTER TABLE pagos_consultas OWNER TO paracelso;

--
-- Name: TABLE pagos_consultas; Type: COMMENT; Schema: paracelso; Owner: paracelso
--

COMMENT ON TABLE pagos_consultas IS 'se debe crear una tabla de deudas_consultas';


--
-- Name: parentezcos; Type: TABLE; Schema: paracelso; Owner: paracelso
--

CREATE TABLE parentezcos (
    id_parentezco integer NOT NULL,
    id_historia bigint,
    id_bitacora bigint,
    tipo_parentezco character varying(4),
    nota character varying(255),
    estado character varying(3)
);


ALTER TABLE parentezcos OWNER TO paracelso;

--
-- Name: parentezcos_id_parentezco_seq; Type: SEQUENCE; Schema: paracelso; Owner: paracelso
--

CREATE SEQUENCE parentezcos_id_parentezco_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE parentezcos_id_parentezco_seq OWNER TO paracelso;

--
-- Name: parentezcos_id_parentezco_seq; Type: SEQUENCE OWNED BY; Schema: paracelso; Owner: paracelso
--

ALTER SEQUENCE parentezcos_id_parentezco_seq OWNED BY parentezcos.id_parentezco;


--
-- Name: password_resets; Type: TABLE; Schema: paracelso; Owner: postgres
--

CREATE TABLE password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE password_resets OWNER TO postgres;

--
-- Name: patologicos; Type: TABLE; Schema: paracelso; Owner: paracelso
--

CREATE TABLE patologicos (
    id_patologico integer NOT NULL,
    id_historia bigint NOT NULL,
    id_bitacora bigint NOT NULL,
    tipo_enfermedad character varying(4),
    fecha date,
    diagnostico character varying(100),
    tratamiento character varying(200),
    cirugia character varying(100),
    estado character varying(3)
);


ALTER TABLE patologicos OWNER TO paracelso;

--
-- Name: COLUMN patologicos.tipo_enfermedad; Type: COMMENT; Schema: paracelso; Owner: paracelso
--

COMMENT ON COLUMN patologicos.tipo_enfermedad IS 'puede ser medica o quirurgicas ';


--
-- Name: patologicos_id_patologico_seq; Type: SEQUENCE; Schema: paracelso; Owner: paracelso
--

CREATE SEQUENCE patologicos_id_patologico_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE patologicos_id_patologico_seq OWNER TO paracelso;

--
-- Name: patologicos_id_patologico_seq; Type: SEQUENCE OWNED BY; Schema: paracelso; Owner: paracelso
--

ALTER SEQUENCE patologicos_id_patologico_seq OWNED BY patologicos.id_patologico;


--
-- Name: personas; Type: TABLE; Schema: paracelso; Owner: paracelso
--

CREATE TABLE personas (
    id_persona integer NOT NULL,
    id_bitacora bigint,
    nombre character varying(50) NOT NULL,
    ap_paterno character varying(50) NOT NULL,
    ap_materno character varying(50),
    fecha_nacimiento date,
    documento_identidad character varying(10),
    tipo_documento character varying(4),
    sexo character varying(2),
    email character varying(100),
    no_telefono character varying(10),
    no_celular character varying(10),
    direccion character varying(100),
    ciudad_residencia character varying(50),
    lugar_nacimiento character varying(50),
    estado character varying(3)
);


ALTER TABLE personas OWNER TO paracelso;

--
-- Name: personas_id_persona_seq; Type: SEQUENCE; Schema: paracelso; Owner: paracelso
--

CREATE SEQUENCE personas_id_persona_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE personas_id_persona_seq OWNER TO paracelso;

--
-- Name: personas_id_persona_seq; Type: SEQUENCE OWNED BY; Schema: paracelso; Owner: paracelso
--

ALTER SEQUENCE personas_id_persona_seq OWNED BY personas.id_persona;


--
-- Name: personas_imagenes; Type: TABLE; Schema: paracelso; Owner: paracelso
--

CREATE TABLE personas_imagenes (
    id_persona bigint,
    imagen bytea,
    estado character varying(3)
);


ALTER TABLE personas_imagenes OWNER TO paracelso;

--
-- Name: respaldos_evaluaciones; Type: TABLE; Schema: paracelso; Owner: paracelso
--

CREATE TABLE respaldos_evaluaciones (
    id_respaldo_evaluacion integer NOT NULL,
    id_evaluacion bigint,
    imagen_respaldo bytea,
    estado character varying(2)
);


ALTER TABLE respaldos_evaluaciones OWNER TO paracelso;

--
-- Name: respaldos_evaluaciones_id_respaldo_evaluacion_seq; Type: SEQUENCE; Schema: paracelso; Owner: paracelso
--

CREATE SEQUENCE respaldos_evaluaciones_id_respaldo_evaluacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE respaldos_evaluaciones_id_respaldo_evaluacion_seq OWNER TO paracelso;

--
-- Name: respaldos_evaluaciones_id_respaldo_evaluacion_seq; Type: SEQUENCE OWNED BY; Schema: paracelso; Owner: paracelso
--

ALTER SEQUENCE respaldos_evaluaciones_id_respaldo_evaluacion_seq OWNED BY respaldos_evaluaciones.id_respaldo_evaluacion;


--
-- Name: resultados_gabinetes; Type: TABLE; Schema: paracelso; Owner: paracelso
--

CREATE TABLE resultados_gabinetes (
    id_resultado_gabinete integer NOT NULL,
    id_orden_gabinete bigint,
    id_bitacora bigint,
    resultado character varying(500),
    estado character varying(500)
);


ALTER TABLE resultados_gabinetes OWNER TO paracelso;

--
-- Name: resultados_gabinetes_id_resultado_gabinete_seq; Type: SEQUENCE; Schema: paracelso; Owner: paracelso
--

CREATE SEQUENCE resultados_gabinetes_id_resultado_gabinete_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE resultados_gabinetes_id_resultado_gabinete_seq OWNER TO paracelso;

--
-- Name: resultados_gabinetes_id_resultado_gabinete_seq; Type: SEQUENCE OWNED BY; Schema: paracelso; Owner: paracelso
--

ALTER SEQUENCE resultados_gabinetes_id_resultado_gabinete_seq OWNED BY resultados_gabinetes.id_resultado_gabinete;


--
-- Name: resultados_laboratorios; Type: TABLE; Schema: paracelso; Owner: paracelso
--

CREATE TABLE resultados_laboratorios (
    id_resultado_laboratorio integer NOT NULL,
    id_orden_laboratorio integer,
    fecha date,
    resultado character varying(500),
    estado character varying(3)
);


ALTER TABLE resultados_laboratorios OWNER TO paracelso;

--
-- Name: resultados_laboratorios_id_resultado_laboratorio_seq; Type: SEQUENCE; Schema: paracelso; Owner: paracelso
--

CREATE SEQUENCE resultados_laboratorios_id_resultado_laboratorio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE resultados_laboratorios_id_resultado_laboratorio_seq OWNER TO paracelso;

--
-- Name: resultados_laboratorios_id_resultado_laboratorio_seq; Type: SEQUENCE OWNED BY; Schema: paracelso; Owner: paracelso
--

ALTER SEQUENCE resultados_laboratorios_id_resultado_laboratorio_seq OWNED BY resultados_laboratorios.id_resultado_laboratorio;


--
-- Name: revisiones; Type: TABLE; Schema: paracelso; Owner: paracelso
--

CREATE TABLE revisiones (
    id_revision integer NOT NULL,
    id_consulta bigint NOT NULL,
    id_bitacora bigint NOT NULL,
    fecha date NOT NULL,
    antecedentes character varying(1000),
    observaciones character varying(1000),
    presion_diastolica smallint,
    presion_sistolica smallint NOT NULL,
    frecuencia_cardiaca numeric,
    frecuencia_respiratoria numeric,
    temperatura numeric(3,2) NOT NULL,
    peso numeric(5,2) NOT NULL,
    estatura numeric(3,2) NOT NULL,
    estado character varying(3) NOT NULL
);


ALTER TABLE revisiones OWNER TO paracelso;

--
-- Name: revisiones_id_revision_seq; Type: SEQUENCE; Schema: paracelso; Owner: paracelso
--

CREATE SEQUENCE revisiones_id_revision_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE revisiones_id_revision_seq OWNER TO paracelso;

--
-- Name: revisiones_id_revision_seq; Type: SEQUENCE OWNED BY; Schema: paracelso; Owner: paracelso
--

ALTER SEQUENCE revisiones_id_revision_seq OWNED BY revisiones.id_revision;


--
-- Name: roles; Type: TABLE; Schema: paracelso; Owner: paracelso
--

CREATE TABLE roles (
    id_rol integer NOT NULL,
    nombre character varying(60),
    descripcion character varying(255),
    enlace character varying(100),
    nivel smallint,
    codigo bigint,
    orden integer,
    estado character varying(3)
);


ALTER TABLE roles OWNER TO paracelso;

--
-- Name: roles_id_rol_seq; Type: SEQUENCE; Schema: paracelso; Owner: paracelso
--

CREATE SEQUENCE roles_id_rol_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE roles_id_rol_seq OWNER TO paracelso;

--
-- Name: roles_id_rol_seq; Type: SEQUENCE OWNED BY; Schema: paracelso; Owner: paracelso
--

ALTER SEQUENCE roles_id_rol_seq OWNED BY roles.id_rol;


--
-- Name: tratamientos; Type: TABLE; Schema: paracelso; Owner: paracelso
--

CREATE TABLE tratamientos (
    id_tratamiento integer NOT NULL,
    id_consulta bigint NOT NULL,
    id_bitacora bigint NOT NULL,
    tipo_tratamiento character varying(4),
    prescripcion character varying(300) NOT NULL,
    codigo_medicamento bigint NOT NULL,
    fecha timestamp without time zone NOT NULL,
    estado character varying(2) NOT NULL
);


ALTER TABLE tratamientos OWNER TO paracelso;

--
-- Name: tratamientos_id_tratamiento_seq; Type: SEQUENCE; Schema: paracelso; Owner: paracelso
--

CREATE SEQUENCE tratamientos_id_tratamiento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tratamientos_id_tratamiento_seq OWNER TO paracelso;

--
-- Name: tratamientos_id_tratamiento_seq; Type: SEQUENCE OWNED BY; Schema: paracelso; Owner: paracelso
--

ALTER SEQUENCE tratamientos_id_tratamiento_seq OWNED BY tratamientos.id_tratamiento;


--
-- Name: users; Type: TABLE; Schema: paracelso; Owner: postgres
--

CREATE TABLE users (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: paracelso; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: paracelso; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: usuarios; Type: TABLE; Schema: paracelso; Owner: paracelso
--

CREATE TABLE usuarios (
    id_usuario integer NOT NULL,
    id_usuario_origen bigint,
    username character varying(30),
    password character varying(100),
    email character varying(10),
    creado_en character varying(3),
    actualizado_en date,
    estado character varying(3)
);


ALTER TABLE usuarios OWNER TO paracelso;

--
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE; Schema: paracelso; Owner: paracelso
--

CREATE SEQUENCE usuarios_id_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usuarios_id_usuario_seq OWNER TO paracelso;

--
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: paracelso; Owner: paracelso
--

ALTER SEQUENCE usuarios_id_usuario_seq OWNED BY usuarios.id_usuario;


--
-- Name: usuarios_personas; Type: TABLE; Schema: paracelso; Owner: paracelso
--

CREATE TABLE usuarios_personas (
    id_dato_usuario integer NOT NULL,
    id_usuario integer,
    id_persona integer,
    fecha date,
    estado character varying(3)
);


ALTER TABLE usuarios_personas OWNER TO paracelso;

--
-- Name: usuarios_personas_id_dato_usuario_seq; Type: SEQUENCE; Schema: paracelso; Owner: paracelso
--

CREATE SEQUENCE usuarios_personas_id_dato_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usuarios_personas_id_dato_usuario_seq OWNER TO paracelso;

--
-- Name: usuarios_personas_id_dato_usuario_seq; Type: SEQUENCE OWNED BY; Schema: paracelso; Owner: paracelso
--

ALTER SEQUENCE usuarios_personas_id_dato_usuario_seq OWNED BY usuarios_personas.id_dato_usuario;


--
-- Name: usuarios_roles; Type: TABLE; Schema: paracelso; Owner: paracelso
--

CREATE TABLE usuarios_roles (
    id_usuario bigint,
    id_rol bigint,
    fecha_asignacion timestamp without time zone,
    codigo bigint,
    estado character varying(3)
);


ALTER TABLE usuarios_roles OWNER TO paracelso;

SET search_path = public, pg_catalog;

--
-- Name: no_patologicos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE no_patologicos (
    id_no_patologico integer NOT NULL,
    id_historia bigint,
    id_bitacora bigint,
    grupo_sanguineo character varying(6),
    tipo_habito character varying(4),
    descripcion character varying(100),
    estado character varying(3)
);


ALTER TABLE no_patologicos OWNER TO postgres;

--
-- Name: COLUMN no_patologicos.grupo_sanguineo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN no_patologicos.grupo_sanguineo IS 'A B AB O - + EN ESTA TABLA NO SERIA UN CAMPO ADECUADO YA QUE SE REPETIRIA VARIAS VECES';


--
-- Name: COLUMN no_patologicos.tipo_habito; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN no_patologicos.tipo_habito IS 'tabaquismo alcoholismo adicciones';


--
-- Name: no_patologicos_id_no_patologico_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE no_patologicos_id_no_patologico_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE no_patologicos_id_no_patologico_seq OWNER TO postgres;

--
-- Name: no_patologicos_id_no_patologico_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE no_patologicos_id_no_patologico_seq OWNED BY no_patologicos.id_no_patologico;


--
-- Name: patologicos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE patologicos (
    id_patologico integer NOT NULL,
    id_historia bigint,
    id_bitacora bigint,
    tipo_enfermedad character varying(4),
    fecha date,
    diagnostico character varying(100),
    tratamiento character varying(200),
    cirugia character varying(100),
    estado character varying(3)
);


ALTER TABLE patologicos OWNER TO postgres;

--
-- Name: COLUMN patologicos.tipo_enfermedad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN patologicos.tipo_enfermedad IS 'puede ser medica o quirurgicas ';


--
-- Name: patologicos_id_patologico_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE patologicos_id_patologico_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE patologicos_id_patologico_seq OWNER TO postgres;

--
-- Name: patologicos_id_patologico_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE patologicos_id_patologico_seq OWNED BY patologicos.id_patologico;


SET search_path = paracelso, pg_catalog;

--
-- Name: id_alergia; Type: DEFAULT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY alergias ALTER COLUMN id_alergia SET DEFAULT nextval('alergias_id_alergia_seq'::regclass);


--
-- Name: id_anamnesis; Type: DEFAULT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY anamnesis ALTER COLUMN id_anamnesis SET DEFAULT nextval('anamnesis_id_anamnesis_seq'::regclass);


--
-- Name: id_bitacora; Type: DEFAULT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY bitacoras ALTER COLUMN id_bitacora SET DEFAULT nextval('bitacoras_id_bitacora_seq'::regclass);


--
-- Name: id_consulta; Type: DEFAULT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY consultas ALTER COLUMN id_consulta SET DEFAULT nextval('consultas_id_consulta_seq'::regclass);


--
-- Name: id_deuda; Type: DEFAULT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY deudas_consultas ALTER COLUMN id_deuda SET DEFAULT nextval('deudas_consultas_id_deuda_seq'::regclass);


--
-- Name: id_diagnostico; Type: DEFAULT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY diagnosticos ALTER COLUMN id_diagnostico SET DEFAULT nextval('diagnosticos_id_diagnostico_seq'::regclass);


--
-- Name: id_evaluacion; Type: DEFAULT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY evaluaciones ALTER COLUMN id_evaluacion SET DEFAULT nextval('evaluaciones_id_evaluacion_seq'::regclass);


--
-- Name: id_historia; Type: DEFAULT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY historias_clinicas ALTER COLUMN id_historia SET DEFAULT nextval('historias_clinicas_id_historia_seq'::regclass);


--
-- Name: id_resultado_gabinete; Type: DEFAULT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY imagenes_gabinetes ALTER COLUMN id_resultado_gabinete SET DEFAULT nextval('imagenes_gabinetes_id_resultado_gabinete_seq'::regclass);


--
-- Name: id_medico; Type: DEFAULT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY medicos ALTER COLUMN id_medico SET DEFAULT nextval('medicos_id_medico_seq'::regclass);


--
-- Name: id_no_patologico; Type: DEFAULT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY no_patologicos ALTER COLUMN id_no_patologico SET DEFAULT nextval('no_patologicos_id_no_patologico_seq'::regclass);


--
-- Name: id_obstetricia; Type: DEFAULT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY obstetricias ALTER COLUMN id_obstetricia SET DEFAULT nextval('obstetricias_id_obstetricia_seq'::regclass);


--
-- Name: id_opcion; Type: DEFAULT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY opciones ALTER COLUMN id_opcion SET DEFAULT nextval('opciones_id_opcion_seq'::regclass);


--
-- Name: id_orden_laboratorio; Type: DEFAULT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY ordenes_laboratorios ALTER COLUMN id_orden_laboratorio SET DEFAULT nextval('ordenes_laboratorios_id_orden_laboratorio_seq'::regclass);


--
-- Name: id_comision; Type: DEFAULT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY pa_comisiones ALTER COLUMN id_comision SET DEFAULT nextval('pa_comisiones_id_comision_seq'::regclass);


--
-- Name: id_institucion; Type: DEFAULT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY pa_instituciones ALTER COLUMN id_institucion SET DEFAULT nextval('pa_instituciones_id_institucion_seq'::regclass);


--
-- Name: id_paciente; Type: DEFAULT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY pacientes ALTER COLUMN id_paciente SET DEFAULT nextval('pacientes_id_paciente_seq'::regclass);


--
-- Name: id_parentezco; Type: DEFAULT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY parentezcos ALTER COLUMN id_parentezco SET DEFAULT nextval('parentezcos_id_parentezco_seq'::regclass);


--
-- Name: id_patologico; Type: DEFAULT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY patologicos ALTER COLUMN id_patologico SET DEFAULT nextval('patologicos_id_patologico_seq'::regclass);


--
-- Name: id_persona; Type: DEFAULT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY personas ALTER COLUMN id_persona SET DEFAULT nextval('personas_id_persona_seq'::regclass);


--
-- Name: id_respaldo_evaluacion; Type: DEFAULT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY respaldos_evaluaciones ALTER COLUMN id_respaldo_evaluacion SET DEFAULT nextval('respaldos_evaluaciones_id_respaldo_evaluacion_seq'::regclass);


--
-- Name: id_resultado_gabinete; Type: DEFAULT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY resultados_gabinetes ALTER COLUMN id_resultado_gabinete SET DEFAULT nextval('resultados_gabinetes_id_resultado_gabinete_seq'::regclass);


--
-- Name: id_resultado_laboratorio; Type: DEFAULT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY resultados_laboratorios ALTER COLUMN id_resultado_laboratorio SET DEFAULT nextval('resultados_laboratorios_id_resultado_laboratorio_seq'::regclass);


--
-- Name: id_revision; Type: DEFAULT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY revisiones ALTER COLUMN id_revision SET DEFAULT nextval('revisiones_id_revision_seq'::regclass);


--
-- Name: id_rol; Type: DEFAULT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY roles ALTER COLUMN id_rol SET DEFAULT nextval('roles_id_rol_seq'::regclass);


--
-- Name: id_tratamiento; Type: DEFAULT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY tratamientos ALTER COLUMN id_tratamiento SET DEFAULT nextval('tratamientos_id_tratamiento_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: paracelso; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id_usuario; Type: DEFAULT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY usuarios ALTER COLUMN id_usuario SET DEFAULT nextval('usuarios_id_usuario_seq'::regclass);


--
-- Name: id_dato_usuario; Type: DEFAULT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY usuarios_personas ALTER COLUMN id_dato_usuario SET DEFAULT nextval('usuarios_personas_id_dato_usuario_seq'::regclass);


SET search_path = public, pg_catalog;

--
-- Name: id_no_patologico; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY no_patologicos ALTER COLUMN id_no_patologico SET DEFAULT nextval('no_patologicos_id_no_patologico_seq'::regclass);


--
-- Name: id_patologico; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY patologicos ALTER COLUMN id_patologico SET DEFAULT nextval('patologicos_id_patologico_seq'::regclass);


SET search_path = paracelso, pg_catalog;

--
-- Data for Name: alergias; Type: TABLE DATA; Schema: paracelso; Owner: paracelso
--

COPY alergias (id_alergia, id_historia, id_bitacora, tipo_alergia, nota, estado) FROM stdin;
\.


--
-- Name: alergias_id_alergia_seq; Type: SEQUENCE SET; Schema: paracelso; Owner: paracelso
--

SELECT pg_catalog.setval('alergias_id_alergia_seq', 1, false);


--
-- Data for Name: anamnesis; Type: TABLE DATA; Schema: paracelso; Owner: paracelso
--

COPY anamnesis (id_anamnesis, id_historia, id_bitacora, tipo, descripcion, estado) FROM stdin;
\.


--
-- Name: anamnesis_id_anamnesis_seq; Type: SEQUENCE SET; Schema: paracelso; Owner: paracelso
--

SELECT pg_catalog.setval('anamnesis_id_anamnesis_seq', 1, false);


--
-- Data for Name: bitacoras; Type: TABLE DATA; Schema: paracelso; Owner: paracelso
--

COPY bitacoras (id_bitacora, codigo_transaccion, id_usuario, fecha, estado) FROM stdin;
1	100	1	2016-06-09 00:00:00	AC
3	100	1	2016-06-13 04:59:14	AC
4	100	1	2016-06-13 05:00:33	AC
5	100	1	2016-06-13 05:00:37	AC
6	100	1	2016-06-13 05:02:07	AC
7	100	1	2016-06-15 03:42:35	AC
9	100	2	2016-06-15 04:04:01	AC
\.


--
-- Name: bitacoras_id_bitacora_seq; Type: SEQUENCE SET; Schema: paracelso; Owner: paracelso
--

SELECT pg_catalog.setval('bitacoras_id_bitacora_seq', 9, true);


--
-- Data for Name: consultas; Type: TABLE DATA; Schema: paracelso; Owner: paracelso
--

COPY consultas (id_consulta, id_bitacora, id_persona, id_medico, id_receptor, id_consultorio, codigo_institucion, tipo_consulta, motivo, historia, fecha, hora, fecha_inicio, hora_inicio, hora_fin, estado) FROM stdin;
\.


--
-- Name: consultas_id_consulta_seq; Type: SEQUENCE SET; Schema: paracelso; Owner: paracelso
--

SELECT pg_catalog.setval('consultas_id_consulta_seq', 1, false);


--
-- Data for Name: deudas_consultas; Type: TABLE DATA; Schema: paracelso; Owner: paracelso
--

COPY deudas_consultas (id_deuda, id_persona, id_consulta, codigo_institucion, fecha_generacion, monto, concepto, estado) FROM stdin;
\.


--
-- Name: deudas_consultas_id_deuda_seq; Type: SEQUENCE SET; Schema: paracelso; Owner: paracelso
--

SELECT pg_catalog.setval('deudas_consultas_id_deuda_seq', 1, false);


--
-- Data for Name: diagnosticos; Type: TABLE DATA; Schema: paracelso; Owner: paracelso
--

COPY diagnosticos (id_diagnostico, id_evaluacion, id_bitacora, tipo_diagnostico, codigo_cie, descripcion, estado) FROM stdin;
\.


--
-- Name: diagnosticos_id_diagnostico_seq; Type: SEQUENCE SET; Schema: paracelso; Owner: paracelso
--

SELECT pg_catalog.setval('diagnosticos_id_diagnostico_seq', 1, false);


--
-- Data for Name: evaluaciones; Type: TABLE DATA; Schema: paracelso; Owner: paracelso
--

COPY evaluaciones (id_evaluacion, id_consulta, id_bitacora, laboratorio, gabinete, estado) FROM stdin;
\.


--
-- Name: evaluaciones_id_evaluacion_seq; Type: SEQUENCE SET; Schema: paracelso; Owner: paracelso
--

SELECT pg_catalog.setval('evaluaciones_id_evaluacion_seq', 1, false);


--
-- Data for Name: historias_clinicas; Type: TABLE DATA; Schema: paracelso; Owner: paracelso
--

COPY historias_clinicas (id_historia, id_medico, id_bitacora, id_persona, codigo_institucion, fecha, hora, nota, estado) FROM stdin;
\.


--
-- Name: historias_clinicas_id_historia_seq; Type: SEQUENCE SET; Schema: paracelso; Owner: paracelso
--

SELECT pg_catalog.setval('historias_clinicas_id_historia_seq', 1, false);


--
-- Data for Name: imagenes_gabinetes; Type: TABLE DATA; Schema: paracelso; Owner: paracelso
--

COPY imagenes_gabinetes (id_resultado_gabinete, imagen, estado) FROM stdin;
\.


--
-- Name: imagenes_gabinetes_id_resultado_gabinete_seq; Type: SEQUENCE SET; Schema: paracelso; Owner: paracelso
--

SELECT pg_catalog.setval('imagenes_gabinetes_id_resultado_gabinete_seq', 1, false);


--
-- Data for Name: medicos; Type: TABLE DATA; Schema: paracelso; Owner: paracelso
--

COPY medicos (id_medico, id_persona, codigo_especialidad, matricula_min_salud, matricula_col_medico, ranking, alma_mater, estado) FROM stdin;
\.


--
-- Name: medicos_id_medico_seq; Type: SEQUENCE SET; Schema: paracelso; Owner: paracelso
--

SELECT pg_catalog.setval('medicos_id_medico_seq', 1, false);


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: paracelso; Owner: postgres
--

COPY migrations (migration, batch) FROM stdin;
2014_10_12_000000_create_users_table	1
2014_10_12_100000_create_password_resets_table	1
\.


--
-- Data for Name: no_patologicos; Type: TABLE DATA; Schema: paracelso; Owner: paracelso
--

COPY no_patologicos (id_no_patologico, id_historia, id_bitacora, grupo_sanguineo, tipo_habito, descripcion, estado) FROM stdin;
\.


--
-- Name: no_patologicos_id_no_patologico_seq; Type: SEQUENCE SET; Schema: paracelso; Owner: paracelso
--

SELECT pg_catalog.setval('no_patologicos_id_no_patologico_seq', 1, false);


--
-- Data for Name: obstetricias; Type: TABLE DATA; Schema: paracelso; Owner: paracelso
--

COPY obstetricias (id_obstetricia, id_historia, id_bitacora, fecha_menarca, ritmo, fum, metodo_anticonceptivo, fup, no_embarazos, no_partos, no_cesareas, no_abortos, observaciones, estado) FROM stdin;
\.


--
-- Name: obstetricias_id_obstetricia_seq; Type: SEQUENCE SET; Schema: paracelso; Owner: paracelso
--

SELECT pg_catalog.setval('obstetricias_id_obstetricia_seq', 1, false);


--
-- Data for Name: opciones; Type: TABLE DATA; Schema: paracelso; Owner: paracelso
--

COPY opciones (id_opcion, descripcion, url, fecha_registro, nsec_opcion, prioridad, estado) FROM stdin;
\.


--
-- Name: opciones_id_opcion_seq; Type: SEQUENCE SET; Schema: paracelso; Owner: paracelso
--

SELECT pg_catalog.setval('opciones_id_opcion_seq', 1, false);


--
-- Data for Name: opciones_roles; Type: TABLE DATA; Schema: paracelso; Owner: paracelso
--

COPY opciones_roles (id_opcion, id_rol, estado) FROM stdin;
\.


--
-- Data for Name: ordenes_gabinetes; Type: TABLE DATA; Schema: paracelso; Owner: paracelso
--

COPY ordenes_gabinetes (id_orden_gabinete, id_consulta, id_bitacora, tipo_gabinete, orden, fecha, estado) FROM stdin;
\.


--
-- Data for Name: ordenes_laboratorios; Type: TABLE DATA; Schema: paracelso; Owner: paracelso
--

COPY ordenes_laboratorios (id_orden_laboratorio, id_consulta, id_bitacora, tipo_laboratorio, orden, fecha, estado) FROM stdin;
\.


--
-- Name: ordenes_laboratorios_id_orden_laboratorio_seq; Type: SEQUENCE SET; Schema: paracelso; Owner: paracelso
--

SELECT pg_catalog.setval('ordenes_laboratorios_id_orden_laboratorio_seq', 1, false);


--
-- Data for Name: pa_cie10; Type: TABLE DATA; Schema: paracelso; Owner: paracelso
--

COPY pa_cie10 (codigo_cie, descripcion, grupo, estado) FROM stdin;
\.


--
-- Data for Name: pa_comisiones; Type: TABLE DATA; Schema: paracelso; Owner: paracelso
--

COPY pa_comisiones (id_comision, id_institucion, fecha, comision, estado) FROM stdin;
\.


--
-- Name: pa_comisiones_id_comision_seq; Type: SEQUENCE SET; Schema: paracelso; Owner: paracelso
--

SELECT pg_catalog.setval('pa_comisiones_id_comision_seq', 1, false);


--
-- Data for Name: pa_diagnosticos; Type: TABLE DATA; Schema: paracelso; Owner: paracelso
--

COPY pa_diagnosticos (codigo_diagnostico, codigo_cie, nombre, descripcion, tratamiento, estado) FROM stdin;
\.


--
-- Data for Name: pa_dominios; Type: TABLE DATA; Schema: paracelso; Owner: paracelso
--

COPY pa_dominios (codigo_dominio, nombre, descripcion, estado) FROM stdin;
\.


--
-- Data for Name: pa_instituciones; Type: TABLE DATA; Schema: paracelso; Owner: paracelso
--

COPY pa_instituciones (id_institucion, codigo_institucion, tipo_institucion, nombre, descripcion, direccion, estado) FROM stdin;
\.


--
-- Name: pa_instituciones_id_institucion_seq; Type: SEQUENCE SET; Schema: paracelso; Owner: paracelso
--

SELECT pg_catalog.setval('pa_instituciones_id_institucion_seq', 1, false);


--
-- Data for Name: pa_medicamentos; Type: TABLE DATA; Schema: paracelso; Owner: paracelso
--

COPY pa_medicamentos (codigo_medicamento, nombre_comercial, nombre_medico, codigo_marca, posologia, presentacion, estado) FROM stdin;
\.


--
-- Data for Name: pa_transacciones; Type: TABLE DATA; Schema: paracelso; Owner: paracelso
--

COPY pa_transacciones (codigo_transaccion, descripcion, abreviacion, fecha, estado) FROM stdin;
100	Registro Persona	RP	2016-06-09 00:00:00	AC
\.


--
-- Data for Name: pacientes; Type: TABLE DATA; Schema: paracelso; Owner: paracelso
--

COPY pacientes (id_paciente, id_persona, codigo_institucion, codigo_seguro, matricula_seguro, religion, observaciones, estado) FROM stdin;
\.


--
-- Name: pacientes_id_paciente_seq; Type: SEQUENCE SET; Schema: paracelso; Owner: paracelso
--

SELECT pg_catalog.setval('pacientes_id_paciente_seq', 1, false);


--
-- Data for Name: pagos_consultas; Type: TABLE DATA; Schema: paracelso; Owner: paracelso
--

COPY pagos_consultas (id_pago, id_deuda, codigo_institucion, forma_pago, fecha, monto, comision, estado) FROM stdin;
\.


--
-- Data for Name: parentezcos; Type: TABLE DATA; Schema: paracelso; Owner: paracelso
--

COPY parentezcos (id_parentezco, id_historia, id_bitacora, tipo_parentezco, nota, estado) FROM stdin;
\.


--
-- Name: parentezcos_id_parentezco_seq; Type: SEQUENCE SET; Schema: paracelso; Owner: paracelso
--

SELECT pg_catalog.setval('parentezcos_id_parentezco_seq', 1, false);


--
-- Data for Name: password_resets; Type: TABLE DATA; Schema: paracelso; Owner: postgres
--

COPY password_resets (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: patologicos; Type: TABLE DATA; Schema: paracelso; Owner: paracelso
--

COPY patologicos (id_patologico, id_historia, id_bitacora, tipo_enfermedad, fecha, diagnostico, tratamiento, cirugia, estado) FROM stdin;
\.


--
-- Name: patologicos_id_patologico_seq; Type: SEQUENCE SET; Schema: paracelso; Owner: paracelso
--

SELECT pg_catalog.setval('patologicos_id_patologico_seq', 1, false);


--
-- Data for Name: personas; Type: TABLE DATA; Schema: paracelso; Owner: paracelso
--

COPY personas (id_persona, id_bitacora, nombre, ap_paterno, ap_materno, fecha_nacimiento, documento_identidad, tipo_documento, sexo, email, no_telefono, no_celular, direccion, ciudad_residencia, lugar_nacimiento, estado) FROM stdin;
1	1	Jaime	Espinoza	Choque	\N	\N	\N	\N	Jaime@mail.com	782312	\N	Universo	\N	\N	AC
2	1	Damian	Espinoza	Choque	\N	\N	\N	\N	damian@mail.com	782312	\N	Universo	\N	\N	AC
3	1	Ariel	Ibarra	Veizaga	\N	\N	\N	\N	ariel@mail.com	782312	\N	Universo	\N	\N	AC
4	9	MARIA	EXALTACION	ESPINOZA	\N	6394545	CI	\N	\N	2782312	68045666	Universo	\N	\N	AC
5	9	JULIAN	JIMENEZ	PEREZ	\N	77777	PS	\N	\N	247555	874566	Universo	\N	\N	AC
6	9	pedro	loayza	zarate	\N	477091212	ci	\N	\N	2121212	55454	Universo	\N	\N	AC
\.


--
-- Name: personas_id_persona_seq; Type: SEQUENCE SET; Schema: paracelso; Owner: paracelso
--

SELECT pg_catalog.setval('personas_id_persona_seq', 6, true);


--
-- Data for Name: personas_imagenes; Type: TABLE DATA; Schema: paracelso; Owner: paracelso
--

COPY personas_imagenes (id_persona, imagen, estado) FROM stdin;
\.


--
-- Data for Name: respaldos_evaluaciones; Type: TABLE DATA; Schema: paracelso; Owner: paracelso
--

COPY respaldos_evaluaciones (id_respaldo_evaluacion, id_evaluacion, imagen_respaldo, estado) FROM stdin;
\.


--
-- Name: respaldos_evaluaciones_id_respaldo_evaluacion_seq; Type: SEQUENCE SET; Schema: paracelso; Owner: paracelso
--

SELECT pg_catalog.setval('respaldos_evaluaciones_id_respaldo_evaluacion_seq', 1, false);


--
-- Data for Name: resultados_gabinetes; Type: TABLE DATA; Schema: paracelso; Owner: paracelso
--

COPY resultados_gabinetes (id_resultado_gabinete, id_orden_gabinete, id_bitacora, resultado, estado) FROM stdin;
\.


--
-- Name: resultados_gabinetes_id_resultado_gabinete_seq; Type: SEQUENCE SET; Schema: paracelso; Owner: paracelso
--

SELECT pg_catalog.setval('resultados_gabinetes_id_resultado_gabinete_seq', 1, false);


--
-- Data for Name: resultados_laboratorios; Type: TABLE DATA; Schema: paracelso; Owner: paracelso
--

COPY resultados_laboratorios (id_resultado_laboratorio, id_orden_laboratorio, fecha, resultado, estado) FROM stdin;
\.


--
-- Name: resultados_laboratorios_id_resultado_laboratorio_seq; Type: SEQUENCE SET; Schema: paracelso; Owner: paracelso
--

SELECT pg_catalog.setval('resultados_laboratorios_id_resultado_laboratorio_seq', 1, false);


--
-- Data for Name: revisiones; Type: TABLE DATA; Schema: paracelso; Owner: paracelso
--

COPY revisiones (id_revision, id_consulta, id_bitacora, fecha, antecedentes, observaciones, presion_diastolica, presion_sistolica, frecuencia_cardiaca, frecuencia_respiratoria, temperatura, peso, estatura, estado) FROM stdin;
\.


--
-- Name: revisiones_id_revision_seq; Type: SEQUENCE SET; Schema: paracelso; Owner: paracelso
--

SELECT pg_catalog.setval('revisiones_id_revision_seq', 1, false);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: paracelso; Owner: paracelso
--

COPY roles (id_rol, nombre, descripcion, enlace, nivel, codigo, orden, estado) FROM stdin;
\.


--
-- Name: roles_id_rol_seq; Type: SEQUENCE SET; Schema: paracelso; Owner: paracelso
--

SELECT pg_catalog.setval('roles_id_rol_seq', 1, false);


--
-- Data for Name: tratamientos; Type: TABLE DATA; Schema: paracelso; Owner: paracelso
--

COPY tratamientos (id_tratamiento, id_consulta, id_bitacora, tipo_tratamiento, prescripcion, codigo_medicamento, fecha, estado) FROM stdin;
\.


--
-- Name: tratamientos_id_tratamiento_seq; Type: SEQUENCE SET; Schema: paracelso; Owner: paracelso
--

SELECT pg_catalog.setval('tratamientos_id_tratamiento_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: paracelso; Owner: postgres
--

COPY users (id, name, email, password, remember_token, created_at, updated_at) FROM stdin;
1	Damian Espinoza	despinoza@mail.net	$2y$10$4MqULxRDOkzO.2qR22d2KOzuxUc.utTPsR6w4aN3Glo12OcREyL2O	gDFfYuEY92dyJHFmtBUzwhAqCdpWty31WBxyarRwNELUYaJhN17O5rdcli1u	2016-06-15 03:42:24	2016-06-15 03:42:28
2	Samuel Orellana	sorellana@mail.com	$2y$10$In5MbrxuZHOXQmjFRGt65umF0eVY9QTaECHeslFgX.ZhNJPuzXlI6	\N	2016-06-15 04:03:19	2016-06-15 04:03:19
3	Fabian Espinoza	fespinoza@gmail.com	$2y$10$vYmbJL6HV6xbtcwZqVa3v.HrEOwNt7bxIxG6ChtDNOrbOYCFnr13S	Rev7Q5PY1tORCHiqjOz3GLIica0C7a3h1DzCoKml0lx9nn6teE4vsyqU40dh	2016-06-18 19:53:22	2016-06-19 02:25:56
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: paracelso; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 3, true);


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: paracelso; Owner: paracelso
--

COPY usuarios (id_usuario, id_usuario_origen, username, password, email, creado_en, actualizado_en, estado) FROM stdin;
1	1	admparacelso	destruccion	\N	\N	\N	AC
\.


--
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE SET; Schema: paracelso; Owner: paracelso
--

SELECT pg_catalog.setval('usuarios_id_usuario_seq', 1, false);


--
-- Data for Name: usuarios_personas; Type: TABLE DATA; Schema: paracelso; Owner: paracelso
--

COPY usuarios_personas (id_dato_usuario, id_usuario, id_persona, fecha, estado) FROM stdin;
\.


--
-- Name: usuarios_personas_id_dato_usuario_seq; Type: SEQUENCE SET; Schema: paracelso; Owner: paracelso
--

SELECT pg_catalog.setval('usuarios_personas_id_dato_usuario_seq', 1, false);


--
-- Data for Name: usuarios_roles; Type: TABLE DATA; Schema: paracelso; Owner: paracelso
--

COPY usuarios_roles (id_usuario, id_rol, fecha_asignacion, codigo, estado) FROM stdin;
\.


SET search_path = public, pg_catalog;

--
-- Data for Name: no_patologicos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY no_patologicos (id_no_patologico, id_historia, id_bitacora, grupo_sanguineo, tipo_habito, descripcion, estado) FROM stdin;
\.


--
-- Name: no_patologicos_id_no_patologico_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('no_patologicos_id_no_patologico_seq', 1, false);


--
-- Data for Name: patologicos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY patologicos (id_patologico, id_historia, id_bitacora, tipo_enfermedad, fecha, diagnostico, tratamiento, cirugia, estado) FROM stdin;
\.


--
-- Name: patologicos_id_patologico_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('patologicos_id_patologico_seq', 1, false);


SET search_path = paracelso, pg_catalog;

--
-- Name: pk_alergias; Type: CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY alergias
    ADD CONSTRAINT pk_alergias PRIMARY KEY (id_alergia);


--
-- Name: pk_anamnesis; Type: CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY anamnesis
    ADD CONSTRAINT pk_anamnesis PRIMARY KEY (id_anamnesis);


--
-- Name: pk_bitacoras; Type: CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY bitacoras
    ADD CONSTRAINT pk_bitacoras PRIMARY KEY (id_bitacora);


--
-- Name: pk_consultas; Type: CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY consultas
    ADD CONSTRAINT pk_consultas PRIMARY KEY (id_consulta);


--
-- Name: pk_deudas_consultas; Type: CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY deudas_consultas
    ADD CONSTRAINT pk_deudas_consultas PRIMARY KEY (id_deuda);


--
-- Name: pk_diagnosticos; Type: CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY diagnosticos
    ADD CONSTRAINT pk_diagnosticos PRIMARY KEY (id_diagnostico);


--
-- Name: pk_evaluaciones; Type: CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY evaluaciones
    ADD CONSTRAINT pk_evaluaciones PRIMARY KEY (id_evaluacion);


--
-- Name: pk_historias_clinicas; Type: CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY historias_clinicas
    ADD CONSTRAINT pk_historias_clinicas PRIMARY KEY (id_historia);


--
-- Name: pk_imagenes_gabinetes; Type: CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY imagenes_gabinetes
    ADD CONSTRAINT pk_imagenes_gabinetes PRIMARY KEY (id_resultado_gabinete);


--
-- Name: pk_medicos; Type: CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY medicos
    ADD CONSTRAINT pk_medicos PRIMARY KEY (id_medico);


--
-- Name: pk_obstetricias; Type: CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY obstetricias
    ADD CONSTRAINT pk_obstetricias PRIMARY KEY (id_obstetricia);


--
-- Name: pk_opciones; Type: CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY opciones
    ADD CONSTRAINT pk_opciones PRIMARY KEY (id_opcion);


--
-- Name: pk_ordenes_gabinetes; Type: CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY ordenes_gabinetes
    ADD CONSTRAINT pk_ordenes_gabinetes PRIMARY KEY (id_orden_gabinete);


--
-- Name: pk_ordenes_laboratorios; Type: CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY ordenes_laboratorios
    ADD CONSTRAINT pk_ordenes_laboratorios PRIMARY KEY (id_orden_laboratorio);


--
-- Name: pk_pa_cie10; Type: CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY pa_cie10
    ADD CONSTRAINT pk_pa_cie10 PRIMARY KEY (codigo_cie);


--
-- Name: pk_pa_comisiones; Type: CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY pa_comisiones
    ADD CONSTRAINT pk_pa_comisiones PRIMARY KEY (id_comision);


--
-- Name: pk_pa_diagnosticos; Type: CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY pa_diagnosticos
    ADD CONSTRAINT pk_pa_diagnosticos PRIMARY KEY (codigo_diagnostico);


--
-- Name: pk_pa_dominio; Type: CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY pa_dominios
    ADD CONSTRAINT pk_pa_dominio PRIMARY KEY (codigo_dominio);


--
-- Name: pk_pa_instituciones; Type: CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY pa_instituciones
    ADD CONSTRAINT pk_pa_instituciones PRIMARY KEY (id_institucion);


--
-- Name: pk_pa_medicamentos; Type: CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY pa_medicamentos
    ADD CONSTRAINT pk_pa_medicamentos PRIMARY KEY (codigo_medicamento);


--
-- Name: pk_pa_transacciones; Type: CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY pa_transacciones
    ADD CONSTRAINT pk_pa_transacciones PRIMARY KEY (codigo_transaccion);


--
-- Name: pk_pacientes; Type: CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY pacientes
    ADD CONSTRAINT pk_pacientes PRIMARY KEY (id_paciente);


--
-- Name: pk_pagos_consultas; Type: CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY pagos_consultas
    ADD CONSTRAINT pk_pagos_consultas PRIMARY KEY (id_pago);


--
-- Name: pk_parentezcos; Type: CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY parentezcos
    ADD CONSTRAINT pk_parentezcos PRIMARY KEY (id_parentezco);


--
-- Name: pk_personas; Type: CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY personas
    ADD CONSTRAINT pk_personas PRIMARY KEY (id_persona);


--
-- Name: pk_respaldos_evaluaciones; Type: CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY respaldos_evaluaciones
    ADD CONSTRAINT pk_respaldos_evaluaciones PRIMARY KEY (id_respaldo_evaluacion);


--
-- Name: pk_resultados_gabinetes; Type: CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY resultados_gabinetes
    ADD CONSTRAINT pk_resultados_gabinetes PRIMARY KEY (id_resultado_gabinete);


--
-- Name: pk_resultados_laboratorios; Type: CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY resultados_laboratorios
    ADD CONSTRAINT pk_resultados_laboratorios PRIMARY KEY (id_resultado_laboratorio);


--
-- Name: pk_revisiones; Type: CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY revisiones
    ADD CONSTRAINT pk_revisiones PRIMARY KEY (id_revision);


--
-- Name: pk_roles; Type: CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT pk_roles PRIMARY KEY (id_rol);


--
-- Name: pk_tratamientos; Type: CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY tratamientos
    ADD CONSTRAINT pk_tratamientos PRIMARY KEY (id_tratamiento);


--
-- Name: pk_usuarios; Type: CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT pk_usuarios PRIMARY KEY (id_usuario);


--
-- Name: pk_usuarios_personas; Type: CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY usuarios_personas
    ADD CONSTRAINT pk_usuarios_personas PRIMARY KEY (id_dato_usuario);


--
-- Name: users_email_unique; Type: CONSTRAINT; Schema: paracelso; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: paracelso; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: password_resets_email_index; Type: INDEX; Schema: paracelso; Owner: postgres
--

CREATE INDEX password_resets_email_index ON password_resets USING btree (email);


--
-- Name: password_resets_token_index; Type: INDEX; Schema: paracelso; Owner: postgres
--

CREATE INDEX password_resets_token_index ON password_resets USING btree (token);


--
-- Name: fk_alergias_reference_historia; Type: FK CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY alergias
    ADD CONSTRAINT fk_alergias_reference_historia FOREIGN KEY (id_historia) REFERENCES historias_clinicas(id_historia) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_anamnesi_reference_historia; Type: FK CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY anamnesis
    ADD CONSTRAINT fk_anamnesi_reference_historia FOREIGN KEY (id_historia) REFERENCES historias_clinicas(id_historia) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_bitacora_reference_pa_trans; Type: FK CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY bitacoras
    ADD CONSTRAINT fk_bitacora_reference_pa_trans FOREIGN KEY (codigo_transaccion) REFERENCES pa_transacciones(codigo_transaccion) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_bitacora_reference_user; Type: FK CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY bitacoras
    ADD CONSTRAINT fk_bitacora_reference_user FOREIGN KEY (id_usuario) REFERENCES users(id);


--
-- Name: fk_consulta_reference_personas; Type: FK CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY consultas
    ADD CONSTRAINT fk_consulta_reference_personas FOREIGN KEY (id_persona) REFERENCES personas(id_persona) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_diagnost_reference_evaluaci; Type: FK CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY diagnosticos
    ADD CONSTRAINT fk_diagnost_reference_evaluaci FOREIGN KEY (id_evaluacion) REFERENCES evaluaciones(id_evaluacion) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_evaluaci_reference_consulta; Type: FK CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY evaluaciones
    ADD CONSTRAINT fk_evaluaci_reference_consulta FOREIGN KEY (id_consulta) REFERENCES consultas(id_consulta) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_historia_reference_personas; Type: FK CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY historias_clinicas
    ADD CONSTRAINT fk_historia_reference_personas FOREIGN KEY (id_persona) REFERENCES personas(id_persona) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_imagenes_reference_resultad; Type: FK CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY imagenes_gabinetes
    ADD CONSTRAINT fk_imagenes_reference_resultad FOREIGN KEY (id_resultado_gabinete) REFERENCES resultados_gabinetes(id_resultado_gabinete) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_medicos_reference_personas; Type: FK CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY medicos
    ADD CONSTRAINT fk_medicos_reference_personas FOREIGN KEY (id_persona) REFERENCES personas(id_persona) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_no_patol_reference_historia; Type: FK CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY no_patologicos
    ADD CONSTRAINT fk_no_patol_reference_historia FOREIGN KEY (id_historia) REFERENCES historias_clinicas(id_historia) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_obstetri_reference_historia; Type: FK CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY obstetricias
    ADD CONSTRAINT fk_obstetri_reference_historia FOREIGN KEY (id_historia) REFERENCES historias_clinicas(id_historia) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_opciones_reference_opciones; Type: FK CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY opciones_roles
    ADD CONSTRAINT fk_opciones_reference_opciones FOREIGN KEY (id_opcion) REFERENCES opciones(id_opcion) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_opciones_reference_roles; Type: FK CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY opciones_roles
    ADD CONSTRAINT fk_opciones_reference_roles FOREIGN KEY (id_rol) REFERENCES roles(id_rol) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_ordenes__reference_consulta; Type: FK CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY ordenes_gabinetes
    ADD CONSTRAINT fk_ordenes__reference_consulta FOREIGN KEY (id_consulta) REFERENCES consultas(id_consulta) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_ordenes__reference_consulta; Type: FK CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY ordenes_laboratorios
    ADD CONSTRAINT fk_ordenes__reference_consulta FOREIGN KEY (id_consulta) REFERENCES consultas(id_consulta) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_pa_comis_reference_pa_insti; Type: FK CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY pa_comisiones
    ADD CONSTRAINT fk_pa_comis_reference_pa_insti FOREIGN KEY (id_institucion) REFERENCES pa_instituciones(id_institucion) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_pacientes_reference_personas; Type: FK CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY pacientes
    ADD CONSTRAINT fk_pacientes_reference_personas FOREIGN KEY (id_persona) REFERENCES personas(id_persona) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_pagos_co_reference_deudas_c; Type: FK CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY pagos_consultas
    ADD CONSTRAINT fk_pagos_co_reference_deudas_c FOREIGN KEY (id_deuda) REFERENCES deudas_consultas(id_deuda) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_parentez_reference_historia; Type: FK CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY parentezcos
    ADD CONSTRAINT fk_parentez_reference_historia FOREIGN KEY (id_historia) REFERENCES historias_clinicas(id_historia) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_patologi_reference_historia; Type: FK CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY patologicos
    ADD CONSTRAINT fk_patologi_reference_historia FOREIGN KEY (id_historia) REFERENCES historias_clinicas(id_historia) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_personas_reference_bitacora; Type: FK CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY personas
    ADD CONSTRAINT fk_personas_reference_bitacora FOREIGN KEY (id_bitacora) REFERENCES bitacoras(id_bitacora) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_personas_reference_personas; Type: FK CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY personas_imagenes
    ADD CONSTRAINT fk_personas_reference_personas FOREIGN KEY (id_persona) REFERENCES personas(id_persona) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_respaldo_reference_evaluaci; Type: FK CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY respaldos_evaluaciones
    ADD CONSTRAINT fk_respaldo_reference_evaluaci FOREIGN KEY (id_evaluacion) REFERENCES evaluaciones(id_evaluacion) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_resultad_reference_ordenes_; Type: FK CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY resultados_gabinetes
    ADD CONSTRAINT fk_resultad_reference_ordenes_ FOREIGN KEY (id_orden_gabinete) REFERENCES ordenes_gabinetes(id_orden_gabinete) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_resultad_reference_ordenes_; Type: FK CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY resultados_laboratorios
    ADD CONSTRAINT fk_resultad_reference_ordenes_ FOREIGN KEY (id_orden_laboratorio) REFERENCES ordenes_laboratorios(id_orden_laboratorio) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_revision_reference_consulta; Type: FK CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY revisiones
    ADD CONSTRAINT fk_revision_reference_consulta FOREIGN KEY (id_consulta) REFERENCES consultas(id_consulta) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_tratamie_reference_consulta; Type: FK CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY tratamientos
    ADD CONSTRAINT fk_tratamie_reference_consulta FOREIGN KEY (id_consulta) REFERENCES consultas(id_consulta) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_usuarios_reference_personas; Type: FK CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY usuarios_personas
    ADD CONSTRAINT fk_usuarios_reference_personas FOREIGN KEY (id_persona) REFERENCES personas(id_persona) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_usuarios_reference_roles; Type: FK CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY usuarios_roles
    ADD CONSTRAINT fk_usuarios_reference_roles FOREIGN KEY (id_rol) REFERENCES roles(id_rol) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_usuarios_reference_usuarios; Type: FK CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY usuarios_personas
    ADD CONSTRAINT fk_usuarios_reference_usuarios FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_usuarios_reference_usuarios; Type: FK CONSTRAINT; Schema: paracelso; Owner: paracelso
--

ALTER TABLE ONLY usuarios_roles
    ADD CONSTRAINT fk_usuarios_reference_usuarios FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

