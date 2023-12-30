## 用于控制条目过滤信息的类
##
## 创建于[FilterController]

class_name EntryFilter

func Initialize():
	BMain.initProSupervisor.initProcess.append("EntryFilter")

## 获取所有条目的激活状态，返回为字符串,用于检查结果
func GetAllEnableState() -> String:
	var s = ""
	for entry in BMain.entryController.allEntry:
		s += entry.name + " " + str(entry.enabled) + "\n"
	
	return s
