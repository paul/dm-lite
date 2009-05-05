
require File.dirname(__FILE__) + '/property'
require File.dirname(__FILE__) + '/resource'

module DMLite
  module Model

    def self.included(base)
      base.extend(ClassMethods)
      base.__send__(:include, Resource)
    end

    module ClassMethods
      def property(name, type, options = {})
        property = Property.new(name, type, options)

        class_eval <<-RUBY, __FILE__, __LINE__ + 1
          def #{name}                 
            @#{name}
          end

          def #{name}=(value)
            @#{name} = value
          end
        RUBY

        properties << property
        property
      end

      def properties
        @properties ||= []
      end
    end

  end
end
