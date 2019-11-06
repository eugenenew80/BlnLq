--drop table apps.CALC_DISTR_FORMULAS cascade constraints;

-- Create table
create table apps.CALC_DISTR_FORMULAS
(
  id               NUMBER not null,
  supply_value_id  NUMBER not null,
  formula_text     VARCHAR2(500) not null,
  org_id           NUMBER not null,
  faa_rule         VARCHAR2(30 CHAR) not null,
  occurrence_way   VARCHAR2(30 CHAR) not null,
  copied_from      NUMBER,
  is_checked       NUMBER default 0 not null,
  create_by        NUMBER,
  create_date      TIMESTAMP(6),
  last_update_by   NUMBER,
  last_update_date TIMESTAMP(6)
)
tablespace USERS;

-- Add comments to the table 
comment on table apps.CALC_DISTR_FORMULAS
  is 'Формулы для распределения электроэнергии';

-- Add comments to the columns
comment on column apps.CALC_DISTR_FORMULAS.id
  is 'ID записи';
comment on column apps.CALC_DISTR_FORMULAS.supply_value_id
  is 'ID объема поставки';
comment on column apps.CALC_DISTR_FORMULAS.formula_text
  is 'Формула';
comment on column apps.CALC_DISTR_FORMULAS.org_id
  is 'ID организации, в рамках которой должна действовать формула';
comment on column apps.CALC_DISTR_FORMULAS.faa_rule
  is 'Правило автонастройки формулы';
comment on column apps.CALC_DISTR_FORMULAS.occurrence_way
  is 'Способ возникновения записи';
comment on column apps.CALC_DISTR_FORMULAS.copied_from
  is 'ID записи, из которой она была создана';
comment on column apps.CALC_DISTR_FORMULAS.is_checked
  is 'Формула проверена';
comment on column apps.CALC_DISTR_FORMULAS.create_by
  is 'Автор записи';
comment on column apps.CALC_DISTR_FORMULAS.create_date
  is 'Дата и время создания';
comment on column apps.CALC_DISTR_FORMULAS.last_update_by
  is 'Автор изменения';
comment on column apps.CALC_DISTR_FORMULAS.last_update_date
  is 'Дата и время изменения';

-- Create/Recreate primary, unique and foreign key constraints 
alter table apps.CALC_DISTR_FORMULAS
  add constraint PK_CALC_DISTR_FORMULAS primary key (ID)
  using index 
  tablespace USERS;

alter table apps.CALC_DISTR_FORMULAS
  add constraint FK_CALC_DISTR_FORMULAS_1 foreign key (SUPPLY_VALUE_ID)
  references apps.CALC_DISTR_SUPPLY_VOLUMES (ID);

alter table apps.CALC_DISTR_FORMULAS
  add constraint FK_CALC_DISTR_FORMULAS_2 foreign key (ORG_ID)
  references apps.DICT_ORGANIZATIONS (ID);

alter table apps.CALC_DISTR_FORMULAS
  add constraint FK_CALC_DISTR_FORMULAS_3 foreign key (FAA_RULE)
  references apps.CALC_DISTR_FAA_RULES (CODE);

alter table apps.CALC_DISTR_FORMULAS
  add constraint FK_CALC_DISTR_FORMULAS_4 foreign key (OCCURRENCE_WAY)
  references apps.CALC_DISTR_FRML_WAYS_CREATE (CODE);
