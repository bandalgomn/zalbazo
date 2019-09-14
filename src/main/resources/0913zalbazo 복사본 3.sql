-- ������ Oracle SQL Developer Data Modeler 19.1.0.081.0911
--   ��ġ:        2019-09-14 02:02:51 KST
--   ����Ʈ:      Oracle Database 11g
--   ����:      Oracle Database 11g



DROP TABLE zalbazo.animal CASCADE CONSTRAINTS;

DROP TABLE zalbazo.care_animal CASCADE CONSTRAINTS;

DROP TABLE zalbazo.category CASCADE CONSTRAINTS;

DROP TABLE zalbazo.content CASCADE CONSTRAINTS;

DROP TABLE zalbazo.favorite_hospital CASCADE CONSTRAINTS;

DROP TABLE zalbazo.hospital CASCADE CONSTRAINTS;

DROP TABLE zalbazo.hospital_label CASCADE CONSTRAINTS;

DROP TABLE zalbazo.hospital_qna CASCADE CONSTRAINTS;

DROP TABLE zalbazo.label CASCADE CONSTRAINTS;

DROP TABLE zalbazo.pic_lib CASCADE CONSTRAINTS;

DROP TABLE zalbazo.pic_lib_rel_content CASCADE CONSTRAINTS;

DROP TABLE zalbazo.pic_lib_rel_hospital CASCADE CONSTRAINTS;

DROP TABLE zalbazo.reply CASCADE CONSTRAINTS;

DROP TABLE zalbazo.reserve CASCADE CONSTRAINTS;

DROP TABLE zalbazo.review CASCADE CONSTRAINTS;

DROP TABLE zalbazo.zalbazo_user CASCADE CONSTRAINTS;

DROP SEQUENCE zalbazo.animal_seq;

DROP SEQUENCE zalbazo.care_animal_seq;

DROP SEQUENCE zalbazo.category_seq;

DROP SEQUENCE zalbazo.content_seq;

DROP SEQUENCE zalbazo.hospital_qna_seq;

DROP SEQUENCE zalbazo.hospital_seq;

DROP SEQUENCE zalbazo.pic_lib_seq;

DROP SEQUENCE zalbazo.reply_seq;

DROP SEQUENCE zalbazo.reserve_seq;

DROP SEQUENCE zalbazo.review_seq;

CREATE user zalbazo identified by account unlock 
;

CREATE SEQUENCE zalbazo.animal_seq INCREMENT BY 1 MAXVALUE 9999999999999999999999999999 MINVALUE 1 CACHE 20;

CREATE SEQUENCE zalbazo.care_animal_seq INCREMENT BY 1 MAXVALUE 9999999999999999999999999999 MINVALUE 1 CACHE 20;

CREATE SEQUENCE zalbazo.category_seq INCREMENT BY 1 MAXVALUE 9999999999999999999999999999 MINVALUE 1 CACHE 20;

CREATE SEQUENCE zalbazo.content_seq INCREMENT BY 1 MAXVALUE 9999999999999999999999999999 MINVALUE 1 CACHE 20;

CREATE SEQUENCE zalbazo.hospital_qna_seq INCREMENT BY 1 MAXVALUE 9999999999999999999999999999 MINVALUE 1 CACHE 20;

CREATE SEQUENCE zalbazo.hospital_seq INCREMENT BY 1 MAXVALUE 9999999999999999999999999999 MINVALUE 1 CACHE 20;

CREATE SEQUENCE zalbazo.pic_lib_seq INCREMENT BY 1 MAXVALUE 9999999999999999999999999999 MINVALUE 1 CACHE 20;

CREATE SEQUENCE zalbazo.reply_seq INCREMENT BY 1 MAXVALUE 9999999999999999999999999999 MINVALUE 1 CACHE 20;

CREATE SEQUENCE zalbazo.reserve_seq INCREMENT BY 1 MAXVALUE 9999999999999999999999999999 MINVALUE 1 CACHE 20;

CREATE SEQUENCE zalbazo.review_seq INCREMENT BY 1 MAXVALUE 9999999999999999999999999999 MINVALUE 1 CACHE 20;

