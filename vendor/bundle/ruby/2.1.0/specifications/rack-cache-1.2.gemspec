# -*- encoding: utf-8 -*-
# stub: rack-cache 1.2 ruby lib

Gem::Specification.new do |s|
  s.name = "rack-cache".freeze
  s.version = "1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ryan Tomayko".freeze]
  s.date = "2012-03-05"
  s.description = "Rack::Cache is suitable as a quick drop-in component to enable HTTP caching for Rack-based applications that produce freshness (Expires, Cache-Control) and/or validation (Last-Modified, ETag) information.".freeze
  s.email = "r@tomayko.com".freeze
  s.extra_rdoc_files = ["README".freeze, "COPYING".freeze, "TODO".freeze, "CHANGES".freeze]
  s.files = ["CHANGES".freeze, "COPYING".freeze, "README".freeze, "TODO".freeze]
  s.homepage = "http://tomayko.com/src/rack-cache/".freeze
  s.rdoc_options = ["--line-numbers".freeze, "--inline-source".freeze, "--title".freeze, "Rack::Cache".freeze, "--main".freeze, "Rack::Cache".freeze]
  s.rubygems_version = "2.6.4".freeze
  s.summary = "HTTP Caching for Rack".freeze

  s.installed_by_version = "2.6.4" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 2

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rack>.freeze, [">= 0.4"])
      s.add_development_dependency(%q<bacon>.freeze, [">= 0"])
      s.add_development_dependency(%q<memcached>.freeze, [">= 0"])
      s.add_development_dependency(%q<dalli>.freeze, [">= 0"])
    else
      s.add_dependency(%q<rack>.freeze, [">= 0.4"])
      s.add_dependency(%q<bacon>.freeze, [">= 0"])
      s.add_dependency(%q<memcached>.freeze, [">= 0"])
      s.add_dependency(%q<dalli>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<rack>.freeze, [">= 0.4"])
    s.add_dependency(%q<bacon>.freeze, [">= 0"])
    s.add_dependency(%q<memcached>.freeze, [">= 0"])
    s.add_dependency(%q<dalli>.freeze, [">= 0"])
  end
end
