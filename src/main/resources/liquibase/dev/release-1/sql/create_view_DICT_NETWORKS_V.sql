create or replace view apps.DICT_NETWORKS_V as
  select n.code
        ,ntl.short_name
        ,ntl.name
        ,n.create_by
        ,n.create_date
        ,n.last_update_by
        ,n.last_update_date
    from apps.dict_networks n
    join apps.dict_networks_tl ntl on ntl.network_code = n.code
   where 
      ntl.lang = adm_cfg.adm_locale;
    
    
   
