require File.dirname(__FILE__) + '/spec_helper.rb'

describe 'using resources' do

  before do
    @adapter = mock('Adapter')

    DMLite.setup(:default, @adapter)

    class Person
      include DMLite::Model

      property :id, Integer
      property :name, String
    end
  end

  describe 'creating' do

    it 'should write to the data store' do
      p = Person.new(:name => 'Paul')

      @adapter.should_receive(:create).once.with([p])
      p.save
    end

    it 'should have a shortcut as #create' do
      @adapter.should_receive(:create)
      Person.create(:name => 'Paul')
    end

  end

end

