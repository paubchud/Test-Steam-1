// @description Player movement and sync (for obj_player)

if (is_local) {
    var h = keyboard_check(vk_right) - keyboard_check(vk_left);
    var v = keyboard_check(vk_down) - keyboard_check(vk_up);
    x += h * 4;
    y += v * 4;

    var buf = buffer_create(8, buffer_grow, 1);
    buffer_write(buf, buffer_f32, x);
    buffer_write(buf, buffer_f32, y);

    steam_net_send_packet(other_player_id, buf, buffer_tell(buf), 0);
    buffer_delete(buf);
}
