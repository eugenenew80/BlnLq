drop table APPS.RES_DATA_TYPES_TL cascade constraints;
-- Create table
create table APPS.RES_DATA_TYPES_TL
(
  code             VARCHAR2(20 CHAR) not null,
  lang             VARCHAR2(10 CHAR) not null,
  name             VARCHAR2(100 CHAR) not null,
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
comment on table APPS.RES_DATA_TYPES_TL
  is 'Переводы видов расчета ТОО РФЦ';
-- Add comments to the columns
comment on column APPS.RES_DATA_TYPES_TL.code
  is 'Код расчета';
comment on column APPS.RES_DATA_TYPES_TL.lang
  is 'Язык';
comment on column APPS.RES_DATA_TYPES_TL.name
  is 'Наименование вида расчета';
comment on column APPS.RES_DATA_TYPES_TL.create_date
  is 'Дата создания';
comment on column APPS.RES_DATA_TYPES_TL.last_update_date
  is 'Дата изменения';
comment on column APPS.RES_DATA_TYPES_TL.create_by
  is 'Автор';
comment on column APPS.RES_DATA_TYPES_TL.last_update_by
  is 'Автор изменения';
-- Create/Recreate primary, unique and foreign key constraints
alter table APPS.RES_DATA_TYPES_TL
  add constraint PK_RES_DATA_TYPES_TL primary key (CODE, LANG)
  using index
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table APPS.RES_DATA_TYPES_TL
  add constraint FK_RES_DATA_TYPES_TL_1 foreign key (CODE)
  references APPS.RES_DATA_TYPES (CODE) on delete cascade
  deferrable;
