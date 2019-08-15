-- Create table
create table APPS.DICT_DM_OF_CTDE
(
  code             VARCHAR2(30 CHAR) not null,
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
comment on table APPS.DICT_DM_OF_CTDE
  is '�������� ��� ����������� ������� ����������� �������� ��� ��������� ������ � �����-�������';
-- Add comments to the columns 
comment on column APPS.DICT_DM_OF_CTDE.code
  is '��� ������';
comment on column APPS.DICT_DM_OF_CTDE.create_by
  is '����� ������';
comment on column APPS.DICT_DM_OF_CTDE.create_date
  is '���� � ����� ��������';
comment on column APPS.DICT_DM_OF_CTDE.last_update_by
  is '����� ���������';
comment on column APPS.DICT_DM_OF_CTDE.last_update_date
  is '���� � ����� ���������� ���������';
-- Create/Recreate indexes 
create index PK_DICT_DM_OF_CTDE on APPS.DICT_DM_OF_CTDE (CODE)
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
alter table APPS.DICT_DM_OF_CTDE
  add constraint PK_DICT_DM_OF_CTDE primary key (CODE)
  deferrable initially deferred;
