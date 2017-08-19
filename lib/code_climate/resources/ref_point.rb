module CodeClimate
  module Resource
    # :nodoc:
    class RefPoint < Base
      belongs_to :repo
    end
  end
end
