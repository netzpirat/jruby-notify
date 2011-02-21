# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name          = %q{jruby-notify}
  s.version       = '0.0.1'

  s.authors       = ['Michael Kessler']
  s.email         = %q{michi@netzpiraten.ch}
  s.homepage      = %q{https://github.com/netzpirat/jruby-notify}
  s.summary       = %q{JNotify for JRuby}
  s.description   = %q{JRuby-Notify is an thin wrapper around the JNotify library.}

  s.add_development_dependency 'rake'
  s.add_development_dependency 'bundler',     '~> 1.0.10'
  s.add_development_dependency 'rspec',       '~> 2.5.0'

  s.files         = Dir.glob('lib/**/*') + %w[LICENSE README.md]
  s.require_paths = ['lib']
end
