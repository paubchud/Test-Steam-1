if (is_local && !instance_exists(obj_camera))
	global.camera = instance_create_layer(0,0,"GUI", obj_camera)

if (is_local) {
	var move_x = keyboard_check(ord("D")) - keyboard_check(ord("A"));
	var move_y = keyboard_check(ord("S")) - keyboard_check(ord("W"));

	// Normalize diagonal movement
	if (move_x != 0 || move_y != 0) {
	    var dir = point_direction(0, 0, move_x, move_y);
	    hsp = lerp(hsp, lengthdir_x(move_speed, dir), accel);
	    vsp = lerp(vsp, lengthdir_y(move_speed, dir), accel);
	} else {
	    hsp = lerp(hsp, 0, friction);
	    vsp = lerp(vsp, 0, friction);
	}

	// Apply deadzone
	if (abs(hsp) < 0.1) hsp = 0;
	if (abs(vsp) < 0.1) vsp = 0;

	// Move the player
	x += hsp;
	y += vsp;

	// Clamp x and y to stay within the room
	x = clamp(x, 0, room_width - sprite_width);
	y = clamp(y, 0, room_height - sprite_height);

    if(move_x!=0 || move_y!=0) {
		update_player_pos_to_server(x, y, index)}
}


