require "thor"
require "boards/new_project"
module Boards
  class NewProject < Thor::Group
    include Thor::Actions
    argument :name, type: :string, desc: 'creates a project named NAME'
    
    desc "creates a project directory named NAME. Creates stub files and boilerplate code."
    def create_directory
      dir_name = name.downcase
      unless Dir.exists?(dir_name)
        Dir.mkdir(dir_name)
        say "create \t#{dir_name}/", :green
      else
        say "dir \t#{dir_name}/ already exists", :blue
      end
    end
    
    def create_setup_rb
      dir_name = name.downcase
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