CREATE TABLE zalbazo.animal (
    animal_id         NUMBER NOT NULL,
    type              VARCHAR2(500 BYTE),
    sex               VARCHAR2(100 BYTE),
    weight            NUMBER,
    age               NUMBER,
    name              VARCHAR2(300 BYTE),
    note              VARCHAR2(3000 BYTE),
    last_treat_date   DATE,
    created_date      DATE,
    updated_date      DATE,
    user_email        VARCHAR2(1000 BYTE) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE system LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT );

COMMENT ON COLUMN zalbazo.animal.animal_id IS
    'ID';

COMMENT ON COLUMN zalbazo.animal.type IS
    '���� ��';

COMMENT ON COLUMN zalbazo.animal.weight IS
    '������';

COMMENT ON COLUMN zalbazo.animal.age IS
    '����';

COMMENT ON COLUMN zalbazo.animal.name IS
    '�̸�';

COMMENT ON COLUMN zalbazo.animal.note IS
    '�������';

COMMENT ON COLUMN zalbazo.animal.last_treat_date IS
    '������ ������';

COMMENT ON COLUMN zalbazo.animal.created_date IS
    '���������Է³�¥';

COMMENT ON COLUMN zalbazo.animal.updated_date IS
    '������¥';

CREATE UNIQUE INDEX zalbazo.animal_pk ON
    zalbazo.animal (
        animal_id
    ASC )
        TABLESPACE system PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE zalbazo.animal
    ADD CONSTRAINT animal_pk PRIMARY KEY ( animal_id )
        USING INDEX zalbazo.animal_pk;

CREATE TABLE zalbazo.care_animal (
    care_animal_id   NUMBER NOT NULL,
    hospital_id      NUMBER NOT NULL,
    animal_id        NUMBER NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE system LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT );

CREATE UNIQUE INDEX zalbazo.care_animal_pk ON
    zalbazo.care_animal (
        care_animal_id
    ASC )
        TABLESPACE system PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE zalbazo.care_animal
    ADD CONSTRAINT care_animal_pk PRIMARY KEY ( care_animal_id )
        USING INDEX zalbazo.care_animal_pk;

CREATE TABLE zalbazo.category (
    category_id   NUMBER NOT NULL,
    name          VARCHAR2(100 BYTE)
)
PCTFREE 10 PCTUSED 40 TABLESPACE system LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT );

CREATE UNIQUE INDEX zalbazo.category_pk ON
    zalbazo.category (
        category_id
    ASC )
        TABLESPACE system PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE zalbazo.category
    ADD CONSTRAINT category_pk PRIMARY KEY ( category_id )
        USING INDEX zalbazo.category_pk;

CREATE TABLE zalbazo.content (
    content_id     NUMBER NOT NULL,
    title          VARCHAR2(1000 BYTE),
    body           VARCHAR2(4000 BYTE),
    created_date   DATE,
    updated_date   DATE,
    category_id    NUMBER NOT NULL,
    user_email     VARCHAR2(1000 BYTE) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE system LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT );

COMMENT ON COLUMN zalbazo.content.title IS
    '�Խñ� ����';

COMMENT ON COLUMN zalbazo.content.body IS
    '�Խñ� ����';

CREATE UNIQUE INDEX zalbazo.content_pk ON
    zalbazo.content (
        content_id
    ASC )
        TABLESPACE system PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE zalbazo.content
    ADD CONSTRAINT content_pk PRIMARY KEY ( content_id )
        USING INDEX zalbazo.content_pk;

CREATE TABLE zalbazo.favorite_hospital (
    user_email    VARCHAR2(1000 BYTE) NOT NULL,
    hospital_id   NUMBER NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE system LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT );

CREATE UNIQUE INDEX zalbazo.favorite_hospital_pk ON
    zalbazo.favorite_hospital (
        user_email
    ASC )
        TABLESPACE system PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE zalbazo.favorite_hospital
    ADD CONSTRAINT favorite_hospital_pk PRIMARY KEY ( user_email )
        USING INDEX zalbazo.favorite_hospital_pk;

CREATE TABLE zalbazo.hospital (
    hospital_id   NUMBER NOT NULL,
    name          VARCHAR2(1000 BYTE),
    address       VARCHAR2(3000 BYTE),
    treat_start   VARCHAR2(20 BYTE),
    treat_end     VARCHAR2(20 BYTE),
    tel           VARCHAR2(20 BYTE),
    info          VARCHAR2(4000 BYTE)
)
PCTFREE 10 PCTUSED 40 TABLESPACE system LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT );

