module CodeClimate
  module Resource
    # :nodoc:
    class Service < Base
      belongs_to :repo
    end
  end
end
