-- Create table
create table apps.DICT_ENERGY_SOURCE_TYPE2
(
  code             VARCHAR2(30 CHAR) not null,
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
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table apps.DICT_ENERGY_SOURCE_TYPE2
  is 'Типы энергоисточника по отношению к филиалу';
-- Add comments to the columns 
comment on column apps.DICT_ENERGY_SOURCE_TYPE2.code
  is 'Код';
comment on column apps.DICT_ENERGY_SOURCE_TYPE2.create_by
  is 'Автор записи';
comment on column apps.DICT_ENERGY_SOURCE_TYPE2.create_date
  is 'Дата и время создания';
comment on column apps.DICT_ENERGY_SOURCE_TYPE2.last_update_by
  is 'Автор изменения';
comment on column apps.DICT_ENERGY_SOURCE_TYPE2.last_update_date
  is 'Дата и время изменения';
-- Create/Recreate primary, unique and foreign key constraints 
alter table apps.DICT_ENERGY_SOURCE_TYPE2
  add constraint PK_DICT_ENERGY_SOURCE_TYPE2 primary key (CODE)
  using index 
  tablespace USERS;