COMMENT ON COLUMN zalbazo.hospital.name IS
    '�����̸�';

COMMENT ON COLUMN zalbazo.hospital.address IS
    '�����ּ�';

COMMENT ON COLUMN zalbazo.hospital.treat_start IS
    '������۽ð�';

COMMENT ON COLUMN zalbazo.hospital.treat_end IS
    '��������ð�';

COMMENT ON COLUMN zalbazo.hospital.tel IS
    '��ȭ��ȣ';

COMMENT ON COLUMN zalbazo.hospital.info IS
    '�����Ұ�';

CREATE UNIQUE INDEX zalbazo.hospital_pk ON
    zalbazo.hospital (
        hospital_id
    ASC )
        TABLESPACE system PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE zalbazo.hospital
    ADD CONSTRAINT hospital_pk PRIMARY KEY ( hospital_id )
        USING INDEX zalbazo.hospital_pk;

CREATE TABLE zalbazo.hospital_label (
    label_code    NUMBER NOT NULL,
    hospital_id   NUMBER NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE system LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT );

CREATE TABLE zalbazo.hospital_qna (
    hospital_qna_id   NUMBER NOT NULL,
    hospital_id       NUMBER NOT NULL,
    content_id        NUMBER NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE system LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT );

CREATE UNIQUE INDEX zalbazo.hospital_qna_pk ON
    zalbazo.hospital_qna (
        hospital_qna_id
    ASC )
        TABLESPACE system PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE zalbazo.hospital_qna
    ADD CONSTRAINT hospital_qna_pk PRIMARY KEY ( hospital_qna_id )
        USING INDEX zalbazo.hospital_qna_pk;

CREATE TABLE zalbazo.label (
    code   NUMBER NOT NULL,
    name   VARCHAR2(100 BYTE)
)
PCTFREE 10 PCTUSED 40 TABLESPACE system LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT );

CREATE UNIQUE INDEX zalbazo.label_pk ON
    zalbazo.label (
        code
    ASC )
        TABLESPACE system PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE zalbazo.label
    ADD CONSTRAINT label_pk PRIMARY KEY ( code )
        USING INDEX zalbazo.label_pk;

CREATE TABLE zalbazo.pic_lib (
    pic_lib_id    NUMBER NOT NULL,
    upload_path   VARCHAR2(200 BYTE) NOT NULL,
    file_name     VARCHAR2(100 BYTE) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE system LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT );

CREATE UNIQUE INDEX zalbazo.pic_lib_pk ON
    zalbazo.pic_lib (
        pic_lib_id
    ASC )
        TABLESPACE system PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE zalbazo.pic_lib
    ADD CONSTRAINT pic_lib_pk PRIMARY KEY ( pic_lib_id )
        USING INDEX zalbazo.pic_lib_pk;

CREATE TABLE zalbazo.pic_lib_rel_content (
    pic_lib_id   NUMBER NOT NULL,
    content_id   NUMBER NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE system LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT );

CREATE TABLE zalbazo.pic_lib_rel_hospital (
    pic_lib_id    NUMBER NOT NULL,
    hospital_id   NUMBER NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE system LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT );

CREATE TABLE zalbazo.reply (
    reply_id       NUMBER NOT NULL,
    body           VARCHAR2(3000 BYTE),
    created_date   DATE,
    updated_date   DATE,
    user_email     VARCHAR2(1000 BYTE) NOT NULL,
    content_id     NUMBER NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE system LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT );

CREATE UNIQUE INDEX zalbazo.reply_pk ON
    zalbazo.reply (
        reply_id
    ASC )
        TABLESPACE system PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE zalbazo.reply
    ADD CONSTRAINT reply_pk PRIMARY KEY ( reply_id )
        USING INDEX zalbazo.reply_pk;

CREATE TABLE zalbazo.reserve (
    reserve_id    NUMBER NOT NULL,
    note          VARCHAR2(4000 BYTE),
    "DATE"        DATE,
    animal_id     NUMBER NOT NULL,
    hospital_id   NUMBER NOT NULL,
    status        VARCHAR2(100 BYTE)
)
PCTFREE 10 PCTUSED 40 TABLESPACE system LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT );

