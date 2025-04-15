// @description Initializes Steam and sets up global lobby list (for obj_controller)

global.lobbies = []; // Prevents access before setup
SteamMultiplayer_Init(); // Only if you've already added this function
