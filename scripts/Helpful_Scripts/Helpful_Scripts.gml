function print_player_list(){
	show_debug_message("[Helper] PlayerCount: "+ string(array_length(global.client.playerList)))
	for(var i = 0; i < array_length(global.client.playerList); i++){
		show_debug_message("[Helper] "+global.client.playerList[i][INDEX.NAME])
	}
}
