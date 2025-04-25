///@description Packet Listening
var _inbuf = buffer_create(1, buffer_grow, 1)
while(steam_net_packet_receive()) {
	var _sender = steam_net_packet_get_sender_id()
	steam_net_packet_get_data(_inbuf)
	buffer_seek(_inbuf, buffer_seek_start, 0)
	var _type = buffer_read(_inbuf, buffer_u8)
	show_debug_message("[Client] type: "+string(_type))
	
	switch _type {
		/* Client Packets Client Receives
		SYNC_PLAYER_LIST: Update player list received from server
		REQUEST_DATA: Send data requested by server
		MOVEMENT_UPDATE_SERVER: Update player position of other players
		*/
		case PACKET.PLAYER_LIST_SYNC:
			show_debug_message("[Client] PL Sync")
			// Update playerList
			playerList = buffer_read(_inbuf, buffer_string)
			
			// Make newly added character
			if(steam_lobby_member_change_entered)
			{
				show_debug_message("Create character")
			}
		break
		case PACKET.REQUEST_DATA:
			show_debug_message("[Client] Sending Data As Requested")
			send_player_data(data)
		break
		case PACKET.MOVEMENT_UPDATE_SERVER: // SENT FROM SERVER
			show_debug_message("[Server] POS Update")
			// Receive movement from another player via server
			var xPos = buffer_read(_inbuf, buffer_u16)
			var yPos = buffer_read(_inbuf, buffer_u16)
			var IDsender = buffer_read(_inbuf, buffer_u64)
			for(i = 0; i <= array_length(playerList); i++) {
				if (IDsender == playerList[i][INDEX.ID]){
					// Change x and y of that character
					show_debug_message("[Client] X: "+ xPos)
					show_debug_message("[Client] Y: "+ yPos)
				}
			}
		break
		
		
		
		/* Server Packets: Server/Host Receives
		PLAYER_JOIN: Takes list element added by Async[lobby chat] and adds player data
		PLAYER_LEAVE: Handles player leaving
		MOVEMENT_UPDATE_SERVER: 
		*/
		case PACKET.PLAYER_JOIN:
			show_debug_message("[Server] Updating Player Data")
			show_debug_message("[Server] " + string(steam_lobby_get_member_count()))
			// Add data to player
			playerList[steam_lobby_get_member_count()-1][INDEX.DATA] = buffer_read(_inbuf, buffer_u16)
			
			// Send full list to others
			for(var i = 1; i < steam_lobby_get_member_count(); i++){ // skip host
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
			var xPos = buffer_read(_inbuf, buffer_u16)
			var yPos = buffer_read(_inbuf, buffer_u16)
			var IDsender = buffer_read(_inbuf, buffer_u64)
			// Loop through players to update movement
			for(i = 0; i <= array_length(playerList); i++) {
				// Possiblyu use index variable instead of ID search idk
				update_player_pos_to_clients(xPos,yPos,IDsender, playerList[i][INDEX.ID]) // Possibly make index variable
			}
		break
		default: show_debug_message("Unknown Packet")
	}
	buffer_delete(_inbuf)
}