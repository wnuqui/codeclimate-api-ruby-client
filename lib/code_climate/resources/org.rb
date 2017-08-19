module CodeClimate
  module Resource
    # :nodoc:
    class Org < Base
      # GET /orgs/:org_id/repos
      custom_endpoint :repos, on: :member, request_method: :get
    end
  end
end
