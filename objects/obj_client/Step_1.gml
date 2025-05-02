///@description Packet Listening
while(steam_net_packet_receive()){
	var _sender = steam_net_packet_get_sender_id()
	steam_net_packet_get_data(inbuf)
	buffer_seek(inbuf, buffer_seek_start, 0)
	var _type = buffer_read(inbuf, buffer_u8)
	show_debug_message("type: "+string(_type))
	
	switch _type {
		/* Client Packets Client Receives
		SYNC_PLAYER_LIST: Update player list received from server
		REQUEST_DATA: Send data requested by server
		MOVEMENT_UPDATE_SERVER: Update player position of other players
		*/
		case PACKET.PLAYER_LIST_SYNC:
			show_debug_message("[Client] PL Sync")
			// Update playerList
			var crunchList = buffer_read(inbuf, buffer_string)
			playerList = json_parse(crunchList)
			
			// Make newly added character
			if(steam_lobby_member_change_entered){
				show_debug_message("Create character")
				var isNew = (playerList[array_length(playerList)-1][INDEX.ID] == global.my_id); // If you just joined
				show_debug_message("Am I new: "+ string(isNew))
				
				// Joinee makes whole list, others make just new
				for(var i = (isNew ? 0:(array_length(playerList)-1));
				i < array_length(playerList);
				i++){
					// Change to get current pos later or make everyone spawn once lobby full
					var playerData = playerList[i]
					var posx = playerData[INDEX.XSPAWN]
					var posy = playerData[INDEX.YSPAWN]
					var player = instance_create_layer(posx, posy, "Instances", obj_player)
					player.playerID = playerData[INDEX.ID]
					if (player.playerID == global.my_id) selfPlayer = player
					player.is_local = ((playerData[INDEX.ID] == global.my_id) ? true:false)
					player.playerName = playerData[INDEX.NAME]
					player.index = i
					show_debug_message("Player Created; ID: "+ string(player.playerID) + ", Local: " + string(player.is_local))
				}
			}
		break
		case PACKET.REQUEST_DATA:
			show_debug_message("[Client] Sending Data As Requested")
			send_player_data(data)
		break
		case PACKET.MOVEMENT_UPDATE_CLIENT: // SENT FROM SERVER
			//show_debug_message("[Client] POS Update")
			// Receive movement from another player via server
			var index = buffer_read(inbuf, buffer_u8)
			var xPos = buffer_read(inbuf, buffer_u16)
			var yPos = buffer_read(inbuf, buffer_u16)
			// Change x and y of that character (need to refer to player obj in list)
			with (obj_player) {
				if (self.index == index){
					self.x = xPos
					self.y = yPos
				}
			}
			//show_debug_message("[Client] X: "+ string(xPos))
			//show_debug_message("[Client] Y: "+ string(yPos))
		break
		default: 
			if isHost{
				//show_debug_message("Sending to Server")
				global.server.inbuf = inbuf
				global.server.alarm[0] = 1}
			else{
				show_debug_message("Server/Unknown Packet")}
	}
}