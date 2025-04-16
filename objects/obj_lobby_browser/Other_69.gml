var steam_async = async_load[? "event_type"]
if (steam_async == "lobby_list") {
    var count = async_load[? "lobby_count"];
	
    for (var i = 0; i < count; i++) {
		var hostID = steam_lobby_list_get_lobby_owner_id(i);
		if (hostID != 0) {
			var lobbyID = string(steam_lobby_list_get_lobby_id(i));
	        var host = steam_get_user_persona_name(hostID);
			
			show_debug_message("Lobby ID         : "+string(lobbyID))
			show_debug_message("Host Persona Name: "+string(host))
			show_debug_message("Host ID          : "+string(hostID))
												
	        array_push(global.lobbies, [lobbyID, host]);
		}
    }
}
