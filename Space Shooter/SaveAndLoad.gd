extends Node

const SAVE_DATA_PATH = "res://save_data.json"

var default_save_data = { #this is a  dictonary
	highscore = 0,
}

func save_data_to_file(save_data):
	var json_string = to_json(save_data) #takes our save data and converts into json string
	var save_file = File.new()
	save_file.open(SAVE_DATA_PATH, File.WRITE) 
	save_file.store_line(json_string) #saving the file
	save_file.close()


func load_data_from_file():
	var save_file = File.new()
	if not save_file.file_exists(SAVE_DATA_PATH):
		return default_save_data #if we don't have save file return 0 highscore
	
	save_file.open(SAVE_DATA_PATH, File.READ)
	var save_data = parse_json(save_file.get_as_text()) #from json to string
	save_file.close()
	return save_data
