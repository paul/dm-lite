require 'moneta'
require 'moneta/memory'

class IdentityMap

  def initialize
    @store = Hash.new { |h,model| h[model] = Moneta::Memory.new }
  end

  def store(resource)
    @store[resource.model][resource.keys.hash] = resource
  end

  def lookup(resource)
    @store[resource.model][resource.keys.hash]
  end

  def invalidate(resource)
    @store[resource.model].delete(resource.keys.hash)
  end

end
