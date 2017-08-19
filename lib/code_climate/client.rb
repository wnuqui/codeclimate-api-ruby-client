require 'active_support/core_ext/module/attribute_accessors'
require 'json_api_client'

require 'code_climate/version'
require 'code_climate/resources/base'

module CodeClimate
  # :nodoc:
  module Client
    mattr_accessor :base_uri, :api_token, :http_verbose

    class << self
      def configure
        yield self if block_given?
        CodeClimate::Resource::Base.site = base_uri
        connect!
        require_code_climate_resources
        self
      end

      def current_user
        Resource::User.first
      end

      def repos
        Resource::Repo
      end

      def ref_points
        Resource::RefPoint
      end

      def builds
        Resource::Build
      end

      def metrics
        Resource::Metric
      end

      def snapshots
        Resource::Snapshot
      end

      def test_reports
        Resource::TestReport
      end

      def services
        Resource::Service
      end

      def orgs
        Resource::Org
      end

      private

      def http_verbose?
        ENV['HTTP_VERBOSE'] == 'true' || http_verbose
      end

      def connect!
        CodeClimate::Resource::Base.connection do |connection|
          connection.use Faraday::Response::Logger if http_verbose?
          connection.use CodeClimate::Middleware
        end
      end

      def require_code_climate_resources
        require 'code_climate/resources/ref_point'
        require 'code_climate/resources/repo'
        require 'code_climate/resources/user'
        require 'code_climate/resources/build'
        require 'code_climate/resources/metric'
        require 'code_climate/resources/snapshot'
        require 'code_climate/resources/test_report'
        require 'code_climate/resources/service'
        require 'code_climate/resources/org'
      end
    end
  end
end
