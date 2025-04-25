if (is_local && (keyboard_check(vk_right) - keyboard_check(vk_left) != 0 ||
    keyboard_check(vk_down) - keyboard_check(vk_up) != 0)) {
    x += keyboard_check(vk_right) - keyboard_check(vk_left);
    y += keyboard_check(vk_down) - keyboard_check(vk_up);
	// Might change to index instead of ID
	update_player_pos_to_server(x, y, global.my_id)
}
