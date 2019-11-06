--drop table apps.CALC_DISTR_SUPPLY_VOLUMES cascade constraints;

-- Create table
create table apps.CALC_DISTR_SUPPLY_VOLUMES
(
  id                      NUMBER not null,
  supply_id               NUMBER not null,
  plan_fact_code          VARCHAR2(4) not null,
  network_code            VARCHAR2(20) not null,
  val                     NUMBER,
  unit_id                 NUMBER not null,
  determination_method    VARCHAR2(30),
  processing_group        NUMBER,
  processing_group_number NUMBER,
  formula_id              NUMBER,
  data_element_id         NUMBER,
  copied_from             NUMBER,
  occurrence_way          VARCHAR2(30) not null,
  create_by               NUMBER,
  create_date             TIMESTAMP(6),
  last_update_by          NUMBER,
  last_update_date        TIMESTAMP(6)
)
tablespace USERS;
  
-- Add comments to the table 
comment on table apps.CALC_DISTR_SUPPLY_VOLUMES
  is 'Объемы поставок электроэнергии';

-- Add comments to the columns
comment on column apps.CALC_DISTR_SUPPLY_VOLUMES.id
  is 'ID записи';
comment on column apps.CALC_DISTR_SUPPLY_VOLUMES.supply_id
  is 'ID поставки';
comment on column apps.CALC_DISTR_SUPPLY_VOLUMES.plan_fact_code
  is 'Признак план/факт';
comment on column apps.CALC_DISTR_SUPPLY_VOLUMES.network_code
  is 'Код сети';
comment on column apps.CALC_DISTR_SUPPLY_VOLUMES.val
  is 'Объем поставки';
comment on column apps.CALC_DISTR_SUPPLY_VOLUMES.unit_id
  is 'Единица измерения';
comment on column apps.CALC_DISTR_SUPPLY_VOLUMES.determination_method
  is 'Метод определения';
comment on column apps.CALC_DISTR_SUPPLY_VOLUMES.processing_group
  is 'Группа обработки';
comment on column apps.CALC_DISTR_SUPPLY_VOLUMES.processing_group_number
  is 'Порядок обработки в группе обработки';
comment on column apps.CALC_DISTR_SUPPLY_VOLUMES.formula_id
  is 'ID формулы, на основе которой рассчитано значение';
comment on column apps.CALC_DISTR_SUPPLY_VOLUMES.data_element_id
  is 'ID элемента данных, на основе которого рассчитано значение';
comment on column apps.CALC_DISTR_SUPPLY_VOLUMES.copied_from
  is 'ID записи, с которой скопирована';
comment on column apps.CALC_DISTR_SUPPLY_VOLUMES.occurrence_way
  is 'Способ возникновения записи';
comment on column apps.CALC_DISTR_SUPPLY_VOLUMES.create_by
  is 'Автор записи';
comment on column apps.CALC_DISTR_SUPPLY_VOLUMES.create_date
  is 'Дата и время создания';
comment on column apps.CALC_DISTR_SUPPLY_VOLUMES.last_update_by
  is 'Автор изменения';
comment on column apps.CALC_DISTR_SUPPLY_VOLUMES.last_update_date
  is 'Дата и время изменения';

-- Create/Recreate indexes 
create unique index IDX_CALC_DISTR_SUPPLY_VOLUMES_U1 on apps.CALC_DISTR_SUPPLY_VOLUMES (SUPPLY_ID, PLAN_FACT_CODE, NETWORK_CODE)
  tablespace USERS;
  
-- Create/Recreate primary, unique and foreign key constraints 
alter table apps.CALC_DISTR_SUPPLY_VOLUMES
  add constraint PK_CALC_DISTR_SUPPLY_VOLUMES primary key (ID)
  using index 
  tablespace USERS;

alter table apps.CALC_DISTR_SUPPLY_VOLUMES
  add constraint FK_CALC_DISTR_SUPPLY_VOLUMES_1 foreign key (SUPPLY_ID)
  references apps.CALC_DISTR_SUPPLIES (ID);

alter table apps.CALC_DISTR_SUPPLY_VOLUMES
  add constraint FK_CALC_DISTR_SUPPLY_VOLUMES_2 foreign key (PLAN_FACT_CODE)
  references apps.DICT_PLAN_FACT (CODE);

alter table apps.CALC_DISTR_SUPPLY_VOLUMES
  add constraint FK_CALC_DISTR_SUPPLY_VOLUMES_3 foreign key (NETWORK_CODE)
  references apps.DICT_NETWORKS (CODE);

alter table apps.CALC_DISTR_SUPPLY_VOLUMES
  add constraint FK_CALC_DISTR_SUPPLY_VOLUMES_4 foreign key (UNIT_ID)
  references apps.DICT_UNITS (ID);

alter table apps.CALC_DISTR_SUPPLY_VOLUMES
  add constraint FK_CALC_DISTR_SUPPLY_VOLUMES_5 foreign key (DETERMINATION_METHOD)
  references apps.CALC_DISTR_RULE_METHODS (CODE);
  
alter table apps.CALC_DISTR_SUPPLY_VOLUMES
  add constraint FK_CALC_DISTR_SUPPLY_VOLUMES_6 foreign key (DATA_ELEMENT_ID)
  references apps.DICT_CROSS_DATA_ELEMENTS (ID);
  
alter table apps.CALC_DISTR_SUPPLY_VOLUMES
  add constraint FK_CALC_DISTR_SUPPLY_VOLUMES_7 foreign key (OCCURRENCE_WAY)
  references apps.CALC_DISTR_FRML_WAYS_CREATE (CODE);