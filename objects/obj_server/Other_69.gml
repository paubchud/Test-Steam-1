var steam_async = async_load[? "event_type"];
show_debug_message("[Server Async] event: " + string(steam_async));

switch(steam_async)
{
	case "lobby_chat_update": // New Player Joined
		var userID = async_load[? "user_id"]
		var userName = steam_get_user_persona_name_sync(userID)
		if (async_load[? "change_flags"] & steam_lobby_member_change_entered)
		{
			show_debug_message("[Server Async] Player Joined")
			array_push(global.client.playerList, [userName, userID, 
			array_length(global.client.playerList)*16+16, 16, 0])
			
			print_player_list()
			request_data(userID)
		}
}
