from bigtree import Node


def breadth_first_search(root, goal):

    """
    the opened set (also known as the fringe or frontier) 
    is a data structure that stores the nodes that have been 
    discovered but not yet explored. 
    These are the nodes that are candidates for expansion. 
    In the Breadth-first search the fringe is a queue (FIFO) 
    """
    opened_set = []

    """
    The closed set (also known as the visited set) is a data 
    structure that keeps track of the nodes that have 
    already been explored.
    """
    closed_set = []

    """
    We maintain a copy of the opened and closed set to display
    after the execution. We do the same operations both on the 
    opened set and on its copy, same thing for the closed set,
    except for the pop.
    """
    opened_set_copy = []
    closed_set_copy = []
    
    # visit the start node
    opened_set.append(root)
    opened_set_copy.append(root)

    while opened_set:

        current_node = opened_set.pop(0)
        current_value = current_node.name

        if current_value == goal:
            return current_node, opened_set_copy, closed_set_copy
        
        for idx, node in enumerate(opened_set):
            print(node.name, end=(', ' if idx < len(opened_set) - 1 else '\n'))
                
        # root node does not contain the goal, close it
        closed_set.append(current_node)
        closed_set_copy.append(current_node)

        for child in current_node.children:
            if child not in closed_set:
                opened_set.append(child)
                opened_set_copy.append(child)

    # goal not found
    return None, opened_set_copy, closed_set_copy

def uniform_cost_search(root):
    pass

def depth_first_search(root, goal):

    """
    the opened set (also known as the fringe or frontier) 
    is a data structure that stores the nodes that have been 
    discovered but not yet explored. 
    These are the nodes that are candidates for expansion. 
    In the Depth-first search the fringe is a stack (LIFO) 
    """
    opened_set = []

    """
    The closed set (also known as the visited set) is a data 
    structure that keeps track of the nodes that have 
    already been explored.
    """
    closed_set = []

    """
    We maintain a copy of the opened and closed set to display
    after the execution. We do the same operations both on the 
    opened set and on its copy, same thing for the closed set,
    except for the pop.
    """
    opened_set_copy = []
    closed_set_copy = []
    
    # visit the start node
    opened_set.append(root)
    opened_set_copy.append(root)

    while opened_set:

        current_node = opened_set.pop()
        current_value = current_node.name

        if current_value == goal:
            return current_node, opened_set_copy, closed_set_copy
                
        # root node does not contain the goal, close it
        closed_set.append(current_node)
        closed_set_copy.append(current_node)

        for child in current_node.children:
            if child not in closed_set:
                opened_set.append(child)
                opened_set_copy.append(child)

    # goal not found
    return None, opened_set_copy, closed_set_copy

def depth_limited_search(root, limit):
    pass

def iterative_deepening_search(root):
    pass


"""
root = Node('a')
b    = Node('b', parent=root)
c    = Node('c', parent=root)
d    = Node('d', parent=b)
e    = Node('e', parent=b)
f    = Node('f', parent=b)
g    = Node('g', parent=c)
h    = Node('h', parent=f)
i    = Node('i', parent=g)
"""

root = Node('a')
b    = Node('b', parent=root)
c    = Node('c', parent=root)
d    = Node('d', parent=b)
e    = Node('e', parent=c)
f    = Node('f', parent=c)
g    = Node('g', parent=e)
h    = Node('h', parent=e)
i    = Node('i', parent=f)
j    = Node('j', parent=f)

root.show()

goal_node, opened_set, closed_set = breadth_first_search(root, 'i')
# goal_node, opened_set, closed_set = depth_first_search(root, 'i')

for idx, node in enumerate(opened_set):
    print(node.name, end=(', ' if idx < len(opened_set) - 1 else '\n'))
for idx, node in enumerate(closed_set):
    print(node.name, end=(', ' if idx < len(closed_set) - 1 else '\n'))
