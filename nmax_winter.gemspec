require File.expand_path('lib/nmax_winter/version', __dir__)

Gem::Specification.new do |s|
  s.name        = 'nmax_winter'
  s.version     = NmaxWinter::VERSION
  s.licenses    = ['MIT']
  s.summary     = "gem for finding the largest numbers in the text"
  s.description = "the gem allows you to find the n largest numbers for a given input text sequence"
  s.authors     = ["Yasha Winter"]
  s.email       = 'vinter-jasha@yandex.ru'
  s.files = Dir['README.md', 'LICENSE',
                'CHANGELOG.md', 'lib/**/*.rb',
                'lib/**/*.rake',
                'nmax_winter.gemspec', '.github/*.md',
                'Gemfile', 'Rakefile']

  s.homepage    = 'https://rubygems.org/gems/nmax_winter'
  s.metadata    = { "source_code_uri" => "https://github.com/YashaVinter/Nmax_Winter" }

  s.add_dependency 'sorted_set'

  s.add_development_dependency 'rspec', '~> 3.6'
end