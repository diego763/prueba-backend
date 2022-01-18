/**
 * Crear una rutina que permita ordenar números (ascendente y descendente). Ejemplo:
 * input: 10, 30, 9, 7, 15
 */
function sortNumbers(dir = "asc", stringNumber = "") {
	stringNumber = stringNumber.replace(/ /g, "");
	const arrayNumbers = stringNumber.split(",");

	if (dir === "asc") {
		arrayNumbers.sort((a, b) => a - b);
	} else if (dir === "desc") {
		arrayNumbers.sort((a, b) => b - a);
	}

	return arrayNumbers.join(", ");
}
console.log(sortNumbers("asc", "10, 30, 9, 7, 15"));

/**
 * Crea una función recursiva que sea capaz de encontrar un número dentro de una colección.
 */
const numbers = [1, 3, 6, 90, 39, 4];
function searchNumber(number, array) {
	if (array.length === 0) {
		return false;
	}
	if (array[0] === number) {
		return true;
	}
	return searchNumber(number, array.slice(1));
}
console.log(searchNumber(39, numbers));
