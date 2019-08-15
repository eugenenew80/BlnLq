--drop table DICT_CTDE_INFLUENCE_DEGREES_TL;
-- Create table
create table APPS.DICT_CTDE_INFLUENCE_DEGREES_TL
(
  code             VARCHAR2(20 CHAR) not null,
  lang             VARCHAR2(10) not null,
  name             varchar2(50 char) not null, 
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
comment on table APPS.DICT_CTDE_INFLUENCE_DEGREES_TL
  is 'Переводы наименований в справочнике Степени влияния на зависимости элементов данных в кросс-таблице';
-- Add comments to the columns 
comment on column APPS.DICT_CTDE_INFLUENCE_DEGREES_TL.code
  is 'Код степени вляния';
comment on column APPS.DICT_CTDE_INFLUENCE_DEGREES_TL.lang
  is 'Код языка';
comment on column APPS.DICT_CTDE_INFLUENCE_DEGREES_TL.name
  is 'Наименование';
comment on column APPS.DICT_CTDE_INFLUENCE_DEGREES_TL.create_by
  is 'Автор записи';
comment on column APPS.DICT_CTDE_INFLUENCE_DEGREES_TL.create_date
  is 'Дата и время записи';
comment on column APPS.DICT_CTDE_INFLUENCE_DEGREES_TL.last_update_by
  is 'Автор изменения';
comment on column APPS.DICT_CTDE_INFLUENCE_DEGREES_TL.last_update_date
  is 'Дата и время изменения';
-- Create/Recreate indexes 
create index PK_DICT_CTDE_INFLUENCE_DEGREES_TL on APPS.DICT_CTDE_INFLUENCE_DEGREES_TL (CODE, LANG)
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
-- Create/Recreate primary, unique and foreign key constraints 
alter table APPS.DICT_CTDE_INFLUENCE_DEGREES_TL
  add constraint PK_DICT_CTDE_INFLUENCE_DEGREES_TL primary key (CODE, LANG)
  deferrable initially deferred;
alter table APPS.DICT_CTDE_INFLUENCE_DEGREES_TL
  add constraint FK_DICT_CTDE_INFLUENCE_DEGREES_TL_1 foreign key (CODE)
  references APPS.DICT_CTDE_INFLUENCE_DEGREES (CODE)
  deferrable initially deferred;
