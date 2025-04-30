/// @description Create Client and Server

// Create server obj if is host
if(steam_lobby_is_owner()) {
	global.server = instance_create_layer(0,32,"Instances", obj_server)
	show_debug_message("[debug] Server obj created")
}

// Create client obj
global.client = instance_create_layer(0,16,"Instances", obj_client)
show_debug_message("[debug] Client obj created")
		
