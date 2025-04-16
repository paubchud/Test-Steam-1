// Mentions any steam async event that occurs
var steam_async = async_load[? "event_type"];
show_debug_message("[Steam Async] event_type: " + string(steam_async));

switch(steam_async){
	case "lobby_created":
		var lobby_id = steam_lobby_get_lobby_id();
		show_debug_message("Lobby Id: "+ string(lobby_id));
		
		// Set lobby data
		steam_lobby_set_data("isGameMakerTest", "true")
		steam_lobby_set_data("Creator", steam_get_persona_name())
		
		//steam_lobby_join_id(lobby_id) // Join hosted game
	break;
	
	// Player has joined the lobby
	case "lobby_chat_update":
	
	break;
	
	case "lobby_joined":
		// move to game room
		room_goto(2)
	break;
	
	// Lobby List Requested
	case "lobby_list":
	
	break;
	
	// Persona name via ID requested
	case "user_persona_name":
		show_debug_message(async_load[? "persona_name"])
	break;
	
	default:
		show_debug_message("Event Type default");
	break;
}