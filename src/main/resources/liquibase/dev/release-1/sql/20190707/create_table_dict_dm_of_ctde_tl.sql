-- Create table
create table APPS.DICT_DM_OF_CTDE_TL
(
  code             VARCHAR2(30 CHAR) not null,
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
comment on table APPS.DICT_DM_OF_CTDE_TL
  is 'Переводы для справочника методов определения значений для элементов данных в кросс-таблице';
-- Add comments to the columns 
comment on column APPS.DICT_DM_OF_CTDE_TL.code
  is 'Код метода';
comment on column APPS.DICT_DM_OF_CTDE_TL.lang
  is 'Код языка';
comment on column APPS.DICT_DM_OF_CTDE_TL.name
  is 'Название метода';
comment on column APPS.DICT_DM_OF_CTDE_TL.create_by
  is 'Автор записи';
comment on column APPS.DICT_DM_OF_CTDE_TL.create_date
  is 'Дата и время создания';
comment on column APPS.DICT_DM_OF_CTDE_TL.last_update_by
  is 'Автор изменения';
comment on column APPS.DICT_DM_OF_CTDE_TL.last_update_date
  is 'Дата и время изменения';
-- Create/Recreate primary, unique and foreign key constraints 
alter table APPS.DICT_DM_OF_CTDE_TL
  add constraint PK_DICT_DM_OF_CTDE_TL primary key (CODE, LANG)
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
alter table APPS.DICT_DM_OF_CTDE_TL
  add constraint FK_DICT_DM_OF_CTDE_TL_1 foreign key (CODE)
  references APPS.DICT_DM_OF_CTDE (CODE)
  deferrable initially deferred;
