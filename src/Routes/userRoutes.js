import express from 'express';
import { getUserDetail,getSavedImagesByUserId ,getCreatedImagesbyUserId,signUp,signIn,updateUser} from '../Controllers/userrController.js';
import { checkToken } from '../Config/jwtConfig.js';

const userRoutes = express.Router();

//đăng ký tài khoản 
userRoutes.post('/sign-up',signUp)

//đăng nhập tài khoản
userRoutes.post("/sign-in",signIn)

//lấy thông tin user 
userRoutes.get('/get-user/:userId',checkToken,getUserDetail)
//lấy danh sách ảnh đã lưu theo user
userRoutes.get('/get-save-images/:userId',checkToken,getSavedImagesByUserId)


//láy danh sách ảnh đã tạo theo user id 
userRoutes.get('/get-created-images/:userId',checkToken,getCreatedImagesbyUserId)

//update thông tin user
userRoutes.put('/update-user/:userId',checkToken,updateUser)


export default userRoutes