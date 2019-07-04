require "thor"
require "boards/new_project"
require "boards/repo"
require "boards/version"
module Boards
  class Cli < Thor
    register(Boards::NewProject, 'new', 'new', 'new boards project named NAME')
  end