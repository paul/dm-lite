require File.dirname(__FILE__) + '/spec_helper.rb'

describe 'unit of work' do

  before do
    @adapter1 = mock('Adapter')
    @adapter2 = mock('Adapter')

    DMLite.setup(:default, @adapter1)
    DMLite.setup(:other, @adapter2)

    class Boat
      include DMLite::Model

      set_default_repository :default

      property :id, Integer
      property :name, String
    end

    class Car
      include DMLite::Model

      set_default_repository :other

      property :id, Integer
      property :make, String
    end
  end

  describe 'abort on error' do

    it 'should not write to the adapter if an exception is raised' do
      @adapter1.should_not_receive(:create)
      @adapter2.should_not_receive(:create)

      b = Boat.new(:name => 'Jolly Roger')
      c = Car.new(:make => "Mazda")
      c.should_receive(:save).and_raise("an error")

      DMLite.transaction do
        lambda {
          b.save
          c.save
        }.should raise_error(RuntimeError)
      end

    end

  end

end


