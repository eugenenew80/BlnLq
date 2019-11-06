--drop table apps.CALC_DISTR_SUPPLY_TRADERS cascade constraints;
-- Create table
create table apps.CALC_DISTR_SUPPLY_TRADERS
(
  id               NUMBER not null,
  supply_id        NUMBER not null,
  order_num        NUMBER default 1 not null,
  trader_id        NUMBER not null,
  create_by        NUMBER,
  create_date      TIMESTAMP(6),
  last_update_by   NUMBER,
  last_update_date TIMESTAMP(6)
)
tablespace USERS;

-- Add comments to the table 
comment on table apps.CALC_DISTR_SUPPLY_TRADERS
  is 'Трейдеры в поставках электроэнергии';

-- Add comments to the columns
comment on column apps.CALC_DISTR_SUPPLY_TRADERS.id
  is 'ID записи';
comment on column apps.CALC_DISTR_SUPPLY_TRADERS.supply_id
  is 'ID поставки';
comment on column apps.CALC_DISTR_SUPPLY_TRADERS.order_num
  is 'Номер по порядку';
comment on column apps.CALC_DISTR_SUPPLY_TRADERS.trader_id
  is 'ID трейдера или энергоснабжающей организации';
comment on column apps.CALC_DISTR_SUPPLY_TRADERS.create_by
  is 'Автор записи';
comment on column apps.CALC_DISTR_SUPPLY_TRADERS.create_date
  is 'Дата и время создания';
comment on column apps.CALC_DISTR_SUPPLY_TRADERS.last_update_by
  is 'Автор изменения';
comment on column apps.CALC_DISTR_SUPPLY_TRADERS.last_update_date
  is 'Дата и время изменения';

-- Create/Recreate primary, unique and foreign key constraints 
alter table apps.CALC_DISTR_SUPPLY_TRADERS
  add constraint PK_CALC_DISTR_SUPPLY_TRADERS primary key (ID)
  using index 
  tablespace USERS;
  
alter table apps.CALC_DISTR_SUPPLY_TRADERS
  add constraint FK_CALC_DISTR_SUPPLY_TRADERS_1 foreign key (SUPPLY_ID)
  references apps.CALC_DISTR_SUPPLIES (ID);
  
alter table apps.CALC_DISTR_SUPPLY_TRADERS
  add constraint FK_CALC_DISTR_SUPPLY_TRADERS_2 foreign key (TRADER_ID)
  references apps.DICT_BUSINESS_PARTNERS (ID);
