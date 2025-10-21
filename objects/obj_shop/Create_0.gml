/// @description Insert description here
// You can write your code in this editor

var towerTab = instance_create_layer(x,y,"GUI",obj_shopTabClickable)
towerTab.type = TAB.TOWER
towerTab.click_function = function(){
	image_index = TAB.TOWER
	instance_create_layer(x-24,y-8,"GUIOVER",obj_towerClickable)
	instance_create_layer(x,y-8,"GUIOVER",obj_towerClickable)
	instance_create_layer(x+24,y-8,"GUIOVER",obj_towerClickable)
	instance_create_layer(x-24,y+15,"GUIOVER",obj_towerClickable)
	instance_create_layer(x,y+15,"GUIOVER",obj_towerClickable)
	instance_create_layer(x+24,y+15,"GUIOVER",obj_towerClickable)
}

var enemyTab = instance_create_layer(x,y,"GUI",obj_shopTabClickable)
enemyTab.type = TAB.ENEMY
enemyTab.click_function = function(){
	image_index = TAB.ENEMY
}


var itemsTab = instance_create_layer(x,y,"GUI",obj_shopTabClickable)
itemsTab.type = TAB.ITEMS
itemsTab.click_function = function(){
	image_index = TAB.ITEMS
}



var exitTab = instance_create_layer(x,y,"GUI",obj_shopTabClickable)
exitTab.type = TAB.EXIT
exitTab.click_function = function(){
	instance_destroy(self)}


enum TAB {
	TOWER = 1,
	ENEMY,
	ITEMS,
	EXIT
}