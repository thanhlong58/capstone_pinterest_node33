import express from "express";
import {
  getCommentsByPictureId,
  getPic,
  getPicbyName,
  getPictureDetail,
  postComment,
  
  postPic,
  getPicsRelated,
  
  savePic,
  checkIsSaved,
  deleteImage

} from "../Controllers/picController.js";

import multer from "multer";
import { checkToken } from "../Config/jwtConfig.js";

const picRoutes = express.Router();
const storage = multer.diskStorage({
  destination: process.cwd() + "/public/img", 
  filename: (req, file, callback) => {
   
    let date = new Date(); 
    let newName = date.getTime();

    callback(null, newName + "_" + file.originalname); 
  }, 
});

const upload = multer({ storage });

// lấy danh sách ảnh
picRoutes.get("/get-pic",checkToken, getPic);
//tìm kiếm danh sách hình ảnh theo tên
picRoutes.get("/get-pic-by-name/:picName",checkToken, getPicbyName);

//lấy thông tin  ảnh và người tạo dựa vào id ảnh
picRoutes.get("/get-pic-detail/:picId",checkToken, getPictureDetail);




//lấy thông tin bình luận theo ảnh
picRoutes.get("/get-comment-detail/:picId",checkToken, getCommentsByPictureId);

//Lưu ảnh 
picRoutes.post("/save-pic/:picId/:userId",checkToken, savePic);

//post bình luận
picRoutes.post("/comment/:picId",checkToken, postComment);

//thêm ảnh
picRoutes.post("/post-pic", upload.single("file"),checkToken, postPic);

//lấy ảnh liên quan theo hình id 

picRoutes.get("/get-pics-related/:picId",checkToken,getPicsRelated)



//kiểm tra ảnh đã lưu hay chưa theo id ảnh và user id 
picRoutes.get("/is-saved/:picId/:userId",checkToken,checkIsSaved)

//xóa ảnh đã tạo theo id ảnh 
picRoutes.delete("/delete-image/:picId/:userId",checkToken,deleteImage)

export default picRoutes;
