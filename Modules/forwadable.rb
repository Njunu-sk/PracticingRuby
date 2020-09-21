module MyForwardable
    def def_delegators(ivar, *delegated_methods)
        delegated_methods.each do |m|
            define_method(m) do |*a, &b|
                obj = instance_variable_get(ivar)
                obj.send(m, *a, &b)
            end
        end
    end
end