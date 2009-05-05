
module DMLite
  module Resource

    def initialize(attributes = {})
      attributes.each do |name, value|
        instance_variable_set("@#{name}", value)
      end
    end

    def save

    end

  end
end
