
// kết nối CSDL

import { Sequelize } from 'sequelize';

const sequelize = new Sequelize("db_pinterest", "root", "1234", {
    host: "localhost",
    port: 3306,
    dialect: "mysql"
})

export default sequelize;