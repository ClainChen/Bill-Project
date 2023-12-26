## 描述账单中所拥有的的全局内容的类
class_name AllEntries

const ID_HEAD = "e" ## 条目ID的前缀

var allEntry: Array[Entry] = [] ## 已创建的所有条目
var id_num = 0 ## 当前已占用到的id号

var additionEntriesFile: FileAccess = FileAccess.open("Data/otherEntries.csv", FileAccess.WRITE)

## 初始化全局条目内容
func Initialize():
	# 初始化默认Entry
	InitializeEntries("Data/defaultEntries.csv")
	InitializeEntries("Data/otherEntries.csv")
	

## 添加新Entry时调用的函数
func AddEntry(entry: Entry) -> void:
	allEntry.append(entry)
	additionEntriesFile.store_line(entry.OutPutAllPropsInCSV())


## 删除Entry时调用的函数
func DeleteEntry(entry: Entry) -> void:
	allEntry.remove_at(allEntry.find(entry))


## 初始化Entry[br]
##
## [param path]: 用于初始化Entry的csv文件路径
func InitializeEntries(path: String) -> void:
	var ae = FileAccess.open(path, FileAccess.READ)
	var heads = ae.get_csv_line()
	var enumContents = []
	var newEntry: Entry = null
	while not ae.eof_reached():
		var data = ae.get_csv_line()
		assert(data.size() == heads.size())
		enumContents = [] if data[5] == "none" else PackedStringArray(data[5].split("-",true,0))
		newEntry = Entry.new(data[0],data[1],data[2],data[3].to_int(),data[4] == "t", enumContents)
		id_num += 1
		allEntry.append(newEntry)
		

func _to_string() -> String:
	var s = "共计" + str(len(allEntry)) + "个可用条目\n\n"
	for entry in allEntry:
		s += entry._to_string()
		s += "\n\n"
	return s
