if (async_load[? "event_type"] == "lobby_list") {
    var count = async_load[? "lobby_count"];
	
    for (var i = 0; i < count; i++) {
        var lobbyID = steam_lobby_list_get_lobby_id(i);
        var host = steam_get_user_persona_name(
											   steam_lobby_list_get_lobby_owner_id(i)
												);
												
        array_push(global.lobbies, [lobbyID, host]);
    }
}
