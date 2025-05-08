/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
width = sprite_width
height = sprite_height
click_function() = function() {
	var cam = view_camera[0]
	instance_create_layer(camera_get_view_x(cam)+camera_get_view_width(cam),
						  camera_get_view_y(cam)+camera_get_view_height(cam),
						  "GUI", obj_shop)
}
