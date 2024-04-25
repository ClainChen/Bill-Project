## 用于创建，控制表格的类

extends Control

class_name Table

## 所有格子
var allCells: Array[Cell] = []

## 列数量
@export var numColumn: int = 7:
	get: return numColumn
	set(value): 
		numColumn = value
		numColumnChanged.emit()

signal numColumnChanged

func _ready() -> void:
	numColumnChanged.connect(numColumnChange)

## 当Column Number变化时的行为
func numColumnChange() -> void:
	pass

## 增加新格子时的为
func AddCell(cell: Cell) -> void:
	var position: Array[int] = [0,0]
	if allCells.size() > 0:
		var lastPos: Array[int] = allCells[-1].position
		if lastPos[1] + 1 >= numColumn:
			position = [lastPos[0] + 1, 0]
		else:
			position = [lastPos[0], lastPos[1] + 1]
	cell.position = position
	allCells.append(cell)
	
	var label: Label = Label.new()
	label.text = cell.content
	label.custom_minimum_size = Vector2(cell.width, cell.height)
	add_child(label)
	
## 获取某一行的所有格子
func GetRow(rowNum: int) -> Array[Cell]:
	return allCells.slice(rowNum * numColumn, rowNum * numColumn + numColumn + 1)

## 获取某一列的所有格子
func GetColumn(columnNum: int) -> Array[Cell]:
	return allCells.slice(columnNum, -1, numColumn)

## 以位置列表来获取某一个格子
func GetCell(position: Array[int]) -> Cell:
	return allCells[position[0] * numColumn + position[1]]

func _on_button_pressed() -> void:
	var cell = Cell.new()
	cell.content = "Hello World"
	cell.height = 40
	cell.width = 100
	AddCell(cell)
