// @description Handles all Steam async events (for obj_controller)

var event = async_load[? "event_type"];

switch (event) {
    case "steam_lobby_created":
        if (async_load[? "result"] == 1) {
            global.my_lobby = async_load[? "lobby_id"];
            steam_lobby_set_joinable(true);
            steam_lobby_set_data("name", steam_get_persona_name() + "'s Game");
        }
        break;

    case "steam_lobby_match_list":
        var count = async_load[? "lobby_count"];
        global.lobbies = []; // Store for GUI display
        for (var i = 0; i < count; ++i) {
            var lobby = steam_lobby_match_get_lobby(i);
            var name = steam_lobby_get_data(lobby, "name");
            array_push(global.lobbies, [lobby, name]);
        }
        break;

    case "steam_lobby_joined":
        global.my_lobby = async_load[? "lobby_id"];
        room_goto(rm_game);
        break;
}
