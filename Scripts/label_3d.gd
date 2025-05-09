extends Node3D

@onready var line_edit: LineEdit = $LineEdit
@onready var label: Label3D = $Label3D

func _ready(): 
	line_edit.text_submitted.connect(_on_LineEdit_text_entered)


func _on_LineEdit_text_entered (new_text: String):
	label.text = "Your name is " + new_text
