module Comparable
    def ==(other)
        (self <=> other) == 0
    end

    def <(other)
        (self <=> other) == -1
    end

    def <=(other)
        self < other || self == other
    end

    def >(other)
        (self <=> other ) == 1
    end

    def >=(other)
        self > other || self == other
    end
end