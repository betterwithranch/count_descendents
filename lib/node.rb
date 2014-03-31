class Node

  def initialize(begin_tag)
    @begin_tag = begin_tag
  end

  def children
    @children ||= []
  end

  def first_child
    @position = 0
    children[@position]
  end

  def next_sibling
    @position += 1
    children[@position]
  end

  # This implementation adheres to the original exercise requirements
  # of passing in the node as an argument and using the node's
  # first_child and next_sibling methods
  def self.count_descendents(node)
    first_child = node.first_child
    return nil unless first_child

    count = count_descendents_plus_self(first_child)

    while sibling = node.next_sibling
      count += count_descendents_plus_self(sibling)
    end

    count
  end

  def self.count_descendents_plus_self(node)
    1 + (Node.count_descendents(node) || 0)
  end

  # I'd prefer to define count_descendents on the instance.  This would
  # allow us to use the implementation below and not rely on the public
  # interface to traverse the hierarchy.
  # It also seems to make more sense to ask the node for it's 
  # number of descendents, rather than rely on some other class to 
  # count the descendents of a provided node.
  def count_descendents(opts={})
    return nil unless first_child
    children.
      map(&:count_descendents_plus_self).
      reduce(:+)
  end

  def count_descendents_plus_self
    1 + (self.count_descendents || 0)
  end

end
