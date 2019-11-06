-- Create table
create table apps.CALC_DISTR_RULE_METHODS
(
  code             VARCHAR2(30 CHAR) not null,
  create_by        NUMBER,
  create_date      TIMESTAMP(6),
  last_update_by   NUMBER,
  last_update_date TIMESTAMP(6)
)
tablespace USERS;

-- Add comments to the table 
comment on table apps.CALC_DISTR_RULE_METHODS
  is 'Справочник Методы распределения электроэнергии';

-- Add comments to the columns
comment on column apps.CALC_DISTR_RULE_METHODS.code
  is 'Код';
comment on column apps.CALC_DISTR_RULE_METHODS.create_by
  is 'Автор записи';
comment on column apps.CALC_DISTR_RULE_METHODS.create_date
  is 'Дата и время создания';
comment on column apps.CALC_DISTR_RULE_METHODS.last_update_by
  is 'Автор изменения';
comment on column apps.CALC_DISTR_RULE_METHODS.last_update_date
  is 'Дата и время изменения';

-- Create/Recreate primary, unique and foreign key constraints 
alter table apps.CALC_DISTR_RULE_METHODS
  add constraint PK_CALC_DISTR_RULE_METHODS primary key (CODE)
  using index 
  tablespace USERS;
