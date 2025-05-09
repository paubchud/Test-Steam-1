/// @description Insert description here
// You can write your code in this editor
switch(type) {
	case TAB.EXIT:
		x_adj -= sprite_get_width(spr_shop)-sprite_width-6
		y_adj -= 9
	break;
	case TAB.ITEMS:
		x_adj -= sprite_width+2
	case TAB.ENEMY:
		x_adj -= sprite_width+2
	case TAB.TOWER:
		x_adj -= 6
		y_adj -= 9
	break;
}