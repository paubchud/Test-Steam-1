global.lobbies = [];
base_y = 200;
var b = steam_lobby_list_add_string_filter("isPaubLobby", "true", steam_lobby_list_filter_eq)
show_debug_message(b)
steam_lobby_list_request(); // Get lobby list from Steam

var refresh_button = instance_create_layer(100, 100, "Instances", obj_button);
refresh_button.label = "Refresh List";
refresh_button.click_function = function() {
	steam_lobby_list_request();
}
