nodeB = {:name => "b", :data => 5, :children => []}
nodeF = {:name => "f", :data => 1, :children => []}
nodeC = {:name => "c", :data => 2, :children => [nodeF]}
nodeA = {:name => "a", :data => 8, :children => [nodeB, nodeC]}

def lowest_val_helper(node, current_low)
  if node[:data] < current_low
    current_low = node[:data]
  end

  node[:children].each do |child|
    current_low = lowest_val_helper(child, current_low)
    puts "name: #{child[:name]} current low: #{current_low}"
  end

  return current_low
end

puts lowest_val_helper(nodeA, 8)
