-- Add/modify columns 
alter table apps.DICT_CROSS_DATA_ELEMENTS add header_id number;

-- Add comments to the columns 
comment on column apps.DICT_CROSS_DATA_ELEMENTS.header_id
  is 'ID заголовка распределения';

-- Create/Recreate primary, unique and foreign key constraints 
alter table apps.DICT_CROSS_DATA_ELEMENTS
  add constraint FK_DICT_CROSS_DATA_ELEMENTS_13 foreign key (HEADER_ID)
  references apps.calc_distribution_headers (ID);

create index IDX_DICT_CROSS_DATA_ELEMENTS_N8 on apps.DICT_CROSS_DATA_ELEMENTS (HEADER_ID)
  tablespace USERS;