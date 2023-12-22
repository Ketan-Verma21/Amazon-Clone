const express = require('express');
const mongoose = require('mongoose');
const authRouter = require("./routes/auth");
const adminRouter = require('./routes/admin');
const productRouter = require('./routes/product');
const dotenv = require('dotenv');
const cors = require('cors');
const app = express();
app.use(express.json());
app.use(
  cors({
    origin: "*",
    credentials: true,
  })
);
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
dotenv.config();
const DB = process.env.MONGO_URL;
const PORT = process.env.PORT;

mongoose.connect(DB).then(() => {

  console.log('Connection Successful');
}).catch(e => {
  console.log(e);
})
app.listen(PORT, "0.0.0.0", () => {
  console.log(`Connected to port ${PORT}`);
})
