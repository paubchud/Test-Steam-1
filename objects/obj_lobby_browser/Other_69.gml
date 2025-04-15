if (async_load[? "event_type"] == "steam_lobby_match_list") {
    global.lobbies = [];

    var count = async_load[? "lobby_count"];
    for (var i = 0; i < count; i++) {
        var lobby = steam_lobby_match_get_lobby(i);
        var name = steam_lobby_get_data(lobby, "name");
        array_push(global.lobbies, [lobby, name]);
    }
}
