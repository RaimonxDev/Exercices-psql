-- Obtener citas de un paciente con fecha y hora de la cita
SELECT 
pacientes.pk_idpaciente,
pacientes.nombre,
pacientes.sexo,
citas.fk_idpaciente,
citas.fecha,
citas.hora
FROM CLINICA.PACIENTE pacientes
INNER JOIN CLINICA.CITA citas
ON pacientes.pk_idpaciente = citas.fk_idpaciente
WHERE pacientes.pk_idpaciente = 'P-0001';


-- Buscar todos los pacientes que tengan o no tenga un expediente
SELECT * FROM CLINICA.PACIENTE cp
LEFT JOIN CLINICA.EXPEDIENTE ce
ON cp.pk_idpaciente = ce.pk_idpaciente;

-- Busca todos los expedientes que tengan un paciente
-- La tabla que manda es CLINICA.EXPEDIENTE
-- INGORA a los pacientes que no tienen un expediente
SELECT * FROM CLINICA.PACIENTE cp
RIGHT JOIN CLINICA.EXPEDIENTE ce
ON cp.pk_idpaciente = ce.pk_idpaciente;

-- SUBCONSULTAS
-- OBTIENE TODOS LOS ESPECIALISTAS QUE TIENE UNA CONSULTA EN LAS 2 FECHAS DADAS
SELECT * FROM CLINICA.ESPECIALISTA
WHERE pk_idEspecialista IN (
SELECT fk_idEspecialista
FROM CLINICA.AGENDAR_CITA
	WHERE fechaCita BETWEEN '2022-10-04' AND '2022-10-08');

-- OBTIENE TODOS LOS ESPECIALISTAS QUE NO TIENE UNA CONSULTA EN LAS 2 FECHAS DADAS
SELECT * FROM CLINICA.ESPECIALISTA
WHERE pk_idEspecialista  NOT IN (
SELECT fk_idEspecialista
FROM CLINICA.AGENDAR_CITA
	WHERE fechaCita BETWEEN '2022-10-04' AND '2022-10-08');
