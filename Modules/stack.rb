require_relative "forwadable"

class Stack
    extend MyForwardable

    def_delegators :@data, :push , :pop, :size, :first, :empty?

    def initialize
        @data = []
    end
end

stack = Stack.new

p stack.push 1
p stack.push 2
p stack.push 3
p stack.size

