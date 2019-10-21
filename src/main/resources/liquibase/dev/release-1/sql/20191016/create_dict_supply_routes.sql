-- Создается взамен таблицы DICT_NETWORK_SEGMENT_RULES

        -- Create table
        create table apps.DICT_SUPPLY_ROUTES
        (
        id                   NUMBER not null,
        network_segment_code VARCHAR2(30) not null,
        energy_source_id     NUMBER,
        consumer_id          NUMBER,
        consumer_unit_id     NUMBER,
        network_code         VARCHAR2(20),
        expected_share       NUMBER,
        start_date           TIMESTAMP(6),
        end_date             TIMESTAMP(6),
        create_by            NUMBER,
        create_date          TIMESTAMP(6),
        last_update_by       NUMBER,
        last_update_date     TIMESTAMP(6)
        )
        tablespace USERS;

        -- Add comments to the table
        comment on table apps.DICT_SUPPLY_ROUTES
        is 'Настройка маршрутов доставки по сетям для потребителей в участках сети';

        -- Add comments to the columns
        comment on column apps.DICT_SUPPLY_ROUTES.id
        is 'Ид';
        comment on column apps.DICT_SUPPLY_ROUTES.network_segment_code
        is 'код участка сети';
        comment on column apps.DICT_SUPPLY_ROUTES.energy_source_id
        is 'идентификатор энергоисточника';
        comment on column apps.DICT_SUPPLY_ROUTES.consumer_id
        is 'идентификатор потребителя';
        comment on column apps.DICT_SUPPLY_ROUTES.consumer_unit_id
        is 'идентификатор подразделения потребителя';
        comment on column apps.DICT_SUPPLY_ROUTES.network_code
        is 'Код сети';
        comment on column apps.DICT_SUPPLY_ROUTES.expected_share
        is 'Ожидаемая доля поставки по сети, %';
        comment on column apps.DICT_SUPPLY_ROUTES.start_date
        is 'Срок действия с';
        comment on column apps.DICT_SUPPLY_ROUTES.end_date
        is 'Срок действия по';
        comment on column apps.DICT_SUPPLY_ROUTES.create_date
        is 'Дата создания';
        comment on column apps.DICT_SUPPLY_ROUTES.last_update_date
        is 'Дата обновления';
        comment on column apps.DICT_SUPPLY_ROUTES.create_by
        is 'Автор';
        comment on column apps.DICT_SUPPLY_ROUTES.last_update_by
        is 'Автор обновления';

        -- Create/Recreate primary, unique and foreign key constraints
        alter table apps.DICT_SUPPLY_ROUTES
        add constraint PK_DICT_SUPPLY_ROUTES primary key (ID)
        using index
        tablespace USERS;
        alter table apps.DICT_SUPPLY_ROUTES
        add constraint FK_DICT_SUPPLY_ROUTES_1 foreign key (network_segment_code)
        references apps.DICT_NETWORK_SEGMENTS (CODE);
        alter table apps.DICT_SUPPLY_ROUTES
        add constraint FK_DICT_SUPPLY_ROUTES_2 foreign key (ENERGY_SOURCE_ID)
        references apps.DICT_ENERGY_SOURCES (ID);
        alter table apps.DICT_SUPPLY_ROUTES
        add constraint FK_DICT_SUPPLY_ROUTES_3 foreign key (CONSUMER_ID)
        references apps.CALC_CONSUMERS (ID);
        alter table apps.DICT_SUPPLY_ROUTES
        add constraint FK_DICT_SUPPLY_ROUTES_4 foreign key (CONSUMER_UNIT_ID)
        references apps.CALC_CONSUMERS (ID);
        alter table apps.DICT_SUPPLY_ROUTES
        add constraint FK_DICT_SUPPLY_ROUTES_5 foreign key (network_code)
        references apps.DICT_NETWORKS (CODE);

        --commit;

        -- Don't forget to run
        -- DROP TABLE apps.DICT_NETWORK_SEGMENT_RULES cascade constraints;