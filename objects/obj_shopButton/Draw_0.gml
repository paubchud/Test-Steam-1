var is_hovered =
    device_mouse_x(0) < x &&
    device_mouse_x(0) > x - width &&
    device_mouse_y(0) < y &&
    device_mouse_y(0) > y - height;
if (is_hovered) image_index = 1;
else image_index = 0;
draw_self()