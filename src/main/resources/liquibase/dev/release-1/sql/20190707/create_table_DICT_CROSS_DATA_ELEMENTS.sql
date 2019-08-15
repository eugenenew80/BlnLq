-- Create table
create table APPS.DICT_CROSS_DATA_ELEMENTS
(
  id                        NUMBER not null,
  network_segment_member_id NUMBER,
  energy_source_id          NUMBER,
  network_segment_code      VARCHAR2(30),
  member_param_id           NUMBER not null,
  data_source_system_id     NUMBER not null,
  bems_code                 VARCHAR2(20 CHAR),
  metering_point_id         NUMBER,
  metering_point_param_id   NUMBER,
  factor                    NUMBER default 1 not null,
  network_code              VARCHAR2(20 CHAR) not null,
  plan_fact                 VARCHAR2(4 CHAR) not null,
  determination_method      VARCHAR2(30 CHAR) not null,
  influence_degree_code     VARCHAR2(30 CHAR) default 'NONE' not null,
  affects_on_element_id     NUMBER,
  default_display_order     NUMBER,
  create_by                 NUMBER,
  create_date               TIMESTAMP(6),
  last_update_by            NUMBER,
  last_update_date          TIMESTAMP(6)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table APPS.DICT_CROSS_DATA_ELEMENTS
  is '�������� ������ ��� �����-������� ���������� ������� ������� ����';
-- Add comments to the columns 
comment on column APPS.DICT_CROSS_DATA_ELEMENTS.id
  is '�������������';
comment on column APPS.DICT_CROSS_DATA_ELEMENTS.network_segment_member_id
  is '������������� ��������� ������� ';
comment on column APPS.DICT_CROSS_DATA_ELEMENTS.energy_source_id
  is '������������� ���������������';
comment on column APPS.DICT_CROSS_DATA_ELEMENTS.network_segment_code
  is '��� ������� ����';
comment on column APPS.DICT_CROSS_DATA_ELEMENTS.member_param_id
  is '�������� ��������� ����';
comment on column APPS.DICT_CROSS_DATA_ELEMENTS.data_source_system_id
  is '������������� ������� ��������� ������';
comment on column APPS.DICT_CROSS_DATA_ELEMENTS.bems_code
  is '��� ����';
comment on column APPS.DICT_CROSS_DATA_ELEMENTS.metering_point_id
  is '������������� ����� �����';
comment on column APPS.DICT_CROSS_DATA_ELEMENTS.metering_point_param_id
  is '�������� ����� �����';
comment on column APPS.DICT_CROSS_DATA_ELEMENTS.factor
  is '���������';
comment on column APPS.DICT_CROSS_DATA_ELEMENTS.network_code
  is '��� ����';
comment on column APPS.DICT_CROSS_DATA_ELEMENTS.plan_fact
  is '������� ����/���� (PLAN - �������� ��������, FACT - ����������� ��������)';
comment on column APPS.DICT_CROSS_DATA_ELEMENTS.determination_method
  is '����� ����������� ��������';
comment on column APPS.DICT_CROSS_DATA_ELEMENTS.influence_degree_code
  is '������� ������� �� ������ �������� (NONE-�� ������, INCREASES-�����������, DECREASES-���������)';
comment on column APPS.DICT_CROSS_DATA_ELEMENTS.affects_on_element_id
  is '������ �� ������� ������';
comment on column APPS.DICT_CROSS_DATA_ELEMENTS.default_display_order
  is '������� ����������� � ��������� �� ���������';
comment on column APPS.DICT_CROSS_DATA_ELEMENTS.create_by
  is '����� ������';
comment on column APPS.DICT_CROSS_DATA_ELEMENTS.create_date
  is '���� � ����� ��������';
comment on column APPS.DICT_CROSS_DATA_ELEMENTS.last_update_by
  is '����� ���������';
comment on column APPS.DICT_CROSS_DATA_ELEMENTS.last_update_date
  is '���� � ����� ���������';
-- Create/Recreate indexes 
create index APPS.IDX_DICT_CROSS_DATA_ELEMENTS_N1 on APPS.DICT_CROSS_DATA_ELEMENTS (NETWORK_SEGMENT_MEMBER_ID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index APPS.IDX_DICT_CROSS_DATA_ELEMENTS_N2 on APPS.DICT_CROSS_DATA_ELEMENTS (ENERGY_SOURCE_ID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index APPS.IDX_DICT_CROSS_DATA_ELEMENTS_N3 on APPS.DICT_CROSS_DATA_ELEMENTS (NETWORK_SEGMENT_CODE)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index APPS.IDX_DICT_CROSS_DATA_ELEMENTS_N4 on APPS.DICT_CROSS_DATA_ELEMENTS (PLAN_FACT, MEMBER_PARAM_ID, NETWORK_CODE)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index APPS.IDX_DICT_CROSS_DATA_ELEMENTS_N5 on APPS.DICT_CROSS_DATA_ELEMENTS (BEMS_CODE)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index APPS.IDX_DICT_CROSS_DATA_ELEMENTS_N6 on APPS.DICT_CROSS_DATA_ELEMENTS (METERING_POINT_ID, METERING_POINT_PARAM_ID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index APPS.IDX_DICT_CROSS_DATA_ELEMENTS_N7 on APPS.DICT_CROSS_DATA_ELEMENTS (AFFECTS_ON_ELEMENT_ID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table APPS.DICT_CROSS_DATA_ELEMENTS
  add constraint PK_DICT_CROSS_DATA_ELEMENTS primary key (ID)
  deferrable initially deferred
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table APPS.DICT_CROSS_DATA_ELEMENTS
  add constraint FK_DICT_CROSS_DATA_ELEMENTS_1 foreign key (AFFECTS_ON_ELEMENT_ID)
  references APPS.DICT_CROSS_DATA_ELEMENTS (ID)
  deferrable initially deferred;
alter table APPS.DICT_CROSS_DATA_ELEMENTS
  add constraint FK_DICT_CROSS_DATA_ELEMENTS_10 foreign key (PLAN_FACT)
  references APPS.DICT_PLAN_FACT (CODE)
  deferrable initially deferred;
alter table APPS.DICT_CROSS_DATA_ELEMENTS
  add constraint FK_DICT_CROSS_DATA_ELEMENTS_11 foreign key (DETERMINATION_METHOD)
  references APPS.DICT_DM_OF_CTDE (CODE)
  deferrable initially deferred;
alter table APPS.DICT_CROSS_DATA_ELEMENTS
  add constraint FK_DICT_CROSS_DATA_ELEMENTS_12 foreign key (INFLUENCE_DEGREE_CODE)
  references APPS.DICT_CTDE_INFLUENCE_DEGREES (CODE)
  deferrable initially deferred;
alter table APPS.DICT_CROSS_DATA_ELEMENTS
  add constraint FK_DICT_CROSS_DATA_ELEMENTS_2 foreign key (NETWORK_SEGMENT_MEMBER_ID)
  references APPS.DICT_NETWORK_SEGMENTS_AND_MEMBERS (ID)
  deferrable initially deferred;
alter table APPS.DICT_CROSS_DATA_ELEMENTS
  add constraint FK_DICT_CROSS_DATA_ELEMENTS_3 foreign key (ENERGY_SOURCE_ID)
  references APPS.DICT_ENERGY_SOURCES (ID)
  deferrable initially deferred;
alter table APPS.DICT_CROSS_DATA_ELEMENTS
  add constraint FK_DICT_CROSS_DATA_ELEMENTS_4 foreign key (NETWORK_SEGMENT_CODE)
  references APPS.DICT_NETWORK_SEGMENTS (CODE)
  deferrable initially deferred;
alter table APPS.DICT_CROSS_DATA_ELEMENTS
  add constraint FK_DICT_CROSS_DATA_ELEMENTS_5 foreign key (MEMBER_PARAM_ID)
  references APPS.MEDIA_PARAMETERS (ID)
  deferrable initially deferred;
alter table APPS.DICT_CROSS_DATA_ELEMENTS
  add constraint FK_DICT_CROSS_DATA_ELEMENTS_6 foreign key (DATA_SOURCE_SYSTEM_ID)
  references APPS.DICT_DATA_SOURCES (ID)
  deferrable initially deferred;
alter table APPS.DICT_CROSS_DATA_ELEMENTS
  add constraint FK_DICT_CROSS_DATA_ELEMENTS_7 foreign key (METERING_POINT_ID)
  references APPS.DICT_METERING_POINTS (ID)
  deferrable initially deferred;
alter table APPS.DICT_CROSS_DATA_ELEMENTS
  add constraint FK_DICT_CROSS_DATA_ELEMENTS_8 foreign key (METERING_POINT_PARAM_ID)
  references APPS.MEDIA_PARAMETERS (ID)
  deferrable initially deferred;
alter table APPS.DICT_CROSS_DATA_ELEMENTS
  add constraint FK_DICT_CROSS_DATA_ELEMENTS_9 foreign key (NETWORK_CODE)
  references APPS.DICT_NETWORKS (CODE)
  deferrable initially deferred;
