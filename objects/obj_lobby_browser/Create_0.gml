global.lobbies = [];
var base_y = 200;
steam_lobby_list_request(); // Get lobby list from Steam

var refresh_button = instance_create_layer(100, 100, "Instances", obj_button);
refresh_button.label = "Refresh List";
refresh_button.click_function = function() {
	steam_lobby_list_request();
}
