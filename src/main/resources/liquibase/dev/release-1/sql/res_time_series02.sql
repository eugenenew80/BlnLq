-- Create table
create table apps.RES_TIME_SERIES_HEADER
(
  id               NUMBER not null,
  start_datetime   TIMESTAMP(6) not null,
  end_datetime     TIMESTAMP(6) not null,
  resolution       VARCHAR2(10) default 'H' not null,
  version          NUMBER default 1 not null,
  is_active        NUMBER default 0 not null,
  time_series_type VARCHAR2(30) not null,
  contract_id      NUMBER,
  bp_id            NUMBER,
  energy_source_id NUMBER,
  total            NUMBER default 0 not null,
  unit_id          NUMBER default 11 not null,
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
comment on table apps.RES_TIME_SERIES_HEADER
  is 'Заголовки значений временных рядов';
-- Add comments to the columns
comment on column apps.RES_TIME_SERIES_HEADER.id
  is 'Идентификатор записи';
comment on column apps.RES_TIME_SERIES_HEADER.start_datetime
  is 'Дата и время начала временного ряда';
comment on column apps.RES_TIME_SERIES_HEADER.end_datetime
  is 'Дата и время окончания временного ряда';
comment on column apps.RES_TIME_SERIES_HEADER.resolution
  is 'Шаг измерения временного ряда';
comment on column apps.RES_TIME_SERIES_HEADER.version
  is 'Версия графика';
comment on column apps.RES_TIME_SERIES_HEADER.is_active
  is 'Активная версия';
comment on column apps.RES_TIME_SERIES_HEADER.time_series_type
  is 'Тип временного ряда';
comment on column apps.RES_TIME_SERIES_HEADER.contract_id
  is 'Идентификатор контракта';
comment on column apps.RES_TIME_SERIES_HEADER.bp_id
  is 'Идентификатор контрагента';
comment on column apps.RES_TIME_SERIES_HEADER.energy_source_id
  is 'Идентификатор энергоисточника';
comment on column apps.RES_TIME_SERIES_HEADER.total
  is 'Итоговое значение за период';
comment on column apps.RES_TIME_SERIES_HEADER.unit_id
  is 'Идентификатор единицы измерения значений';
comment on column apps.RES_TIME_SERIES_HEADER.create_by
  is 'Автор записи';
comment on column apps.RES_TIME_SERIES_HEADER.create_date
  is 'Дата и время создания записи';
comment on column apps.RES_TIME_SERIES_HEADER.last_update_by
  is 'Автор последнего изменения';
comment on column apps.RES_TIME_SERIES_HEADER.last_update_date
  is 'Дата и время изменения записи';
-- Create/Recreate indexes
create index apps.RES_TIME_SERIES_HEADER_N1 on apps.RES_TIME_SERIES_HEADER (TIME_SERIES_TYPE)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;

-- Create/Recreate primary, unique and foreign key constraints
alter table apps.RES_TIME_SERIES_HEADER
  add constraint PK_RES_TIME_SERIES_HEADER primary key (ID)
  deferrable initially deferred
  using index
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;

alter table apps.RES_TIME_SERIES_HEADER
  add constraint FK_RES_TIME_SERIES_HEADER_1 foreign key (TIME_SERIES_TYPE)
  references apps.RES_TIME_SERIES_TYPES (CODE)
  deferrable initially deferred;

alter table apps.RES_TIME_SERIES_HEADER
  add constraint FK_RES_TIME_SERIES_HEADER_2 foreign key (CONTRACT_ID)
  references apps.CM_DOC_KEG_CTE (ID)
  deferrable initially deferred;

alter table apps.RES_TIME_SERIES_HEADER
  add constraint FK_RES_TIME_SERIES_HEADER_3 foreign key (ENERGY_SOURCE_ID)
  references apps.DICT_ENERGY_SOURCES (ID)
  deferrable initially deferred;

alter table apps.RES_TIME_SERIES_HEADER
  add constraint FK_RES_TIME_SERIES_HEADER_4 foreign key (RESOLUTION)
  references apps.CALC_PERIOD_TYPES (CODE)
  deferrable initially deferred;

-- Create table
create table apps.RES_TIME_SERIES_LINES
(
  header_id NUMBER not null,
  pos       NUMBER not null,
  val       NUMBER
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
comment on table apps.RES_TIME_SERIES_LINES
  is 'Строки значений временных рядов';
-- Add comments to the columns
comment on column apps.RES_TIME_SERIES_LINES.header_id
  is 'Идентификатор заголовка';
comment on column apps.RES_TIME_SERIES_LINES.pos
  is 'Номер значения';
comment on column apps.RES_TIME_SERIES_LINES.val
  is 'Значение';

-- Create/Recreate primary, unique and foreign key constraints
alter table apps.RES_TIME_SERIES_LINES
  add constraint PK_RES_TIME_SERIES_LINES primary key (header_id, pos)
  deferrable initially deferred
  using index
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
alter table apps.RES_TIME_SERIES_LINES
  add constraint FK_RES_TIME_SERIES_LINES_1 foreign key (HEADER_ID)
  references apps.RES_TIME_SERIES_HEADER (ID)
  deferrable initially deferred;

-- Create sequence
create sequence apps.RES_TIME_SERIES_HEADER_S
minvalue 1
maxvalue 999999999999999
start with 1
increment by 1
cache 20;
