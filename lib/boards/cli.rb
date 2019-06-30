require "thor"
require "boards/new_project"
module Boards
  class Cli < Thor
    include Thor::Actions
    register(Boards::NewProject, 'new', 'new', 'new boards project named NAME')
  end
end