// Initiate Server Variables

// Player list will store: Name, ID, Spawn x, Spawn y, Data String (later)
var player = instance_create_layer(16, 16, "Instances", obj_player)
player.playerID = global.my_id
player.is_local = true
player.playerName = global.my_name
player.index = 0; // Host
					

//show_debug_message("[S obj] Add host to player list")
playerList[0] = [global.my_name, global.my_id, 16, 16, 0]
print_player_list()
//array_push(playerList, [global.my_name, global.my_id, 0, 0, 0])

//show_debug_message("[S obj] Player Added: "+ string(playerList[0][0]))
inbuf = buffer_create(1, buffer_grow, 1)