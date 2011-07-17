# Demonstate whereis usage
require "whereis"

good = "g++"
bad = "xyz"

# Will find g++ on my system
puts Whereis.whereis(good)
puts Whereis.boolean(good)

# Will not find xyz
puts Whereis.whereis(bad)
puts Whereis.boolean(bad)
