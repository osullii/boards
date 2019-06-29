require "thor"
module Colony
  class Cli < Thor

    desc 'new NAME', 'generates a new directory named NAME for a new colony project, including boilerplate files and code.'
    def new(name)
      puts "Ahoy! You would like to generate a new project called #{name}!"
    end
  end
end