/// @description Create Client and Server
// Create client obj
var clientID = instance_create_layer(0,16,"Instances", obj_client)
//show_debug_message("[debug] Client obj created")
		
// Create server obj if is host
if(steam_lobby_is_owner()) {
	//show_debug_message("[debug] Server obj created")
	instance_create_layer(0,32,"Instances", obj_server)
}