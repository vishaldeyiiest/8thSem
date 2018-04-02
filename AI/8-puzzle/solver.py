from board import Board
from search_bfs_dfs_ida import bfs, dfs, ida
from heuristics import hill_climbing, best_first, Astar

start = Board([[2, 8, 1], [6, 0, 4], [3, 7, 5]])

#start = Board([[1, 3, 6], [4, 0, 2], [7, 5, 8]])
#start.display_board()
goal = Board([[1, 2, 3], [4, 5, 6], [7, 8, 0]])

option = int(raw_input('Enter 1 for BFS, 2 for DFS and 3 for IDA, 4 for hill_climbing, 5 for Best-first and 6 for A*: '))
print

print 'Starting State: '
start.display_board()

print 'Goal State: '
goal.display_board()

if option == 1:
	comp, moves = bfs(start, goal)
	print 'Used Method: Breadth first Search'
elif option == 2:
	comp, moves = dfs(start, goal)
	print 'Used Method: Depth first Search'
elif option == 3:
	comp, moves = ida(start, goal)
	print 'Used Method: Iterative Deepening Search'
elif option == 4:
	comp, moves = hill_climbing(start, goal)
	print 'Used Method: Hill Climbing Search'
elif option == 5:
	comp, moves = best_first(start, goal)
	print 'Used Method: Best-first Search'
elif option == 6:
	comp, moves = Astar(start, goal)
	print 'Used Method: A* Search'
else:
	print 'Not a valid option..! TRY again! :('
	exit(0)

if moves is None:
	print "Unsolvable Starting State..!"
elif moves == [None]:
	print "Goal and starting states are same"
else:
	print 'Number of comparisons: ', comp
	print 'Number of moves: ', len(moves), '\n'
	print moves
