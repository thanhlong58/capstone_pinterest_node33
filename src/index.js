import express from 'express';
const app = express();
app.use(express.json()) // hàm gọi middleware chuyển đổi cấu trúc json để backend nhận được

import cors from 'cors';
app.use(cors()); // middleware chấp nhận tất FE truy cập vào
app.use(express.static(".")) 
app.listen(8080); 


// localhost:8080/api/food/get-food
// localhost:8080/api/user/get-user
import rootRoutes from './Routes/rootRoutes.js';

app.use("/api",rootRoutes)



// kết CSDL
// yarn add mysql2
// import mysql2 from 'mysql2';

// const conn = mysql2.createConnection({
//     host: "localhost",
//     user: "root",
//     password: "1234",
//     database: "db_node33",
//     port: "3306"
// })