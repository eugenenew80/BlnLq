-- Create table
create table apps.CALC_DISTR_FRML_WAYS_CREATE
(
  code             VARCHAR2(30 CHAR) not null,
  create_by        NUMBER,
  create_date      TIMESTAMP(6),
  last_update_by   NUMBER,
  last_update_date TIMESTAMP(6)
)
tablespace USERS;

-- Add comments to the table 
comment on table apps.CALC_DISTR_FRML_WAYS_CREATE
  is 'Способы создания формул';

-- Add comments to the columns
comment on column apps.CALC_DISTR_FRML_WAYS_CREATE.code
  is 'Код';
comment on column apps.CALC_DISTR_FRML_WAYS_CREATE.create_by
  is 'Автор записи';
comment on column apps.CALC_DISTR_FRML_WAYS_CREATE.create_date
  is 'Дата и время создания';
comment on column apps.CALC_DISTR_FRML_WAYS_CREATE.last_update_by
  is 'Автор изменения';
comment on column apps.CALC_DISTR_FRML_WAYS_CREATE.last_update_date
  is 'Дата и время изменения';

-- Create/Recreate primary, unique and foreign key constraints 
alter table apps.CALC_DISTR_FRML_WAYS_CREATE
  add constraint PK_CALC_DISTR_FRML_WAYS_CREATE primary key (CODE)
  using index 
  tablespace USERS;
