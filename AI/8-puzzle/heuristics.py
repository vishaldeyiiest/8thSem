from board import Board
from copy import deepcopy

class Node:
	def __init__(self, state, parent, move, depth, hcost):
		self.state = state
		self.parent = parent
		self.move = move	
		self.depth = depth
		self.hcost = hcost
'''
def create_node(state, parent, move, depth):
	return Node(state, parent, move, depth)
'''

def create_child(current_node, visited, goal_state):
	current_state = current_node.state
	nodes = []
	#print current_state.value
	up_state = current_state.move_up()
	down_state = current_state.move_down()
	left_state = current_state.move_left()
	right_state = current_state.move_right()

	if up_state != None:
		up = Node(Board(up_state), current_node, 'up', current_node.depth+1, heuristic_cost(up_state, goal_state))
		nodes.append(up)
	
	if down_state != None:
		down = Node(Board(down_state), current_node, 'down', current_node.depth+1, heuristic_cost(down_state, goal_state))
		nodes.append(down)

	if left_state != None:
		left = Node(Board(left_state), current_node, 'left', current_node.depth+1, heuristic_cost(left_state, goal_state))
		nodes.append(left)

	if right_state != None:
		right = Node(Board(right_state), current_node, 'right', current_node.depth+1, heuristic_cost(right_state, goal_state))
		nodes.append(right)
	'''
	for x in nodes:
		if x.state != None:
			#nodes.remove(x)
			print x.state.value
			print x.state.display_board()
	'''
	return nodes


def find_num(num, state):
	for i in range(3):
		for j in range(3):
			if state[i][j] == num:
				return i, j

def heuristic_cost(start, goal):
	hc = 0
	
	# Manhattan distance
	'''
	for c in range(1, 9):
		r1, c1 = find_num(c, start)
		r2, c2 = find_num(c, goal)
		hc += abs(r1-r2) + abs(c1-c2)
	#print hc
	'''
	# with no of misplaced tiles
	
	for r in range(3):
		for c in range(3):
			if start[r][c] != goal[r][c] and goal[r][c] != 0:
				hc += 1
	
	return hc


def compare_hcost(state1, state2):
	return state1.hcost - state2.hcost

def compare_fcost(state1, state2):
	return state1.depth + state1.hcost - (state2.depth + state2.hcost)


def hill_climbing(start, goal):

	states = []
	visited = set()
	comp = 0
	states.append(Node(start, None, None, 0, heuristic_cost(start.value, goal.value)))

	while True:
		if len(states) == 0:
			return comp, None
		comp += 1
		current = states.pop(0)
		#current.state.display_board()
		visited.add(current.state)			
		
		if current.state == goal:
			path = []
			temp = current
			while True:
				path.insert(0, temp.move)
				if temp.depth == 1:
					break
				temp = temp.parent
			
			return comp, path

		newstates = create_child(current, visited, goal.value)
		newstates.sort(compare_hcost)
		for st in newstates:
			if st.state not in visited:
				states.insert(0, st)
		


def best_first(start, goal):

	states = []
	visited = set()
	comp = 0
	states.append(Node(start, None, None, 0, heuristic_cost(start.value, goal.value)))

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

		newstates = create_child(current, visited, goal.value)
		for st in newstates:
			if st.state not in visited:
				states.append(st)
		#states.extend(newstates)
		states.sort(compare_hcost)


def Astar(start, goal):
	states = []
	visited = set()
	visited_cost = {}
	comp = 0
	states.append(Node(start, None, None, 0, heuristic_cost(start.value, goal.value)))

	while True:
		if len(states) == 0:
			return comp, None

		current = states.pop(0)
		#print 'At depth: ', current.depth
		#current.state.display_board()
		visited.add(current.state)
		visited_cost[current.state] = current.hcost + current.depth 			

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

		newstates = create_child(current, visited, goal.value)
		
		for st in newstates:	
				
			for eachst in states:
				if eachst.state == st.state:
					if (eachst.depth + eachst.hcost) > (st.depth + st.hcost):
						eachst = deepcopy(st)
						break
			
			
			for eachst in visited:
				if eachst == st.state and visited_cost[eachst] > (st.depth + st.hcost):
					#print 'Vis', eachst.value
					#print st.state.value
					visited.remove(eachst)
					del visited_cost[eachst]
					states.append(st)
					break
			
			if st.state not in visited:
				states.append(st)

		states.sort(compare_fcost)