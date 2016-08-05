# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'month_ordinals/version'

Gem::Specification.new do |spec|
  spec.name          = "month_ordinals"
  spec.version       = MonthOrdinals::VERSION
  spec.authors       = ["Eric Boehs"]
  spec.email         = ["ericboehs@gmail.com"]

  spec.summary       = %q{Generate an array of month oridnals}
  spec.description   = %q{Given a year range, generate a hash of arrays for
  each ordinal for each day of each month. For example, every first tuesday of
  the month for every month in year range.}
  spec.homepage      = "https://github.com/ericboehs/month_ordinals"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "m"
  spec.add_development_dependency "pry-awesome_print"
end
