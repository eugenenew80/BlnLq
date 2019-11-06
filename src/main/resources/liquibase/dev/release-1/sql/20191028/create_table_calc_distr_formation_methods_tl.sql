-- Create table
create table apps.CALC_DISTR_FORMATION_METHODS_TL
(
  code             VARCHAR2(30) not null,
  lang             VARCHAR2(10) not null,
  short_name       VARCHAR2(50) not null,
  name             VARCHAR2(150) not null,
  create_by        NUMBER,
  create_date      TIMESTAMP(6),
  last_update_by   NUMBER,
  last_update_date TIMESTAMP(6)
)
tablespace USERS;

-- Add comments to the table 
comment on table apps.CALC_DISTR_FORMATION_METHODS_TL
  is 'Переводы наименований для справочника Способы формирования распределения электроэнергии';

  -- Add comments to the columns
comment on column apps.CALC_DISTR_FORMATION_METHODS_TL.code
  is 'Код значения';
comment on column apps.CALC_DISTR_FORMATION_METHODS_TL.lang
  is 'Код языка';
comment on column apps.CALC_DISTR_FORMATION_METHODS_TL.short_name
  is 'Краткое наименование';
comment on column apps.CALC_DISTR_FORMATION_METHODS_TL.name
  is 'Наименование';
comment on column apps.CALC_DISTR_FORMATION_METHODS_TL.create_by
  is 'Автор записи';
comment on column apps.CALC_DISTR_FORMATION_METHODS_TL.create_date
  is 'Дата и время создания';
comment on column apps.CALC_DISTR_FORMATION_METHODS_TL.last_update_by
  is 'Автор изменения';
comment on column apps.CALC_DISTR_FORMATION_METHODS_TL.last_update_date
  is 'Дата и время изменения';

-- Create/Recreate primary, unique and foreign key constraints 
alter table apps.CALC_DISTR_FORMATION_METHODS_TL
  add constraint PK_CALC_DISTR_FORMATION_METHODS_TL primary key (CODE, LANG)
  using index 
  tablespace USERS;

alter table apps.CALC_DISTR_FORMATION_METHODS_TL
  add constraint FK_CALC_DISTR_FORMATION_METHODS_TL_1 foreign key (CODE)
  references apps.CALC_DISTR_FORMATION_METHODS (CODE);