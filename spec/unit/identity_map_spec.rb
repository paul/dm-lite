require File.dirname(__FILE__) + '/../spec_helper.rb'

require 'dm-lite/identity_map'

describe 'Identity Map' do

  before do
    @im = IdentityMap.new

    @paul = mock('Person', :model => "Person", :keys => [1])
    @im.store(@paul)

    @paul2 = mock('Person', :model => "Person", :keys => [1])
    @carl = mock('Person', :model => "Person", :keys => [2])
    @yehuda = mock('Person', :model => "Programmer", :keys => [1])

  end

  describe '#store' do
    it 'should store resources' do
      @im.lookup(@paul).should == @paul
    end

    it 'should overwrite an existing resource with the same key' do
      @im.store(@paul2)
      @im.lookup(@paul).should == @paul2
    end
  end

  describe '#lookup' do
    it 'should lookup resources' do
      @im.lookup(@paul).should == @paul
    end

    it 'should find a resource with the same key' do
      @im.lookup(@paul2).should == @paul
    end

    it 'shound not find a resource with a different key' do
      @im.lookup(@carl).should_not == @paul
    end

    it 'shound not find a resource with a different model' do
      @im.lookup(@yehuda).should_not == @paul
    end

    it 'should return nil for a missing key' do
      @im.lookup(@carl).should be_nil
    end

  end

  describe '#invalidate' do

    it 'should not find a resource that has been invalidatated' do
      @im.invalidate(@paul)
      @im.lookup(@paul).should be_nil
    end

  end
end
