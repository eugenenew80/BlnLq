-- Create table
create table apps.DICT_ENERGY_SOURCE_TYPE2_TL
(
  code             VARCHAR2(30 CHAR) not null,
  lang             VARCHAR2(10) not null,
  short_name       VARCHAR2(10 CHAR) not null,
  name             VARCHAR2(30 CHAR) not null,
  create_by        NUMBER,
  create_date      TIMESTAMP(6),
  last_update_by   NUMBER,
  last_update_date TIMESTAMP(6)
)
tablespace USERS;

-- Add comments to the table 
comment on table apps.DICT_ENERGY_SOURCE_TYPE2_TL
  is 'Переводы названий типов энергоисточников по отношению к филиалу';

-- Add comments to the columns 
comment on column apps.DICT_ENERGY_SOURCE_TYPE2_TL.code
  is 'Код типа';
comment on column apps.DICT_ENERGY_SOURCE_TYPE2_TL.lang
  is 'Код языка';
comment on column apps.DICT_ENERGY_SOURCE_TYPE2_TL.short_name
  is 'Краткое наименование';
comment on column apps.DICT_ENERGY_SOURCE_TYPE2_TL.name
  is 'Наименование';
comment on column apps.DICT_ENERGY_SOURCE_TYPE2_TL.create_by
  is 'Автор записи';
comment on column apps.DICT_ENERGY_SOURCE_TYPE2_TL.create_date
  is 'Дата и время создания';
comment on column apps.DICT_ENERGY_SOURCE_TYPE2_TL.last_update_by
  is 'Автор изменения';
comment on column apps.DICT_ENERGY_SOURCE_TYPE2_TL.last_update_date
  is 'Дата и время изменения';

-- Create/Recreate primary, unique and foreign key constraints 
alter table apps.DICT_ENERGY_SOURCE_TYPE2_TL
  add constraint PK_DICT_ENERGY_SOURCE_TYPE2_TL primary key (CODE, LANG)
  using index 
  tablespace USERS;
alter table apps.DICT_ENERGY_SOURCE_TYPE2_TL
  add constraint FK_DICT_ENERGY_SOURCE_TYPE2_TL_1 foreign key (CODE)
  references apps.dict_energy_source_type2 (CODE);