--1
CREATE TABLE tb_estudante (
    STUDENTID SERIAL PRIMARY KEY,
    FATHER_EDU INT,
    MOTHER_EDU INT,
    PREP_STUDY INT,
    SALARY INT,
    PREP_EXAM INT,
    GRADE INT
);  

--2

CREATE OR REPLACE PROCEDURE sp_aprovados_pais_phds()
LANGUAGE plpgsql
AS $$
DECLARE
    v_contador INT;
BEGIN
    SELECT COUNT(*) FROM tb_estudante WHERE GRADE => 1 AND FATHER_EDU = 6 AND MOTHER_EDU = 6 INTO v_contador;
    RAISE NOTICE '%', v_contador;
END;
$$;
 
CALL sp_aprovados_pais_phds();

--3

CREATE OR REPLACE PROCEDURE aprovados_sozinhos (
    OUT total_aprovados INT
)
LANGUAGE plpgsql
AS $
BEGIN
    SELECT COUNT(*)
    INTO total_aprovados
    FROM studet_prediction
    WHERE partner = 1
      AND grade >= 1;
END;
$$
 
 
DO $$
DECLARE
    qtd INTEGER;
BEGIN
    CALL aprovados_sozinho(qtd);
 
    RAISE NOTICE 'Os Total de aprovados foram de: %', qtd;
END;
$$;

