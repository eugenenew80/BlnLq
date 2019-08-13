-- Create table
create table apps.CALC_DISTRIBUTION_ES
(
  id               NUMBER not null,
  header_id        NUMBER not null,
  energy_source_id NUMBER not null,
  param_id         NUMBER not null,
  plan_val         NUMBER,
  fact_val         NUMBER,
  unit_id          NUMBER not null,
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
comment on table apps.CALC_DISTRIBUTION_ES
  is 'Объемы электроэнергии по энергоисточникам';
-- Add comments to the columns
comment on column apps.CALC_DISTRIBUTION_ES.id
  is 'Идентификатор';
comment on column apps.CALC_DISTRIBUTION_ES.header_id
  is 'Идентификатор заголовка распределения';
comment on column apps.CALC_DISTRIBUTION_ES.energy_source_id
  is 'Идентификатор энергисточника';
comment on column apps.CALC_DISTRIBUTION_ES.param_id
  is 'Идентификатор параметра измерения';
comment on column apps.CALC_DISTRIBUTION_ES.plan_val
  is 'Плановый объем электроэнергии';
comment on column apps.CALC_DISTRIBUTION_ES.fact_val
  is 'Фактический объем электроэнергии';
comment on column apps.CALC_DISTRIBUTION_ES.unit_id
  is 'Идентификатор единицы измерения';
comment on column apps.CALC_DISTRIBUTION_ES.create_by
  is 'Автор записи';
comment on column apps.CALC_DISTRIBUTION_ES.create_date
  is 'Дата и время создания записи';
comment on column apps.CALC_DISTRIBUTION_ES.last_update_by
  is 'Автор последнего изменения';
comment on column apps.CALC_DISTRIBUTION_ES.last_update_date
  is 'Дата и время изменения записи';
-- Create/Recreate indexes 
create index IDX_CALC_DISTRIBUTION_ES_N1 on apps.CALC_DISTRIBUTION_ES (HEADER_ID, ENERGY_SOURCE_ID, PARAM_ID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
-- Create/Recreate primary, unique and foreign key constraints 
alter table apps.CALC_DISTRIBUTION_ES
  add constraint PK_CALC_DISTRIBUTION_ES primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
alter table apps.CALC_DISTRIBUTION_ES
  add constraint FK_CALC_DISTRIBUTION_ES_1 foreign key (HEADER_ID)
  references apps.CALC_DISTRIBUTION_HEADERS (ID)
  deferrable initially deferred;
alter table apps.CALC_DISTRIBUTION_ES
  add constraint FK_CALC_DISTRIBUTION_ES_2 foreign key (ENERGY_SOURCE_ID)
  references apps.DICT_ENERGY_SOURCES (ID)
  deferrable initially deferred;
alter table apps.CALC_DISTRIBUTION_ES
  add constraint FK_CALC_DISTRIBUTION_ES_3 foreign key (PARAM_ID)
  references apps.MEDIA_PARAMETERS (ID)
  deferrable initially deferred;
alter table apps.CALC_DISTRIBUTION_ES
  add constraint FK_CALC_DISTRIBUTION_ES_4 foreign key (UNIT_ID)
  references apps.DICT_UNITS (ID)
  deferrable initially deferred;
