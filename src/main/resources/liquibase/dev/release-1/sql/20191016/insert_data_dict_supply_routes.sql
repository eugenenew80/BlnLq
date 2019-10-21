-- Copy data to table DICT_SUPPLY_ROUTES
INSERT into apps.dict_supply_routes
  (id
  ,network_segment_code
  ,energy_source_id
  ,consumer_id
  ,consumer_unit_id
  ,network_code
  ,expected_share
  ,start_date
  ,end_date
  ,create_by
  ,create_date
  ,last_update_by
  ,last_update_date)
  SELECT id
        ,network_segment_code
        ,energy_source_id
        ,consumer_id
        ,consumer_unit_id
        ,network_code
        ,expected_share
        ,start_date
        ,end_date
        ,create_by
        ,create_date
        ,last_update_by
        ,last_update_date
    FROM apps.dict_network_segment_rules t
   WHERE t.id not in (SELECT x.id
                        FROM apps.dict_supply_routes x);
