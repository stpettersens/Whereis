#
# Whereis
# An interface to `whereis` [or `where` on Windows].
# Copyright (c) 2011 Sam Saint-Pettersen.
#
# Released under the MIT/X11 License.
#
require 'uname'

module Whereis
	def self.whereis(executable)
		if Uname.sysname.match(/.*n[i|u]x/)
			whereis = 'whereis'
		else
			whereis = 'where'
		end
		begin
			output = IO.popen("#{whereis} #{executable}")
			output = output.readlines
			output = output[0].chomp
		rescue
			output = ''
		end
		return output
	end
	def self.boolean(executable)
		output = self.whereis(executable)
		if output.match(/\w:\\|\//)
			return true
		else
			return false
		end
	end 
end
