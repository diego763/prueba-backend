const Events = require("events");
class MyEventEmitter extends Events {}
const myEmitter = new MyEventEmitter();

class EventClass {
	connect() {
		myEmitter.emit("status", "connect");
	}

	disconnect() {
		myEmitter.emit("status", "disconnect");
	}

	addMetric(value) {
		myEmitter.emit("addMetric", value);
		return value;
	}

	removeMetric() {
		myEmitter.emit("removeMetric", "remove metric");
	}

	on(event, params) {
		myEmitter.on(event, params);
	}
}

module.exports = EventClass;
