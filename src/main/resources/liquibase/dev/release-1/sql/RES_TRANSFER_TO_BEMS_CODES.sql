-- Create table
create table APPS.RES_TRANSFER_TO_BEMS_CODES
(
  code             VARCHAR2(30),
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
comment on table APPS.RES_TRANSFER_TO_BEMS_CODES
  is 'Справочник кодов передачи файлов в СБРЭ';
-- Add comments to the columns 
comment on column APPS.RES_TRANSFER_TO_BEMS_CODES.code
  is 'Код статуса';
comment on column APPS.RES_TRANSFER_TO_BEMS_CODES.create_by
  is 'Автор записи';
comment on column APPS.RES_TRANSFER_TO_BEMS_CODES.create_date
  is 'Дата и время создания записи';
comment on column APPS.RES_TRANSFER_TO_BEMS_CODES.last_update_by
  is 'Автор последнего изменения';
comment on column APPS.RES_TRANSFER_TO_BEMS_CODES.last_update_date
  is 'Дата и время изменения записи';
-- Create/Recreate primary, unique and foreign key constraints 
alter table APPS.RES_TRANSFER_TO_BEMS_CODES
  add constraint PK_RES_TRANSFER_TO_BEMS_CODES primary key (CODE)
  deferrable initially deferred
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
