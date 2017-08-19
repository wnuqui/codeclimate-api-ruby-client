module CodeClimate
  module Resource
    # :nodoc:
    class Snapshot < Base
      belongs_to :repo
    end
  end
end
