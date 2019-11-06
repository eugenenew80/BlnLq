-- Add/modify columns 
alter table apps.CALC_DISTRIBUTION_HEADERS add status varchar2(30);
alter table apps.CALC_DISTRIBUTION_HEADERS add formation_method varchar2(30 char);

-- Add comments to the columns 
comment on column apps.CALC_DISTRIBUTION_HEADERS.status
  is 'Статус формирования';

comment on column apps.CALC_DISTRIBUTION_HEADERS.formation_method
  is 'Способ формирования документа';

-- Create/Recreate primary, unique and foreign key constraints 
alter table apps.CALC_DISTRIBUTION_HEADERS
  add constraint FK_CALC_DISTRIBUTION_HEADERS_8 foreign key (STATUS)
  references apps.media_batch_statuses (CODE);
alter table apps.CALC_DISTRIBUTION_HEADERS
  add constraint FK_CALC_DISTRIBUTION_HEADERS_9 foreign key (FORMATION_METHOD)
  references apps.calc_distr_formation_methods (CODE);
