GDPC                @                                                                         T   res://.godot/exported/133200997/export-7d0aed02f690866ed7244818f5e0223a-control.scn         �      �GU��%Fg]�t�6�    ,   res://.godot/global_script_class_cache.cfg  �             ��Р�8���8~$}P�       res://.godot/uid_cache.bin         (       D�X_��Ξ43J\�        res://Sceen/control.tscn.remap  p      d       �V|��y5bϊ�$��1       res://new_script.gd �      �      )�}AC���!j�       res://project.binary0      i      ؜�M7p����ٰ7��    g]�(�uy6RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script           local://PackedScene_c8k0d �          PackedScene          	         names "         Control    layout_mode    anchors_preset    anchor_right    anchor_bottom    grow_horizontal    grow_vertical    	   variants                        �?            node_count             nodes        ��������        ����                                                  conn_count              conns               node_paths              editable_instances              version             RSRC��ᝎ^���extends Node

@onready var text := %TextEdit

@export var newText = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	self.set_name("NewName")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func change_text():
	if len(text.get_text()) == 0:
		text.set_text(newText) 
	else:
		text.set_text("")
7�~Hv���K[remap]

path="res://.godot/exported/133200997/export-7d0aed02f690866ed7244818f5e0223a-control.scn"
Ñ"b*8D.*|�list=Array[Dictionary]([])
���%�   [R��]�2&   res://Sceen/control.tscn�r��y�%ECFG      application/config/name         Godot Projects     application/run/main_scene          res://Sceen/control.tscn   application/config/features$   "         4.1    Forward Plus    "   display/window/size/viewport_width         #   display/window/size/viewport_height      �     dotnet/project/assembly_name         Godot Projects  ��o�U