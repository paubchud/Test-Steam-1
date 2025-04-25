//Server obj[Async]: send updated player list when a player joins
function player_list_sync(steam_id){
	var _b = buffer_create(1, buffer_grow, 1)
	buffer_write(_b, buffer_u8, PACKET.SYNC_PLAYER_LIST)
	buffer_write(_b, buffer_string, playerList)
	steam_net_packet_send(steam_id, _b)
	buffer_delete(_b)
}

//Server obj[Begin Step]: When recived, loop through players to update all
// X position, Y position, ID of player moving, ID of player receiving packet
function update_player_pos_to_clients(xPos, yPos, IDsender, IDreceiver){
	var _b = buffer_create(5, buffer_fixed, 1)
	buffer_write(_b, buffer_u8, PACKET.MOVEMENT_UPDATE_SERVER)
	buffer_write(_b, buffer_u16, xPos)
	buffer_write(_b, buffer_u16, yPos)
	buffer_write(_b, buffer_u16, IDsender)
	steam_net_packet_send(IDreceiver, _b)
	show_debug_message("Packet Sent to Clients")
	buffer_delete(_b)
}

//Client obj[Step]: On movement, update player position
// X position, Y position, ID of player moving
function update_player_pos_to_server(xPos, yPos, IDsender){
	var _b = buffer_create(5, buffer_fixed, 1)
	buffer_write(_b, buffer_u8, PACKET.MOVEMENT_UPDATE_CLIENT)
	buffer_write(_b, buffer_u16, xPos)
	buffer_write(_b, buffer_u16, yPos)
	buffer_write(_b, buffer_u64, IDsender)
	steam_net_packet_send(steam_lobby_get_owner_id(), _b)
	show_debug_message("Packet Sent to Server")
	buffer_delete(_b)
}


enum PACKET {
	SYNC_PLAYER_LIST = 1,
	MOVEMENT_UPDATE_SERVER,
	MOVEMENT_UPDATE_CLIENT
}