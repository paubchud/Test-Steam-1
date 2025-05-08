// Variables (Default)
isHost = steam_lobby_is_owner()
playerList = isHost ? global.server.playerList: []
selfPlayer = isHost ? instance_find(obj_player, 0): undefined
data = 0
playerToBeAdded = false;
spawnMult = 16
enum INDEX {
	NAME = 0,
	ID = 1,
	XSPAWN = 2,
	YSPAWN = 3,
	DATA = 4
}
inbuf = buffer_create(1, buffer_grow, 1)

// initialize host
//if(isHost)
//{
//	show_debug_message("You are the Host")
//}
//else
//{
//	show_debug_message("You are not the Host")
//}



// Create yourself
//var player = instance_create_layer(spawnMult*array_length(playerList)+16, 16, "Instances", obj_player)