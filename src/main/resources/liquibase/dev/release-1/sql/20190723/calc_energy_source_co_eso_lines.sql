-- Create table
create table apps.CALC_ENERGY_SOURCE_CO_eso_LINES
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
comment on table apps.CALC_ENERGY_SOURCE_CO_eso_LINES
  is 'Трейдеры к строке распределения';
-- Add comments to the columns
comment on column apps.CALC_ENERGY_SOURCE_CO_eso_LINES.id
  is 'Идентификатор';
comment on column apps.CALC_ENERGY_SOURCE_CO_eso_LINES.line_id
  is 'Идентификатор строки распределения';
comment on column apps.CALC_ENERGY_SOURCE_CO_eso_LINES.order_num
  is 'Порядок отображения';
comment on column apps.CALC_ENERGY_SOURCE_CO_eso_LINES.company_id
  is 'Энергоснабжающая компания';
comment on column apps.CALC_ENERGY_SOURCE_CO_eso_LINES.create_by
  is 'Автор записи';
comment on column apps.CALC_ENERGY_SOURCE_CO_eso_LINES.create_date
  is 'Дата и время создания записи';
comment on column apps.CALC_ENERGY_SOURCE_CO_eso_LINES.last_update_by
  is 'Автор последнего изменения';
comment on column apps.CALC_ENERGY_SOURCE_CO_eso_LINES.last_update_date
  is 'Дата и время изменения записи';
-- Create/Recreate indexes
create index IDX_CALC_ENERGY_SOURCE_CO_eso_LINES on apps.CALC_ENERGY_SOURCE_CO_eso_LINES (LINE_ID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
-- Create/Recreate primary, unique and foreign key constraints
alter table apps.CALC_ENERGY_SOURCE_CO_eso_LINES
  add constraint PK_CALC_ENERGY_SOURCE_CO_eso_LINES primary key (ID)
  using index
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;

alter table apps.CALC_ENERGY_SOURCE_CO_eso_LINES
  add constraint FK_CALC_ENERGY_SOURCE_CO_eso_LINES_1 foreign key (LINE_ID)
  references apps.CALC_ENERGY_SOURCE_CO_LINES (ID)
  deferrable initially deferred;

alter table apps.CALC_ENERGY_SOURCE_CO_eso_LINES
  add constraint FK_CALC_ENERGY_SOURCE_CO_eso_LINES_2 foreign key (company_id)
  references apps.dict_business_partners(ID)
  deferrable initially deferred;