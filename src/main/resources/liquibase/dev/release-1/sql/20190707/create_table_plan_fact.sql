-- Create table
create table APPS.DICT_PLAN_FACT
(
  code             VARCHAR2(4 CHAR),
  create_by        NUMBER,
  create_date      TIMESTAMP(6),
  last_update_by   NUMBER,
  last_update_data TIMESTAMP(6)
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
comment on table APPS.DICT_PLAN_FACT
  is 'Справочник названий План и Факт';
-- Add comments to the columns 
comment on column APPS.DICT_PLAN_FACT.code
  is 'Код типа данных';
comment on column APPS.DICT_PLAN_FACT.create_by
  is 'Автор записи';
comment on column APPS.DICT_PLAN_FACT.create_date
  is 'Дата и время создания';
comment on column APPS.DICT_PLAN_FACT.last_update_by
  is 'Автор изменения';
comment on column APPS.DICT_PLAN_FACT.last_update_data
  is 'Дат и время изменения';
-- Create/Recreate primary, unique and foreign key constraints 
alter table APPS.DICT_PLAN_FACT
  add constraint PK_DICT_PLAN_FACT primary key (CODE)
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
