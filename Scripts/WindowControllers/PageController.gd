extends Control

@export var buttonGroup: ButtonGroup

var rectPos: Rect2i = Rect2i(230,160, 1330, 700)

# Page Organization
var pagesIndex: Dictionary = {
		0: true,
		1: false
	}
var oldPageIndex: int = 0
var pages: Array = [MainPage, BillPage]


# Called when the node enters the scene tree for the first time.
func _ready():
	for each in pages:
		each.hide()
	MainPage.popup(rectPos)
	buttonGroup.get_buttons()[0].button_pressed = true
	print(buttonGroup.get_buttons())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _switch_page(buttonIndex: int):
	# Filter the case when the buttonIndex is exceed the Total number of pages
	if buttonIndex > pagesIndex.size() - 1:
		return
	if not pagesIndex[buttonIndex]:
		pages[oldPageIndex].hide()
		pagesIndex[oldPageIndex] = false
		pagesIndex[buttonIndex] = true
		pages[buttonIndex].popup(rectPos)
		oldPageIndex = buttonIndex
		
		
		