COMMENT ON COLUMN zalbazo.reserve.note IS
    '���೻��';

CREATE UNIQUE INDEX zalbazo.reserve_pk ON
    zalbazo.reserve (
        reserve_id
    ASC )
        TABLESPACE system PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE zalbazo.reserve
    ADD CONSTRAINT reserve_pk PRIMARY KEY ( reserve_id )
        USING INDEX zalbazo.reserve_pk;

CREATE TABLE zalbazo.review (
    review_id     NUMBER NOT NULL,
    hospital_id   NUMBER NOT NULL,
    content_id    NUMBER NOT NULL,
    star_point    NUMBER
)
PCTFREE 10 PCTUSED 40 TABLESPACE system LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT );

CREATE UNIQUE INDEX zalbazo.review_pk ON
    zalbazo.review (
        review_id
    ASC )
        TABLESPACE system PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE zalbazo.review
    ADD CONSTRAINT review_pk PRIMARY KEY ( review_id )
        USING INDEX zalbazo.review_pk;

CREATE TABLE zalbazo.zalbazo_user (
    email            VARCHAR2(1000 BYTE)
        CONSTRAINT nnc_zalbazo_user_email NOT NULL,
    password         VARCHAR2(500 BYTE)
        CONSTRAINT nnc_zalbazo_user_password NOT NULL,
    role             VARCHAR2(100 BYTE),
    tel              VARCHAR2(20 BYTE),
    address          VARCHAR2(1000 BYTE),
    name             VARCHAR2(500 BYTE),
    join_date        DATE,
    last_login       DATE,
    enabled          VARCHAR2(20 BYTE),
    email_auth_key   VARCHAR2(50 BYTE)
)
PCTFREE 10 PCTUSED 40 TABLESPACE system LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT );

COMMENT ON COLUMN zalbazo.zalbazo_user.email IS
    'ȸ�������̸���';

COMMENT ON COLUMN zalbazo.zalbazo_user.password IS
    '�����α����н�����';

COMMENT ON COLUMN zalbazo.zalbazo_user.role IS
    '���� ����';

COMMENT ON COLUMN zalbazo.zalbazo_user.tel IS
    '��ȭ��ȣ';

CREATE UNIQUE INDEX zalbazo.zalbazo_user_pk ON
    zalbazo.zalbazo_user (
        email
    ASC )
        TABLESPACE system PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE zalbazo.zalbazo_user
    ADD CONSTRAINT zalbazo_user_pk PRIMARY KEY ( email )
        USING INDEX zalbazo.zalbazo_user_pk;

ALTER TABLE zalbazo.animal
    ADD CONSTRAINT animal_user_fk FOREIGN KEY ( user_email )
        REFERENCES zalbazo.zalbazo_user ( email )
    NOT DEFERRABLE;

ALTER TABLE zalbazo.care_animal
    ADD CONSTRAINT care_animal_animal_fk FOREIGN KEY ( animal_id )
        REFERENCES zalbazo.animal ( animal_id )
    NOT DEFERRABLE;

ALTER TABLE zalbazo.care_animal
    ADD CONSTRAINT care_animal_hospital_fk FOREIGN KEY ( hospital_id )
        REFERENCES zalbazo.hospital ( hospital_id )
    NOT DEFERRABLE;

ALTER TABLE zalbazo.content
    ADD CONSTRAINT content_category_fk FOREIGN KEY ( category_id )
        REFERENCES zalbazo.category ( category_id )
    NOT DEFERRABLE;

ALTER TABLE zalbazo.content
    ADD CONSTRAINT content_user_fk FOREIGN KEY ( user_email )
        REFERENCES zalbazo.zalbazo_user ( email )
    NOT DEFERRABLE;

ALTER TABLE zalbazo.favorite_hospital
    ADD CONSTRAINT favorite_hospital_hospital_fk FOREIGN KEY ( hospital_id )
        REFERENCES zalbazo.hospital ( hospital_id )
    NOT DEFERRABLE;

ALTER TABLE zalbazo.favorite_hospital
    ADD CONSTRAINT favorite_hospital_user_fk FOREIGN KEY ( user_email )
        REFERENCES zalbazo.zalbazo_user ( email )
    NOT DEFERRABLE;

