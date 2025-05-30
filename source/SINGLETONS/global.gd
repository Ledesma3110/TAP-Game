extends Node

#Declaraciones de rutas de pantallas no jugables
var SCREEN_PRINCIPAL_PATH:String = "res://source/SCREENS/NON_GAME_SCREENS/screen_principal/screen_principal.tscn"
var SCREEN_CONFIG_PATH:String = "res://source/SCREENS/NON_GAME_SCREENS/screen_config/screen_config.tscn"
var SCREEN_INTRO_PATH:String = "res://source/SCREENS/NON_GAME_SCREENS/screen_intro/screen_intro.tscn"
var SCREEN_CONTROLS_PATH:String = "res://source/SCREENS/NON_GAME_SCREENS/screen_controls/screen_controls.tscn"

#Declaraciones de rutas de pantallas jugables
var SCREEN_GAME_WORLD_PATH:String = "res://source/SCREENS/IN_GAME_SCREENS/screen_game_world/screen_game_world.tscn"

var player_has_lamp:bool = true

#Declaracion de marcadores para ubicacion de personaje
enum Markers {mk_world, mk_building_t, mk_building_b}
var current_mark = Markers.mk_world


#Declaraciones de variables globales
var pChar_speed:int ##Velocidad del personaje.
var pChar_max_health:int ##Salud máxima del personaje.
var pChar_base_damage:int ##Daño base del personaje.
var pChar_low_heal:int ##Recuperación base de salud del personaje.
var pChar_high_heal:int ##Recuperación máxima de salud del personaje.
var pChar_name: String ##Nombre del personaje.

var enemy_speed:int ##Velocidad del enemigo
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#carga de idioma activo
	var language_settings = CONFIG_FILE.load_language_setting()
	TranslationServer.set_locale(language_settings.actlan)
	
	#asignacion de valores Character
	var character_settings = CONFIG_FILE.load_character_setting()
	pChar_speed = character_settings.speed
	pChar_max_health = character_settings.maxhealth
	pChar_base_damage = character_settings.basedamage
	pChar_low_heal = character_settings.lowheal
	pChar_high_heal = character_settings.highheal
	pChar_name = character_settings.name
	#asignación de valores Enemy
	
	var enemy_setting=CONFIG_FILE.load_enemy_setting()
	enemy_speed = enemy_setting.speed
