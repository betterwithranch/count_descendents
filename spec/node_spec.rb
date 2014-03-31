require 'spec_helper'

describe Node do
  # Specs for class method as specified in requirements
  describe '##count_descendents' do
    it 'should be zero for an empty node' do
      node = Node.new('body')
      Node.count_descendents(node).should be_nil
    end

    it 'should be one when one child' do
      node = Node.new('<body>')
      node.children << Node.new("<div id='container'>")
      Node.count_descendents(node).should == 1
    end

    it 'should be two when two immediate children' do
      node = Node.new('<body>')
      node.children << Node.new("<div id='container1'>")
      node.children << Node.new("<div id='container2'>")
      Node.count_descendents(node).should == 2
    end

    it 'should be two when single child has a single child' do
      node = Node.new('<body>')
      child_node = Node.new("<div id='container1'>")
      child_node.children << Node.new("<div id='container2'>")
      node.children << child_node
      Node.count_descendents(node).should == 2
    end

    it 'should be three when one child has children and one does not' do
      node = Node.new('<body>')
      child_node = Node.new("<div id='container1'>")
      child_node.children << Node.new("<div id='container2'>")
      node.children << child_node
      node.children << Node.new("<div id='container3'>")
      Node.count_descendents(node).should == 3

    end
  end

  # Specs for instance method refactoring
  describe '#count_descendents' do
    it 'should be zero for an empty node' do
      node = Node.new('body')
      node.count_descendents.should be_nil
    end

    it 'should be one when one child' do
      node = Node.new('<body>')
      node.children << Node.new("<div id='container'>")
      node.count_descendents.should == 1
    end

    it 'should be two when two immediate children' do
      node = Node.new('<body>')
      node.children << Node.new("<div id='container1'>")
      node.children << Node.new("<div id='container2'>")
      node.count_descendents.should == 2
    end

    it 'should be two when single child has a single child' do
      node = Node.new('<body>')
      child_node = Node.new("<div id='container1'>")
      child_node.children << Node.new("<div id='container2'>")
      node.children << child_node
      node.count_descendents.should == 2
    end

    it 'should be three when one child has children and one does not' do
      node = Node.new('<body>')
      child_node = Node.new("<div id='container1'>")
      child_node.children << Node.new("<div id='container2'>")
      node.children << child_node
      node.children << Node.new("<div id='container3'>")
      node.count_descendents.should == 3

    end
  end
end
