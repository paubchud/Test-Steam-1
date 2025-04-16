// Mentions any steam async event that occurs
global.steam_event = async_load[? "event_type"];
show_debug_message("[Steam Async] event_type: " + string(global.steam_event));

var steam_async = global.steam_event;

switch(steam_async){
	case "lobby_created":
		var lobby_id = async_load[? "lobby_id"];
		show_debug_message("Lobby Id: "+ string(lobby_id));
		
		
		steam_lobby_join_id(lobby_id) // Join hosted game
	break;
	
	case "lobby_joined":
		// move to game room
		room_goto(2)
		if(steam_lobby_is_owner())
		{
			// Set lobby data
			steam_lobby_set_data("isPaubLobby", "true")
			steam_lobby_set_data("Creator", steam_get_persona_name())	
		}
	break;
	
	// Lobby List Requested
	case "lobby_list":
	
	break;
	
	// Persona name via ID requested
	case "user_persona_name":
	
	break;
	
	default:
		show_debug_message("Event Type default");
	break;
}