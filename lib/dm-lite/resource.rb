
module DMLite
  module Resource

    def initialize(attributes = {})
      attributes.each do |name, value|
        instance_variable_set("@#{name}", value)
      end
    end

    alias model class

    def save
      if DMLite.in_transaction?
        DMLite.current_transaction.add_operation(:create, self)
      else
        DMLite.transaction do
          save
        end
      end
    end

  end
end
