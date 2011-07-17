#
# Whereis
# An interface to `whereis` [or `where` on Windows].
# Copyright (c) 2011 Sam Saint-Pettersen.
#
# Released under the MIT/X11 License.
#
require 'sys/uname'
include Sys

module Whereis
	def self.whereis(executable)
		whereis = nil
		if Uname.sysname.match(/.*n[i|u]x/)
			whereis = 'whereis'
		else
			whereis = 'where'
		end
		output = IO.popen("#{whereis} #{executable}")
		begin 
			output = output.readlines()
			output = output[0].chomp
		rescue
			output = ''
		end
		return output
	end
	def self.boolean(executable)
		output = self.whereis(executable)
		if output.match(/[\:|\/]+/)
			return true
		else
			return false
		end
	end 
end
