const EventClass = require("./models/events");
const objEvent = new EventClass();
const config = require("./config");
const os = require("os");
const uuid = require("uuid");
const memoryRepository = require("./models/memory");
const _memoryRepository = new memoryRepository();

objEvent.on("status", (status) => {
	// console.log(`Estado: ${status}`);
});

objEvent.on("addMetric", (data) => {
	// console.log("Agregando: ", data);
	_memoryRepository.add(data);
});

objEvent.on("removeMetric", (data) => {
	// console.log("Eliminando: ", data);
});

objEvent.connect();

//Intervalo para terminar el envio de eventos
const { MIN_DISCONNECT } = config;
let currentSecond = 0;

let interval = setInterval(() => {
	//si supera los minutos de seteados en la configuracion deja de emitir
	currentSecond++;
	if (currentSecond / 60 >= MIN_DISCONNECT) {
		objEvent.disconnect();
		clearInterval(interval);
		return;
	}

	const hostname = os.hostname();
	const free_memory = os.freemem();
	const total_memory = os.totalmem();
	const now = new Date();
	const date_created =
		now.getHours() + ":" + now.getMinutes() + ":" + now.getSeconds();

	//emite el evento con los datos
	objEvent.addMetric({
		uuid: uuid.v1(),
		free_memory,
		total_memory,
		hostname,
		date_created,
	});
}, 1000);
