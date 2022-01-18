const sqlite3 = require("sqlite3").verbose();

function DB(path_db) {
	return new sqlite3.Database(path_db, (err) => {
		if (err) {
			console.log("Could not connect to database", err);
		} else {
			console.log("Connected to database");
		}
	});
}

module.exports = DB;
