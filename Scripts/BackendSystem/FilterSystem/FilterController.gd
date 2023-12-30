## 用于控制所有过滤器的类

class_name FilterController

var entryFilter: EntryFilter = EntryFilter.new() ## 系统使用的条目过滤管理器[EntryFilter]

func Initialize():
	BMain.initProSupervisor.initProcess.append("FilterController")
	entryFilter.Initialize()

