## 用于控制条目过滤信息的类
##
## 创建于[FilterController]

class_name EntryFilter

var allEFInfo: Array[EFInfo] = []

## 用来表示条目过滤启用信息的类
class EFInfo:
	var name: String = "" ## 条目名
	var filterID: int = -1 ## 过滤ID
	var entryID: int = -1 ## 条目ID
	var enabled: bool = false ## 激活状态
	
	func _init(name: String, filterID: int, entryID: int, enabled: bool = false):
		self.name = name
		self.filterID = filterID
		self.entryID = entryID
		self.enabled = enabled
	
	func _to_string():
		var s = "条目名: " + name + "\n"
		s += "过滤ID： " + str(filterID) + "\n"
		s += "条目ID: " + str(entryID) + "\n"
		s += "激活: " + "是" if enabled else "否"
		return s


func Initialize():
	pass
