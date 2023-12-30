## 该项目在后端程序中的主类，用于管理和访问所有后端相关的程序
##
## 在其他脚本中调用该类时，请使用BMain

extends Node

class_name BackMain

## 用于储存所有可用的条目
var entryController: EntryController = EntryController.new()

## 过滤系统的总控制器
var filterController: FilterController = FilterController.new()

## 初始化系统的观察器
var initProSupervisor: InitProSupervisor = InitProSupervisor.new()

func _ready():
	initProSupervisor.Initialize()
	
	entryController.Initialize()
	filterController.Initialize()
	
	initProSupervisor.completion = true
	print(initProSupervisor)
	initProSupervisor.complete.emit()
	
