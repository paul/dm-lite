
require File.dirname(__FILE__) + '/property'

module DMLite
  module Model

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def property(name, type, options = {})
        properties << Property.new(name, type, options)
      end

      def properties
        @properties ||= []
      end
    end

  end
end
