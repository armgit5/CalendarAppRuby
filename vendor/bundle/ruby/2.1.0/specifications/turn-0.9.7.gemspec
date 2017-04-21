# -*- encoding: utf-8 -*-
# stub: turn 0.9.7 ruby lib

Gem::Specification.new do |s|
  s.name = "turn".freeze
  s.version = "0.9.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Thomas Sawyer".freeze, "Tim Pease".freeze]
  s.date = "2014-03-14"
  s.description = "Turn provides a set of alternative runners for MiniTest, both colorful and informative.".freeze
  s.email = ["transfire@gmail.com".freeze, "tim.pease@gmail.com".freeze]
  s.executables = ["turn".freeze]
  s.extra_rdoc_files = ["History.txt".freeze, "LICENSE.txt".freeze, "Release.txt".freeze, "Version.txt".freeze, "CONTRIBUTING.md".freeze, "NOTICE.md".freeze, "README.md".freeze]
  s.files = ["CONTRIBUTING.md".freeze, "History.txt".freeze, "LICENSE.txt".freeze, "NOTICE.md".freeze, "README.md".freeze, "Release.txt".freeze, "Version.txt".freeze, "bin/turn".freeze]
  s.homepage = "http://rubygems.org/gems/turn".freeze
  s.licenses = ["MIT".freeze, "MIT".freeze]
  s.rubygems_version = "2.6.4".freeze
  s.summary = "Test Reporters (New) -- new output formats for Testing".freeze

  s.installed_by_version = "2.6.4" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ansi>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<minitest>.freeze, ["~> 4"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<indexer>.freeze, [">= 0"])
      s.add_development_dependency(%q<mast>.freeze, [">= 0"])
    else
      s.add_dependency(%q<ansi>.freeze, [">= 0"])
      s.add_dependency(%q<minitest>.freeze, ["~> 4"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<indexer>.freeze, [">= 0"])
      s.add_dependency(%q<mast>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<ansi>.freeze, [">= 0"])
    s.add_dependency(%q<minitest>.freeze, ["~> 4"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<indexer>.freeze, [">= 0"])
    s.add_dependency(%q<mast>.freeze, [">= 0"])
  end
end
