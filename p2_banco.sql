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