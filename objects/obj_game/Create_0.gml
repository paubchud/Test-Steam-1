// initialize world

// List of players
var player_list = {}

// initialize host
if(global.my_id == steam_lobby_get_owner_id())
{
	show_debug_message("You are the Host")
	var host_player = instance_create_layer(16,16, "Instances", obj_player)
	host_player.playerID = global.my_id;
	player_list[0] = host_player;
}
else
{
	show_debug_message("You are not the Host")
	// Create players before you in their current position
	instance_create_layer(16,16, "Instances", obj_player)
	
	// Create you
	instance_create_layer(40,40, "Instances", obj_player)
}