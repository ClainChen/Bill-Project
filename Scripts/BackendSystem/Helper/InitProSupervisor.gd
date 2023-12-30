## 用于检测程序初始化进程的类（监管者）
##
## 创建于[Main]类

class_name InitProSupervisor

signal complete

var completion: bool = false
var initProcess: Array[String] = [] ## 初始化所有进程的名字
var startTime: int = 0 ## 开始初始化时的系统时间

func Initialize():
	self.startTime = Time.get_ticks_usec()


func _to_string() -> String:
	var s = "AllProcesses: \n"
	for each in initProcess:
		s += each + "\n"
	s += "Time Spend: " + str(TimeConsumption()) + "us\n"
	s += "初始化已完成" if completion else "初始化未完成"
	return s
	
## 获取从系统初始化开始到现在所消耗的时间
func TimeConsumption() -> int:
	return Time.get_ticks_usec() - startTime