ALTER TABLE zalbazo.hospital_label
    ADD CONSTRAINT hospital_label_hospital_fk FOREIGN KEY ( hospital_id )
        REFERENCES zalbazo.hospital ( hospital_id )
    NOT DEFERRABLE;

ALTER TABLE zalbazo.hospital_label
    ADD CONSTRAINT hospital_label_label_fk FOREIGN KEY ( label_code )
        REFERENCES zalbazo.label ( code )
    NOT DEFERRABLE;

ALTER TABLE zalbazo.hospital_qna
    ADD CONSTRAINT hospital_qna_content_fk FOREIGN KEY ( content_id )
        REFERENCES zalbazo.content ( content_id )
    NOT DEFERRABLE;

ALTER TABLE zalbazo.hospital_qna
    ADD CONSTRAINT hospital_qna_hospital_fk FOREIGN KEY ( hospital_id )
        REFERENCES zalbazo.hospital ( hospital_id )
    NOT DEFERRABLE;

ALTER TABLE zalbazo.pic_lib_rel_content
    ADD CONSTRAINT pic_lib_rel_content_fk FOREIGN KEY ( content_id )
        REFERENCES zalbazo.content ( content_id )
    NOT DEFERRABLE;

ALTER TABLE zalbazo.pic_lib_rel_hospital
    ADD CONSTRAINT pic_lib_rel_hospital_fk FOREIGN KEY ( hospital_id )
        REFERENCES zalbazo.hospital ( hospital_id )
    NOT DEFERRABLE;

ALTER TABLE zalbazo.pic_lib_rel_content
    ADD CONSTRAINT pic_rel_content_pic_fk FOREIGN KEY ( pic_lib_id )
        REFERENCES zalbazo.pic_lib ( pic_lib_id )
    NOT DEFERRABLE;

ALTER TABLE zalbazo.pic_lib_rel_hospital
    ADD CONSTRAINT pic_rel_hospital_pic_fk FOREIGN KEY ( pic_lib_id )
        REFERENCES zalbazo.pic_lib ( pic_lib_id )
    NOT DEFERRABLE;

ALTER TABLE zalbazo.reply
    ADD CONSTRAINT reply_content_fk FOREIGN KEY ( content_id )
        REFERENCES zalbazo.content ( content_id )
    NOT DEFERRABLE;

ALTER TABLE zalbazo.reply
    ADD CONSTRAINT reply_user_fk FOREIGN KEY ( user_email )
        REFERENCES zalbazo.zalbazo_user ( email )
    NOT DEFERRABLE;

ALTER TABLE zalbazo.reserve
    ADD CONSTRAINT reserve_animal_fk FOREIGN KEY ( animal_id )
        REFERENCES zalbazo.animal ( animal_id )
    NOT DEFERRABLE;

ALTER TABLE zalbazo.reserve
    ADD CONSTRAINT reserve_hospital_fk FOREIGN KEY ( hospital_id )
        REFERENCES zalbazo.hospital ( hospital_id )
    NOT DEFERRABLE;

ALTER TABLE zalbazo.review
    ADD CONSTRAINT review_content_fk FOREIGN KEY ( content_id )
        REFERENCES zalbazo.content ( content_id )
    NOT DEFERRABLE;

ALTER TABLE zalbazo.review
    ADD CONSTRAINT review_hospital_fk FOREIGN KEY ( hospital_id )
        REFERENCES zalbazo.hospital ( hospital_id )
    NOT DEFERRABLE;



-- Oracle SQL Developer Data Modeler ��� ����: 
-- 
-- CREATE TABLE                            16
-- CREATE INDEX                            13
-- ALTER TABLE                             34
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                         10
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              1
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0


Insert into ZALBAZO.CATEGORY (CATEGORY_ID,NAME) values (1,'community');
Insert into ZALBAZO.CATEGORY (CATEGORY_ID,NAME) values (2,'jisik');
Insert into ZALBAZO.CATEGORY (CATEGORY_ID,NAME) values (3,'review');
Insert into ZALBAZO.CATEGORY (CATEGORY_ID,NAME) values (4,'hqna');

