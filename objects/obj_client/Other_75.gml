switch(async_load[? "event_type"])
{
	case "lobby_chat_update": // New Player Joined
		show_debug_message("[Async: Client] Player Count: "+array_length(playerList))
		playerToBeAdded = true
	break;
}