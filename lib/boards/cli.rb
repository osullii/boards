require "thor"
module Boards
  class Cli < Thor
    include Thor::Actions

    desc 'new NAME', 'generates a new directory named NAME for a new boards project, including stub files and boilerplate code.'
    def new(name)
      puts "Ahoy! You would like to generate a new project called #{name.capitalize}!"
      dir_name = name.downcase
      unless Dir.exists?(dir_name)
        Dir.mkdir(dir_name)
        say "create \t#{dir_name}/", :green
      else
        say "dir \t#{dir_name}/ already exists", :blue
      end
      file_name = 'setup.rb'
      unless File.exists?("#{dir_name}/#{file_name}")
        File.open("#{dir_name}/#{file_name}", "w") {|f| f.write "# I am a setup file."}
        say "create \t#{dir_name}/#{file_name}", :green
      else
        say "file \t#{dir_name}/#{file_name} already exists", :blue
      end
    end
  end
end