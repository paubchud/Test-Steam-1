///@description Packet Listening
var _inbuf = buffer_create(1, buffer_grow, 1)
while(steam_net_packet_receive()) {
	var _sender = steam_net_packet_get_sender_id()
	steam_net_packet_get_data(_inbuf)
	buffer_seek(_inbuf, buffer_seek_start, 0)
	var _type = buffer_read(_inbuf, buffer_u8)
	
	switch _type {
		case PACKET.SYNC_PLAYER_LIST:
		
		break
		case PACKET.MOVEMENT_UPDATE_SERVER: // SENT FROM SERVER
			show_debug_message("Packet Received from Server")
			// Receive movement from another player via server
			var xPos = buffer_read(_inbuf, buffer_u16)
			var yPos = buffer_read(_inbuf, buffer_u16)
			var IDsender = buffer_read(_inbuf, buffer_u64)
			for(i = 0; i <= array_length(playerList); i++) {
				if (IDsender == playerList[i][INDEX.ID]){
					// Change x and y of that character
					show_debug_message("[Client Packet] X: "+ xPos)
					show_debug_message("[Client Packet] Y: "+ yPos)
				}
			}
			
			buffer_delete(_inbuf)
		break
		default: show_debug_message("[Client Packet] Unknown Packet")
	}
}