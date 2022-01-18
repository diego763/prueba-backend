require("dotenv").config(); //instalado para que tome los .env
const express = require("express");
const cors = require("cors");
const notFound = require("./notFound");
const resourcesRouter = require("./controllers/resources");
const app = express();
require("./events"); //se inicializan los eventos y se guarda en la base de datos

app.use(express.json());
app.use(cors());

app.use("/get/resource", resourcesRouter);

//404
app.use(notFound);

const PORT = process.env.PORT || 3001;
const server = app.listen(PORT, () => {
	console.log(`Servidor escuchando en el puerto ${PORT}`);
});

module.exports = { app, server };
