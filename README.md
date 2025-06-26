🚢 Titanic 多容器資料展示專案
本專案使用 Docker Compose 建立三層式架構，展示 Titanic 乘客資料，流程如下：

MySQL 資料庫（匯入 CSV） → Flask 後端 API → Nginx 前端頁面呈現


📁 專案結構
```
titanic_project/
├── docker-compose.yml       
├── mysql/                   
│   ├── init.sql
│   └── titanic.csv
├── flask_app/               
│   ├── Dockerfile
│   ├── app.py
│   ├── requirements.txt
│   └── templates/
│       └── table.html       
├── webserver/               
│   ├── Dockerfile
│   └── index.html           
└── README.md                 
```


執行方式
複製程式碼
```
sudo docker compose up --build
```
開啟瀏覽器輸入：

🔸 資料表（table.html，由 Flask 渲染）
```
IP:5000/table
```

🔸 JSON API（純資料格式）
```
IP:5000/passengers
```

若要停止並刪除所有容器與資源：
```
sudo docker compose down
```
