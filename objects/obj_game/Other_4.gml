/// @description Create Client and Server

// Create server obj if is host
if(steam_lobby_is_owner()) {
	//show_debug_message("[debug] Server obj created")
	global.server = instance_create_layer(0,32,"Instances", obj_server)
}

// Create client obj
global.client = instance_create_layer(0,16,"Instances", obj_client)
print_player_list()
//show_debug_message("[debug] Client obj created")
		
