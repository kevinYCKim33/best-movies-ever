# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "best_movies_ever/version"

Gem::Specification.new do |spec|
  spec.authors       = ["Kevin Kim"]
  spec.email         = ["kevikim33@gmail.com"]
  spec.description   = %q{100 Best Films according to Rotten Tomatoes}
  spec.summary       = %q{100 Best Films according to Rotten Tomatatoes; See synopsis and critics consensus.}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.executables   = ["best-movies-ever"]
  spec.name          = "best-movies-ever-cli-gem"
  spec.require_paths = ["lib", "lib/best_movies_ever"]
  spec.version       = BestMoviesEver::VERSION
  spec.license       = "MIT"

  # spec.executables   <<'best-movies-ever'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end


  spec.bindir        = "exe"


  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "nokogiri", ">= 0"
  spec.add_development_dependency "pry", ">= 0"
  spec.add_development_dependency "open_uri_redirections"
end
