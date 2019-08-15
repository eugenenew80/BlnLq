-- Create table
create table apps.CALC_DISTRIBUTION_LINE_ESO
(
  id               NUMBER not null,
  line_id          NUMBER not null,
  order_num        NUMBER not null,
  company_id       NUMBER not null,
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
comment on table apps.CALC_DISTRIBUTION_LINE_ESO
  is 'Трейдеры к строке распределения';
-- Add comments to the columns
comment on column apps.CALC_DISTRIBUTION_LINE_ESO.id
  is 'Идентификатор';
comment on column apps.CALC_DISTRIBUTION_LINE_ESO.line_id
  is 'Идентификатор строки распределения';
comment on column apps.CALC_DISTRIBUTION_LINE_ESO.order_num
  is 'Порядок отображения';
comment on column apps.CALC_DISTRIBUTION_LINE_ESO.company_id
  is 'Энергоснабжающая компания';
comment on column apps.CALC_DISTRIBUTION_LINE_ESO.create_by
  is 'Автор записи';
comment on column apps.CALC_DISTRIBUTION_LINE_ESO.create_date
  is 'Дата и время создания записи';
comment on column apps.CALC_DISTRIBUTION_LINE_ESO.last_update_by
  is 'Автор последнего изменения';
comment on column apps.CALC_DISTRIBUTION_LINE_ESO.last_update_date
  is 'Дата и время изменения записи';
-- Create/Recreate indexes 
create index IDX_CALC_DISTRIBUTION_LINE_ESO on apps.CALC_DISTRIBUTION_LINE_ESO (LINE_ID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
-- Create/Recreate primary, unique and foreign key constraints 
alter table apps.CALC_DISTRIBUTION_LINE_ESO
  add constraint PK_CALC_DISTRIBUTION_LINE_ESO primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
alter table apps.CALC_DISTRIBUTION_LINE_ESO
  add constraint FK_CALC_DISTRIBUTION_LINE_ESO_1 foreign key (LINE_ID)
  references apps.CALC_DISTRIBUTION_HEADERS (ID)
  deferrable initially deferred;
