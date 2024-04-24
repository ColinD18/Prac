import heapq

class Node:
    def __init__(self, name, heuristic, graph=None):
        self.name = name
        self.heuristic = heuristic
        self.graph = graph
        self.g_cost = float('inf')
        self.f_cost = float('inf')
        self.parent = None

    def __lt__(self, other):
        return self.f_cost < other.f_cost

def user_input_heuristic(node_names):
    heuristic = {}    
    for node in node_names:
        value = int(input(f"Enter heuristic value for {node}: "))
        heuristic[node] = value
    return heuristic

def user_input_graph(node_names):
    graph = {}
    for node in node_names:
        neighbors = []
        num_neighbors = int(input(f"Enter the number of neighbors for node {node}: "))
        for _ in range(num_neighbors):
            neighbor = input(f"Enter neighbor name for node {node}: ")
            cost = int(input(f"Enter cost to neighbor {neighbor}: "))
            neighbors.append((neighbor, cost))
        graph[node] = neighbors
    return graph

def aStarAlgo(start, goal, heuristic, graph):
    open_set = []
    closed_set = set()

    start_node = Node(start, heuristic[start], graph)
    start_node.g_cost = 0
    start_node.f_cost = start_node.g_cost + start_node.heuristic
    heapq.heappush(open_set, start_node)

    while open_set:
        current_node = heapq.heappop(open_set)

        if current_node.name == goal:
            path = []
            while current_node:
                path.insert(0, current_node)
                current_node = current_node.parent
            print(f"Optimal path from {start} to {goal}: {' -> '.join(node.name for node in path)}")
            print(f"Total cost: {path[-1].g_cost}")
            return

        closed_set.add(current_node.name)

        for neighbor, cost in Graph_nodes[current_node.name]:
            if neighbor not in closed_set:
                neighbor_node = Node(neighbor, heuristic[neighbor], current_node.graph)
                neighbor_node.g_cost = current_node.g_cost + cost
                neighbor_node.f_cost = neighbor_node.g_cost + neighbor_node.heuristic
                neighbor_node.parent = current_node

                if neighbor_node not in open_set:
                    heapq.heappush(open_set, neighbor_node)

    print(f"No path found from {start} to {goal}")

node_names = input("Enter node names separated by space: ").split()

heuristic_values = user_input_heuristic(node_names)

Graph_nodes = user_input_graph(node_names)

# User input for start and goal nodes
start_node = input("Enter the start node: ")
goal_node = input("Enter the goal node: ")

# User input for heuristic values

# Run A* algorithm
aStarAlgo(start_node, goal_node, heuristic_values, Graph_nodes)
