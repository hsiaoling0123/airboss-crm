# ❄️ AirBoss CRM - 冷氣保養與客戶關係管理系統

![AirBoss CRM Banner](https://img.shields.io/badge/Status-In%20Development-blue?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

AirBoss CRM 是一套專為**冷氣工程、水電維修與外勤保養團隊**打造的客戶關係與工單管理系統。透過直覺的視覺化介面、智慧排程與地圖整合，幫助工程人員與後勤團隊輕鬆提升派單效率與客戶滿意度。

---

## 📱 核心功能 (Core Features)

### 📊 1. 首頁 Dashboard 與營收追蹤
- **今日工作清單**：即時掌握當日外勤行程、客戶資訊、服務項目與預估金額。
- **目標與業績統計**：動態視覺化進度條，隨時查看月營收達成率與未收款項。
- **智慧行銷與提醒**：自動彙整回訪提醒、保養到期通知與每日社群行銷任務。

### 👤 2. CRM 客戶管理與設備履歷
- **客戶分級標籤**：支援 VIP、高消費、社區客、潛力客等多維度分類。
- **冷氣設備履歷**：詳細記錄顧客家中的設備品牌（日立、大金等）、坪數、型號與施工注意事項（如：需脫鞋、備有停車位）。
- **完整服務歷程**：整合歷史施工紀錄、保養紀錄與請款狀態。

### 📅 3. 拖曳式排程管理 (Schedule & Calendar)
- **視覺化時間軸**：提供週/日視圖，方便安排與調整外勤師傅行程。
- **直覺拖曳操作**：支援拖曳工單快速變更預約時間與派單人員。

### 🛠️ 4. 自動化保養提醒與工單系統
- **即將到期推播**：系統依保養週期（12 天、45 天、60 天等）自動跳出提醒，促進二次續約。
- **工單狀態流轉**：清楚標示「進行中」、「已完成」、「待收款」，降低漏單與呆帳風險。

### 🗺️ 5. 地圖客戶與區域巡檢 (Map View)
- **Google Maps 整合**：於地圖上直覺標註客戶地理位置。
- **周邊鄰近提醒**：方便外勤師傅在空檔時查看附近是否有待拜訪或保養到期的客戶，實現「順路巡檢」。

### 📈 6. 財務報表與行銷中心
- **財務收支統計**：自動計算月收入、支出、淨利與營收走勢圖。
- **多平台行銷發布**：追蹤 IG、FB、Threads、LINE 廣播與施工影片發布狀況。

---

## 🛠️ 技術架構 (Tech Stack)

- **Frontend (App):** Cross-platform Framework (Flutter / React Native)
- **Backend:** Node.js / Python / Go (RESTful APIs)
- **Database:** PostgreSQL / Firebase
- **Third-party Services:** Google Maps API (地圖定位與地址轉經緯度)

---

## 📂 專案目錄結構 (Project Structure)

```text
airboss-crm/
├── docs/               # 設計圖與 API 文件
├── src/
│   ├── assets/         # 圖片與圖示資源
│   ├── components/     # 可重複使用的 UI 元件
│   ├── models/         # 資料模型 (Data Models)
│   ├── screens/        # 各功能頁面 (Dashboard, Customer, Calendar...)
│   └── services/       # API 與第三方服務整合 (Google Maps API)
└── README.md
