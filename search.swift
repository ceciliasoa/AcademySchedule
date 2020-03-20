
func readDate() -> [String:String]? {
	print("Insira a data para consultar o calendario (DD/MM): ")
	guard let date = readLine() else { return nil }

	let splitedDate = date.split{$0 == "/"}

	let day: String = String(splitedDate[0])
	var month: String = String(splitedDate[1])

	switch month {
		case "01": month = "jan"
		case "02": month = "feb"
		case "03": month = "mar"
		case "04": month = "apr"
		case "05": month = "may"
		case "06": month = "jun"
		default: return nil
	}
	
	let dateDict = ["day": day, "month": month]

	return dateDict
}


func searchDate(_ date: [String:String]?,_ schedule: Schedule) -> String{
	guard let date = date else { return "Data inválida" }
	
	guard let stringDay = date["day"] else { return "Dia inválido"}
	guard let month = date["month"] else { return "Mês inválido"}
	let day = Int(stringDay)

	let foundMonth = schedule.months.filter { $0.name == month }[0]
	
	for event in foundMonth.events{
		if (event.eventDays.filter { $0 == day } != []) {
			let endIndex = event.eventDays.count-1
			return ("Ocorrerá: \(event.eventName) que começa no dia \(event.eventDays[0]) e termina no dia \(event.eventDays[endIndex])")
		}
	}

	return "Nenhum evento encontrado nessa data"
}