Insert into ZALBAZO.ZALBAZO_USER (EMAIL, PASSWORD, ROLE, TEL, ADDRESS, NAME, JOIN_DATE, LAST_LOGIN) Values('dummy@gmail.com', '{noop}1234', 'user', '01033499440', '����� ���ʱ�', 'ȫ�浿', sysdate, null);
Insert into ZALBAZO.CONTENT (CONTENT_ID,TITLE,BODY,CREATED_DATE,UPDATED_DATE,CATEGORY_ID,USER_EMAIL) values (CONTENT_SEQ.nextval,'�����׽�Ʈ�������ĵ�1','�����׽�Ʈ�������ĵ�1',to_date('19/09/05','RR/MM/DD'),to_date('19/09/05','RR/MM/DD'),2,'dummy@gmail.com');


Insert into ZALBAZO.HOSPITAL (HOSPITAL_ID,NAME,ADDRESS,TREAT_START,TREAT_END,TEL,INFO) values (HOSPITAL_SEQ.nextval,'���� ��������','����Ư���� ������ �ϻ絿 414-18 �Ե�ĳ���� 2��','08:00','21:00',24262775,'������ ������ �������� �ݷ������� �����ϴ� ���� ���������Դϴ�.');
Insert into ZALBAZO.HOSPITAL (HOSPITAL_ID,NAME,ADDRESS,TREAT_START,TREAT_END,TEL,INFO) values (HOSPITAL_SEQ.nextval,'���24�õ�������','����Ư���� ������ �ϻ絿 414-18 �Ե�ĳ���� 2��','00:00','24:00',262278275,'�����/���ϵ��� ��ġ�� 24�ð� ���������Դϴ�.

���� �߻����� �𸣴� ������ ���̵��� ���� ��������.
��κ��� �ܰ������� ������ ȣ�����, ȯ�ڰ��ñ�, �������.
���� ������ ���׻��¸� �ٷ� �� �� �ִ� ���װ˻��.
ö���� �Կ������� ���� ��������, �Ǹ��� ����, ����ġ���.
�������μ� �ּ��� ���ϱ� ���� ��� ���߱����� ����ϰ� ������ �����ε� �� �������ѳ����ڽ��ϴ�.

�� �� ���񽺷δ�
����̸� ���� ���� ĹŸ�� ȣ��. ����� �̿�.
���� ���������� �а� ���۵� ������ ȣ��, ������ �̿�.
�� ������ ĹŸ���� Ĺ�ε�� ����̸� ���� ������ �Ҿ��߽��ϴ�.

���� ���� �ٶ��ϴ�.');
Insert into ZALBAZO.HOSPITAL (HOSPITAL_ID,NAME,ADDRESS,TREAT_START,TREAT_END,TEL,INFO) values (HOSPITAL_SEQ.nextval,'����Ʈ�������� �����ϻ���','����Ư���� ������ �ϻ絿 452-31 �������� 1��','10:00','21:00','24428875','���� :: �츮�� ����ó�� ���� �⻵�ϰ� ���� ����ϴ� ����Ʈ ������ ����
�ȳ��ϼ��� ����Ʈ�������� �����ϻ������Դϴ�~!
���� �Ż纻��, ���� ��ġ����, �������, ��ź����, ���������� �� 5 ���� ������
�� 36 ���� ���ǻ簡 �ɵ����� �������� ���� �����ϰ� �Ϻ��� �߱��ϴ� �Ƿ�ȯ���� �߱��մϴ�
����ó�� �ݷ��������� ���� ����� �� �� �ִ� ȯ���� �����Ͽ�, �ݷ��������� �ǰ��� ��ȣ�ں� �����
�ູ���� �帮���� �׻� �ּ��� ���� �Ƿ� ���񽺸� ������ �帮�ڽ��ϴ�.');

Insert into ZALBAZO.LABEL (CODE,NAME) values (1,'24hr');
Insert into ZALBAZO.LABEL (CODE,NAME) values (2,'beauty');
Insert into ZALBAZO.LABEL (CODE,NAME) values (3,'parking');
Insert into ZALBAZO.LABEL (CODE,NAME) values (4,'rare');


Insert into ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (1,1);
Insert into ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (2,1);
Insert into ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (3,1);
Insert into ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (3,2);
Insert into ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (4,2);
Insert into ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (1,3);
Insert into ZALBAZO.HOSPITAL_LABEL (LABEL_CODE,HOSPITAL_ID) values (3,3);

commit;
