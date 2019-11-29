-- Drop constraints
alter table apps.CALC_DISTR_FORMULA_VARS
  drop constraint PK_CALC_DISTR_FORMULA_VARS cascade;
  
alter table apps.CALC_DISTR_FORMULA_VARS
  drop constraint FK_CALC_DISTR_FORMULA_VARS_1;

alter table apps.CALC_DISTR_FORMULA_VARS
  drop constraint FK_CALC_DISTR_FORMULA_VARS_2;
  
-- Drop columns 
alter table apps.CALC_DISTR_FORMULA_VARS drop column formula_id;
alter table apps.CALC_DISTR_FORMULA_VARS add source_value_id NUMBER not null;

-- Add comments to the columns
comment on column apps.CALC_DISTR_FORMULA_VARS.supply_value_id
  is 'ID объема поставки рассчитываемого значениЯ';
comment on column apps.CALC_DISTR_FORMULA_VARS.source_value_id
  is 'ID составляющей для формулы';

-- Create/Recreate primary, unique and foreign key constraints 
alter table apps.CALC_DISTR_FORMULA_VARS
  add constraint PK_CALC_DISTR_FORMULA_VARS primary key (SUPPLY_VALUE_ID, VAR_CODE)
  using index
  tablespace USERS;

alter table apps.CALC_DISTR_FORMULA_VARS
  add constraint FK_CALC_DISTR_FORMULA_VARS_1 foreign key (SUPPLY_VALUE_ID)
  references apps.calc_distr_supply_volumes (ID);

alter table apps.CALC_DISTR_FORMULA_VARS
  add constraint FK_CALC_DISTR_FORMULA_VARS_2 foreign key (SOURCE_VALUE_ID)
  references apps.CALC_DISTR_SUPPLY_VOLUMES (ID);
