/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
width = sprite_width
height = sprite_height
click_function = function(){
	var cam = view_camera[0]
	if( !instance_exists(obj_shop) ){
	instance_create_layer((camera_get_view_x(cam)+camera_get_view_width(cam))/2,
						  (camera_get_view_y(cam)+camera_get_view_height(cam))/2,
						  "GUI", obj_shop)
	} else if ( instance_exists(obj_shop) ){
		instance_destroy(obj_shop)
	}
}
