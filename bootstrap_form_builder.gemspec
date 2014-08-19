# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bootstrap_form_builder/version'

Gem::Specification.new do |spec|
  spec.name          = "bs_form_builder"
  spec.version       = BootstrapFormBuilder::VERSION
  spec.authors       = ["Sean Geoghegan"]
  spec.email         = ["sean@tushare.com"]
  spec.summary       = %q{A Rails form builder for bootstrap style forms.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'actionview'
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
