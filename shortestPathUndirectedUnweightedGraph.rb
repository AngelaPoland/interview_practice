#how do we find the shortest path from a start node to an end node in an unweighted, undirected graph?
#https://www.interviewcake.com/question/ruby/mesh-message


def bfs_get_path(graph, start_node, end_node)
  unless graph.has_key?(start_node)
    raise ArgumentError, 'Start node not in graph'
  end

  unless graph.has_key?(end_node)
    raise ArgumentError, 'End node not in graph'
  end

  nodes_to_visit = Queue.new
  nodes_to_visit << start_node

  # keep track of how we got to each node
  # we'll use this to reconstruct the shortest path at the end
  # we'll ALSO use this to keep track of which nodes we've
  # already visited
  how_we_reached_nodes = { start_node => nil }

  until nodes_to_visit.empty?
    current_node = nodes_to_visit.pop

    # stop when we reach the end node
    if current_node == end_node
      return reconstruct_path(how_we_reached_nodes, start_node, end_node)
    end

    graph[current_node].each do |neighbor|
      next if how_we_reached_nodes.has_key?(neighbor)
      nodes_to_visit << neighbor

      # keep track of how we got to this node
      how_we_reached_nodes[neighbor] = current_node
    end
  end

  # if we get here, then we never found the end node
  # so there's NO path from start_node to end_node
  nil
end


def reconstruct_path(how_we_reached_nodes, start_node, end_node)
  reversed_shortest_path = []

  # start from the end of the path and work backwards
  current_node = end_node

  while current_node
    reversed_shortest_path << current_node
    current_node = how_we_reached_nodes[current_node]
  end

  # reverse our path to get the right order
  reversed_shortest_path.reverse! # no longer reversed
end
