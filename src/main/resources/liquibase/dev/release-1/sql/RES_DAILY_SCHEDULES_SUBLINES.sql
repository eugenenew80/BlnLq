-- Create table
create table APPS.RES_DAILY_SCHEDULES_SUBLINES
(
  ds_line_id NUMBER not null,
  pos        NUMBER not null,
  val        NUMBER
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
comment on table APPS.RES_DAILY_SCHEDULES_SUBLINES
  is 'Таблица часовых значений суточного графика нагрузок ТОО РФЦ';
-- Add comments to the columns 
comment on column APPS.RES_DAILY_SCHEDULES_SUBLINES.ds_line_id
  is 'Идентификатор строки суточного графика';
comment on column APPS.RES_DAILY_SCHEDULES_SUBLINES.pos
  is 'Номер часа';
comment on column APPS.RES_DAILY_SCHEDULES_SUBLINES.val
  is 'Значение';
-- Create/Recreate primary, unique and foreign key constraints 
alter table APPS.RES_DAILY_SCHEDULES_SUBLINES
  add constraint PK_RES_DAILY_SCHEDULES_SUBLINES primary key (DS_LINE_ID, POS)
  deferrable initially deferred
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
alter table APPS.RES_DAILY_SCHEDULES_SUBLINES
  add constraint FK_RES_DAILY_SCHEDULES_SUBLINES_1 foreign key (DS_LINE_ID)
  references APPS.RES_DAILY_SCHEDULES_LINES (ID) on delete cascade
  deferrable initially deferred;
-- Create/Recreate check constraints 
alter table APPS.RES_DAILY_SCHEDULES_SUBLINES
  add constraint CH_DS_POS_VALUES
  check (pos >= 0 and pos <= 23)
  deferrable initially deferred;
