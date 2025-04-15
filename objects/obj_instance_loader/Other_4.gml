// Host Button
var btn_host = instance_create_layer(100, 100, "Instances", obj_button);
btn_host.label = "Host Game";
btn_host.click_function = function() {
    steam_lobby_create(steam_lobby_type_public, 8); // Host lobby for up to 8 players
	show_debug_message("Lobby Created")
};

// Join Button
var btn_join = instance_create_layer(100, 160, "Instances", obj_button);
btn_join.label = "Join Game";
btn_join.click_function = function() {
    room_goto(rm_lobby_list);
	show_debug_message("Going to lobby list")
};

