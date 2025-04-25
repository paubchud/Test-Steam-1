// Variables (Default)
show_debug_message("Create Start")
var isHost = 0; // not host
playerList = []
spawnMult = 16
enum INDEX{
	NAME = 0,
	ID = 1,
	XSPAWN = 2,
	YSPAWN = 3,
	DATA = 4
}
show_debug_message("Enums Initialized")

// initialize host
if(isHost)
{
	show_debug_message("You are the Host")
}
else
{
	show_debug_message("You are not the Host")
}
// Create everyone before you


// Create yourself
show_debug_message("Self Created")
var player = instance_create_layer(spawnMult*playerList+16, 16, "Instances", obj_player)