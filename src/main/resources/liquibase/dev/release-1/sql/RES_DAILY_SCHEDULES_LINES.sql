-- Create table
create table APPS.RES_DAILY_SCHEDULES_LINES
(
  id                      NUMBER not null,
  header_id               NUMBER not null,
  tab_page_code           VARCHAR2(30) not null,
  contract_id             NUMBER not null,
  energy_source_id        NUMBER,
  res_energy_zone_id      NUMBER,
  customer_energy_zone_id NUMBER,
  total                   NUMBER not null,
  unit_id                 NUMBER not null,
  is_fixed                NUMBER default 0 not null,
  times_series_header_id  NUMBER,
  create_by               NUMBER,
  create_date             TIMESTAMP(6),
  last_update_by          NUMBER,
  last_update_date        TIMESTAMP(6)
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
comment on table APPS.RES_DAILY_SCHEDULES_LINES
  is 'Строки суточных графиков нагрузок ТОО РФЦ';
-- Add comments to the columns 
comment on column APPS.RES_DAILY_SCHEDULES_LINES.id
  is 'Идентификатор';
comment on column APPS.RES_DAILY_SCHEDULES_LINES.header_id
  is 'Идентификатор заголовка суточного графика';
comment on column APPS.RES_DAILY_SCHEDULES_LINES.tab_page_code
  is 'Тип графика: PURCHASE - покупка от ВИЭ, MIDDLE - отпуск в сеть УП, SALE - Продажа УП';
comment on column APPS.RES_DAILY_SCHEDULES_LINES.contract_id
  is 'Идентификатор договора';
comment on column APPS.RES_DAILY_SCHEDULES_LINES.energy_source_id
  is 'Идентификатор электростанции';
comment on column APPS.RES_DAILY_SCHEDULES_LINES.res_energy_zone_id
  is 'Идентификатор энергозоны электростанции на ВИЭ';
comment on column APPS.RES_DAILY_SCHEDULES_LINES.customer_energy_zone_id
  is 'Идентификатор энергозоны УП';
comment on column APPS.RES_DAILY_SCHEDULES_LINES.total
  is 'Итоговое значение за сутки';
comment on column APPS.RES_DAILY_SCHEDULES_LINES.unit_id
  is 'Единица измерения';
comment on column APPS.RES_DAILY_SCHEDULES_LINES.is_fixed
  is 'Заморожено (Логическое поле)';
comment on column APPS.RES_DAILY_SCHEDULES_LINES.times_series_header_id
  is 'Идентификатор временной последовательности, из которой скопированы часовые значения';
comment on column APPS.RES_DAILY_SCHEDULES_LINES.create_by
  is 'Автор записи';
comment on column APPS.RES_DAILY_SCHEDULES_LINES.create_date
  is 'Дата и время создания записи';
comment on column APPS.RES_DAILY_SCHEDULES_LINES.last_update_by
  is 'Автор последнего изменения';
comment on column APPS.RES_DAILY_SCHEDULES_LINES.last_update_date
  is 'Дата и время изменения записи';
-- Create/Recreate indexes 
create index APPS.IDX_RES_DAILY_SCHEDULES_LINES_N1 on APPS.RES_DAILY_SCHEDULES_LINES (RES_ENERGY_ZONE_ID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
create index APPS.IDX_RES_DAILY_SCHEDULES_LINES_N2 on APPS.RES_DAILY_SCHEDULES_LINES (CUSTOMER_ENERGY_ZONE_ID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
create index APPS.IDX_RES_DAILY_SCHEDULES_LINES_N3 on APPS.RES_DAILY_SCHEDULES_LINES (UNIT_ID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
create unique index APPS.IDX_RES_DAILY_SCHEDULES_LINES_U1 on APPS.RES_DAILY_SCHEDULES_LINES (HEADER_ID, TAB_PAGE_CODE, CONTRACT_ID, ENERGY_SOURCE_ID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
-- Create/Recreate primary, unique and foreign key constraints 
alter table APPS.RES_DAILY_SCHEDULES_LINES
  add constraint PK_RES_DAILY_SCHEDULES_LINES primary key (ID)
  deferrable initially deferred
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
alter table APPS.RES_DAILY_SCHEDULES_LINES
  add constraint FK_RES_DAILY_SCHEDULES_LINES_1 foreign key (HEADER_ID)
  references APPS.RES_DAILY_SCHEDULES_HEADERS (ID) on delete cascade
  deferrable initially deferred;
alter table APPS.RES_DAILY_SCHEDULES_LINES
  add constraint FK_RES_DAILY_SCHEDULES_LINES_2 foreign key (CONTRACT_ID)
  references APPS.CM_DOC_KEG_CTE (ID)
  deferrable initially deferred;
alter table APPS.RES_DAILY_SCHEDULES_LINES
  add constraint FK_RES_DAILY_SCHEDULES_LINES_3 foreign key (ENERGY_SOURCE_ID)
  references APPS.DICT_ENERGY_SOURCES (ID)
  deferrable initially deferred;
alter table APPS.RES_DAILY_SCHEDULES_LINES
  add constraint FK_RES_DAILY_SCHEDULES_LINES_4 foreign key (RES_ENERGY_ZONE_ID)
  references APPS.DICT_ENERGY_ZONES (ID)
  deferrable initially deferred;
alter table APPS.RES_DAILY_SCHEDULES_LINES
  add constraint FK_RES_DAILY_SCHEDULES_LINES_5 foreign key (CUSTOMER_ENERGY_ZONE_ID)
  references APPS.DICT_ENERGY_ZONES (ID)
  deferrable initially deferred;
alter table APPS.RES_DAILY_SCHEDULES_LINES
  add constraint FK_RES_DAILY_SCHEDULES_LINES_6 foreign key (UNIT_ID)
  references APPS.DICT_UNITS (ID)
  deferrable initially deferred;
alter table APPS.RES_DAILY_SCHEDULES_LINES
  add constraint FK_RES_DAILY_SCHEDULES_LINES_7 foreign key (TIMES_SERIES_HEADER_ID)
  references APPS.RES_TIME_SERIES_HEADER (ID)
  deferrable initially deferred;
