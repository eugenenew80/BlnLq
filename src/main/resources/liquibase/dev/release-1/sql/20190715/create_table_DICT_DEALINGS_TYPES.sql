-- Create table
create table apps.DICT_DEALINGS_TYPES
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
comment on table apps.DICT_DEALINGS_TYPES
  is '���������� ���� ������';
-- Add comments to the columns 
comment on column apps.DICT_DEALINGS_TYPES.code
  is '��� ���� ������';
comment on column apps.DICT_DEALINGS_TYPES.create_by
  is '����� ������';
comment on column apps.DICT_DEALINGS_TYPES.create_date
  is '���� � ����� ��������';
comment on column apps.DICT_DEALINGS_TYPES.last_update_by
  is '����� ���������';
comment on column apps.DICT_DEALINGS_TYPES.last_update_date
  is '���� � ����� ���������';
-- Create/Recreate primary, unique and foreign key constraints 
alter table apps.DICT_DEALINGS_TYPES
  add constraint PK_DICT_DEALINGS_TYPES primary key (CODE)
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
