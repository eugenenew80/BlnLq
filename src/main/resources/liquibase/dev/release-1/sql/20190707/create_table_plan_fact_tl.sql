-- Create table
create table APPS.DICT_PLAN_FACT_TL
(
  plan_fact_code   VARCHAR2(4 CHAR) not null,
  lang             VARCHAR2(10) not null,
  short_name       VARCHAR2(10 CHAR) not null,
  name             VARCHAR2(30 CHAR) not null,
  create_by        NUMBER,
  create_date      TIMESTAMP(6),
  last_update_by   NUMBER,
  last_update_date TIMESTAMP(6)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table APPS.DICT_PLAN_FACT_TL
  is 'Переводы для названий справочника План и Факт';
-- Add comments to the columns 
comment on column APPS.DICT_PLAN_FACT_TL.plan_fact_code
  is 'Код типа';
comment on column APPS.DICT_PLAN_FACT_TL.lang
  is 'Код языка';
comment on column APPS.DICT_PLAN_FACT_TL.short_name
  is 'Краткое наименование';
comment on column APPS.DICT_PLAN_FACT_TL.name
  is 'Полное наименование';
comment on column APPS.DICT_PLAN_FACT_TL.create_by
  is 'Автор записи';
comment on column APPS.DICT_PLAN_FACT_TL.create_date
  is 'Дата и время создания';
comment on column APPS.DICT_PLAN_FACT_TL.last_update_by
  is 'Автор изменения';
comment on column APPS.DICT_PLAN_FACT_TL.last_update_date
  is 'Дат и время изменения';
-- Create/Recreate primary, unique and foreign key constraints 
alter table APPS.DICT_PLAN_FACT_TL
  add constraint PK_DICT_PLAN_FACT_TL primary key (PLAN_FACT_CODE, LANG)
  deferrable initially deferred
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table APPS.DICT_PLAN_FACT_TL
  add constraint FK_DICT_PLAN_FACT_TL_1 foreign key (PLAN_FACT_CODE)
  references APPS.DICT_PLAN_FACT (CODE)
  deferrable initially deferred;
