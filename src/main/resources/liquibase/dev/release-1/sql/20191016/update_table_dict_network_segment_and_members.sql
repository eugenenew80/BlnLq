-- Add/modify columns 
alter table apps.DICT_NETWORK_SEGMENTS_AND_MEMBERS add sub_consumer_id number;
alter table apps.DICT_NETWORK_SEGMENTS_AND_MEMBERS add sub_consumer_unit_id number;
alter table apps.DICT_NETWORK_SEGMENTS_AND_MEMBERS add delivery_assignment_id number;
alter table apps.DICT_NETWORK_SEGMENTS_AND_MEMBERS add header_id number;

-- Add comments to the columns 
comment on column apps.DICT_NETWORK_SEGMENTS_AND_MEMBERS.sub_consumer_id
  is 'ID субабонента';
comment on column apps.DICT_NETWORK_SEGMENTS_AND_MEMBERS.sub_consumer_unit_id
  is 'ID подразделения субабонента';
comment on column apps.DICT_NETWORK_SEGMENTS_AND_MEMBERS.delivery_assignment_id
  is 'ID назначения поставки';
comment on column apps.DICT_NETWORK_SEGMENTS_AND_MEMBERS.header_id
  is 'ID заголовка распределения';

-- Create/Recreate primary, unique and foreign key constraints 
alter table apps.DICT_NETWORK_SEGMENTS_AND_MEMBERS
  add constraint FK_DICT_NETWORK_SEGMENTS_AND_MEMBERS_5 foreign key (SUB_CONSUMER_ID)
  references apps.calc_consumers (ID);
alter table apps.DICT_NETWORK_SEGMENTS_AND_MEMBERS
  add constraint FK_DICT_NETWORK_SEGMENTS_AND_MEMBERS_6 foreign key (SUB_CONSUMER_UNIT_ID)
  references apps.calc_consumers (ID);
alter table apps.DICT_NETWORK_SEGMENTS_AND_MEMBERS
  add constraint FK_DICT_NETWORK_SEGMENTS_AND_MEMBERS_7 foreign key (DELIVERY_ASSIGNMENT_ID)
  references apps.dict_delivery_assignments (ID);
alter table apps.DICT_NETWORK_SEGMENTS_AND_MEMBERS
  add constraint FK_DICT_NETWORK_SEGMENTS_AND_MEMBERS_8 foreign key (HEADER_ID)
  references apps.calc_distribution_headers (ID);
