-- Create table
create table APPS.RES_DAILY_SCHEDULES_HEADERS
(
  id                NUMBER not null,
  schedule_date     DATE not null,
  version           NUMBER not null,
  is_sended_to_bems NUMBER default 0 not null,
  is_publicated     NUMBER default 0 not null,
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
comment on table APPS.RES_DAILY_SCHEDULES_HEADERS
  is 'Суточные графики нагрузок ТОО РФЦ';
-- Add comments to the columns 
comment on column APPS.RES_DAILY_SCHEDULES_HEADERS.id
  is 'Идентификатор графика';
comment on column APPS.RES_DAILY_SCHEDULES_HEADERS.schedule_date
  is 'Дата графика';
comment on column APPS.RES_DAILY_SCHEDULES_HEADERS.version
  is 'Версия';
comment on column APPS.RES_DAILY_SCHEDULES_HEADERS.is_sended_to_bems
  is 'Отправлен в СБРЭ';
comment on column APPS.RES_DAILY_SCHEDULES_HEADERS.is_publicated
  is 'Опубликован в ЛКК';
comment on column APPS.RES_DAILY_SCHEDULES_HEADERS.create_by
  is 'Автор записи';
comment on column APPS.RES_DAILY_SCHEDULES_HEADERS.create_date
  is 'Дата и время создания записи';
comment on column APPS.RES_DAILY_SCHEDULES_HEADERS.last_update_by
  is 'Автор последнего изменения';
comment on column APPS.RES_DAILY_SCHEDULES_HEADERS.last_update_date
  is 'Дата и время изменения записи';
-- Create/Recreate indexes 
create unique index APPS.IDX_RES_DAILY_SCHEDULES_HEADERS_U1 on APPS.RES_DAILY_SCHEDULES_HEADERS (SCHEDULE_DATE, VERSION)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;

-- Create/Recreate primary, unique and foreign key constraints 
alter table APPS.RES_DAILY_SCHEDULES_HEADERS
  add constraint PK_RES_DAILY_SCHEDULES_HEADERS primary key (ID)
  deferrable initially deferred
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
