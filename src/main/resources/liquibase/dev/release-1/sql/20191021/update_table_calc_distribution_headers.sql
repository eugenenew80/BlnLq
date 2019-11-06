-- Drop primary, unique and foreign key constraints 
alter table apps.CALC_DISTRIBUTION_HEADERS
  drop constraint FK_CALC_DISTRIBUTION_HEADERS_6;

-- Drop columns 
alter table apps.CALC_DISTRIBUTION_HEADERS drop column source_doc_id;

-- Add/modify columns 
alter table apps.CALC_DISTRIBUTION_HEADERS rename column calculation_data to CALC_DATE;
