// @description Receives and applies position data (for obj_player)

var buf = async_load[? "buffer"];
x = buffer_read(buf, buffer_f32);
y = buffer_read(buf, buffer_f32);
