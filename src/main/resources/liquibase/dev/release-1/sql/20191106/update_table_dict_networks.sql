-- Add/modify columns 
alter table DICT_NETWORKS add order_num number default 1 not null;
-- Add comments to the columns 
comment on column DICT_NETWORKS.order_num
  is 'Порядок отображения';
