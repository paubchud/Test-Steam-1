// @description Draws the list of joinable lobbies (for obj_controller)

var list_x = 100;
var list_y = 100;
var spacing = 30;

if (is_array(global.lobbies)) {
    for (var i = 0; i < array_length(global.lobbies); ++i) {
        var lobby = global.lobbies[i];
        var lobby_id = lobby[0];
        var lobby_name = lobby[1];

        draw_set_color(c_white);
        draw_text(list_x, list_y + i * spacing, lobby_name);
    }
}
