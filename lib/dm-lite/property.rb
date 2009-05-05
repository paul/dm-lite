
module DMLite

  class Property

    attr_reader :name, :type, :options

    def initialize(name, type, options = {})
      @name, @type = name, type

      @options = options
    end

  end

end
