
module DMLite

  class Repository

    attr_reader :name, :adapter

    def initialize(name, adapter)
      @name, @adapter = name, adapter
    end

    def create(resource)
      @adapter.create([resource])
    end

  end
end
