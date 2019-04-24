create or replace package apps.res_pkg is

  -- Author  : STARKOV
  -- Created : 22-апр-19 17:04:15
  -- Purpose : Для РФЦ по ВИЭ
  
  --Процедура для добавления прогнозных обьемов производства на сутки
  procedure res_time_series_line_add(p_header_id apps.res_time_series_lines.header_id%type,
                                     p_pos apps.res_time_series_lines.pos%type,
                                     p_val apps.res_time_series_lines.val%type);
                            
end res_pkg;
/
create or replace package body apps.res_pkg is

  --Процедура для добавления прогнозных обьемов производства на сутки
  procedure res_time_series_line_add(p_header_id apps.res_time_series_lines.header_id%type,
                                     p_pos apps.res_time_series_lines.pos%type,
                                     p_val apps.res_time_series_lines.val%type)
   is
   begin
    insert into res_time_series_lines(header_id,
                                      pos,
                                      val)
                               values(p_header_id,
                                      p_pos,
                                      p_val);
   end;                                    
                                                


end res_pkg;
/
