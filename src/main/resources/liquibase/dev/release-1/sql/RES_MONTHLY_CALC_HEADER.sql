drop table RES_MONTHLY_CALC_HEADERS cascade constraints;
-- Create table
create table RES_MONTHLY_CALC_HEADERS
(
  id               NUMBER not null,
  period_id        NUMBER not null,
  calc_type_code   VARCHAR2(30) not null,
  unit_id          NUMBER not null,
  copied_from_id   number,
  state            varchar2(30),
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
comment on table RES_MONTHLY_CALC_HEADERS
  is 'Заголовки расчетов ТОО РФЦ за месяц';
-- Add comments to the columns 
comment on column RES_MONTHLY_CALC_HEADERS.id
  is 'Идентификатор расчета';
comment on column RES_MONTHLY_CALC_HEADERS.period_id
  is 'Идентификатиор расчетного периода';
comment on column RES_MONTHLY_CALC_HEADERS.calc_type_code
  is 'Вид расчета';
comment on column RES_MONTHLY_CALC_HEADERS.unit_id
  is 'Идентификатор единицы измерения';
comment on column RES_MONTHLY_CALC_HEADERS.copied_from_id
  is 'Скопировано из';
comment on column RES_MONTHLY_CALC_HEADERS.state
  is 'Статус согласования';
comment on column RES_MONTHLY_CALC_HEADERS.create_by
  is 'Автор записи';
comment on column RES_MONTHLY_CALC_HEADERS.create_date
  is 'Дата и время создания записи';
comment on column RES_MONTHLY_CALC_HEADERS.last_update_by
  is 'Автор последнего изменения';
comment on column RES_MONTHLY_CALC_HEADERS.last_update_date
  is 'Дата и время изменения записи';
-- Create/Recreate primary, unique and foreign key constraints 
alter table RES_MONTHLY_CALC_HEADERS
  add constraint PK_RES_MONTHLY_CALC_HEADERS primary key (ID)
  deferrable initially deferred
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
alter table RES_MONTHLY_CALC_HEADERS
  add constraint FK_RES_MONTHLY_CALC_HEADERS_1 foreign key (PERIOD_ID)
  references FIN_PERIODS (ID)
  deferrable initially deferred;
alter table RES_MONTHLY_CALC_HEADERS
  add constraint FK_RES_MONTHLY_CALC_HEADERS_2 foreign key (CALC_TYPE_CODE)
  references CALC_DATA_TYPES (CODE)
  deferrable initially deferred;
alter table RES_MONTHLY_CALC_HEADERS
  add constraint FK_RES_MONTHLY_CALC_HEADERS_3 foreign key (UNIT_ID)
  references DICT_UNITS (ID)
  deferrable initially deferred;
alter table RES_MONTHLY_CALC_HEADERS
  add constraint FK_RES_MONTHLY_CALC_HEADERS_4 foreign key (COPIED_FROM_ID)
  references RES_MONTHLY_CALC_HEADERS (ID)
  deferrable initially deferred;
alter table RES_MONTHLY_CALC_HEADERS
  add constraint FK_RES_MONTHLY_CALC_HEADERS_5 foreign key (STATE)
  references WF_STATES (CODE)
  deferrable initially deferred;