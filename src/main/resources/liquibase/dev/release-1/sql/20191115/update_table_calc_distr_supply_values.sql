-- Drop columns 
alter table apps.CALC_DISTR_SUPPLY_VOLUMES drop column formula_id;

-- Add/modify columns 
alter table apps.CALC_DISTR_SUPPLY_VOLUMES add faa_rule varchar2(30 char);
alter table apps.CALC_DISTR_SUPPLY_VOLUMES add formula_text varchar2(500 char);
alter table apps.CALC_DISTR_SUPPLY_VOLUMES add is_checked number default 0 not null;
alter table apps.CALC_DISTR_SUPPLY_VOLUMES add status varchar2(20);

-- Add comments to the columns 
comment on column apps.CALC_DISTR_SUPPLY_VOLUMES.faa_rule
  is 'Код типовой формулы';
comment on column apps.CALC_DISTR_SUPPLY_VOLUMES.formula_text
  is 'Текст формулы';
comment on column apps.CALC_DISTR_SUPPLY_VOLUMES.is_checked
  is 'Признак "Формула проверена"';
comment on column apps.CALC_DISTR_SUPPLY_VOLUMES.status
  is 'Статус рассчитанного значения';
  
-- Create/Recreate primary, unique and foreign key constraints 
alter table apps.CALC_DISTR_SUPPLY_VOLUMES
  add constraint FK_CALC_DISTR_SUPPLY_VOLUMES_8 foreign key (FAA_RULE)
  references apps.calc_distr_faa_rules (CODE);

alter table apps.CALC_DISTR_SUPPLY_VOLUMES
  add constraint FK_CALC_DISTR_SUPPLY_VOLUMES_9 foreign key (STATUS)
  references apps.media_batch_statuses (CODE);