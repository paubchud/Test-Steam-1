if (is_local) {
    x += keyboard_check(vk_right) - keyboard_check(vk_left);
    y += keyboard_check(vk_down) - keyboard_check(vk_up);
}
