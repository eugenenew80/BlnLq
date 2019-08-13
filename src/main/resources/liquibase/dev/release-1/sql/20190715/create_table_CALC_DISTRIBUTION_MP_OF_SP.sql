-- Create table
create table apps.CALC_DISTRIBUTION_MP_OF_SP
(
  id                NUMBER not null,
  header_id         NUMBER,
  metering_point_id NUMBER,
  param_id          NUMBER,
  is_inverted       NUMBER,
  val               NUMBER,
  unit_id           NUMBER,
  create_by         NUMBER,
  create_date       TIMESTAMP(6),
  last_update_by    NUMBER,
  last_update_date  TIMESTAMP(6)
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
comment on table apps.CALC_DISTRIBUTION_MP_OF_SP
  is 'Объемы в точках учета для определения сальдо-перетока';
-- Add comments to the columns
comment on column apps.CALC_DISTRIBUTION_MP_OF_SP.id
  is 'Идентификатор';
comment on column apps.CALC_DISTRIBUTION_MP_OF_SP.header_id
  is 'Идентификатор заголовка распределения';
comment on column apps.CALC_DISTRIBUTION_MP_OF_SP.metering_point_id
  is 'Идентификатор точки учета';
comment on column apps.CALC_DISTRIBUTION_MP_OF_SP.param_id
  is 'Идентификатор параметра в точке учета';
comment on column apps.CALC_DISTRIBUTION_MP_OF_SP.is_inverted
  is 'Признак - направление перетока инвертировано';
comment on column apps.CALC_DISTRIBUTION_MP_OF_SP.val
  is 'Объем электроэнергии в точке учета';
comment on column apps.CALC_DISTRIBUTION_MP_OF_SP.unit_id
  is 'Идентификтор единицы измерения';
comment on column apps.CALC_DISTRIBUTION_MP_OF_SP.create_by
  is 'Автор записи';
comment on column apps.CALC_DISTRIBUTION_MP_OF_SP.create_date
  is 'Дата и время создания записи';
comment on column apps.CALC_DISTRIBUTION_MP_OF_SP.last_update_by
  is 'Автор последнего изменения';
comment on column apps.CALC_DISTRIBUTION_MP_OF_SP.last_update_date
  is 'Дата и время изменения записи';
-- Create/Recreate indexes 
create index IDX_CALC_DISTRIBUTION_MP_OF_SP_N1 on apps.CALC_DISTRIBUTION_MP_OF_SP (HEADER_ID, METERING_POINT_ID, PARAM_ID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
-- Create/Recreate primary, unique and foreign key constraints 
alter table apps.CALC_DISTRIBUTION_MP_OF_SP
  add constraint PK_CALC_DISTRIBUTION_MP_OF_SP primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
alter table apps.CALC_DISTRIBUTION_MP_OF_SP
  add constraint FK_CALC_DISTRIBUTION_MP_OF_SP_1 foreign key (HEADER_ID)
  references apps.CALC_DISTRIBUTION_HEADERS (ID)
  deferrable initially deferred;
alter table apps.CALC_DISTRIBUTION_MP_OF_SP
  add constraint FK_CALC_DISTRIBUTION_MP_OF_SP_2 foreign key (METERING_POINT_ID)
  references apps.DICT_METERING_POINTS (ID)
  deferrable initially deferred;
alter table apps.CALC_DISTRIBUTION_MP_OF_SP
  add constraint FK_CALC_DISTRIBUTION_MP_OF_SP_3 foreign key (PARAM_ID)
  references apps.MEDIA_PARAMETERS (ID)
  deferrable initially deferred;
alter table apps.CALC_DISTRIBUTION_MP_OF_SP
  add constraint FK_CALC_DISTRIBUTION_MP_OF_SP_4 foreign key (UNIT_ID)
  references apps.DICT_UNITS (ID)
  deferrable initially deferred;
