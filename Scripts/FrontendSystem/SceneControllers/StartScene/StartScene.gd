## 用于控制开始界面相关元素的主类

extends Control

class_name StartScene

## 切换界面的行为
func _switch_page(pageID: int) -> void:
	for id in len(FMain.GetAllSubPages()):
		FMain.GetAllSubPages()[id].visible = pageID == id
		
