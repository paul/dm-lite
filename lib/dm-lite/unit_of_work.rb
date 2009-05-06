require File.dirname(__FILE__) + '/identity_map'

module DMLite
  class UnitOfWork

    attr_reader :identity_map, :operations

    def initialize
      @identity_map = IdentityMap.new
      @operations = []
    end

    def rollback
      @identity_map = IdentityMap.new
      @operations = []
    end

    def commit
      @operations.each { |op| op.call }
    end

    def add_operation(command, *args)
      @operations << Operation.new(command, args)
    end

  end

  class Operation
    attr_reader :command, :args

    def initialize(command, *args)
      @command, @args = command, *args
    end

    def call
      case command
      when :create
        resource = args.first
        repository = resource.model.repository
        repository.create(resource)
      end
    end
  end
    
end
