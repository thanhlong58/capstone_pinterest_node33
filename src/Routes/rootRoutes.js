import express from 'express';
// import foodRoutes from './foodRoutes.js';

// import userRoutes from './userRotues.js';
import picRoutes from './picRoutes.js';
import userRoutes from './userRoutes.js';
//  quản lý tên đối tượng endpoint
const rootRoutes = express.Router();



//quản lý đối tượng hình ảnh 
rootRoutes.use('/pic',picRoutes)
//quản lý đối tượng user
rootRoutes.use('/user',userRoutes)

export default rootRoutes;