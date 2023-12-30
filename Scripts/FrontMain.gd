## 该项目在前端程序中的主类，用于管理和访问所有后端相关的程序
##
## 在其他脚本中调用该类时，请使用FMain

extends Node

class_name FrontMain

## 开始场景
var startScene: StartScene
## 首页场景
var	homePage: HomePage
## 账单场景
var	billPage: BillPage

var startSceneButtonGroup: ButtonGroup = preload("res://Assets/ButtonGroup/左侧边栏按钮组合.tres")

func _ready() -> void:
	startScene = preload("res://Scene/开始界面.tscn").instantiate() 
	homePage = preload("res://Scene/首页.tscn").instantiate()
	billPage = preload("res://Scene/账簿.tscn").instantiate()
	
	Initialize()
	
## 运行软件
func Initialize() -> void:
	add_child(startScene)
	add_child(homePage)
	add_child(billPage)

	billPage.hide()
	

## 获取所有除StartScene以外的子界面，按顺序排列
func GetAllSubPages() -> Array:
	return [homePage, billPage]
	
