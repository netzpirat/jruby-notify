# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name          = %q{jruby-notify}
  s.version       = '0.4.0'

  s.authors       = ['Michael Kessler']
  s.email         = %q{michi@flinkfinger.com}
  s.homepage      = %q{https://github.com/netzpirat/jruby-notify}
  s.summary       = %q{JNotify for JRuby}
  s.description   = %q{JRuby-Notify is an thin wrapper around the JNotify library.}

  s.add_development_dependency 'rake'
  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rspec'

  s.files         = Dir.glob('lib/**/*') + %w[LICENSE README.md]
  s.require_paths = ['lib']
end
