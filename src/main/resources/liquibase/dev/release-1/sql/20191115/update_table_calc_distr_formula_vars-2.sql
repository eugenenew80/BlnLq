-- drop constraints
alter table APPS.CALC_DISTR_FORMULA_VARS
  drop constraint PK_CALC_DISTR_FORMULA_VARS cascade;
alter table APPS.CALC_DISTR_FORMULA_VARS
  drop constraint FK_CALC_DISTR_FORMULA_VARS_1;
  
-- Add/modify columns 
alter table APPS.CALC_DISTR_FORMULA_VARS rename column supply_value_id to SUPPLY_VOLUME_ID;

-- Create/Recreate primary, unique and foreign key constraints 
alter table APPS.CALC_DISTR_FORMULA_VARS
  add constraint PK_CALC_DISTR_FORMULA_VARS primary key (SUPPLY_VOLUME_ID, VAR_CODE)
  using index
  tablespace USERS;

alter table APPS.CALC_DISTR_FORMULA_VARS
  add constraint FK_CALC_DISTR_FORMULA_VARS_1 foreign key (SUPPLY_VOLUME_ID)
  references APPS.CALC_DISTR_SUPPLY_VOLUMES (ID);