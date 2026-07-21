-- 1. 建立客戶資料表 (Customers)
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    address TEXT,
    latitude DECIMAL(10, 8),   -- 用於 Google Maps 定位
    longitude DECIMAL(11, 8),  -- 用於 Google Maps 定位
    tag VARCHAR(50) DEFAULT '一般客戶', -- VIP, 高消費, 社區客, 潛力客
    birthday DATE,
    job VARCHAR(100),
    company VARCHAR(100),
    tax_id VARCHAR(20),       -- 統一編號
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. 建立冷氣設備履歷表 (Equipments)
CREATE TABLE equipments (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id) ON DELETE CASCADE,
    location_name VARCHAR(50), -- 如：客廳、主臥
    brand VARCHAR(50),         -- 如：日立、大金
    capacity VARCHAR(50),      -- 如：5KW, 3KW
    note TEXT,                 -- 注意事項（如：怕狗、要脫鞋、B2停車）
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. 建立工單與保養紀錄表 (Work Orders)
CREATE TABLE work_orders (
    id SERIAL PRIMARY KEY,
    order_no VARCHAR(20) UNIQUE NOT NULL, -- 工單號 (如：W250722-001)
    customer_id INT REFERENCES customers(id) ON DELETE CASCADE,
    service_type VARCHAR(50) NOT NULL,   -- 保養、維修、清洗
    status VARCHAR(20) DEFAULT '進行中',  -- 進行中, 已完成, 待收款
    scheduled_at TIMESTAMP NOT NULL,      -- 預約時間
    amount DECIMAL(10, 2) DEFAULT 0.00,  -- 金額
    assigned_worker VARCHAR(50),         -- 負責師傅
    note TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 4. 建立自動化保養提醒表 (Maintenance Reminders)
CREATE TABLE maintenance_reminders (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id) ON DELETE CASCADE,
    last_service_date DATE,
    next_service_due DATE NOT NULL,      -- 到期日
    status VARCHAR(20) DEFAULT '即將到期', -- 即將到期, 已提醒, 已續約
    days_left INT                        -- 剩餘天數 (如：12, 45, 60)
);

-- 5. 建立財務紀錄表 (Financials)
CREATE TABLE financial_records (
    id SERIAL PRIMARY KEY,
    type VARCHAR(10) CHECK (type IN ('INCOME', 'EXPENSE')), -- 收入/支出
    category VARCHAR(50),  -- 類別 (如：清洗保養、零件採購)
    amount DECIMAL(10, 2) NOT NULL,
    record_date DATE NOT NULL,
    work_order_id INT REFERENCES work_orders(id) ON DELETE SET NULL,
    note TEXT
);
