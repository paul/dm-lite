
require File.dirname(__FILE__) + '/dm-lite/model'
require File.dirname(__FILE__) + '/dm-lite/repository'
require File.dirname(__FILE__) + '/dm-lite/unit_of_work'

module DMLite

  class << self

    attr_reader :repositories

  end

  def self.setup(name, adapter)
    @repositories ||= {}

    @repositories[name] = Repository.new(name, adapter)
  end

  def self.transaction(&blk)
    Thread.current[:dm_lite_uow] ||= UnitOfWork.new
    begin
      yield
      current_transaction.commit
    rescue Exception => e
      current_transaction.rollback
      raise e
    ensure
      Thread.current[:dm_lite_uow] = nil
    end
  end

  def self.current_transaction
    Thread.current[:dm_lite_uow]
  end

end
