import random, copy

num_states = 0

class TicTacToe:
	
	def __init__(self):
		self.board = [' ', ' ', ' ',
				' ', ' ', ' ',
				' ', ' ', ' ']

	def display(self):
		print self.board[0], '|', self.board[1], '|', self.board[2]
		print '---------'
		print self.board[3], '|', self.board[4], '|', self.board[5]
		print '---------'
		print self.board[6], '|', self.board[7], '|', self.board[8] 
	
	def getPos(self, player):
		moves = []
		for i in range(len(self.board)):
			if self.board[i] == player:
				moves.append(i)
		return set(moves)

	def nextAvailableMoves(self):
		moves = []
		for i in range(len(self.board)):
			if self.board[i] == ' ':
				moves.append(i) 	
		return moves

	def checkWin(self):
		solutions = [[0, 1, 2], [0, 3, 6], [1, 4, 7], [2, 5, 8],
			[0, 4, 8], [3, 4, 5], [6, 7, 8], [2, 4, 6]]

		for player in ['X', 'O']:
			pos = self.getPos(player)
			for sol in solutions:
				win_flag = True
				for s in sol:
					if s not in pos:
						win_flag = False
				if win_flag:
					return player

	def gameOver(self):

		if self.checkWin() != None:
			return True
		for i in self.board:
			if i == " ":
				return False
		return True


	def makeMove(self, move, player):
		self.board[move] = player

	def minimax(self, prev_board, depth, player):
		#print 'Depth: ', depth
		global num_states
		num_states += 1
		if depth == 0 or prev_board.gameOver():
			if prev_board.checkWin() == 'X':
				return -10
			elif prev_board.checkWin() == 'O':
				return 10
			else:
				return 0

		if player == 'X':
			bestv = 1000
			for move in prev_board.nextAvailableMoves():
				prev_board.makeMove(move, player)
				mv = self.minimax(prev_board, depth+1, changePlayer(player))*depth
				#undo
				prev_board.makeMove(move, ' ')
				bestv = min(bestv, mv)

			return bestv

		if player == 'O':
			bestv = -1000
			for move in prev_board.nextAvailableMoves():
				prev_board.makeMove(move, player)
				mv = self.minimax(prev_board, depth+1, changePlayer(player))*(9-depth)
				#undo
				prev_board.makeMove(move, ' ')
				bestv = max(bestv, mv)

			return bestv

	def minimax_alpha_beta(self, prev_board, depth, player, alpha, beta):
		#print 'Depth: ', depth
		global num_states
		num_states += 1
		if depth == 9 or prev_board.gameOver():
			if prev_board.checkWin() == 'X':
				return -10
			elif prev_board.checkWin() == 'O':
				return 10
			else:
				return 0

		if player == 'X':
			bestv = 1000
			for move in prev_board.nextAvailableMoves():
				prev_board.makeMove(move, player)
				mv = self.minimax_alpha_beta(prev_board, depth+1, changePlayer(player), alpha, beta)*depth
				#undo
				prev_board.makeMove(move, ' ')
				bestv = min(bestv, mv)
				beta = min(beta, bestv)
				if beta <= alpha:
					break

			return bestv

		if player == 'O':
			bestv = -1000
			for move in prev_board.nextAvailableMoves():
				prev_board.makeMove(move, player)
				mv = self.minimax_alpha_beta(prev_board, depth+1, changePlayer(player), alpha, beta)*(9-depth)
				#undo
				prev_board.makeMove(move, ' ')
				bestv = max(bestv, mv)
				alpha = max(alpha, bestv)
				if beta <= alpha:
					break

			return bestv

	def checkWhoWin(self):
		if self.checkWin() == 'X':
			return 'YOU'
		elif self.checkWin() == 'O':
			return 'COMPUTER'
		elif self.gameOver():
			return 'Nobody, DRAW'

def getBestMove(board, depth, player):
		choices = []

		for move in board.nextAvailableMoves():
			board.makeMove(move, player)
			mv = board.minimax(board, depth+1, changePlayer(player))
			#mv = board.minimax_alpha_beta(board, depth+1, changePlayer(player), -float('inf'), float('inf'))
			#print player
			board.makeMove(move, ' ')

			if mv > 0:
				choices = [move]
			elif mv == 0:
				choices.append(move)

		print 'Choices: ',
		for i in choices:
			print i+1,
		print
		'''
		if len(choices) > 0:
			return choices[0]
		else:
			return random.choice(board.nextAvailableMoves())
		'''

		return choices[0], num_states
		

def changePlayer(player):
		if player == 'X':
			player = 'O'
		else:
			player = 'X'
		return player
