lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "boards/version"

Gem::Specification.new do |spec|
  spec.name          = "boards"
  spec.version       = Boards::VERSION
  spec.authors       = ["Irial O'Sullivan"]
  spec.email         = ["irialosullivan@gmail.com"]

  spec.summary       = %q{To facilitate remote programming of Raspberry Pis.}
  spec.description   = %q{A DSL and toolkit that allows programmers to specify setup of Raspberry Pis remotely.}
  spec.homepage      = "https://github.com/osullii/colony"
  spec.license       = "MIT"

  # spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/osullii/colony"
  spec.metadata["changelog_uri"] = "https://github.com/osullii/colony"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "thor"
end