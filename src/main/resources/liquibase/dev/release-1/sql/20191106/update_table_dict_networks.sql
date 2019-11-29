-- Add/modify columns 
alter table apps.DICT_NETWORKS add order_num number default 1 not null;
-- Add comments to the columns 
comment on column apps.DICT_NETWORKS.order_num
  is 'Порядок отображения';
