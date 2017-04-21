# -*- encoding: utf-8 -*-
# stub: ansi 1.4.3 ruby lib

Gem::Specification.new do |s|
  s.name = "ansi".freeze
  s.version = "1.4.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Thomas Sawyer".freeze, "Florian Frank".freeze]
  s.date = "2012-06-28"
  s.description = "The ANSI project is a superlative collection of ANSI escape code related libraries\nenabling ANSI colorization and stylization of console output. Byte for byte\nANSI is the best ANSI code library available for the Ruby programming\nlanguage.".freeze
  s.email = ["transfire@gmail.com".freeze]
  s.extra_rdoc_files = ["HISTORY.rdoc".freeze, "DEMO.rdoc".freeze, "COPYING.rdoc".freeze, "README.rdoc".freeze]
  s.files = ["COPYING.rdoc".freeze, "DEMO.rdoc".freeze, "HISTORY.rdoc".freeze, "README.rdoc".freeze]
  s.homepage = "http://rubyworks.github.com/ansi".freeze
  s.rubygems_version = "2.6.4".freeze
  s.summary = "ANSI at your fingertips!".freeze

  s.installed_by_version = "2.6.4" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<detroit>.freeze, [">= 0"])
      s.add_development_dependency(%q<qed>.freeze, [">= 0"])
      s.add_development_dependency(%q<lemon>.freeze, [">= 0"])
    else
      s.add_dependency(%q<detroit>.freeze, [">= 0"])
      s.add_dependency(%q<qed>.freeze, [">= 0"])
      s.add_dependency(%q<lemon>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<detroit>.freeze, [">= 0"])
    s.add_dependency(%q<qed>.freeze, [">= 0"])
    s.add_dependency(%q<lemon>.freeze, [">= 0"])
  end
end
