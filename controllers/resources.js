const resourcesRouter = require("express").Router();
const memoryRepository = require("../models/memory");
const _memoryRepository = new memoryRepository();

resourcesRouter.get("/memory", async (req, resp) => {
	try {
		const result = await _memoryRepository.all();
		resp.status(200).json({
			status: true,
			data: result,
		});
	} catch (e) {
		resp.status(400).json({
			error: "Error al recuperar los datos",
			status: false,
		});
	}
});

module.exports = resourcesRouter;
