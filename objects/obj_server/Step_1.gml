// Packet Listening
var _inbuf = buffer_create(1, buffer_grow, 1)
while(steam_net_packet_receive()) {
	var _sender = steam_net_packet_get_sender_id()
	steam_net_packet_get_data(_inbuf)
	buffer_seek(_inbuf, buffer_seek_start, 0)
	var _type = buffer_read(_inbuf, buffer_u8)
	
	switch _type {
		case PACKET.MOVEMENT_UPDATE_CLIENT: // SENT FROM CLIENT
			show_debug_message("Packet Received from Client")
			var xPos = buffer_read(_inbuf, buffer_u16)
			var yPos = buffer_read(_inbuf, buffer_u16)
			var IDsender = buffer_read(_inbuf, buffer_u64)
			// Loop through players to update movement
			for(i = 0; i <= array_length(playerList); i++) {
				// Possiblyu use index variable instead of ID search idk
				update_player_pos_to_clients(xPos,yPos,IDsender, playerList[i][INDEX.ID]) // Possibly make index variable
			}
			
			buffer_delete(_inbuf)
		break
		default: show_debug_message("[Server Packet] Unknown Packet")
	}
}