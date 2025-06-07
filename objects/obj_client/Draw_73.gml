/// @description Render the board
depth = 9999
for (var i = 0; i < array_length(global.board); i++)
{
	for (var j = 0; j < array_length(global.board[0]); j++)
	{
		draw_sprite(spr_board, global.board[i][j], i*16, j*16)
	}
}