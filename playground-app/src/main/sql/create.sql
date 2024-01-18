CREATE OR REPLACE TABLE location
(
    location_id   INT AUTO_INCREMENT PRIMARY KEY,
    parent_id     INT,
    location_name VARCHAR(128) NOT NULL DEFAULT '',
    phys_addr_1   VARCHAR(128) NOT NULL DEFAULT '',
    phys_addr_2   VARCHAR(128) NOT NULL DEFAULT '',
    phys_addr_3   VARCHAR(128) NOT NULL DEFAULT '',
    phys_addr_4   VARCHAR(128) NOT NULL DEFAULT '',
    post_addr_1   VARCHAR(128) NOT NULL DEFAULT '',
    post_addr_2   VARCHAR(128) NOT NULL DEFAULT '',
    post_addr_3   VARCHAR(128) NOT NULL DEFAULT '',
    post_addr_4   VARCHAR(128) NOT NULL DEFAULT '',
    post_code     VARCHAR(128) NOT NULL DEFAULT '',
    for_order     INT,
    for_transfer  INT,
    for_fortnight INT,
    created_at    DATETIME              DEFAULT NOW(),
    updated_at    DATETIME              DEFAULT NOW(),
    status        INT          NOT NULL
);

CREATE OR REPLACE TABLE project
(
    project_id         INT AUTO_INCREMENT PRIMARY KEY,
    location_id        INT REFERENCES location,
    project_name       VARCHAR(128) NOT NULL DEFAULT '',
    project_start_date DATE,
    project_end_date   DATE,
    is_current         INT,
    created_at         DATETIME              DEFAULT NOW(),
    updated_at         DATETIME              DEFAULT NOW(),
    status             INT          NOT NULL
);

CREATE OR REPLACE TABLE project_phase
(
    project_phase_id         INT AUTO_INCREMENT PRIMARY KEY,
    project_id               INT REFERENCES project,
    project_phase_name       VARCHAR(128) NOT NULL DEFAULT '',
    project_phase_start_date DATE,
    project_phase_end_date   DATE,
    created_at               DATETIME              DEFAULT NOW(),
    updated_at               DATETIME              DEFAULT NOW(),
    status                   INT          NOT NULL
);

CREATE OR REPLACE TABLE building_plan
(
    building_plan_id   INT AUTO_INCREMENT PRIMARY KEY,
    project_id         INT REFERENCES project,
    building_plan_name VARCHAR(128) NOT NULL DEFAULT '',
    created_at         DATETIME              DEFAULT NOW(),
    updated_at         DATETIME              DEFAULT NOW(),
    status             INT          NOT NULL
);

CREATE OR REPLACE TABLE plot
(
    plot_id          INT AUTO_INCREMENT PRIMARY KEY,
    project_id       INT REFERENCES project,
    project_phase_id INT REFERENCES project_phase,
    location_id      INT REFERENCES location,
    building_plan_id INT REFERENCES building_plan,
    plot_name        VARCHAR(128) NOT NULL DEFAULT '',
    created_at       DATETIME              DEFAULT NOW(),
    updated_at       DATETIME              DEFAULT NOW(),
    status           INT          NOT NULL
);

CREATE OR REPLACE TABLE block
(
    block_id         INT AUTO_INCREMENT PRIMARY KEY,
    project_id       INT REFERENCES project,
    project_phase_id INT REFERENCES project_phase,
    plot_id          INT REFERENCES plot,
    location_id      INT REFERENCES location,
    building_plan_id INT REFERENCES building_plan,
    block_name       VARCHAR(128) NOT NULL DEFAULT '',
    created_at       DATETIME              DEFAULT NOW(),
    updated_at       DATETIME              DEFAULT NOW(),
    status           INT          NOT NULL
);

CREATE OR REPLACE TABLE unit
(
    unit_id          INT AUTO_INCREMENT PRIMARY KEY,
    project_id       INT REFERENCES project,
    project_phase_id INT REFERENCES project_phase,
    plot_id          INT REFERENCES plot,
    block_id         INT REFERENCES block,
    location_id      INT REFERENCES location,
    building_plan_id INT REFERENCES building_plan,
    block_name       VARCHAR(128) NOT NULL DEFAULT '',
    created_at       DATETIME              DEFAULT NOW(),
    updated_at       DATETIME              DEFAULT NOW(),
    status           INT          NOT NULL
);

CREATE OR REPLACE TABLE trade
(
    trade_id   INT AUTO_INCREMENT PRIMARY KEY,
    trade_name VARCHAR(128) NOT NULL DEFAULT '',
    created_at DATETIME              DEFAULT NOW(),
    updated_at DATETIME              DEFAULT NOW(),
    status     INT          NOT NULL
);

CREATE OR REPLACE TABLE stock_type
(
    stock_type_id   INT AUTO_INCREMENT PRIMARY KEY,
    trade_id        INT REFERENCES trade,
    stock_type_name VARCHAR(128) NOT NULL DEFAULT '',
    created_at      DATETIME              DEFAULT NOW(),
    updated_at      DATETIME              DEFAULT NOW(),
    status          INT          NOT NULL
);

CREATE OR REPLACE TABLE stock_item
(
    stock_item_id   INT AUTO_INCREMENT PRIMARY KEY,
    trade_id        INT REFERENCES trade,
    stock_type_id   INT REFERENCES stock_type,
    stock_item_name VARCHAR(128) NOT NULL DEFAULT '',
    specification   VARCHAR(128) NOT NULL DEFAULT '',
    created_at      DATETIME              DEFAULT NOW(),
    updated_at      DATETIME              DEFAULT NOW(),
    status          INT          NOT NULL
);

CREATE OR REPLACE TABLE supplier
(
    supplier_id    INT AUTO_INCREMENT PRIMARY KEY,
    location_id    INT REFERENCES location,
    supplier_name  VARCHAR(128) NOT NULL DEFAULT '',
    contact_person VARCHAR(128) NOT NULL DEFAULT '',
    tel            VARCHAR(128) NOT NULL DEFAULT '',
    cell           VARCHAR(128) NOT NULL DEFAULT '',
    fax            VARCHAR(128) NOT NULL DEFAULT '',
    email          VARCHAR(256) NOT NULL DEFAULT '',
    email_cc       VARCHAR(256) NOT NULL DEFAULT '',
    created_at     DATETIME              DEFAULT NOW(),
    updated_at     DATETIME              DEFAULT NOW(),
    status         INT          NOT NULL
);

CREATE OR REPLACE TABLE supplier_stock
(
    supplier_stock_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_id       INT REFERENCES supplier,
    stock_item_id     INT REFERENCES stock_item,
    product_code      VARCHAR(128) NOT NULL DEFAULT '',
    cost_price        NUMERIC(9, 2)         DEFAULT 0,
    cost_price_data   DATE                  DEFAULT NOW(),
    created_at        DATETIME              DEFAULT NOW(),
    updated_at        DATETIME              DEFAULT NOW(),
    status            INT          NOT NULL
);

CREATE OR REPLACE TABLE order_status
(
    order_status_id   INT AUTO_INCREMENT PRIMARY KEY,
    rank_seq          INT,
    order_status_name VARCHAR(128)
);

CREATE OR REPLACE TABLE order_hdr
(
    order_hdr_id     INT AUTO_INCREMENT PRIMARY KEY,
    order_status_id  INT REFERENCES order_status,
    supplier_id      INT REFERENCES supplier,
    project_id       INT REFERENCES project,
    project_phase_id INT          NULL,
    plot_id          INT          NULL,
    block_id         INT          NULL,
    unit_id          INT          NULL,
    order_ref        VARCHAR(128) NOT NULL,
    order_date       DATE         NOT NULL,
    cancel_date      DATE         NOT NULL,
    exp_del_date     DATE         NOT NULL,
    act_del_date     DATE         NOT NULL,
    instructions     TEXT         NULL,
    rec_note         TEXT         NULL,
    created_at       DATETIME DEFAULT NOW(),
    updated_at       DATETIME DEFAULT NOW(),
    status           INT          NOT NULL
);

CREATE OR REPLACE TABLE order_detail
(
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_hdr_id    INT REFERENCES order_hdr,
    stock_item_id   INT REFERENCES stock_item,
    catalogue_ref   VARCHAR(128)  NULL,
    qty_ordered     INT           NOT NULL DEFAULT 0,
    qty_received    INT           NOT NULL DEFAULT 0,
    qty_cancelled   INT           NOT NULL DEFAULT 0,
    qty_invoiced    INT           NOT NULL DEFAULT 0,
    cost            NUMERIC(9, 2) NOT NULL DEFAULT 0,
    vat             NUMERIC(9, 2) NOT NULL DEFAULT 0,
    created_at      DATETIME               DEFAULT NOW(),
    updated_at      DATETIME               DEFAULT NOW(),
    status          INT           NOT NULL
);

