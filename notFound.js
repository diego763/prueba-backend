module.exports = (req, resp) => {
	resp.status(404).json({
		error: "No encontrado",
		status: false,
	});
};
