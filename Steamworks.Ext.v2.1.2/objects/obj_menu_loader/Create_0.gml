// @description Creates buttons for menu (for obj_menu_loader)

show_debug_message("obj_menu_loader Create running");

var bHost = instance_create_layer(100, 100, "Instances", obj_button)
bHost.label = "Host Game"
bHost.click_function = SteamMultiplayer_HostGame;

var bRefresh = instance_create_layer(100, 140, "Instances", obj_button)
bRefresh.label = "Refresh List";
bRefresh.click_function = SteamMultiplayer_RefreshList;

lobby_list = {};
