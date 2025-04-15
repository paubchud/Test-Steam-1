var is_hovered =
    device_mouse_x(0) > x &&
    device_mouse_x(0) < x + width &&
    device_mouse_y(0) > y &&
    device_mouse_y(0) < y + height;

// resizes transparent sprite for collision mask
image_xscale = width;
image_yscale = height;

//draw_sprite_ext(sprite_index, image_index, x, y, width, height);
draw_set_color(is_hovered ? c_gray : c_dkgray);
draw_rectangle(x, y, x + width, y + height, false);

draw_set_color(c_white);
draw_text(x + 10, y + 8, label);