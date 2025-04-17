// Mentions any steam async event that occurs
var steam_async = async_load[? "event_type"];
show_debug_message("[Steam Async] event_type: " + string(steam_async));

switch(steam_async){
	case "lobby_created":
		var lobby_id = steam_lobby_get_lobby_id();
		
		// Set lobby data
		steam_lobby_set_data("isGameMakerTest", "true")
		steam_lobby_set_data("hostID"		  , global.my_id)
		steam_lobby_set_data("hostPer"		  , steam_get_persona_name())
		
		//steam_lobby_join_id(lobby_id) // Join hosted game
		
		
		
		
		// Debug Functions
		show_debug_message("[debug] Created Lobby Id: "+ string(lobby_id));
		show_debug_message("[debug] Is Owner?       : "+ string(steam_lobby_is_owner()))
		show_debug_message("[debug] Lobby OwnerID   : "+ string(steam_lobby_get_owner_id()))
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
	
	
	
	
		// Debug Functions
		for (var i = 0; i < steam_lobby_list_get_count(); i++) {
			var lobbyID = steam_lobby_list_get_lobby_id(i);
			show_debug_message("[debug] Lobby ID      : "+string(lobbyID))
			
			var datHost = steam_lobby_get_data("hostID")
			show_debug_message("[debug] Host  ID(data): "+string(datHost))
			
			var funcHost = steam_lobby_list_get_lobby_owner_id(i)
			show_debug_message("[debug] Host  ID(func): "+string(funcHost))
			
			var datPer = steam_lobby_get_data("hostPer")
			show_debug_message("[debug] Host Per(data): "+string(datPer))
			
			var funcPer = steam_get_user_persona_name(datHost);
			show_debug_message("[debug] Host Per(func): "+string(funcPer))
	    }
	break;
	
	// Persona name via ID requested
	case "user_persona_name":
		show_debug_message(async_load[? "persona_name"])
	break;
	
	default:
		show_debug_message("Event Type default");
	break;
}