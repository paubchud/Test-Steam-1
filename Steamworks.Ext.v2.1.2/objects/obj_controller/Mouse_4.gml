// @description Checks if user clicks a lobby to join (for obj_controller)

var list_x = 100;
var list_y = 100;
var spacing = 30;

if (is_array(global.lobbies)) {
    for (var i = 0; i < array_length(global.lobbies); ++i) {
        var yy = list_y + i * spacing;
        if (mouse_x > list_x && mouse_x < list_x + 300 &&
            mouse_y > yy && mouse_y < yy + 20) {

            var lobby = global.lobbies[i];
            var lobby_id = lobby[0];
            SteamMultiplayer_JoinLobby(lobby_id);
            break;
        }
    }
}
