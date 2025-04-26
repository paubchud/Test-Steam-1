// Initiate Server Variables

// Player list will store: Name, ID, Spawn x, Spawn y, Data String (later)
//show_debug_message("[S obj] Add host to player list")
global.client.playerList[0] = [global.my_name, global.my_id, 0, 0, 0]
print_player_list()
//array_push(playerList, [global.my_name, global.my_id, 0, 0, 0])

//show_debug_message("[S obj] Player Added: "+ string(playerList[0][0]))