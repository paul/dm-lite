require 'identity_map'

module DMLite
  class UnitOfWork

    attr_reader :identity_map, :operations

    def initialize
      @identity_map = IdentityMap.new
      @operations = []
    end

  end
end
