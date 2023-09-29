import sequelize from "../Models/index.js";
import initModels from "../Models/init-models.js";
import { Sequelize } from "sequelize";
import bcrypt from "bcrypt";
import { taoToken } from "../Config/jwtConfig.js";
import { errorCode, failedCode, succesCode } from "../Config/response.js";

const Op = Sequelize.Op;

const model = initModels(sequelize);

//đăng ký tài khoản
const signUp = async (req, res) => {
  try {
    const { email, mat_khau, ho_ten, tuoi } = req.body;

    let checkEmail = await model.nguoi_dung.findAll({
      where: {
        email,
      },
    });

    if (checkEmail.length > 0) {
      return failedCode(res, "", 409, "The email is already registered");
    }

    let newData = {
      email,
      mat_khau: bcrypt.hashSync(mat_khau, 10),
      ho_ten,
      tuoi,
    };

    await model.nguoi_dung.create(newData);

    return succesCode(res, newData, "Registration is successful");
  } catch (err) {
    return errorCode(err, "Resgistration is not succed, try again.");
  }
};

//đăng nhập tài khoản
const signIn = async (req, res) => {
  try {
    const { email, mat_khau } = req.body;

    let checkEmail = await model.nguoi_dung.findOne({
      where: {
        email,
      },
    });

    if (checkEmail) {
      let checkPassWord = bcrypt.compareSync(mat_khau, checkEmail.mat_khau);
      if (checkPassWord == true) {
        let token = taoToken(checkEmail);

        succesCode(res, { userInfo: checkEmail, token }, "You have logged in!");
      } else {
        failedCode(res, "", 400, "Password is incorrect");
      }
    } else {
      failedCode(res, "", 400, "Email is incorrect");
    }
  } catch (err) {
    return res.status(500).json({ message: "Internal server error" });
  }
};

//lấy thông tin user

const getUserDetail = async (req, res) => {
  try {
    const { userId } = req.params;

    const user = await model.nguoi_dung.findOne({
      where: {
        nguoi_dung_id: userId,
      },
    });

    if (user) {
      return succesCode(res, user, "Succes getting user info");
    } else {
      return failedCode(res, "", 404, "User not found");
    }
  } catch (err) {
    return res.status(500).json({ message: "Internal server error" });
  }
};
//lấy danh sách hình ảnh đã save theo user

const getSavedImagesByUserId = async (req, res) => {
  try {
    const { userId } = req.params;

    const savedImages = await model.luu_anh.findAll({
      where: {
        nguoi_dung_id: userId,
      },
    });

    if (savedImages.length > 0) {
      const imageIds = savedImages.map((savedImage) => savedImage.hinh_id);
      console.log(imageIds);

      const images = await model.hinh_anh.findAll({
        where: {
          hinh_id: imageIds,
        },
      });

      succesCode(res, images, "Succes getting saved images");
    } else {
      failedCode(res, "", 404, "No saved images found for this user");
    }
  } catch (err) {
    res.status(500).json({ message: "Internal server error" });
  }
};

//lấy danh sách đã tạo theo userid
const getCreatedImagesbyUserId = async (req, res) => {
  try {
    const { userId } = req.params;

    const createdImages = await model.hinh_anh.findAll({
      where: {
        nguoi_dung_id: userId,
      },
    });

    if (createdImages && createdImages.length > 0) {
      succesCode(res, createdImages, "Succes getting created images!");
    } else {
      failedCode(res, "", 404, "No created images found for this user");
    }
  } catch (err) {
    res.status(500).json({ message: "Internal server error" });
  }
};

//cập nhật thông tin người dùng

const updateUser = async (req, res) => {
  try {
    const { userId } = req.params;
    const { email, mat_khau, ho_ten, tuoi } = req.body;

    let checkEmail = await model.nguoi_dung.findAll({
      where: {
        email,
        nguoi_dung_id: {
          [Op.ne]: userId,
        },
      },
    });

    if (checkEmail.length > 0) {
      return failedCode(
        res,
        "",
        400,
        "Email is already registered for another user"
      );
    }

    await model.nguoi_dung.update(
      {
        ho_ten,
        email,
        mat_khau: bcrypt.hashSync(mat_khau, 10),
        tuoi,
      },
      {
        where: { nguoi_dung_id: userId },
      }
    );
    const userUpdated = await model.nguoi_dung.findOne({
      where: {
        nguoi_dung_id: userId,
      },
    });
    return succesCode(res, userUpdated, "Your profile is updated!");
  } catch (err) {
    return res.status(500).json({ message: "Internal server error" });
  }
};

export {
  getUserDetail,
  getSavedImagesByUserId,
  getCreatedImagesbyUserId,
  signUp,
  signIn,
  updateUser,
};
