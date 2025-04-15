var my = mouse_y;
var base_y = 100;
var index = floor((my - base_y) / 30);

if (index >= 0 && index < array_length(global.lobbies)) {
    var lobby_id = global.lobbies[index][0];
    steam_lobby_join(lobby_id);
}
