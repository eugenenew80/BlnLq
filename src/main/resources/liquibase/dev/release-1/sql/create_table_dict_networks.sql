-- Create table
create table APPS.DICT_NETWORKS
(
  code             VARCHAR2(20 CHAR) not null,
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
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table APPS.DICT_NETWORKS
  is 'Справочник Сети';
-- Add comments to the columns 
comment on column APPS.DICT_NETWORKS.code
  is 'Код участка сети';
comment on column APPS.DICT_NETWORKS.create_by
  is 'Автор записи';
comment on column APPS.DICT_NETWORKS.create_date
  is 'Дата и время создания записи';
comment on column APPS.DICT_NETWORKS.last_update_by
  is 'Автор изменения';
comment on column APPS.DICT_NETWORKS.last_update_date
  is 'Дата и время последнего изменения';
-- Create/Recreate primary, unique and foreign key constraints 
alter table APPS.DICT_NETWORKS
  add constraint PK_DICT_NETWORKS primary key (CODE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;