-- Create table
create table apps.DICT_DELIVERY_TYPES
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
comment on table apps.DICT_DELIVERY_TYPES
  is 'Справочник Типы поставки';
-- Add comments to the columns
comment on column apps.DICT_DELIVERY_TYPES.code
  is 'Код типа поставки';
comment on column apps.DICT_DELIVERY_TYPES.create_by
  is 'Автор записи';
comment on column apps.DICT_DELIVERY_TYPES.create_date
  is 'Дата и время создания';
comment on column apps.DICT_DELIVERY_TYPES.last_update_by
  is 'Автор изменения';
comment on column apps.DICT_DELIVERY_TYPES.last_update_date
  is 'Дата и время изменения';
-- Create/Recreate primary, unique and foreign key constraints 
alter table apps.DICT_DELIVERY_TYPES
  add constraint PK_DICT_DELIVERY_TYPES primary key (CODE)
  deferrable initially deferred
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
