module CodeClimate
  module Resource
    # :nodoc:
    class Repo < Base
      # GET /repos/:repo_id
      def self.at(id)
        find(id).first
      end

      # GET /repos/:repo_id/ref_points
      def ref_points
        CodeClimate::Client.ref_points.where(repo_id: id).all
      end

      # GET /repos/:repo_id/builds
      def builds
        CodeClimate::Client.builds.where(repo_id: id).all
      end

      # GET /repos/:repo_id/metrics/:name?filter[from]=YYYY-MM-DD&filter[to]=YYYY-MM-DD
      def metrics(range)
        options = { repo_id: id, from: range[:from], to: range[:to] }
        CodeClimate::Client.metrics.where(options).find('gpa')
      end

      # GET /repos/:repo_id/services
      def services
        CodeClimate::Client.services.where(repo_id: id).all
      end

      # GET /repos/repo_id/test_reports
      def test_reports
        CodeClimate::Client.test_reports.where(repo_id: id).all
      end
    end
  end
end
