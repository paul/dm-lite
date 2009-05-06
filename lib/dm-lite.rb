
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
    begin_transaction unless in_transaction?
    begin
      yield
      current_transaction.commit
    rescue RuntimeError => e
      current_transaction.rollback
      raise e
    ensure
      end_transaction
    end
  end

  def self.in_transaction?
    not current_transaction.nil?
  end

  def self.current_transaction
    Thread.current[:dm_lite_uow]
  end

  def self.begin_transaction
    Thread.current[:dm_lite_uow] = UnitOfWork.new
  end

  def self.end_transaction
    Thread.current[:dm_lite_uow] = nil
  end

end
