require 'ips_test_kit'

module InfernoTemplate
  class Suite < Inferno::TestSuite
    id :au_ips_inferno
    title 'AU IPS Inferno Test Suite'
    description 'Inferno template test suite.'

    # These inputs will be available to all tests in this suite
    input :url,
          title: 'FHIR Server Base Url'

    input :credentials,
          title: 'OAuth Credentials',
          type: :oauth_credentials,
          optional: true

    # All FHIR requests in this suite will use this FHIR client
    fhir_client do
      url :url
      oauth_credentials :credentials
    end

    # All FHIR validation requsets will use this FHIR validator
    fhir_resource_validator do
      # igs 'identifier#version' # Use this method for published IGs/versions
      # igs 'igs/filename.tgz'   # Use this otherwise

      exclude_message do |message|
        message.message.match?(/\A\S+: \S+: URL value '.*' does not resolve/)
      end
    end

    group from: :ips_resource_validation
  end
end
