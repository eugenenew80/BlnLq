-- Create table
create table APPS.RES_TRANSFER_TO_BEMS_CODES_TL
(
  code             VARCHAR2(30) not null,
  lang             VARCHAR2(10) not null,
  name             VARCHAR2(100) not null,
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
comment on table APPS.RES_TRANSFER_TO_BEMS_CODES_TL
  is 'Таблица переводов для справочника кодов передачи файлов';
-- Add comments to the columns 
comment on column APPS.RES_TRANSFER_TO_BEMS_CODES_TL.code
  is 'Код статуса';
comment on column APPS.RES_TRANSFER_TO_BEMS_CODES_TL.lang
  is 'Код языка';
comment on column APPS.RES_TRANSFER_TO_BEMS_CODES_TL.name
  is 'Описание';
comment on column APPS.RES_TRANSFER_TO_BEMS_CODES_TL.create_by
  is 'Автор записи';
comment on column APPS.RES_TRANSFER_TO_BEMS_CODES_TL.create_date
  is 'Дата и время создания записи';
comment on column APPS.RES_TRANSFER_TO_BEMS_CODES_TL.last_update_by
  is 'Автор последнего изменения';
comment on column APPS.RES_TRANSFER_TO_BEMS_CODES_TL.last_update_date
  is 'Дата и время изменения записи';
-- Create/Recreate primary, unique and foreign key constraints 
alter table APPS.RES_TRANSFER_TO_BEMS_CODES_TL
  add constraint PK_RES_TRANSFER_TO_BEMS_CODES_TL primary key (CODE, LANG)
  deferrable initially deferred
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
alter table APPS.RES_TRANSFER_TO_BEMS_CODES_TL
  add constraint FK_RES_TRANSFER_TO_BEMS_CODES_TL_1 foreign key (CODE)
  references APPS.RES_TRANSFER_TO_BEMS_CODES (CODE) on delete cascade
  deferrable initially deferred;
