extends TextureRect

@onready var image = $image
@onready var press_label = $Label

var local_id = 0
var pressed_name = ""

func _ready() -> void:
	PlayerData.onWeaponChanged.connect(self.onWeaponChanged)
	var pressed_index = get_index() + 1
	press_label.text = str(pressed_index)
	pressed_name = "pressed_%s" %pressed_index

func _input(event: InputEvent) -> void:
	if !pressed_name.is_empty() && event.is_action_pressed(pressed_name):
		print(local_id)
		PlayerData.changeWeapon(local_id)

func onWeaponChanged():
	if Utils.player.gun && Utils.player.gun.weapon_id == local_id:
		print(Utils.player.gun.weapon_id)
		self_modulate = Color("#83e0ff")
	else:
		self_modulate = Color.WHITE
