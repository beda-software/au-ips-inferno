Gem::Specification.new do |spec|
  spec.name          = 'inferno_template'
  spec.version       = '0.0.1'
  spec.authors       = ["Inferno Template"]
  # spec.email         = ['TODO']
  spec.date          = Time.now.utc.strftime('%Y-%m-%d')
  spec.summary       = 'Inferno Template Test Kit'
  spec.description   = 'Inferno template Inferno test kit for FHIR'
  # spec.homepage      = 'TODO'
  spec.license       = 'Apache-2.0'
  spec.add_runtime_dependency 'inferno_core', '~> 0.4.38'
  spec.add_development_dependency 'database_cleaner-sequel', '~> 1.8'
  spec.add_development_dependency 'factory_bot', '~> 6.1'
  spec.add_development_dependency 'rspec', '~> 3.10'
  spec.add_development_dependency 'webmock', '~> 3.11'
  spec.required_ruby_version = Gem::Requirement.new('>= 3.1.2')
  # spec.metadata['homepage_uri'] = spec.homepage
  # spec.metadata['source_code_uri'] = 'TODO'
  spec.files = [
    Dir['lib/**/*.rb'],
    Dir['lib/**/*.json'],
    'LICENSE'
  ].flatten

  spec.require_paths = ['lib']
end
