module CodeClimate
  module Resource
    # :nodoc:
    class Build < Base
      belongs_to :repo
    end
  end
end
