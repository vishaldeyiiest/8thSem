from game import TicTacToe, getBestMove

total_states = 0
game = TicTacToe()

game.display()

while not game.gameOver():
	your_move = int(input('You are playing as X. Choose number between 1-9 (row-major): '))

	game.makeMove(your_move-1, 'X')
	game.display()

	if game.gameOver():
		break

	print 'Now Computers turn...'
	c_move, count = getBestMove(game, 0, 'O')

	total_states += count
	game.makeMove(c_move, 'O')
	game.display()

print 'GAME OVER..!'
print 'WINNER is: ' + game.checkWhoWin()

print 'States Explored: ', total_states