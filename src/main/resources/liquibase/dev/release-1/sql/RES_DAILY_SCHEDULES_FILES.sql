-- Create table
create table APPS.RES_DAILY_SCHEDULES_FILES
(
  id                  NUMBER,
  ds_header_id        NUMBER,
  file_name           VARCHAR2(100),
  formation_date      TIMESTAMP(6),
  transfer_date       TIMESTAMP(6),
  transfer_status     VARCHAR2(20),
  transfer_error_code VARCHAR2(30),
  is_selected         NUMBER,
  file_body           BLOB,
  create_by           NUMBER,
  create_date         TIMESTAMP(6),
  last_update_by      NUMBER,
  last_update_date    TIMESTAMP(6)
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
comment on table APPS.RES_DAILY_SCHEDULES_FILES
  is 'Таблица сформированных и отправленных файлов в СБРЭ';
-- Add comments to the columns 
comment on column APPS.RES_DAILY_SCHEDULES_FILES.id
  is 'Идентификатор записи';
comment on column APPS.RES_DAILY_SCHEDULES_FILES.ds_header_id
  is 'Идентификатор заголовка суточного графика';
comment on column APPS.RES_DAILY_SCHEDULES_FILES.file_name
  is 'Наименование файла';
comment on column APPS.RES_DAILY_SCHEDULES_FILES.formation_date
  is 'Дата и время формирования файла';
comment on column APPS.RES_DAILY_SCHEDULES_FILES.transfer_date
  is 'Дата и время передачи файла в СБРЭ';
comment on column APPS.RES_DAILY_SCHEDULES_FILES.transfer_status
  is 'Статус передачи: (W-ожидает обработки, E-ошибка, C-завершено)';
comment on column APPS.RES_DAILY_SCHEDULES_FILES.transfer_error_code
  is 'Код ошибки при передаче файла в СБРЭ';
comment on column APPS.RES_DAILY_SCHEDULES_FILES.is_selected
  is 'Строка выделена на форме (логическое поле)';
comment on column APPS.RES_DAILY_SCHEDULES_FILES.file_body
  is 'Содержание отправленного XML файла';
comment on column APPS.RES_DAILY_SCHEDULES_FILES.create_by
  is 'Автор записи';
comment on column APPS.RES_DAILY_SCHEDULES_FILES.create_date
  is 'Дата и время создания записи';
comment on column APPS.RES_DAILY_SCHEDULES_FILES.last_update_by
  is 'Автор последнего изменения';
comment on column APPS.RES_DAILY_SCHEDULES_FILES.last_update_date
  is 'Дата и время изменения записи';
-- Create/Recreate indexes 
create index APPS.IDX_RES_DAILY_SCHEDULES_FILES_N1 on APPS.RES_DAILY_SCHEDULES_FILES (TRANSFER_STATUS)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
create index APPS.IDX_RES_DAILY_SCHEDULES_FILES_N2 on APPS.RES_DAILY_SCHEDULES_FILES (TRANSFER_ERROR_CODE)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
create unique index APPS.IDX_RES_DAILY_SCHEDULES_FILES_U1 on APPS.RES_DAILY_SCHEDULES_FILES (DS_HEADER_ID, FILE_NAME)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
-- Create/Recreate primary, unique and foreign key constraints 
alter table APPS.RES_DAILY_SCHEDULES_FILES
  add constraint PK_RES_DAILY_SCHEDULES_FILES primary key (ID)
  deferrable initially deferred
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
alter table APPS.RES_DAILY_SCHEDULES_FILES
  add constraint FK_RES_DAILY_SCHEDULES_FILES_1 foreign key (DS_HEADER_ID)
  references APPS.RES_DAILY_SCHEDULES_HEADERS (ID) on delete cascade
  deferrable initially deferred;
alter table APPS.RES_DAILY_SCHEDULES_FILES
  add constraint FK_RES_DAILY_SCHEDULES_FILES_2 foreign key (TRANSFER_STATUS)
  references APPS.MEDIA_PROCESSING_STATUSES (CODE)
  deferrable initially deferred;
alter table APPS.RES_DAILY_SCHEDULES_FILES
  add constraint FK_RES_DAILY_SCHEDULES_FILES_3 foreign key (TRANSFER_ERROR_CODE)
  references APPS.RES_TRANSFER_TO_BEMS_CODES (CODE)
  deferrable initially deferred;
