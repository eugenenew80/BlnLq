drop table apps.RES_MONTHLY_CALC_LINES cascade constraints;
-- Create table
create table apps.RES_MONTHLY_CALC_LINES
(
  id                   NUMBER not null,
  header_id            NUMBER not null,
  tab_page_code        VARCHAR2(30) not null,
  contract_id          NUMBER not null,
  countrparty_id       NUMBER not null,
  energy_source_id     NUMBER,
  energy_group_id      NUMBER,
  amount               NUMBER,
  is_fixed             NUMBER default 0 not null,
  transfer_to_fin_date TIMESTAMP(6),
  create_by            NUMBER,
  create_date          TIMESTAMP(6),
  last_update_by       NUMBER,
  last_update_date     TIMESTAMP(6)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table apps.RES_MONTHLY_CALC_LINES
  is '������ �������� ��� ��� �� �����';
-- Add comments to the columns 
comment on column apps.RES_MONTHLY_CALC_LINES.id
  is '������������� ������';
comment on column apps.RES_MONTHLY_CALC_LINES.header_id
  is '������������� ��������� �������';
comment on column apps.RES_MONTHLY_CALC_LINES.tab_page_code
  is '������������� �������: PURCHASE - ������� �� ���, MIDDLE - ������ � ���� ��, SALE - ������� ��';
comment on column apps.RES_MONTHLY_CALC_LINES.contract_id
  is '������������� ��������';
comment on column apps.RES_MONTHLY_CALC_LINES.countrparty_id
  is '������������� �����������';
comment on column apps.RES_MONTHLY_CALC_LINES.energy_source_id
  is '������������� ��������������';
comment on column apps.RES_MONTHLY_CALC_LINES.energy_group_id
  is '������������� ������ ��������������';
comment on column apps.RES_MONTHLY_CALC_LINES.amount
  is '����� ��������������';
comment on column apps.RES_MONTHLY_CALC_LINES.is_fixed
  is '������������� �� ��������� (���������� ����)';
comment on column apps.RES_MONTHLY_CALC_LINES.transfer_to_fin_date
  is '���� �������� � ���������� �������';
comment on column apps.RES_MONTHLY_CALC_LINES.create_by
  is '����� ������';
comment on column apps.RES_MONTHLY_CALC_LINES.create_date
  is '���� � ����� �������� ������';
comment on column apps.RES_MONTHLY_CALC_LINES.last_update_by
  is '����� ���������� ���������';
comment on column apps.RES_MONTHLY_CALC_LINES.last_update_date
  is '���� � ����� ��������� ������';
-- Create/Recreate primary, unique and foreign key constraints 
alter table apps.RES_MONTHLY_CALC_LINES
  add constraint PK_RES_MONTHLY_CALC_LINES primary key (ID)
  deferrable initially deferred
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
alter table apps.RES_MONTHLY_CALC_LINES
  add constraint FK_RES_MONTHLY_CALC_LINES_1 foreign key (HEADER_ID)
  references apps.RES_MONTHLY_CALC_HEADERS (ID) on delete cascade
  deferrable initially deferred;
alter table apps.RES_MONTHLY_CALC_LINES
  add constraint FK_RES_MONTHLY_CALC_LINES_2 foreign key (CONTRACT_ID)
  references apps.CM_DOC_KEG_CTE (ID)
  deferrable initially deferred;
alter table apps.RES_MONTHLY_CALC_LINES
  add constraint FK_RES_MONTHLY_CALC_LINES_3 foreign key (COUNTRPARTY_ID)
  references apps.DICT_BUSINESS_PARTNERS (ID)
  deferrable initially deferred;
alter table apps.RES_MONTHLY_CALC_LINES
  add constraint FK_RES_MONTHLY_CALC_LINES_4 foreign key (ENERGY_SOURCE_ID)
  references apps.DICT_ENERGY_SOURCES (ID)
  deferrable initially deferred;
alter table apps.RES_MONTHLY_CALC_LINES
  add constraint FK_RES_MONTHLY_CALC_LINES_5 foreign key (ENERGY_GROUP_ID)
  references apps.CALC_ELECTRICITY_PRODUCER_GROUPS (ID)
  deferrable initially deferred;