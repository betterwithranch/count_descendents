Exercise for counting descendent nodes.
====

There are two implementations of count_descendents here.  The initial approach uses the specified public interface 
where the node is passed as argument to the counting method.  

    count_descendents(node)

The second approach refactors to implement this as an instance method where the instance can return a count of it's descendent nodes.  

    node.count_descendents

Installation and specs
----

The project is configured with bundler and rspec.  To run the specs:

    bundle install && rspec spec
