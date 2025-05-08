if (global.client.selfPlayer != undefined) {
	x = global.client.selfPlayer.x
	y = global.client.selfPlayer.y
}

var cam = view_camera[0];
var cam_x = camera_get_view_x(cam);
var cam_y = camera_get_view_y(cam);

var cam_w = camera_get_view_width(cam);
var cam_h = camera_get_view_height(cam);

var target_x = x - cam_w / 2;
var target_y = y - cam_h / 2;

target_x = clamp(target_x, 0, room_width - cam_w);
target_y = clamp(target_y, 0, room_height - cam_h);

// Lerp to target position
var smooth = 0.2;
var new_x = lerp(cam_x, target_x, smooth);
var new_y = lerp(cam_y, target_y, smooth);

camera_set_view_pos(cam, new_x, new_y);
