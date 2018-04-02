import copy

class Board:
	def __init__(self, initv):
		self.value = initv

	def __eq__(self, state):
		return self.value == state.value
	
	def __hash__(self):
		return hash(str(self.value))

	def find_blank(self):
		values = self.value
		#print values
		for i in range(3):
			for j in range(3):
				if values[i][j] == 0:
					return i, j
	
	def move_up(self):
		row, col = self.find_blank()
		if row == 0:
			return None
		else:
			new_s = copy.deepcopy(self.value)
			new_s[row-1][col], new_s[row][col] = new_s[row][col], new_s[row-1][col]
		return new_s

	def move_down(self):
		row, col = self.find_blank()
		if row == 2:
			return None
		else:
			new_s = copy.deepcopy(self.value)
			new_s[row+1][col], new_s[row][col] = new_s[row][col], new_s[row+1][col]
		return new_s

	def move_left(self):
		row, col = self.find_blank()	
		if col == 0:
			return None
		else:
			new_s = copy.deepcopy(self.value)
			new_s[row][col-1], new_s[row][col] = new_s[row][col], new_s[row][col-1]
		return new_s

	def move_right(self):
		row, col = self.find_blank()
		if col == 2:
			return None
		else:
			new_s = copy.deepcopy(self.value)
			new_s[row][col+1], new_s[row][col] = new_s[row][col], new_s[row][col+1]
		return new_s


	def display_board(self):
		print "-------------"
		for i in range(3):
			for j in range(3):
				print '|', self.value[i][j],
			print  
		print "-------------"