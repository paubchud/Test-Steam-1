// Initialize Steam
steam_init();
// Close game and error if steam is not open
if (!steam_initialised()){show_error("Steam is not initialized. Please launch the game through Steam.", true);}

// Get your own Steam ID
global.my_id = steam_get_user_steam_id();
global.my_name = steam_get_persona_name();
show_debug_message(global.my_name + "'s Steam ID: " + string(global.my_id));
