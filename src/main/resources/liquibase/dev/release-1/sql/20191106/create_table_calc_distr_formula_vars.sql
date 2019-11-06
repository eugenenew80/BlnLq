-- drop table apps.CALC_DISTR_FORMULA_VARS cascade constraints;

-- Create table
create table apps.CALC_DISTR_FORMULA_VARS
(
  formula_id       NUMBER not null,
  var_code         VARCHAR2(10) not null,
  supply_value_id  NUMBER not null,
  create_by        NUMBER,
  create_date      TIMESTAMP(6),
  last_update_by   NUMBER,
  last_update_date TIMESTAMP(6)
)
tablespace USERS;

-- Add comments to the table 
comment on table apps.CALC_DISTR_FORMULA_VARS
  is 'Таблица составляющих формул';

-- Add comments to the columns
comment on column apps.CALC_DISTR_FORMULA_VARS.formula_id
  is 'ID формулы, к которой указана составляющая';
comment on column apps.CALC_DISTR_FORMULA_VARS.var_code
  is 'Обозначение составляющей формулы';
comment on column apps.CALC_DISTR_FORMULA_VARS.supply_value_id
  is 'ID составляющей формулы';
comment on column apps.CALC_DISTR_FORMULA_VARS.create_by
  is 'Автор записи';
comment on column apps.CALC_DISTR_FORMULA_VARS.create_date
  is 'Дата и время создания';
comment on column apps.CALC_DISTR_FORMULA_VARS.last_update_by
  is 'Автор изменения';
comment on column apps.CALC_DISTR_FORMULA_VARS.last_update_date
  is 'Дата и время изменения';

-- Create/Recreate primary, unique and foreign key constraints
alter table apps.CALC_DISTR_FORMULA_VARS
  add constraint PK_CALC_DISTR_FORMULA_VARS primary key (formula_id, var_code)
  using index 
  tablespace USERS;

alter table apps.CALC_DISTR_FORMULA_VARS
  add constraint FK_CALC_DISTR_FORMULA_VARS_1 foreign key (FORMULA_ID)
  references apps.CALC_DISTR_FORMULAS (ID);

alter table apps.CALC_DISTR_FORMULA_VARS
  add constraint FK_CALC_DISTR_FORMULA_VARS_2 foreign key (supply_value_id)
  references apps.CALC_DISTR_SUPPLY_VOLUMES (ID);