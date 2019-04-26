-- Create table
create table apps.RES_TIME_SERIES_TYPES
(
  code             VARCHAR2(30) not null,
  load_type_code   VARCHAR2(30) not null,
  param_id         NUMBER not null,
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
comment on table apps.RES_TIME_SERIES_TYPES
  is 'Типы временных рядов';
-- Add comments to the columns
comment on column apps.RES_TIME_SERIES_TYPES.code
  is 'Код типа временного ряда';
comment on column apps.RES_TIME_SERIES_TYPES.load_type_code
  is 'Вид временного ряда';
comment on column apps.RES_TIME_SERIES_TYPES.param_id
  is 'Измеряемый параметр';
comment on column apps.RES_TIME_SERIES_TYPES.create_by
  is 'Автор записи';
comment on column apps.RES_TIME_SERIES_TYPES.create_date
  is 'Дата и время создания записи';
comment on column apps.RES_TIME_SERIES_TYPES.last_update_by
  is 'Автор последнего изменения';
comment on column apps.RES_TIME_SERIES_TYPES.last_update_date
  is 'Дата и время изменения записи';
-- Create/Recreate indexes
create index apps.IDX_RES_TIME_SERIES_TYPES_N1 on apps.RES_TIME_SERIES_TYPES (LOAD_TYPE_CODE)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
create index apps.IDX_RES_TIME_SERIES_TYPES_N2 on apps.RES_TIME_SERIES_TYPES (PARAM_ID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
-- Create/Recreate primary, unique and foreign key constraints
alter table apps.RES_TIME_SERIES_TYPES
  add constraint PK_RES_TIME_SERIES_TYPES primary key (CODE)
  deferrable initially deferred
  using index
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;

alter table apps.RES_TIME_SERIES_TYPES
  add constraint FK_RES_TIME_SERIES_TYPES_1 foreign key (LOAD_TYPE_CODE)
  references apps.RES_LOAD_TYPES (CODE)
  deferrable initially deferred;

alter table apps.RES_TIME_SERIES_TYPES
  add constraint FK_RES_TIME_SERIES_TYPES_2 foreign key (PARAM_ID)
  references apps.MEDIA_PARAMETERS (ID)
  deferrable initially deferred;

-- Create table
create table apps.RES_TIME_SERIES_TYPES_TL
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
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

-- Add comments to the table
comment on table apps.RES_TIME_SERIES_TYPES_TL
  is 'Переводы для справочника Типы временных рядов';
-- Add comments to the columns
comment on column apps.RES_TIME_SERIES_TYPES_TL.code
  is 'Код типа временного ряда';
comment on column apps.RES_TIME_SERIES_TYPES_TL.lang
  is 'Код языка';
comment on column apps.RES_TIME_SERIES_TYPES_TL.name
  is 'Наименование';
comment on column apps.RES_TIME_SERIES_TYPES_TL.create_by
  is 'Автор записи';
comment on column apps.RES_TIME_SERIES_TYPES_TL.create_date
  is 'Дата и время создания записи';
comment on column apps.RES_TIME_SERIES_TYPES_TL.last_update_by
  is 'Автор последнего изменения';
comment on column apps.RES_TIME_SERIES_TYPES_TL.last_update_date
  is 'Дата и время изменения записи';

-- Create/Recreate primary, unique and foreign key constraints
alter table apps.RES_TIME_SERIES_TYPES_TL
  add constraint PK_RES_TIME_SERIES_TYPES_TL primary key (CODE, LANG)
  deferrable initially deferred
  using index
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;

alter table apps.RES_TIME_SERIES_TYPES_TL
  add constraint FK_RES_TIME_SERIES_TYPES_TL_1 foreign key (CODE)
  references apps.RES_TIME_SERIES_TYPES (CODE)
  deferrable initially deferred;
