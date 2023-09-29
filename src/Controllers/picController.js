import { failedCode, succesCode } from "../Config/response.js";
import sequelize from "../Models/index.js";
import initModels from "../Models/init-models.js";
import { Sequelize } from "sequelize";

const Op = Sequelize.Op;

const model = initModels(sequelize);

//lấy danh sách hình ảnh
const getPic = async (req, res) => {
  try {
    const data = await model.hinh_anh.findAll();
    return succesCode(res, data, "Succeed getting Images");
  } catch (err) {
    return res.status(500).json({ message: "Internal server error" });
  }
};

//tìm kiếm danh sách hình ảnh theo tên

const getPicbyName = async (req, res) => {
  try {
    const { picName } = req.params;

    const data = await model.hinh_anh.findAll({
      where: {
        ten_hinh: {
          [Op.like]: `%${picName}%`,
        },
      },
    });

    if (data.length == 0) {
      return failedCode(res, "", 404, "There is no picture matching");
    }

    return succesCode(res, data, "Succeed");
  } catch (err) {
    return res.status(500).json({ message: "Internal server error" });
  }
};

//TRANG CHI TIẾT
//lấy thông tin ảnh và người tạo dựa vào id ảnh
const getPictureDetail = async (req, res) => {
  try {
    const { picId } = req.params;

    const picture = await model.hinh_anh.findOne({
      where: { hinh_id: picId },
      include: [{ model: model.nguoi_dung, as: "nguoi_dung" }],
    });

    if (!picture) {
      return failedCode(res, "", 404, "Picture not found");
    }

    return succesCode(res, picture, "Succeed");
  } catch (error) {
    return res.status(500).json({ message: "Internal server error" });
  }
};

//lấy thông tin bình luận theo ảnh

const getCommentsByPictureId = async (req, res) => {
  try {
    const { picId } = req.params;

    const comments = await model.binh_luan.findAll({
      where: { hinh_id: picId },
    });

    return res.json({ comments });
  } catch (error) {
    return res.status(500).json({ message: "Internal server error" });
  }
};

//Lưu ảnh

const savePic = async (req, res) => {
  try {
    const { picId, userId } = req.params;
    const currentDate = new Date();

    const existingRow = await model.luu_anh.findOne({
      where: {
        nguoi_dung_id: userId,
        hinh_id: picId,
      },
    });

    if (existingRow) {
      return failedCode(res, "", 400, "Picture is already saved");
    }

    await model.luu_anh.create({
      nguoi_dung_id: userId,
      hinh_id: picId,
      ngay_luu: currentDate,
    });

    const savedPic = await model.hinh_anh.findOne({
      where: {
        hinh_id: picId,
      },
    });

    return succesCode(res, savedPic, "You have saved the picture!");
  } catch (err) {
    return res.status(500).json({ message: "Internal server error" });
  }
};

//post comment

const postComment = async (req, res) => {
  try {
    const currentDate = new Date();

    const { noi_dung, nguoi_dung_id } = req.body;
    const { picId } = req.params;

    const picture = await model.hinh_anh.findOne({
      where: { hinh_id: picId },
    });

    if (!picture) {
      return failedCode(res, "", 404, "Picture not found");
    }

    const newComment = await model.binh_luan.create({
      hinh_id: picId,
      noi_dung,
      nguoi_dung_id,
      ngay_binh_luan: currentDate,
    });

    return succesCode(res, newComment, "You just added a comment!");
  } catch (err) {
    res.status(500).json({ error: "Error posting comment" });
  }
};

//thêm ảnh lên server

const postPic = async (req, res) => {
  try {
    const file = req.file;
    const { nguoi_dung_id, mo_ta, ten_hinh } = req.body;

    const duong_dan = `http://localhost:8080/public/img/${file.filename}`;

    const data = await model.hinh_anh.create({
      nguoi_dung_id,
      duong_dan,
      mo_ta,
      ten_hinh,
    });

    return succesCode(res, data, "Image is uploaded");
  } catch (err) {
    res.status(500).json({ message: "Internal server error" });
  }
};

// lấy danh sách ảnh liên quan theo hình id
const getPicsRelated = async (req, res) => {
  try {
    const { picId } = req.params;

    const pic = await model.hinh_anh.findOne({
      where: {
        hinh_id: picId,
      },
    });

    if (!pic) {
      return failedCode(res, "", 404, "Picture not found");
    }

    const picFirstTwoChars = pic.ten_hinh.substring(0, 2);

    const picsRelated = await model.hinh_anh.findAll({
      where: {
        ten_hinh: {
          [Op.like]: `${picFirstTwoChars}%`,
        },
        hinh_id: {
          [Op.not]: picId,
        },
      },
    });

    succesCode(res, picsRelated, "Succeed");
  } catch (err) {
    res.status(500).json({ error: "Internal server error" });
  }
};

//kiểm tra ảnh đã lưu chưa theo id ảnh
const checkIsSaved = async (req, res) => {
  try {
    const { picId, userId } = req.params;

    const picSaved = await model.luu_anh.findOne({
      where: {
        hinh_id: picId,
        nguoi_dung_id: userId,
      },
    });

    if (picSaved) {
      succesCode(res, { isSaved: true }, "This picture is saved");
    } else {
      succesCode(res, { isSaved: false }, "This picture is not saved");
    }
  } catch (err) {
    res.status(500).json({ message: "Internal server error" });
  }
};

//xóa ảnh đã tạo
const deleteImage = async (req, res) => {
  try {
    const { picId, userId } = req.params;

    const picToDelete = await model.hinh_anh.findOne({
      where: {
        hinh_id: picId,
      },
    });

    if (!picToDelete) {
      return failedCode(res, "", 404, "Image does not exist");
    }

    if (picToDelete.nguoi_dung_id == userId) {
      picToDelete.destroy();
      return succesCode(res, "", "Delete successful");
    } else {
      return failedCode(res,"",403,"Cannot delete another user's image")
    }
  } catch (err) {
    res.status(500).json({ message: "Internal server error" });
  }
};

export {
  getPic,
  getPicbyName,
  getPictureDetail,
  getCommentsByPictureId,
  savePic,
  postComment,
  postPic,
  getPicsRelated,
  checkIsSaved,
  deleteImage,
};
