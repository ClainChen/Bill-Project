## 表示账单中的某一个条目的类

class_name Entry

## 创建一个新条目时触发的信号。[br]
## 通常是将新条目加入全局账单[Bill]中
signal CreateEntry(entry: Entry)

## 删除一个条目时触发的信号。[br]
## 通常是将就条目从全局账单[Bill]中删除
signal DeleteEntry(entry: Entry)

var id: String = "" ## 条目ID, 以e打头， 比如e0, e1, e2等等
var name: String = "" ## 条目名称
var inputFormat: RegEx = RegEx.new() ## 条目输入内容格式限制
var min_size: int = 1 ## 最小所需空间
var deletable: bool = true ## 该条目是否可以被删除
var enabled: bool = false ## 该条目是否被激活

## 该条目允许的内容，通常用于枚举内容。[br]
## 当数组长度大于0时，该条目变为枚举条目
var validContents: PackedStringArray = []

func _init(id: String, name: String, inputFormat: String = "[\\s\\S]*", 
min_size: int = 1, deletable: bool = true, validContents: PackedStringArray = []):
	self.id = id
	self.name = name
	self.inputFormat.compile(inputFormat)
	self.min_size = min_size
	self.deletable = deletable
	self.validContents = validContents
	
	# 初始化信号连接
	signalInitialize()

func _to_string():
	var s = "ID: {id}\n".format({"id": self.id})
	s += "名称: {name}\n".format({"name": self.name})
	s += "内容格式: {inputFormat}\n".format({"inputFormat": self.inputFormat.get_pattern()})
	s += "最小空间: {min_size}\n".format({"min_size": self.min_size})
	s += "是否可以被删除: {deletable}\n".format({"deletable": "是" if self.deletable else "否"})
	s += "是否是枚举条目: {result}".format({"result": "是" if len(self.validContents) != 0 else "否"})

	return s

## 初始化信号连接
func signalInitialize():
	CreateEntry.connect(BMain.entryController.AddEntry)
	DeleteEntry.connect(BMain.entryController.DeleteEntry)


## 增加可用内容，会将该条目变为枚举条目
func AddContent(content: String):
	validContents.append(content)

## 将该条目所有属性输出为csv格式
func OutPutAllPropsInCSV() -> String:
	var s = self.id
	s += "," + self.name
	s += "," + self.inputFormat.get_pattern()
	s += "," + str(self.min_size)
	s += "," + "t" if self.deletable else "f"
	s += "," + "-".join(self.validContents)
	
	return s
