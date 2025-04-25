// Variables (Default)
isHost = steam_lobby_is_owner() ? 1:0
playerList = []
data = 0
playerToBeAdded = false;
spawnMult = 16
enum INDEX{
	NAME = 0,
	ID = 1,
	XSPAWN = 2,
	YSPAWN = 3,
	DATA = 4
}

// initialize host
if(isHost)
{
	show_debug_message("You are the Host")
}
else
{
	show_debug_message("You are not the Host")
	send_player_data(data)
}


// Create everyone before you


// Create yourself
var player = instance_create_layer(spawnMult*array_length(playerList)+16, 16, "Instances", obj_player)