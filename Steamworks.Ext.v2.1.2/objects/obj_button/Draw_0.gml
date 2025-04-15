// @description Draws the button at its own position (for obj_button)

///*
var is_hovered =
    device_mouse_x(0) > x &&
    device_mouse_x(0) < x + width &&
    device_mouse_y(0) > y &&
    device_mouse_y(0) < y + height;

draw_set_color(is_hovered ? c_gray : c_dkgray);
//*/

//draw_self(); // Optional, draws the sprite

draw_set_color(c_dkgray);
draw_rectangle(x, y, x + width, y + height, false);

draw_set_color(c_white);
draw_text(x + 10, y + 8, label);

show_debug_message("Button drawn: "+ label)
