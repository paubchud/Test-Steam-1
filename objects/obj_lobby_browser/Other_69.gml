var steam_async = async_load[? "event_type"]
if (steam_async == "lobby_list") {
    var count = steam_lobby_list_get_count()
	show_debug_message("Lobby Count: "+string(count))
	
    for (var i = 0; i < count; i++) {
		var lobbyID = steam_lobby_list_get_lobby_id(i);
		
		// Debug message for lobby Data
		show_debug_message("Lobby ID: "+string(lobbyID))
		
		// Create lobby button for lobby joining
		var lobby_button = 
		instance_create_layer(200        ,
							  base_y+i*50,
							  "Instances",
							  obj_lobby_button)
		lobby_button.label = lobbyID;
		lobby_button.lobbyID = lobbyID;
															
		// Push button into array of buttons
	    array_push(lobbies, lobby_button);
    }
}