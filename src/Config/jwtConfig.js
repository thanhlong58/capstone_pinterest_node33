import jwt from "jsonwebtoken";

const checkToken = (req, res, next) => {
  try {
    let { token } = req.headers;

    if (verifyToken(token)) {
      next();
    }
  } catch (ex) {
    res.status(403).send("Unauthorized access");
  }
};

const taoToken = (data) => {
  return jwt.sign({ data }, "GIAIDU", { expiresIn: "1y" });
};

const verifyToken = (token) => {
  return jwt.verify(token, "GIAIDU");
};
const decodeToken = (token) => {
  return jwt.decode(token);
};

export { checkToken, taoToken };
