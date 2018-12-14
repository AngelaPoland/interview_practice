#taken from InterviewCake

class BinaryTreeNode

  attr_accessor :value
  attr_reader :left, :right

  def initialize(value)
    @value = value
    @left  = nil
    @right = nil
  end

  def insert_left(value)
    @left = BinaryTreeNode.new(value)
    return @left
  end

  def insert_right(value)
    @right = BinaryTreeNode.new(value)
    return @right
  end
end

# We start with a method for getting the largest value. The largest value is simply the "rightmost" one, so we can get it in one walk down the tree by traversing rightward until we don't have a right child anymore:

def find_largest(root_node)
  current = root_node
  while current
    return current.value if !current.right
    current = current.right
  end
end

# With this in mind, we can also find the second largest in one walk down the tree. At each step, we have a few cases:
#
# 1- If we have a left subtree but not a right subtree, then the current node is the largest overall (the "rightmost") node. The second largest element must be the largest element in the left subtree. We use our find_largest() method above to find the largest in that left subtree!
# 2- If we have a right child, but that right child node doesn't have any children, then the right child must be the largest element and our current node must be the second largest element!
# 3- Else, we have a right subtree with more than one element, so the largest and second largest are somewhere in that subtree. So we step right.

  def find_largest(root_node)
  current = root_node
  while current
    return current.value if !current.right
    current = current.right
  end
end

def find_second_largest(root_node)
  if !root_node || (!root_node.left && !root_node.right)
    raise Exception, 'Tree must have at least 2 nodes'
  end

  current = root_node

  while current
    # case: current is largest and has a left subtree
    # 2nd largest is the largest in that subtree
    if current.left && !current.right
      return find_largest(current.left)
    end

    # case: current is parent of largest, and largest has no children,
    # so current is 2nd largest
    if current.right && \
        !current.right.left && \
        !current.right.right
      return current.value
    end

    current = current.right
  end
end

# Complexity
# We're doing one walk down our BST, which means O(h)O(h) time, where hh is the height of the tree (again, that's O(\lg{n})O(lgn) if the tree is balanced, O(n)O(n) otherwise). O(1)O(1) space.
