import Foundation
//dados do json decodificados em objetos
struct Schedule: Codable {
	let months: [Month]
}

struct Month: Codable {
	let name: String
	let events: [Event]
}

struct Event: Codable {
	let eventName: String
	let eventDays: [Int]
}
//json
let jsonString = """
{"months":[
	{"name":"jan",
	"events":[
		{"eventName": "CBL",
		"eventDays": [1,2,3,4,5]}
	]},
	{"name":"feb",
	"events":[
		{"eventName": "CBL",
		"eventDays": [6,7,8,9,10]}
	]},
	{"name":"mar",
	"events":[
		{"eventName": "CBL",
		"eventDays": [11,12,13,14,15]}
	]},
	{"name":"apr",
	"events":[
		{"eventName": "CBL",
		"eventDays": [16,17,18,19,20]}
	]},
	{"name":"may",
	"events":[
		{"eventName": "CBL",
		"eventDays": [21,22,23,24,25]}
	]},
	{"name":"jun",
	"events":[
		{"eventName": "CBL",
		"eventDays": [26,27,28,29,30]}
	]}
	]
}
"""
//ler o json e retorna como objeto para a stuct Schedule
func readJson() -> Schedule {
	
	let jsonData = jsonString.data(using: .utf8)!
	//decodifica o json
	let schedule = try! JSONDecoder().decode(Schedule.self, from: jsonData)
	return schedule
}
