-- Create table
create table APPS.DICT_CTDE_INFLUENCE_DEGREES
(
  code             VARCHAR2(20 CHAR) not null,
  factor           NUMBER not null,
  create_by        NUMBER,
  create_date      TIMESTAMP(6),
  last_update_by   NUMBER,
  last_update_date TIMESTAMP(6)
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
comment on table APPS.DICT_CTDE_INFLUENCE_DEGREES
  is '���������� ������� ������� �� ����������� ��������� ������ � �����-�������';
-- Add comments to the columns 
comment on column APPS.DICT_CTDE_INFLUENCE_DEGREES.code
  is '��� ������� �������';
comment on column APPS.DICT_CTDE_INFLUENCE_DEGREES.factor
  is '���������';
comment on column APPS.DICT_CTDE_INFLUENCE_DEGREES.create_by
  is '����� ������';
comment on column APPS.DICT_CTDE_INFLUENCE_DEGREES.create_date
  is '���� � ����� ��������';
comment on column APPS.DICT_CTDE_INFLUENCE_DEGREES.last_update_by
  is '����� ���������';
comment on column APPS.DICT_CTDE_INFLUENCE_DEGREES.last_update_date
  is '���� � ����� ���������';
-- Create/Recreate primary, unique and foreign key constraints 
alter table APPS.DICT_CTDE_INFLUENCE_DEGREES
  add constraint PK_DICT_CTDE_INFLUENCE_DEGREES primary key (CODE)
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
