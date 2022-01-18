const DB = require("../db");
const _db = DB(__dirname + "/../resource.db");

class memoryRepository {
	constructor() {
		this.createTable();
	}

	createTable() {
		const sql = `
        CREATE TABLE IF NOT EXISTS memory (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          uuid TEXT,
          free_memory INTEGER,
          total_memory INTEGER,
          hostname TEXT,
          date_created TEXT)`;
		return _db.run(sql, (err) => {
			if (err) {
				console.log("Tabla no creada!!", err);
			}
		});
	}

	add(data) {
		const { uuid, free_memory, total_memory, hostname, date_created } =
			data;
		const sql =
			"INSERT INTO memory (uuid, free_memory, total_memory, hostname, date_created) VALUES (?, ?, ?, ?, ?)";
		return _db.run(sql, [
			uuid,
			free_memory,
			total_memory,
			hostname,
			date_created,
		]);
	}

	all() {
		const sql =
			"SELECT m.free_memory, m.date_created FROM memory AS m ORDER BY m.date_created ASC";

		return new Promise((resolve, reject) => {
			_db.all(sql, [], (err, results) => {
				if (err) {
					console.log("error: ", err);
					reject([]);
				} else {
					resolve(results);
				}
			});
		});
	}
}
module.exports = memoryRepository;
