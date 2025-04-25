switch(async_load[? "event_type"])
{
	case "lobby_chat_update": // New Player Joined
		var userID = async_load[? "user_id"]
		var userName = steam_get_user_persona_name_sync(userID)
		if (async_load[? "change_flags"] & steam_lobby_member_change_entered)
		{
			show_debug_message("[Server Async] Player Joined")
			array_push(playerList, [userName, userID, 0, 0, 0])
			request_data(userID)
		}
}
