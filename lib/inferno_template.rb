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
    group do
      title 'IPS Server Operations for Generating IPS Bundles Tests'
      short_title 'IPS Operation Tests'
      description %(
        This group evaluates the ability of systems to provide a standard FHIR
        API for generating and communicating an IPS Bundle as described in the
        [IPS Data Generation and Inclusion Guidance](http://hl7.org/fhir/uv/ips/STU1.1/ipsGeneration.html).

        Please note that the DocRef tests are currently of limited scope.
      )


      input :url, title: 'IPS FHIR Server Base URL'

      fhir_client do
        url :url
      end

      group from: :ips_summary_operation
      group from: :ips_docref_operation
    end
  end
end
