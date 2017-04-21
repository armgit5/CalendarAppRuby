# -*- encoding: utf-8 -*-
# stub: turn 0.9.7 ruby lib

Gem::Specification.new do |s|
  s.name = "turn"
  s.version = "0.9.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Thomas Sawyer", "Tim Pease"]
  s.date = "2014-03-14"
  s.description = "Turn provides a set of alternative runners for MiniTest, both colorful and informative."
  s.email = ["transfire@gmail.com", "tim.pease@gmail.com"]
  s.executables = ["turn"]
  s.extra_rdoc_files = ["History.txt", "LICENSE.txt", "Release.txt", "Version.txt", "CONTRIBUTING.md", "NOTICE.md", "README.md"]
  s.files = ["CONTRIBUTING.md", "History.txt", "LICENSE.txt", "NOTICE.md", "README.md", "Release.txt", "Version.txt", "bin/turn"]
  s.homepage = "http://rubygems.org/gems/turn"
  s.licenses = ["MIT", "MIT"]
  s.rubygems_version = "2.4.8"
  s.summary = "Test Reporters (New) -- new output formats for Testing"

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ansi>, [">= 0"])
      s.add_runtime_dependency(%q<minitest>, ["~> 4"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<indexer>, [">= 0"])
      s.add_development_dependency(%q<mast>, [">= 0"])
    else
      s.add_dependency(%q<ansi>, [">= 0"])
      s.add_dependency(%q<minitest>, ["~> 4"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<indexer>, [">= 0"])
      s.add_dependency(%q<mast>, [">= 0"])
    end
  else
    s.add_dependency(%q<ansi>, [">= 0"])
    s.add_dependency(%q<minitest>, ["~> 4"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<indexer>, [">= 0"])
    s.add_dependency(%q<mast>, [">= 0"])
  end
end
