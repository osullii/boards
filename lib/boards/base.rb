require "thor"
module Boards 
  class Base < Thor
    
    no_commands do 
    
      def create_directory(dirname)
        unless Dir.exists?(dirname)
          Dir.mkdir(dirname)
          say "create \t#{dirname}/", :green
        else
          say "dir \t#{dirname}/ already exists", :blue
        end
      end
    
      def create_setup_rb(dirname, filename)
        unless File.exists?("#{dirname}/#{filename}")
          File.open("#{dirname}/#{filename}", "w") do |f| 
            f.write "# I am a setup file."
          end
          say "create \t#{dirname}/#{filename}", :green
        else
          say "file \t#{dirname}/#{filename} already exists", :blue
        end
      end
    
      def create_boards_rb(dirname, filename)
        unless File.exists?("#{dirname}/#{filename}")
          File.open("#{dirname}/#{filename}", "w")  do |f| 
            f.write "# Define the setup of your different boards here.\n"
            f.write "# For more information on the DSL that can be put in this file got to <boards wiki uri>.\n"
            f.write "# TODO: Define DSL.\n"
            f.write "# TODO: Update boards wiki.\n"
          end
          say "create \t#{dirname}/#{filename}", :green
        else
          say "file \t#{dirname}/#{filename} already exists", :blue
        end
      end
    
      def create_gemfile(dirname, filename)
        unless File.exists?("#{dirname}/#{filename}")
          File.open("#{dirname}/#{filename}", "w") do |f| 
            f.write "source 'https://rubygems.org'\n"
            f.write 'git_source(:github) { |repo| "https://github.com/#{repo}.git" }'
            f.write "\n\n"
            f.write "# Bundle edge Boards instead:\n"
            f.write "# gem 'boards', github: '#{REPO}'\n"
            f.write "gem 'boards', '#{VERSION}'"
          end
          say "create \t#{dirname}/#{filename}", :green
        else
          say "file \t#{dirname}/#{filename} already exists", :blue
        end
      end
    end
  end
end