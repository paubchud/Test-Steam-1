// Steam multiplayer setup and event handling (for obj_controller)

// Call in obj_controller Create event
function SteamMultiplayer_Init() {
    steam_init();
    if (!steam_is_overlay_enabled()) {
        show_debug_message("Steam overlay not available");
    }

    global.network_type = 1; // Steam networking
    global.my_lobby = -1;
}

// Call when host button is pressed
function SteamMultiplayer_HostGame() {
	steam_lobby_create(steam_lobby_type_private,8)
	//steam_lobby_set_data(string(steam_lobby_get_owner_id()), "room", "rm_arena");
}

// Call when refresh button is pressed
function SteamMultiplayer_RefreshList() {
    steam_lobby_list_request();
	/*/ Inside your Refresh button click function
	var num_lobbies = steam_lobby_list_get_count()  // Get number of available lobbies
	var lobby_list = [];  // Array to store the available lobbies

	// Loop through the lobbies and store relevant info (e.g., lobby ID, room name)
	for (var i = 0; i < num_lobbies; i++) {
		var lobby_id = steam_lobby_list_get_lobby_id(i);  // Get lobby ID
		lobby_list[i] = {id: lobby_id}; // Store the lobby info

    // Debug message to verify the lobbies
    show_message("Lobby " + string(i + 1) + ": " + lobby_id);
	}*/
}

// Call when selecting a lobby to join
function SteamMultiplayer_JoinLobby(lobby_id) {
    steam_lobby_join_id(lobby_id);
	var room_name = steam_lobby_get_data(string(steam_lobby_get_owner_id()), "room");
	
    show_debug_message("room name: " + room_name);
	/*
	if (room_exists(room_name)) {
		room_goto(global.room_map[room_name]); // Use a map if needed
	} else {
		room_goto(rm_arena); // fallback
		*/
}

// Call when needing a debug output for button clicks
function click_function_debug() {
	show_debug_message("Button clicked!");	
}