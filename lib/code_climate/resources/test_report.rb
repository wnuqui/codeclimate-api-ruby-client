module CodeClimate
  module Resource
    # :nodoc:
    class TestReport < Base
      belongs_to :repo
    end
  end
end
