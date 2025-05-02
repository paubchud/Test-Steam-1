/// @description Handle Server Packet Event
steam_net_packet_get_data(inbuf)
buffer_seek(inbuf, buffer_seek_start, 0)
var _type = buffer_read(inbuf, buffer_u8)
//show_debug_message("[Server] type: "+string(_type))
	
switch _type {
/* Server Packets: Server/Host Receives
	PLAYER_JOIN: Takes list element added by Async[lobby chat] and adds player data
	PLAYER_LEAVE: Handles player leaving
	MOVEMENT_UPDATE_SERVER: 
	*/
	case PACKET.UPDATE_DATA:
		//show_debug_message("[Server] Updating Player Data")
		// Add data to player
		playerList[array_length(playerList)-1][INDEX.DATA] = buffer_read(inbuf, buffer_u16)
			
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
	case PACKET.MOVEMENT_UPDATE_SERVER: // SENT FROM CLIENT
		show_debug_message("[Server] POS Update")
		var index = buffer_read(inbuf, buffer_u8)
		var xPos = buffer_read(inbuf, buffer_u16)
		var yPos = buffer_read(inbuf, buffer_u16)
		// Loop through players to update movement
		for(var i = 0; i < array_length(playerList); i++) {
			if (i != index){
				update_player_pos_to_clients(xPos,yPos,index,
				playerList[i][INDEX.ID]) // Possibly make index variable
			}
		}
	break
	default: show_debug_message("Unknown Packet")
}