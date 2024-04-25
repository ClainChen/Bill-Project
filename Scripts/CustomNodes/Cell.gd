## 代表表格[Table]中一个格子的类
##
## 用于储存格子信息

class_name Cell

## 格子在表格中的位置，从(0,0)开始
var position: Array[int]
var height: int
var width: int
var content: String

## 获取该格子在表格中的X轴位置
func GetXCoord() -> int:
	return position[0]

## 获取该格子在表格中的Y轴位置
func GetYCoord() -> int:
	return position[1]


func _to_string() -> String:
	var s: String = ""
	s += "位置: " + str(position) + "\n"
	s += "高: " + str(height) + "\n"
	s += "宽: " + str(width) + "\n"
	s += "内容: " + content + "\n"
	
	return s
