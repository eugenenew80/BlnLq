-- Create table
create table APPS.DICT_NETWORKS_TL
(
  network_code     VARCHAR2(20 CHAR) not null,
  lang             VARCHAR2(10 CHAR) not null,
  short_name       VARCHAR2(20 CHAR) not null,
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
comment on table APPS.DICT_NETWORKS_TL
  is 'Переводы названий для справочника Сети';
-- Add comments to the columns 
comment on column APPS.DICT_NETWORKS_TL.network_code
  is 'Код участка сети';
comment on column APPS.DICT_NETWORKS_TL.lang
  is 'Код языка';
comment on column APPS.DICT_NETWORKS_TL.short_name
  is 'Краткое наименование';
comment on column APPS.DICT_NETWORKS_TL.name
  is 'Наименование';
comment on column APPS.DICT_NETWORKS_TL.create_by
  is 'Автор записи';
comment on column APPS.DICT_NETWORKS_TL.create_date
  is 'Дата и время создания';
comment on column APPS.DICT_NETWORKS_TL.last_update_by
  is 'Автор изменения';
comment on column APPS.DICT_NETWORKS_TL.last_update_date
  is 'Дата и время последнего изменения';
-- Create/Recreate primary, unique and foreign key constraints 
alter table APPS.DICT_NETWORKS_TL
  add constraint PK_DICT_NETWORKS_TL primary key (NETWORK_CODE, LANG)
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
alter table APPS.DICT_NETWORKS_TL
  add constraint FK_DICT_NETWORKS_TL foreign key (NETWORK_CODE)
  references APPS.DICT_NETWORKS (CODE)
  deferrable initially deferred;
