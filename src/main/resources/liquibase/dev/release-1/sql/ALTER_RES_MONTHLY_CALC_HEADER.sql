-- Create/Recreate primary, unique and foreign key constraints 
alter table RES_MONTHLY_CALC_HEADERS
  drop constraint FK_RES_MONTHLY_CALC_HEADERS_2;
alter table RES_MONTHLY_CALC_HEADERS
  add constraint FK_RES_MONTHLY_CALC_HEADERS_2 foreign key (CALC_TYPE_CODE)
  references res_data_types (CODE)
  deferrable initially deferred;
