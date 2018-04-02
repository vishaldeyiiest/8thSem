from board import Board

class Node:
	def __init__(self, state, parent, move, depth):
		self.state = state
		self.parent = parent
		self.move = move	
		self.depth = depth
'''
def create_node(state, parent, move, depth):
	return Node(state, parent, move, depth)
'''

def create_child(current_node, visited):
	current_state = current_node.state
	nodes = []
	#print current_state.value
	
	up = Node(Board(current_state.move_up()), current_node, 'up', current_node.depth+1)
	down = Node(Board(current_state.move_down()), current_node, 'down', current_node.depth+1)
	left = Node(Board(current_state.move_left()), current_node, 'left', current_node.depth+1)
	right = Node(Board(current_state.move_right()), current_node, 'right', current_node.depth+1)
	'''
	up = create_node(current_state.move_up(), current_node, 'up', current_node.depth+1)
	down = create_node(current_state.move_down(), current_node, 'down', current_node.depth+1)
	left = create_node(current_state.move_left(), current_node, 'left', current_node.depth+1)
	right = create_node(current_state.move_right(), current_node, 'right', current_node.depth+1)
	'''
	#print up.state.value, current_state.value		## WHY SAME ?

	for x in [up, down, left, right]:
		#if x.state in visited: print 'HH'
		if x.state not in visited and type(x.state.value) != type(None):
			nodes.append(x)
			#print x.state.value

	return nodes

def bfs(start, goal):

	states = []
	visited = set()
	comp = 0
	states.append(Node(start, None, None, 0))

	while True:
		if len(states) == 0:
			return comp, None

		current = states.pop(0)
		#current.state.display_board()
		visited.add(current.state)			
		comp += 1
		if current.state == goal:
			path = []
			temp = current
			while True:
				path.insert(0, temp.move)
				if temp.depth == 1:
					break
				temp = temp.parent
			#print comp, len(visited)
			return comp, path

		states.extend(create_child(current, visited))

def dfs(start, goal, depth_limit = 100):

	states = []
	visited = set()

	states.append(Node(start, None, None, 0))
	comp = 0

	while True:
		if len(states) == 0:
			return comp, None

		current = states.pop(0)
		#current.state.display_board()
		visited.add(current.state)			
		comp += 1

		if current.state == goal:
			path = []
			temp = current
			while True:
				path.insert(0, temp.move)
				if temp.depth == 1:
					break
				temp = temp.parent
			return comp, path

		if current.depth < depth_limit:
			new_states = create_child(current, visited)
			new_states.extend(states)
			states = new_states


def ida(start, goal, depth_limit = 100):
	comparisons = 0
	for d in range(depth_limit):
		comp, res = dfs(start, goal, d)
		comparisons += comp
		if res != None:
			return comparisons, res

	return comparisons, res