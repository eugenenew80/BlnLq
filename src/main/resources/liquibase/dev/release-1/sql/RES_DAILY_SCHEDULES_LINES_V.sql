create or replace view apps.RES_DAILY_SCHEDULES_LINES_V as
  select dsl.id
        ,dsl.header_id
        ,dsl.tab_page_code
        ,dsl.contract_id
        ,c.doc_number || ' от ' || c.doc_date as contract_name
        ,dsl.energy_source_id
        ,destl.short_name as energy_source_short_name
        ,dsl.res_energy_zone_id
        ,deztl1.name as res_energy_zone_name
        ,dsl.customer_energy_zone_id
        ,deztl2.name as customer_energy_zone_name

        ,(select t.val from apps.RES_DAILY_SCHEDULES_SUBLINES t where t.ds_line_id = dsl.id and t.pos = 0) as hour00
        ,(select t.val from apps.RES_DAILY_SCHEDULES_SUBLINES t where t.ds_line_id = dsl.id and t.pos = 1) as hour01
        ,(select t.val from apps.RES_DAILY_SCHEDULES_SUBLINES t where t.ds_line_id = dsl.id and t.pos = 2) as hour02
        ,(select t.val from apps.RES_DAILY_SCHEDULES_SUBLINES t where t.ds_line_id = dsl.id and t.pos = 3) as hour03
        ,(select t.val from apps.RES_DAILY_SCHEDULES_SUBLINES t where t.ds_line_id = dsl.id and t.pos = 4) as hour04
        ,(select t.val from apps.RES_DAILY_SCHEDULES_SUBLINES t where t.ds_line_id = dsl.id and t.pos = 5) as hour05
        ,(select t.val from apps.RES_DAILY_SCHEDULES_SUBLINES t where t.ds_line_id = dsl.id and t.pos = 6) as hour06
        ,(select t.val from apps.RES_DAILY_SCHEDULES_SUBLINES t where t.ds_line_id = dsl.id and t.pos = 7) as hour07
        ,(select t.val from apps.RES_DAILY_SCHEDULES_SUBLINES t where t.ds_line_id = dsl.id and t.pos = 8) as hour08
        ,(select t.val from apps.RES_DAILY_SCHEDULES_SUBLINES t where t.ds_line_id = dsl.id and t.pos = 9) as hour09
        ,(select t.val from apps.RES_DAILY_SCHEDULES_SUBLINES t where t.ds_line_id = dsl.id and t.pos = 10) as hour10
        ,(select t.val from apps.RES_DAILY_SCHEDULES_SUBLINES t where t.ds_line_id = dsl.id and t.pos = 11) as hour11
        ,(select t.val from apps.RES_DAILY_SCHEDULES_SUBLINES t where t.ds_line_id = dsl.id and t.pos = 12) as hour12
        ,(select t.val from apps.RES_DAILY_SCHEDULES_SUBLINES t where t.ds_line_id = dsl.id and t.pos = 13) as hour13
        ,(select t.val from apps.RES_DAILY_SCHEDULES_SUBLINES t where t.ds_line_id = dsl.id and t.pos = 14) as hour14
        ,(select t.val from apps.RES_DAILY_SCHEDULES_SUBLINES t where t.ds_line_id = dsl.id and t.pos = 15) as hour15
        ,(select t.val from apps.RES_DAILY_SCHEDULES_SUBLINES t where t.ds_line_id = dsl.id and t.pos = 16) as hour16
        ,(select t.val from apps.RES_DAILY_SCHEDULES_SUBLINES t where t.ds_line_id = dsl.id and t.pos = 17) as hour17
        ,(select t.val from apps.RES_DAILY_SCHEDULES_SUBLINES t where t.ds_line_id = dsl.id and t.pos = 18) as hour18
        ,(select t.val from apps.RES_DAILY_SCHEDULES_SUBLINES t where t.ds_line_id = dsl.id and t.pos = 19) as hour19
        ,(select t.val from apps.RES_DAILY_SCHEDULES_SUBLINES t where t.ds_line_id = dsl.id and t.pos = 20) as hour20
        ,(select t.val from apps.RES_DAILY_SCHEDULES_SUBLINES t where t.ds_line_id = dsl.id and t.pos = 21) as hour21
        ,(select t.val from apps.RES_DAILY_SCHEDULES_SUBLINES t where t.ds_line_id = dsl.id and t.pos = 22) as hour22
        ,(select t.val from apps.RES_DAILY_SCHEDULES_SUBLINES t where t.ds_line_id = dsl.id and t.pos = 23) as hour23
        ,dsl.total
        ,dsl.is_fixed
        ,dsl.unit_id
        ,dutl.short_name as unit_short_name

        ,dsl.times_series_header_id
        ,dsl.create_by
        ,dsl.create_date
        ,dsl.last_update_by
        ,dsl.last_update_date
        
        
    from apps.RES_DAILY_SCHEDULES_LINES dsl
    join apps.cm_doc_keg_cte c on dsl.contract_id = c.id
    left join apps.dict_energy_sources_tl destl on destl.energy_source_id = dsl.energy_source_id
                                               and destl.lang = 'RU'
    left join apps.dict_energy_zones_tl deztl1 on deztl1.energy_zone_id = dsl.res_energy_zone_id
                                              and deztl1.lang = 'RU'
    left join apps.dict_energy_zones_tl deztl2 on deztl2.energy_zone_id = dsl.customer_energy_zone_id
                                              and deztl2.lang = 'RU'
    left join apps.dict_units_tl dutl on dutl.unit_id = dsl.unit_id
                                     and dutl.lang = 'RU'
   