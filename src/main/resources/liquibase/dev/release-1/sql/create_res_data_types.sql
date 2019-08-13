-- Create table
create table APPS.RES_DATA_TYPES
(
code VARCHAR2(20 CHAR) not null,
priority NUMBER,
create_by NUMBER,
create_date TIMESTAMP(6),
last_update_by NUMBER,
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
comment on table APPS.RES_DATA_TYPES
is 'Справочник Виды расчетов ТОО РФЦ';
-- Add comments to the columns
comment on column APPS.RES_DATA_TYPES.code
is 'Код расчета';
comment on column APPS.RES_DATA_TYPES.priority
is 'Приоритет';
comment on column APPS.RES_DATA_TYPES.create_by
is 'Автор';
comment on column APPS.RES_DATA_TYPES.create_date
is 'Дата создания';
comment on column APPS.RES_DATA_TYPES.last_update_by
is 'Автор изменения';
comment on column APPS.RES_DATA_TYPES.last_update_date
is 'Дата изменения';
-- Create/Recreate primary, unique and foreign key constraints
alter table APPS.RES_DATA_TYPES
add constraint PK_RES_DATA_TYPES primary key (CODE)
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