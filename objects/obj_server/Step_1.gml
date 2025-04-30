/// @description Handle Global Async Events
_inbuf = buffer_create(1, buffer_grow, 1)
while(steam_net_packet_receive()) {
	var _sender = steam_net_packet_get_sender_id()
	steam_net_packet_get_data(_inbuf)
	buffer_seek(_inbuf, buffer_seek_start, 0)
	var _type = buffer_read(_inbuf, buffer_u8)
	
	switch _type {
	/* Server Packets: Server/Host Receives
		PLAYER_JOIN: Takes list element added by Async[lobby chat] and adds player data
		PLAYER_LEAVE: Handles player leaving
		MOVEMENT_UPDATE_SERVER: 
		*/
		case PACKET.UPDATE_DATA:
			show_debug_message("[Server] Updating Player Data")
			// Add data to player
			playerList[array_length(playerList)-1][INDEX.DATA] = buffer_read(_inbuf, buffer_u16)
			
			//print_player_list() // player list checks out so far with 2 players
			
			// Send full list to others
			for(var i = 0; i < array_length(playerList); i++){
				player_list_sync(playerList[i][INDEX.ID])
			}
		break
		case PACKET.PLAYER_LEAVE:
			show_debug_message("[Server] Player Leave")
			// Remove from list
			
			// Send new list to others
		
		break
		case PACKET.MOVEMENT_UPDATE_CLIENT: // SENT FROM CLIENT
			show_debug_message("[Server] POS Update")
			var index = buffer_read(_inbuf, buffer_u8)
			var xPos = buffer_read(_inbuf, buffer_u16)
			var yPos = buffer_read(_inbuf, buffer_u16)
			// Loop through players to update movement
			for(var i = 0; i < array_length(playerList); i++) {
				if (i != index){
					update_player_pos_to_clients(xPos,yPos,index,
					playerList[i][INDEX.ID]) // Possibly make index variable
				}
			}
		break
		default: show_debug_message("SUnknown Packet")
	}
}