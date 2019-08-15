-- Create table
create table apps.CALC_DISTRIBUTION_LINES
(
  id                     NUMBER not null,
  header_id              NUMBER not null,
  consumer_id            NUMBER not null,
  consumer_unit_id       NUMBER,
  sub_consumer_id        NUMBER,
  sub_consumer_unit_id   NUMBER,
  energy_source_id       NUMBER not null,
  network_code           VARCHAR2(20) not null,
  plan_val               NUMBER,
  fact_val               NUMBER,
  unit_id                NUMBER not null,
  delivery_assignment_id NUMBER,
  delivery_type_code     VARCHAR2(30),
  dealings_type_code     VARCHAR2(30),
  line_added_manually    NUMBER default 0 not null,
  create_by              NUMBER,
  create_date            TIMESTAMP(6),
  last_update_by         NUMBER,
  last_update_date       TIMESTAMP(6)
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
comment on table apps.CALC_DISTRIBUTION_LINES
  is 'Строки распределения электроэнергии';
-- Add comments to the columns
comment on column apps.CALC_DISTRIBUTION_LINES.id
  is 'Идентификатор строки распределения';
comment on column apps.CALC_DISTRIBUTION_LINES.header_id
  is 'Идентификатор заголовка распределения';
comment on column apps.CALC_DISTRIBUTION_LINES.consumer_id
  is 'Код потребителя';
comment on column apps.CALC_DISTRIBUTION_LINES.consumer_unit_id
  is 'Код подразделения потребителя';
comment on column apps.CALC_DISTRIBUTION_LINES.sub_consumer_id
  is 'Код субабонета';
comment on column apps.CALC_DISTRIBUTION_LINES.sub_consumer_unit_id
  is 'Код подразделения субабонента';
comment on column apps.CALC_DISTRIBUTION_LINES.energy_source_id
  is 'Идентификатор энергоисточника';
comment on column apps.CALC_DISTRIBUTION_LINES.network_code
  is 'Код сети';
comment on column apps.CALC_DISTRIBUTION_LINES.plan_val
  is 'Плановый объем';
comment on column apps.CALC_DISTRIBUTION_LINES.fact_val
  is 'Фактический объем';
comment on column apps.CALC_DISTRIBUTION_LINES.unit_id
  is 'Идентификатор единицы измерения параметра';
comment on column apps.CALC_DISTRIBUTION_LINES.delivery_assignment_id
  is 'Идентификатор назначения поставки';
comment on column apps.CALC_DISTRIBUTION_LINES.delivery_type_code
  is 'Код типа поставки: импорт, экспорт, внутри РК, …';
comment on column apps.CALC_DISTRIBUTION_LINES.dealings_type_code
  is 'Код вида сделки';
comment on column apps.CALC_DISTRIBUTION_LINES.line_added_manually
  is 'Строка добавлена вручную: 1-да, 0-нет';
comment on column apps.CALC_DISTRIBUTION_LINES.create_by
  is 'Автор записи';
comment on column apps.CALC_DISTRIBUTION_LINES.create_date
  is 'Дата и время создания записи';
comment on column apps.CALC_DISTRIBUTION_LINES.last_update_by
  is 'Автор последнего изменения';
comment on column apps.CALC_DISTRIBUTION_LINES.last_update_date
  is 'Дата и время изменения записи';
-- Create/Recreate indexes 
create index IDX_CALC_DISTRIBUTION_N1 on apps.CALC_DISTRIBUTION_LINES (HEADER_ID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
create index IDX_CALC_DISTRIBUTION_N2 on apps.CALC_DISTRIBUTION_LINES (CONSUMER_ID, CONSUMER_UNIT_ID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
create index IDX_CALC_DISTRIBUTION_N3 on apps.CALC_DISTRIBUTION_LINES (ENERGY_SOURCE_ID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
create index IDX_CALC_DISTRIBUTION_N4 on apps.CALC_DISTRIBUTION_LINES (NETWORK_CODE)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
create index IDX_CALC_DISTRIBUTION_N5 on apps.CALC_DISTRIBUTION_LINES (DELIVERY_ASSIGNMENT_ID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
create index IDX_CALC_DISTRIBUTION_N6 on apps.CALC_DISTRIBUTION_LINES (DELIVERY_TYPE_CODE)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
create index IDX_CALC_DISTRIBUTION_N7 on apps.CALC_DISTRIBUTION_LINES (DEALINGS_TYPE_CODE)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
-- Create/Recreate primary, unique and foreign key constraints 
alter table apps.CALC_DISTRIBUTION_LINES
  add constraint PK_CALC_DISTRIBUTION_LINES primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
alter table apps.CALC_DISTRIBUTION_LINES
  add constraint FK_CALC_DISTRIBUTION_LINES_1 foreign key (HEADER_ID)
  references apps.CALC_DISTRIBUTION_HEADERS (ID)
  deferrable initially deferred;
alter table apps.CALC_DISTRIBUTION_LINES
  add constraint FK_CALC_DISTRIBUTION_LINES_10 foreign key (DEALINGS_TYPE_CODE)
  references apps.DICT_DEALINGS_TYPES (CODE)
  deferrable initially deferred;
alter table apps.CALC_DISTRIBUTION_LINES
  add constraint FK_CALC_DISTRIBUTION_LINES_2 foreign key (CONSUMER_ID)
  references apps.CALC_CONSUMERS (ID)
  deferrable initially deferred;
alter table apps.CALC_DISTRIBUTION_LINES
  add constraint FK_CALC_DISTRIBUTION_LINES_3 foreign key (CONSUMER_UNIT_ID)
  references apps.CALC_CONSUMERS (ID)
  deferrable initially deferred;
alter table apps.CALC_DISTRIBUTION_LINES
  add constraint FK_CALC_DISTRIBUTION_LINES_4 foreign key (SUB_CONSUMER_ID)
  references apps.CALC_CONSUMERS (ID)
  deferrable initially deferred;
alter table apps.CALC_DISTRIBUTION_LINES
  add constraint FK_CALC_DISTRIBUTION_LINES_5 foreign key (SUB_CONSUMER_UNIT_ID)
  references apps.CALC_CONSUMERS (ID)
  deferrable initially deferred;
alter table apps.CALC_DISTRIBUTION_LINES
  add constraint FK_CALC_DISTRIBUTION_LINES_6 foreign key (ENERGY_SOURCE_ID)
  references apps.DICT_ENERGY_SOURCES (ID)
  deferrable initially deferred;
alter table apps.CALC_DISTRIBUTION_LINES
  add constraint FK_CALC_DISTRIBUTION_LINES_7 foreign key (NETWORK_CODE)
  references apps.DICT_NETWORKS (CODE)
  deferrable initially deferred;
alter table apps.CALC_DISTRIBUTION_LINES
  add constraint FK_CALC_DISTRIBUTION_LINES_8 foreign key (DELIVERY_ASSIGNMENT_ID)
  references apps.DICT_DELIVERY_ASSIGNMENTS (ID)
  deferrable initially deferred;
alter table apps.CALC_DISTRIBUTION_LINES
  add constraint FK_CALC_DISTRIBUTION_LINES_9 foreign key (DELIVERY_TYPE_CODE)
  references apps.DICT_DELIVERY_TYPES (CODE)
  deferrable initially deferred;
