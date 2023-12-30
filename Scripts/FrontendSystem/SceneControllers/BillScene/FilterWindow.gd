extends PanelContainer

## 用于存储在过滤界面时点击条目的历史行为[br]
## 当同一条目点击次数为偶数时，其历史记录将会被删除 (因为相当于该条目状态没有变化)
var filterOperateHistory: Array[String] = [] 

@onready var content_container: VBoxContainer = %ContentContainer

var checkBoxGroup: Dictionary = {}

func _ready() -> void:
	hide()
	for entry in BMain.entryController.allEntry:
		var newCheckBox: FilterCheckBox = FilterCheckBox.new()
		newCheckBox.name = entry.name
		newCheckBox.text = entry.name
		newCheckBox.id = entry.id
		newCheckBox.button_pressed = entry.enabled
		newCheckBox.filter_button_pressed.connect(OnButtonPressed)
		newCheckBox.focus_mode = Control.FOCUS_NONE
		content_container.add_child(newCheckBox)
		
		checkBoxGroup[entry.id] = newCheckBox
		
## 过滤界面被打开时的行为
func OpenFilterWindow() -> void:
	show()

## 过滤界面点击取消键后的行为
func CancelFilter() -> void:
	for id in filterOperateHistory:
		checkBoxGroup[id].button_pressed = not checkBoxGroup[id].button_pressed
	print(filterOperateHistory)
	filterOperateHistory.clear()
	print(BMain.filterController.entryFilter.GetAllEnableState())
	hide()
	

##过滤界面点击确定键后的行为
func SubmitFilter() -> void:
	for id in filterOperateHistory:
		for entry in BMain.entryController.allEntry:
			if entry.id == id:
				entry.enabled = not entry.enabled
	print(filterOperateHistory)
	filterOperateHistory.clear()
	print(BMain.filterController.entryFilter.GetAllEnableState())
	hide()
	

## 过滤界面点击条目[CheckBox]后的行为
func OnButtonPressed(id: String) -> void:
	if id in filterOperateHistory:
		filterOperateHistory.erase(id)
	else:
		filterOperateHistory.append(id)
	print(filterOperateHistory)


