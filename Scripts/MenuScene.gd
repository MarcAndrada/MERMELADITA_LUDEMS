extends Control

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/MainScene.tscn")


func _on_credits_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/CreditsScene.tscn")


func _on_exit_button_pressed():
	get_tree().quit()
