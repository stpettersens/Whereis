require 'rubygems'
require 'rake'
require 'echoe'
require 'fileutils'

name = 'whereis'
version = '1.1.5'
Echoe.new(name, version) do |p|
	p.description = "Ruby interface to `whereis` command."
	p.url	      = "http://github.com/stpettersens/Whereis"		
	p.email	      = "s.stpettersen@gmail.com"
	p.ignore_pattern	= []
	p.development_dependencies = []
	p.runtime_dependencies = ["uname"]
end

task :makegem => [:build_gemspec] do
	puts "Building gem..."
	system("gem build #{name}.gemspec")
end

task :instgem do
	puts "Installing gem..."
	system("gem install #{name}-#{version}")
end

task :all => [:makegem, :instgem, :cleanup] do
end

task :cleanup => [:clobber] do
	puts "Removing everything, including .gemspec"
	FileUtils.rm("Manifest")
	FileUtils.rm("#{name}.gemspec")
end
