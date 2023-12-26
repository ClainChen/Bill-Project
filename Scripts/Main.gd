## 该项目的主类，将会初始化所有内容

extends Node

class_name Main

## 用于储存所有可用的条目
var allEntries: AllEntries = AllEntries.new()

## 过滤系统的总控制器
var filterController: FilterController = FilterController.new()

func _ready():
	allEntries.Initialize()
	print(allEntries)
	
	filterController.Initialize()
	
