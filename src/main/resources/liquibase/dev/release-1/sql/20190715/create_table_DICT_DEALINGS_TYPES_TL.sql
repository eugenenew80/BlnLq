-- Create table
create table apps.DICT_DEALINGS_TYPES_TL
(
  dealings_type_code VARCHAR2(30 CHAR) not null,
  lang               VARCHAR2(10) not null,
  short_name         VARCHAR2(30 CHAR) not null,
  name               VARCHAR2(100 CHAR) not null,
  create_by          NUMBER,
  create_date        TIMESTAMP(6),
  last_update_by     NUMBER,
  last_update_date   TIMESTAMP(6)
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
comment on table apps.DICT_DEALINGS_TYPES_TL
  is 'Переводы для справочника Виды сделок';
-- Add comments to the columns
comment on column apps.DICT_DEALINGS_TYPES_TL.dealings_type_code
  is 'Код вида сделки';
comment on column apps.DICT_DEALINGS_TYPES_TL.lang
  is 'Код языка';
comment on column apps.DICT_DEALINGS_TYPES_TL.short_name
  is 'Краткое наименование';
comment on column apps.DICT_DEALINGS_TYPES_TL.name
  is 'Полное наименование';
comment on column apps.DICT_DEALINGS_TYPES_TL.create_by
  is 'Автор записи';
comment on column apps.DICT_DEALINGS_TYPES_TL.create_date
  is 'Дата и время создания';
comment on column apps.DICT_DEALINGS_TYPES_TL.last_update_by
  is 'Автор изменения';
comment on column apps.DICT_DEALINGS_TYPES_TL.last_update_date
  is 'Дата и время изменения';
-- Create/Recreate primary, unique and foreign key constraints 
alter table apps.DICT_DEALINGS_TYPES_TL
  add constraint PK_DICT_DEALINGS_TYPES_TL primary key (DEALINGS_TYPE_CODE, LANG)
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
alter table apps.DICT_DEALINGS_TYPES_TL
  add constraint FK_DICT_DEALINGS_TYPES_TL_1 foreign key (DEALINGS_TYPE_CODE)
  references apps.DICT_DEALINGS_TYPES (CODE)
  deferrable initially deferred;
