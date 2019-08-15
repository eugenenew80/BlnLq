-- Create table
create table APPS.DICT_CROSS_DATA_ELEMENTS_TL
(
  element_id       NUMBER not null,
  lang             VARCHAR2(10) not null,
  name             VARCHAR2(50 CHAR) not null,
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
comment on table APPS.DICT_CROSS_DATA_ELEMENTS_TL
  is 'Переводы названий элементов данных в кросс-таблице';
-- Add comments to the columns 
comment on column APPS.DICT_CROSS_DATA_ELEMENTS_TL.element_id
  is 'Идентификатор элемента данных';
comment on column APPS.DICT_CROSS_DATA_ELEMENTS_TL.lang
  is 'Код языка';
comment on column APPS.DICT_CROSS_DATA_ELEMENTS_TL.name
  is 'Наименование';
comment on column APPS.DICT_CROSS_DATA_ELEMENTS_TL.create_by
  is 'Автор записи';
comment on column APPS.DICT_CROSS_DATA_ELEMENTS_TL.create_date
  is 'Дата и время создания';
comment on column APPS.DICT_CROSS_DATA_ELEMENTS_TL.last_update_by
  is 'Автор изменения';
comment on column APPS.DICT_CROSS_DATA_ELEMENTS_TL.last_update_date
  is 'Дата и время изменения';
-- Create/Recreate primary, unique and foreign key constraints 
alter table APPS.DICT_CROSS_DATA_ELEMENTS_TL
  add constraint PK_DICT_CROSS_DATA_ELEMENTS_TL primary key (ELEMENT_ID, LANG)
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
