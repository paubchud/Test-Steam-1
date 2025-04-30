///@self obj_client
function print_player_list(){
	show_debug_message("[Helper] PlayerCount: "+ string(array_length(playerList)))
	for(var i = 0; i < array_length(playerList); i++){
		show_debug_message("[Helper] "+playerList[i][INDEX.NAME])
	}
}
