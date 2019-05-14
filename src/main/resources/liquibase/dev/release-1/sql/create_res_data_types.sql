drop table RES_DATA_TYPES cascade constraints;
-- Create table
create table RES_DATA_TYPES
(
  code             VARCHAR2(20 CHAR) not null,
  priority         NUMBER,
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
comment on table RES_DATA_TYPES
  is 'Справочник Виды расчетов ТОО РФЦ';
-- Add comments to the columns 
comment on column RES_DATA_TYPES.code
  is 'Код расчета';
comment on column RES_DATA_TYPES.create_date
  is 'Дата создания';
comment on column RES_DATA_TYPES.last_update_date
  is 'Дата изменения';
comment on column RES_DATA_TYPES.create_by
  is 'Автор';
comment on column RES_DATA_TYPES.last_update_by
  is 'Автор изменения';
comment on column RES_DATA_TYPES.priority
  is 'Приоритет';
-- Create/Recreate primary, unique and foreign key constraints 
alter table RES_DATA_TYPES
  add constraint PK_RES_DATA_TYPES primary key (CODE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
