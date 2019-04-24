-- Create table
create table apps.RES_LOAD_TYPES
(
  code             VARCHAR2(30) not null,
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
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table
comment on table apps.RES_LOAD_TYPES
  is 'Справочник Виды графиков';
-- Add comments to the columns
comment on column apps.RES_LOAD_TYPES.code
  is 'Код графика';
comment on column apps.RES_LOAD_TYPES.create_by
  is 'Автор записи';
comment on column apps.RES_LOAD_TYPES.create_date
  is 'Дата и время создания';
comment on column apps.RES_LOAD_TYPES.last_update_by
  is 'Автор последнего изменения';
comment on column apps.RES_LOAD_TYPES.last_update_date
  is 'Дата и время последнего изменения';
-- Create/Recreate primary, unique and foreign key constraints
alter table apps.RES_LOAD_TYPES
  add constraint PK_RES_LOAD_TYPES primary key (CODE)
  using index
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;

-- Create table
create table apps.RES_LOAD_TYPES_TL
(
  code             VARCHAR2(30) not null,
  lang             VARCHAR2(10) not null,
  name             VARCHAR2(30) not null,
  create_by        NUMBER,
  create_date      TIMESTAMP(6),
  last_update_by   NUMBER,
  last_update_date TIMESTAMP(6)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
-- Add comments to the table
comment on table apps.RES_LOAD_TYPES_TL
  is 'Переводы справочника Виды графиков';
-- Add comments to the columns
comment on column apps.RES_LOAD_TYPES_TL.code
  is 'Код графика';
comment on column apps.RES_LOAD_TYPES_TL.lang
  is 'Код языка';
comment on column apps.RES_LOAD_TYPES_TL.name
  is 'Наименование';
comment on column apps.RES_LOAD_TYPES_TL.create_by
  is 'Авто записи';
comment on column apps.RES_LOAD_TYPES_TL.create_date
  is 'Дата и время создания записи';
comment on column apps.RES_LOAD_TYPES_TL.last_update_by
  is 'Автор последнего изменения';
comment on column apps.RES_LOAD_TYPES_TL.last_update_date
  is 'Дата и время последнего изменения';
-- Create/Recreate primary, unique and foreign key constraints
alter table apps.RES_LOAD_TYPES_TL
  add constraint PK_RES_LOAD_TYPES_TL primary key (CODE, LANG)
  using index
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
alter table apps.RES_LOAD_TYPES_TL
  add constraint FK_RES_LOAD_TYPES_TL_1 foreign key (CODE)
  references apps.RES_LOAD_TYPES (CODE)
  deferrable initially deferred;
