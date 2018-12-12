# # Alias the module so it can be called as Bar instead of Foo.Bar
# alias Foo.Bar, as: Bar

# # Ensure the module is compiled and available (usually for macros)
# require Foo

# # Import functions from Foo so they can be called without the `Foo.` prefix
# import Foo

# # Invokes the custom code defined in Foo as an extension point
# use Foo

defmodule Math do

    defmodule Arithmetics do
        def add(a,b) do
            a+b
        end 
    end

end
