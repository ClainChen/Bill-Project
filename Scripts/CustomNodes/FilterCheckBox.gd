## 专用于过滤器的[CheckBox]类

extends CheckBox

class_name FilterCheckBox

signal filter_button_pressed(id: String) ## 当该FilterCheckBox被按下时的信号

var id: String = "" ## 该CheckBox的ID

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button_down.connect(_on_filter_button_pressed)

## 当该FilterCheckBox被按下时发出的行为
func _on_filter_button_pressed():
	filter_button_pressed.emit(id)
