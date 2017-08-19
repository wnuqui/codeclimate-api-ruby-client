module CodeClimate
  module Resource
    # :nodoc:
    class Metric < Base
      belongs_to :repo
    end
  end
end
