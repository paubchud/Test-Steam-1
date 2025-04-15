// Initialize Steam
steam_init();

// Get your own Steam ID
global.my_id = steam_get_user_steam_id();
show_debug_message("My Steam ID: " + string(global.my_id));







// Close game and error if steam is not open
if(global.my_id == 0){show_error("Steam is not initialized. Please launch the game through Steam.", true);}