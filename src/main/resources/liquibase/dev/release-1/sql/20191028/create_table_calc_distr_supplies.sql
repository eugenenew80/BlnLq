--drop table apps.CALC_DISTR_SUPPLIES cascade constraints;
-- Create table
create table apps.CALC_DISTR_SUPPLIES
(
  id                        NUMBER not null,
  network_segment_member_id NUMBER not null,
  energy_source_id          NUMBER not null,
  energy_source_type2       VARCHAR2(30),
  delivery_type_code        VARCHAR2(30),
  dealings_type_code        VARCHAR2(30),
  copied_from               number,
  occurrence_way            varchar2(30 char) not null,
  create_by                 NUMBER,
  create_date               TIMESTAMP(6),
  last_update_by            NUMBER,
  last_update_date          TIMESTAMP(6)
)
tablespace USERS;

-- Add comments to the table 
comment on table apps.CALC_DISTR_SUPPLIES
  is 'Поставки электроэнергии потребителям от энергоисточников';

-- Add comments to the columns
comment on column apps.CALC_DISTR_SUPPLIES.id
  is 'ID записи';
comment on column apps.CALC_DISTR_SUPPLIES.network_segment_member_id
  is 'ID потребителя в участке сети';
comment on column apps.CALC_DISTR_SUPPLIES.energy_source_id
  is 'ID энергоисточника';
comment on column apps.CALC_DISTR_SUPPLIES.energy_source_type2
  is 'Тип энергоисточника по отношению к филиалу';
comment on column apps.CALC_DISTR_SUPPLIES.delivery_type_code
  is 'Тип поставки';
comment on column apps.CALC_DISTR_SUPPLIES.dealings_type_code
  is 'Вид сделки';
comment on column apps.CALC_DISTR_SUPPLIES.copied_from
  is 'ID строки, из которой скопирована';
comment on column apps.CALC_DISTR_SUPPLIES.occurrence_way
  is 'Способ возникновения записи';
comment on column apps.CALC_DISTR_SUPPLIES.create_by
  is 'Автор записи';
comment on column apps.CALC_DISTR_SUPPLIES.create_date
  is 'Дата и время создания';
comment on column apps.CALC_DISTR_SUPPLIES.last_update_by
  is 'Автор изменения';
comment on column apps.CALC_DISTR_SUPPLIES.last_update_date
  is 'Дата и время изменения';

-- Create/Recreate primary, unique and foreign key constraints 
alter table apps.CALC_DISTR_SUPPLIES
  add constraint PK_CALC_DISTR_SUPPLIES primary key (ID)
  using index 
  tablespace USERS;
  
alter table apps.CALC_DISTR_SUPPLIES
  add constraint FK_CALC_DISTR_SUPPLIES_1 foreign key (NETWORK_SEGMENT_MEMBER_ID)
  references apps.DICT_NETWORK_SEGMENTS_AND_MEMBERS (ID);
  
alter table apps.CALC_DISTR_SUPPLIES
  add constraint FK_CALC_DISTR_SUPPLIES_2 foreign key (ENERGY_SOURCE_ID)
  references apps.DICT_ENERGY_SOURCES (ID);
  
alter table apps.CALC_DISTR_SUPPLIES
  add constraint FK_CALC_DISTR_SUPPLIES_3 foreign key (energy_source_type2)
  references apps.DICT_ENERGY_SOURCE_TYPE2 (CODE);
  
alter table apps.CALC_DISTR_SUPPLIES
  add constraint FK_CALC_DISTR_SUPPLIES_4 foreign key (DELIVERY_TYPE_CODE)
  references apps.DICT_DELIVERY_TYPES (CODE);
  
alter table apps.CALC_DISTR_SUPPLIES
  add constraint FK_CALC_DISTR_SUPPLIES_5 foreign key (DEALINGS_TYPE_CODE)
  references apps.DICT_DEALINGS_TYPES (CODE);
  
alter table apps.CALC_DISTR_SUPPLIES
  add constraint FK_CALC_DISTR_SUPPLIES_6 foreign key (occurrence_way)
  references apps.CALC_DISTR_FRML_WAYS_CREATE (CODE);
