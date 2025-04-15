var base_y = 100;

for (var i = 0; i < array_length(global.lobbies); i++) {
    var name = global.lobbies[i][1];
    draw_text(100, base_y + i * 30, name);
}
