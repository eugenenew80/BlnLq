-- Create table
create table apps.CALC_DISTRIBUTION_LINE_PROPS
(
  line_id          NUMBER not null,
  property_code    VARCHAR2(30) not null,
  property_val     VARCHAR2(30),
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
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table apps.CALC_DISTRIBUTION_LINE_PROPS
  is 'Значения свойств строки распределения электроэнергии';
-- Add comments to the columns
comment on column apps.CALC_DISTRIBUTION_LINE_PROPS.line_id
  is 'Идентификатор строки распределения';
comment on column apps.CALC_DISTRIBUTION_LINE_PROPS.property_code
  is 'Код свойства';
comment on column apps.CALC_DISTRIBUTION_LINE_PROPS.property_val
  is 'Значение свойства';
comment on column apps.CALC_DISTRIBUTION_LINE_PROPS.create_by
  is 'Автор записи';
comment on column apps.CALC_DISTRIBUTION_LINE_PROPS.create_date
  is 'Дата и время создания записи';
comment on column apps.CALC_DISTRIBUTION_LINE_PROPS.last_update_by
  is 'Автор последнего изменения';
comment on column apps.CALC_DISTRIBUTION_LINE_PROPS.last_update_date
  is 'Дата и время изменения записи';
-- Create/Recreate primary, unique and foreign key constraints 
alter table apps.CALC_DISTRIBUTION_LINE_PROPS
  add constraint PK_CALC_DISTRIBUTION_LINE_PROPS primary key (LINE_ID, PROPERTY_CODE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
