-- Create table
create table apps.DICT_DELIVERY_ASSIGNMENTS_TL
(
  delivery_assignment_id NUMBER not null,
  lang                   VARCHAR2(10) not null,
  name                   VARCHAR2(100 CHAR) not null,
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
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table apps.DICT_DELIVERY_ASSIGNMENTS_TL
  is 'Переводы для справочника Назначения поставки';
-- Add comments to the columns
comment on column apps.DICT_DELIVERY_ASSIGNMENTS_TL.delivery_assignment_id
  is 'Идентификатор назначения поставки';
comment on column apps.DICT_DELIVERY_ASSIGNMENTS_TL.lang
  is 'Код языка';
comment on column apps.DICT_DELIVERY_ASSIGNMENTS_TL.name
  is 'Наименование';
comment on column apps.DICT_DELIVERY_ASSIGNMENTS_TL.create_by
  is 'Автор записи';
comment on column apps.DICT_DELIVERY_ASSIGNMENTS_TL.create_date
  is 'Дата и время создания';
comment on column apps.DICT_DELIVERY_ASSIGNMENTS_TL.last_update_by
  is 'Автор изменения';
comment on column apps.DICT_DELIVERY_ASSIGNMENTS_TL.last_update_date
  is 'Дата и время изменения';
-- Create/Recreate primary, unique and foreign key constraints 
alter table apps.DICT_DELIVERY_ASSIGNMENTS_TL
  add constraint PK_DICT_DELIVERY_ASSIGNMENTS_TL primary key (DELIVERY_ASSIGNMENT_ID, LANG)
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
alter table apps.DICT_DELIVERY_ASSIGNMENTS_TL
  add constraint FK_DICT_DELIVERY_ASSIGNMENTS_TL_1 foreign key (DELIVERY_ASSIGNMENT_ID)
  references apps.DICT_DELIVERY_ASSIGNMENTS (ID)
  deferrable initially deferred;
