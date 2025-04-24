//Server obj[Async]: send updated player list when a player joins
function player_list_sync(){
	var _b = buffer_create(1, buffer_grow, 1)
	buffer_write(_b, buffer_u8, PACKET.SYNC_PLAYER_LIST)
	buffer_write(_b, buffer_string, playerList)
}


enum PACKET {
	SYNC_PLAYER_LIST = 99
}