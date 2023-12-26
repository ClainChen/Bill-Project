extends PopupPanel

@onready var input_info = [%DateInput, %PayerInput, %ReceiverInput, 
						   %MethodInput, %AmountInput, %AddInfoInput]
# Called when the node enters the scene tree for the first time.
func _ready():
	print(input_info)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_AddBill_pressed():
	popup_centered_clamped(Vector2(640,360), 0.5)
	popup_window = false

