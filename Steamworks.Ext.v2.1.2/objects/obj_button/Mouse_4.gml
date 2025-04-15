// @description Run click function if clicked inside button (for obj_button)

var mx = device_mouse_x(0);
var my = device_mouse_y(0);

if (mx > x && mx < x + width && my > y && my < y + height) {
    if (is_callable(click_function)) {
		click_function();
		click_function_debug();
	} else {
	    show_debug_message("No valid click_function set.");
	}
}
