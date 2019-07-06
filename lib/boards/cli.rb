require "thor"
require "boards/base"

module Boards
  class Cli < Base
    
    desc 'new NAME', 'creates a new Boards project named NAME'
    def new(name)
      dirname = name.downcase
      create_directory(dirname)
      create_setup_rb(dirname, 'setup.rb')
      create_boards_rb(dirname, 'boards.rb')
      create_gemfile(dirname, 'Gemfile')
    end
    
    desc 'console', 'opens an IRB console in the current directory'
    def console
       require "irb"
       IRB.start(__FILE__)
    end
  end
end
