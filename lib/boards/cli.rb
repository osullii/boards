require "thor"
require "boards/new_project"
require "boards/repo"
require "boards/version"

module Boards
  class Cli < Thor
    
    desc 'new NAME', 'creates a new Boards project named NAME'
    def new(name)
      create_directory(name)
      create_setup_rb(name)
      create_boards_rb(name)
      create_gemfile(name)
    end
    
    no_commands do 
    
      def create_directory(name)
        dir_name = name.downcase
        unless Dir.exists?(dir_name)
          Dir.mkdir(dir_name)
          say "create \t#{dir_name}/", :green
        else
          say "dir \t#{dir_name}/ already exists", :blue
        end
      end
    
      def create_setup_rb(name)
        dir_name = name.downcase
        file_name = 'setup.rb'
        unless File.exists?("#{dir_name}/#{file_name}")
          File.open("#{dir_name}/#{file_name}", "w") do |f| 
            f.write "# I am a setup file."
          end
          say "create \t#{dir_name}/#{file_name}", :green
        else
          say "file \t#{dir_name}/#{file_name} already exists", :blue
        end
      end
    
      def create_boards_rb(name)
        dir_name = name.downcase
        file_name = 'boards.rb'
        unless File.exists?("#{dir_name}/#{file_name}")
          File.open("#{dir_name}/#{file_name}", "w")  do |f| 
            f.write "# Define the setup of your different boards here.\n"
            f.write "# For more information on the DSL that can be put in this file got to <boards wiki uri>.\n"
            f.write "# TODO: Define DSL.\n"
            f.write "# TODO: Update boards wiki.\n"
          end
          say "create \t#{dir_name}/#{file_name}", :green
        else
          say "file \t#{dir_name}/#{file_name} already exists", :blue
        end
      end
    
      def create_gemfile(name)
        dir_name = name.downcase
        file_name = 'Gemfile'
        unless File.exists?("#{dir_name}/#{file_name}")
          File.open("#{dir_name}/#{file_name}", "w") do |f| 
            f.write "source 'https://rubygems.org'\n"
            f.write 'git_source(:github) { |repo| "https://github.com/#{repo}.git" }'
            f.write "\n\n"
            f.write "# Bundle edge Boards instead:\n"
            f.write "# gem 'boards', github: '#{REPO}'\n"
            f.write "gem 'boards', '#{VERSION}'"
          end
          say "create \t#{dir_name}/#{file_name}", :green
        else
          say "file \t#{dir_name}/#{file_name} already exists", :blue
        end
      end
    end
  end
end