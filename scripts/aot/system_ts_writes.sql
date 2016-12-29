DROP TABLE t1 PURGE;
DROP TABLE t2 PURGE;

SET ECHO ON

CREATE TABLE t1(a INT) TABLESPACE users;
CREATE TABLE t2(a INT) TABLESPACE system;

ALTER SYSTEM SWITCH LOGFILE;
ALTER SYSTEM CHECKPOINT;

PAUSE

SET TIMING ON

EXEC FOR i IN 1..300000 LOOP INSERT INTO t1 VALUES(i); END LOOP;

ALTER SYSTEM CHECKPOINT;

EXEC FOR i IN 1..300000 LOOP INSERT INTO t2 VALUES(i); END LOOP;

SET TIMING OFF ECHO OFF
